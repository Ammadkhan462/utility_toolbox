package com.utilitytoolbox.smarttools

import android.annotation.SuppressLint
import android.app.PendingIntent
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.service.quicksettings.Tile
import android.service.quicksettings.TileService

/// Quick Settings tile: one tap from the notification shade opens the QR
/// scanner via the same deep link the launcher shortcut uses.
class QrScanTileService : TileService() {

    override fun onStartListening() {
        super.onStartListening()
        qsTile?.apply {
            state = Tile.STATE_INACTIVE
            updateTile()
        }
    }

    @SuppressLint("StartActivityAndCollapseDeprecated")
    override fun onClick() {
        super.onClick()
        val launch = Intent(
            Intent.ACTION_VIEW,
            Uri.parse("utilitytoolbox://tool/qr_scanner"),
            this,
            MainActivity::class.java,
        ).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)

        val open = {
            if (Build.VERSION.SDK_INT >= 34) {
                val pending = PendingIntent.getActivity(
                    this,
                    0,
                    launch,
                    PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT,
                )
                startActivityAndCollapse(pending)
            } else {
                @Suppress("DEPRECATION")
                startActivityAndCollapse(launch)
            }
        }
        // On a locked device, ask to unlock first — the camera UI shouldn't
        // appear over the lock screen.
        if (isLocked) unlockAndRun { open() } else open()
    }
}
