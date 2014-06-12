adbss() {
    adb shell stop &&
    adb remount &&
    adb sync &&
    adb shell start
}

alias lc='adb logcat'

# compile and test paint
ctp() {
    mmm -j16 frameworks/base frameworks/base/core/jni &&
    adbss &&
    runtest -j16 --path cts/tests/tests/graphics/src/android/graphics/cts/PaintTest.java
}

# vim: set ft=sh :
