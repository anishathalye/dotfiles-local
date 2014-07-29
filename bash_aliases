setdeviceprompt() {
    PS1="\[\033[0;32m\]\u\[\033[0m\]@\[\033[0;33m\]\h\[\033[0m\] \[\033[0;31m\]\w\[\033[0m\] \[\033[0;36m\][${1}]\[\033[0m\]\n\[\033[0;34m\]\$\[\033[0m\] "
}

CURRENT_DEVICE=""

setdevice() {
    case "${1}" in
        "hammerhead")
            CURRENT_DEVICE="06f0930b00743ab1"
            ;;
        "flo")
            CURRENT_DEVICE="070877dd"
            ;;
        *)
            CURRENT_DEVICE=""
            ;;
    esac
    if [[ -n $CURRENT_DEVICE ]]; then
        setdeviceprompt $1
    else
        if [[ -n $1 ]]; then
            setdeviceprompt "$1 | default"
        else
            setdeviceprompt "unknown"
        fi
    fi
}

inferdevice() {
    if [[ -n $ANDROID_PRODUCT_OUT ]]; then
        setdevice $(basename $ANDROID_PRODUCT_OUT)
    else
        setdevice ""
    fi
}

runcurrent() {
    local CMD=$1 && shift
    if [[ "$CURRENT_DEVICE" != "" ]]; then
        $CMD -s $CURRENT_DEVICE $@
    else
        $CMD $@
    fi
}

alias adb='runcurrent adb'
alias fastboot='runcurrent fastboot'

adbss() {
    adb shell stop &&
        adb remount &&
        adb sync &&
        adb shell start
}

makefb() {
    (
    croot &&
        mmm -j12 frameworks/base frameworks/base/core/jni
    )
}

syncfb() {
    makefb && adbss
}

makemb() {
    (
    croot &&
        mmm -j12 vendor/google_experimental/users/aathalye/Markbench
    )
}

syncmb() {
    makemb && adbss
}

alias lc='adb logcat'
alias lcc='adb logcat -c && adb logcat' # clear logcat buffer

# for use after editing device/.../BoardConfig.mk
alias cleanri='rm -rf $OUT/obj/SHARED_LIBRARIES/libandroid_runtime_intermediates'

# vim: set ft=sh :
