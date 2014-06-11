adbss() {
    adb shell stop &&
    adb remount &&
    adb sync &&
    adb shell start
}
