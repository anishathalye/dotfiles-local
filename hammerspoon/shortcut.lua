function systemKey(key)
  hs.eventtap.event.newSystemKeyEvent(key, true):post()
  hs.eventtap.event.newSystemKeyEvent(key, false):post()
end

-- lock screen by starting screensaver
hs.hotkey.bind({'shift', 'cmd'}, 'l', function() hs.caffeinate.startScreensaver() end)

-- simulate media keys for external keyboard
hs.hotkey.bind({'shift', 'cmd'}, 'pad5', function() systemKey('PLAY') end)
hs.hotkey.bind({'shift', 'cmd'}, 'pad4', function() systemKey('PREVIOUS') end)
hs.hotkey.bind({'shift', 'cmd'}, 'pad6', function() systemKey('NEXT') end)
hs.hotkey.bind({'shift', 'cmd'}, 'pad8', function() systemKey('SOUND_UP') end)
hs.hotkey.bind({'shift', 'cmd'}, 'pad2', function() systemKey('SOUND_DOWN') end)
hs.hotkey.bind({'shift', 'cmd'}, 'pad0', function() systemKey('MUTE') end)

-- simulate media keys for tenkeyless keyboard
hs.hotkey.bind({'shift', 'cmd'}, 'return', function() systemKey('PLAY') end)
hs.hotkey.bind({'shift', 'cmd'}, 'left', function() systemKey('PREVIOUS') end)
hs.hotkey.bind({'shift', 'cmd'}, 'right', function() systemKey('NEXT') end)
hs.hotkey.bind({'shift', 'cmd'}, 'up', function() systemKey('SOUND_UP') end)
hs.hotkey.bind({'shift', 'cmd'}, 'down', function() systemKey('SOUND_DOWN') end)
hs.hotkey.bind({'shift', 'cmd'}, 'm', function() systemKey('MUTE') end)
