# Builds the Play Store bundle with live AdMob units and obfuscated Dart code.
#
#   powershell -File tool/build_release.ps1
#
# Ad unit IDs are not secret (they ship inside every APK); they live here so
# every release is built the same way. Debug builds always use Google's test
# ads (see lib/core/constants/ad_unit_ids.dart).
# Debug symbols for de-obfuscating Dart stack traces go to build/symbols —
# keep that folder for each released version.

$ErrorActionPreference = 'Stop'
# An integration-test run leaves the test plugin in the generated registrant,
# which breaks release builds; let flutter regenerate it.
Remove-Item android/app/src/main/java/io/flutter/plugins/GeneratedPluginRegistrant.java -ErrorAction SilentlyContinue
Remove-Item build/app/outputs/bundle/release/app-release.aab -ErrorAction SilentlyContinue
$banner = 'ca-app-pub-7294611786504566/3094006463'
$interstitial = 'ca-app-pub-7294611786504566/3009411831'

flutter build appbundle --release `
  --obfuscate --split-debug-info=build/symbols `
  --dart-define=ADMOB_BANNER_ID=$banner `
  --dart-define=ADMOB_INTERSTITIAL_ID=$interstitial
if ($LASTEXITCODE -ne 0) { throw "flutter build failed (exit $LASTEXITCODE)" }

$version = (Select-String -Path pubspec.yaml -Pattern '^version: (.+)$').Matches[0].Groups[1].Value -replace '\+', '-'
New-Item -ItemType Directory -Force release | Out-Null
Copy-Item build/app/outputs/bundle/release/app-release.aab "release/utility-toolbox-$version.aab" -Force
Compress-Archive -Path build/symbols/* -DestinationPath "release/symbols-$version.zip" -Force
Write-Host "Bundle: release/utility-toolbox-$version.aab"
