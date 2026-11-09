package com.utilitytoolbox.smarttools

import android.app.AlarmManager
import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.os.SystemClock
import android.view.View
import android.widget.RemoteViews
import java.text.SimpleDateFormat
import java.util.Calendar
import java.util.Locale
import java.util.TimeZone
import org.json.JSONArray

/// Home-screen "World Clock" widget.
///
/// NOTE: this originally used <TextClock> views so each clock face would
/// tick on its own without the app/provider needing to push updates. That
/// caused "Can't load widget" on real devices (confirmed on an Infinix/XOS
/// phone): Android's officially supported RemoteViews view set is
/// FrameLayout/LinearLayout/RelativeLayout/GridLayout as containers, and
/// AnalogClock/Button/Chronometer/ImageButton/ImageView/ProgressBar/
/// TextView/ViewFlipper/ListView/GridView/StackView/AdapterViewFlipper/
/// ViewStub as views — TextClock was never on that list, so it inflates
/// unpredictably (or not at all) depending on OS version/OEM skin.
///
/// This uses plain TextViews, with the time text computed here in Kotlin
/// per-city (via each city's IANA zone) and pushed with setTextViewText —
/// refreshed once a minute by a repeating AlarmManager alarm, which is the
/// standard, universally-supported pattern real clock widgets use. The
/// alarm is re-armed *aligned to the next wall-clock minute boundary*
/// (see [scheduleNextTick]) so every row's displayed minute changes at the
/// same moment the device's real clock does, instead of drifting.
///
/// Row count is not fixed at 4: [rowsToShowFor] reads each widget
/// instance's current size (Android gives per-instance min/max width and
/// height in dp via [AppWidgetManager.getAppWidgetOptions]) and shows more
/// rows the taller the user resizes the widget, up to [MAX_ROWS]. A
/// freshly-placed widget at its default size shows [DEFAULT_ROWS].
class WorldClockWidgetProvider : AppWidgetProvider() {

    companion object {
        private const val PREFS_NAME = "world_clock_widget_prefs"
        private const val PREFS_KEY_CITIES = "cities_json"
        private const val ACTION_TICK = "com.utilitytoolbox.smarttools.ACTION_WORLD_CLOCK_TICK"

        /// Rows shown on a freshly-placed widget at its default size.
        const val DEFAULT_ROWS = 4

        /// Hard cap on how many rows the layout has / we will ever show,
        /// no matter how large the widget is resized. Keep in sync with
        /// the number of wc_row_N blocks in widget_world_clock.xml, and
        /// with WIDGET_MAX_ROWS on the Flutter side.
        const val MAX_ROWS = 8

        // Rough per-row / header heights in dp, used only to decide how
        // many rows fit in the space the user has resized the widget to.
        // Doesn't need to be pixel-perfect — worst case a row is clipped
        // by the launcher, not drawn wrong.
        private const val HEADER_DP = 40
        private const val ROW_DP = 42

        private val ROW_IDS = intArrayOf(
            R.id.wc_row_0, R.id.wc_row_1, R.id.wc_row_2, R.id.wc_row_3,
            R.id.wc_row_4, R.id.wc_row_5, R.id.wc_row_6, R.id.wc_row_7
        )
        private val FLAG_IDS = intArrayOf(
            R.id.wc_flag_0, R.id.wc_flag_1, R.id.wc_flag_2, R.id.wc_flag_3,
            R.id.wc_flag_4, R.id.wc_flag_5, R.id.wc_flag_6, R.id.wc_flag_7
        )
        private val NAME_IDS = intArrayOf(
            R.id.wc_name_0, R.id.wc_name_1, R.id.wc_name_2, R.id.wc_name_3,
            R.id.wc_name_4, R.id.wc_name_5, R.id.wc_name_6, R.id.wc_name_7
        )
        private val CLOCK_IDS = intArrayOf(
            R.id.wc_clock_0, R.id.wc_clock_1, R.id.wc_clock_2, R.id.wc_clock_3,
            R.id.wc_clock_4, R.id.wc_clock_5, R.id.wc_clock_6, R.id.wc_clock_7
        )
        private val DATE_IDS = intArrayOf(
            R.id.wc_date_0, R.id.wc_date_1, R.id.wc_date_2, R.id.wc_date_3,
            R.id.wc_date_4, R.id.wc_date_5, R.id.wc_date_6, R.id.wc_date_7
        )

        /// Called from MainActivity right after the Flutter side saves a new
        /// pinned-city list, so the widget updates immediately instead of
        /// waiting for the next minute tick. Rebuilds each placed instance
        /// at *its own* current size.
        fun pushUpdate(context: Context) {
            val manager = AppWidgetManager.getInstance(context)
            val ids = manager.getAppWidgetIds(ComponentName(context, WorldClockWidgetProvider::class.java))
            for (id in ids) {
                manager.updateAppWidget(id, buildRemoteViews(context, manager, id))
            }
        }

        /// How many rows fit given this widget instance's current size.
        /// Never below [DEFAULT_ROWS], never above [MAX_ROWS].
        private fun rowsToShowFor(appWidgetManager: AppWidgetManager, appWidgetId: Int): Int {
            val options = appWidgetManager.getAppWidgetOptions(appWidgetId)
            val minHeight = options.getInt(AppWidgetManager.OPTION_APPWIDGET_MIN_HEIGHT, 0)
            val maxHeight = options.getInt(AppWidgetManager.OPTION_APPWIDGET_MAX_HEIGHT, 0)
            // The bigger of the two reported heights reflects how much
            // space the user has actually dragged the widget's frame to.
            val availableDp = maxOf(minHeight, maxHeight)
            if (availableDp <= 0) return DEFAULT_ROWS
            val fittable = (availableDp - HEADER_DP) / ROW_DP
            return fittable.coerceIn(DEFAULT_ROWS, MAX_ROWS)
        }

        private fun buildRemoteViews(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ): RemoteViews {
            val views = RemoteViews(context.packageName, R.layout.widget_world_clock)
            val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            val citiesJson = prefs.getString(PREFS_KEY_CITIES, null)
            val rowsToShow = rowsToShowFor(appWidgetManager, appWidgetId)

            data class City(val flag: String, val name: String, val zone: String)

            val cities = mutableListOf<City>()
            if (citiesJson != null) {
                try {
                    val arr = JSONArray(citiesJson)
                    for (i in 0 until minOf(arr.length(), MAX_ROWS)) {
                        val obj = arr.getJSONObject(i)
                        cities.add(
                            City(
                                flag = obj.optString("flag", ""),
                                name = obj.optString("name", ""),
                                zone = obj.optString("zone", "UTC")
                            )
                        )
                    }
                } catch (_: Exception) {
                    // Malformed/missing prefs entry — fall through to the
                    // "no pinned cities" empty state below rather than crash.
                }
            }

            // Tapping anywhere on the widget opens the app.
            val launchIntent = context.packageManager.getLaunchIntentForPackage(context.packageName)
            if (launchIntent != null) {
                val pendingIntent = PendingIntent.getActivity(
                    context, 0, launchIntent,
                    PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
                )
                views.setOnClickPendingIntent(R.id.wc_root, pendingIntent)
            }

            views.setViewVisibility(
                R.id.wc_empty_state,
                if (cities.isEmpty()) View.VISIBLE else View.GONE
            )

            val now = Calendar.getInstance().time
            for (i in 0 until MAX_ROWS) {
                if (i < cities.size && i < rowsToShow) {
                    val city = cities[i]
                    val tz = try {
                        TimeZone.getTimeZone(city.zone)
                    } catch (_: Exception) {
                        TimeZone.getTimeZone("UTC")
                    }
                    val timeFmt = SimpleDateFormat("h:mm a", Locale.getDefault()).apply { timeZone = tz }
                    val dateFmt = SimpleDateFormat("EEE, MMM d", Locale.getDefault()).apply { timeZone = tz }

                    views.setViewVisibility(ROW_IDS[i], View.VISIBLE)
                    views.setTextViewText(FLAG_IDS[i], city.flag)
                    views.setTextViewText(NAME_IDS[i], city.name)
                    // Same `now` instant used for every row below, so all
                    // visible clocks always show the same moment in time —
                    // no row ever lags behind another.
                    views.setTextViewText(CLOCK_IDS[i], timeFmt.format(now))
                    views.setTextViewText(DATE_IDS[i], dateFmt.format(now))
                } else {
                    views.setViewVisibility(ROW_IDS[i], View.GONE)
                }
            }

            return views
        }

        private fun tickPendingIntent(context: Context): PendingIntent {
            val intent = Intent(context, WorldClockWidgetProvider::class.java).apply {
                action = ACTION_TICK
            }
            return PendingIntent.getBroadcast(
                context, 0, intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
        }

        /// Arms the next single tick, aligned to the next wall-clock minute
        /// boundary (not just "60s from whenever this happened to run").
        /// Called again from [onReceive] every time a tick fires, forming a
        /// self-rescheduling chain — this is safe to call repeatedly (each
        /// call just replaces the pending alarm for the same PendingIntent),
        /// so it's also re-armed on every system-triggered onUpdate
        /// (including after a reboot, since Android calls onUpdate again
        /// for existing widgets then — no separate BOOT_COMPLETED receiver
        /// needed).
        ///
        /// NOTE 1: this used to be a single `setInexactRepeating` call. That
        /// turned out to not fire reliably on this device (Infinix/XOS) —
        /// heavily customized OEM battery managers are known to silently
        /// deprioritize or drop background *inexact* repeating alarms,
        /// especially with a non-"standard" interval like 60s (AlarmManager
        /// only formally optimizes for its INTERVAL_FIFTEEN_MINUTES/etc.
        /// buckets). Exact alarms, especially via setExactAndAllowWhileIdle,
        /// get materially stronger delivery guarantees from the OS, which
        /// is why we switched to that here.
        ///
        /// NOTE 2: the previous version scheduled the *next* tick exactly
        /// 60_000ms after whenever the *current* tick happened to actually
        /// fire. Since exact alarms can still be delivered a little late
        /// (OS scheduling jitter, Doze exit latency, etc.), that offset
        /// compounds tick-over-tick — over time the widget's displayed
        /// minute starts changing visibly later than the real device clock
        /// in the status bar (the "not changing simultaneously" symptom).
        /// Anchoring every scheduled tick to the actual wall-clock minute
        /// boundary (System.currentTimeMillis() % 60_000) instead of to the
        /// previous tick's firing time means drift can't accumulate: even
        /// if one tick fires a bit late, the next one is still scheduled
        /// for the *real* next minute boundary, not "late + 60s".
        private fun scheduleNextTick(context: Context) {
            val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
            val nowMillis = System.currentTimeMillis()
            // Small +250ms buffer so we fire just after the boundary rolls
            // over (never a hair before it, which would still show the old
            // minute).
            val msUntilNextMinute = (60_000L - (nowMillis % 60_000L)) + 250L
            val triggerAt = SystemClock.elapsedRealtime() + msUntilNextMinute
            val pendingIntent = tickPendingIntent(context)
            try {
                val canScheduleExact =
                    Build.VERSION.SDK_INT < Build.VERSION_CODES.S || alarmManager.canScheduleExactAlarms()
                if (canScheduleExact) {
                    alarmManager.setExactAndAllowWhileIdle(
                        AlarmManager.ELAPSED_REALTIME_WAKEUP, triggerAt, pendingIntent
                    )
                } else {
                    alarmManager.setAndAllowWhileIdle(
                        AlarmManager.ELAPSED_REALTIME_WAKEUP, triggerAt, pendingIntent
                    )
                }
            } catch (_: SecurityException) {
                // Exact-alarm permission revoked mid-flight (user toggled it
                // off in Settings) — fall back rather than crash the tick.
                alarmManager.setAndAllowWhileIdle(
                    AlarmManager.ELAPSED_REALTIME_WAKEUP, triggerAt, pendingIntent
                )
            }
        }

        private fun cancelTicks(context: Context) {
            val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
            alarmManager.cancel(tickPendingIntent(context))
        }
    }

    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray) {
        for (id in appWidgetIds) {
            appWidgetManager.updateAppWidget(id, buildRemoteViews(context, appWidgetManager, id))
        }
        scheduleNextTick(context)
    }

    /// Fired whenever the user finishes dragging a resize handle on the
    /// widget (or the launcher otherwise changes its size). We rebuild just
    /// that instance so it re-evaluates rowsToShowFor() against the new
    /// dimensions immediately, rather than waiting for the next minute tick.
    override fun onAppWidgetOptionsChanged(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int,
        newOptions: Bundle
    ) {
        appWidgetManager.updateAppWidget(appWidgetId, buildRemoteViews(context, appWidgetManager, appWidgetId))
    }

    override fun onEnabled(context: Context) {
        scheduleNextTick(context)
    }

    override fun onDisabled(context: Context) {
        cancelTicks(context)
    }

    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action == ACTION_TICK) {
            pushUpdate(context)
            scheduleNextTick(context)
            return
        }
        super.onReceive(context, intent)
    }
}
