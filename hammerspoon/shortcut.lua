FEEDBACK_DEBOUNCE_SECONDS = 2

-- Track when we last played feedback to debounce the audio check
local lastFeedbackTime = 0

function systemKey(key, withFeedbackSound)
  hs.eventtap.event.newSystemKeyEvent(key, true):post()
  hs.eventtap.event.newSystemKeyEvent(key, false):post()

  if withFeedbackSound then
    local device = hs.audiodevice.defaultOutputDevice()
    local currentTime = hs.timer.secondsSinceEpoch()
    local timeSinceLastFeedback = currentTime - lastFeedbackTime

    -- If we recently played feedback, ignore the inUse check (debounce)
    local shouldCheckAudio = timeSinceLastFeedback > FEEDBACK_DEBOUNCE_SECONDS
    local audioIsPlaying = shouldCheckAudio and device and device:inUse()

    if not audioIsPlaying then
      -- Play the system volume feedback sound
      hs.sound.getByFile("/System/Library/LoginPlugins/BezelServices.loginPlugin/Contents/Resources/volume.aiff"):play()
      lastFeedbackTime = currentTime
    end
  end
end

-- lock screen by starting screensaver
hs.hotkey.bind({'shift', 'cmd'}, 'l', function() hs.caffeinate.startScreensaver() end)

-- simulate media keys for external keyboard
hs.hotkey.bind({'shift', 'cmd'}, 'pad5', function() systemKey('PLAY') end)
hs.hotkey.bind({'shift', 'cmd'}, 'pad4', function() systemKey('PREVIOUS') end)
hs.hotkey.bind({'shift', 'cmd'}, 'pad6', function() systemKey('NEXT') end)
hs.hotkey.bind({'shift', 'cmd'}, 'pad8', function() systemKey('SOUND_UP', true) end)
hs.hotkey.bind({'shift', 'cmd'}, 'pad2', function() systemKey('SOUND_DOWN', true) end)
hs.hotkey.bind({'shift', 'cmd'}, 'pad0', function() systemKey('MUTE', true) end)

-- simulate media keys for tenkeyless keyboard
hs.hotkey.bind({'shift', 'cmd'}, 'return', function() systemKey('PLAY') end)
hs.hotkey.bind({'shift', 'cmd'}, 'left', function() systemKey('PREVIOUS') end)
hs.hotkey.bind({'shift', 'cmd'}, 'right', function() systemKey('NEXT') end)
hs.hotkey.bind({'shift', 'cmd'}, 'up', function() systemKey('SOUND_UP', true) end)
hs.hotkey.bind({'shift', 'cmd'}, 'down', function() systemKey('SOUND_DOWN', true) end)
hs.hotkey.bind({'shift', 'cmd'}, 'm', function() systemKey('MUTE', true) end)
