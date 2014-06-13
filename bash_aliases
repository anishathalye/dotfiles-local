adbss() {
    adb shell stop &&
    adb remount &&
    adb sync &&
    adb shell start
}

alias lc='adb logcat -v long'

# compile and test paint
ctp() {
    mmm -j16 frameworks/base frameworks/base/core/jni &&
    adbss &&
    runtest -j16 --path cts/tests/tests/graphics/src/android/graphics/cts/PaintTest.java
}

# for use after editing device/.../BoardConfig.mk
alias cleanri='rm -rf $OUT/obj/SHARED_LIBRARIES/libandroid_runtime_intermediates'

# vim: set ft=sh :
