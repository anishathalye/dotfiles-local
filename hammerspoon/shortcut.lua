-- lock screen by starting screensaver
hs.hotkey.bind({'shift', 'cmd'}, 'l', function() hs.caffeinate.startScreensaver() end)
