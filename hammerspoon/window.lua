function half(orientation, first)
  return function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local max = win:screen():frame()

    if orientation == 'horizontal' and not first then
        f.x = max.x + max.w / 2
    else
      f.x = max.x
    end

    if orientation == 'vertical' and not first then
      f.y = max.y + max.h / 2
    else
      f.y = max.y
    end

    if orientation == 'horizontal' then
      f.w = max.w / 2
      f.h = max.h
    else
      f.w = max.w
      f.h = max.h / 2
    end

    win:setFrame(f)
  end
end

-- half of screen
hs.hotkey.bind({'alt', 'cmd'}, 'left', half('horizontal', true))
hs.hotkey.bind({'alt', 'cmd'}, 'right', half('horizontal', false))
hs.hotkey.bind({'alt', 'cmd'}, 'up', half('vertical', true))
hs.hotkey.bind({'alt', 'cmd'}, 'down', half('vertical', false))

-- full screen
hs.hotkey.bind({'alt', 'cmd'}, 'f', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

-- center screen
hs.hotkey.bind({'alt', 'cmd'}, 'c', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.x = max.x + (max.w - f.w) / 2
  f.y = max.y + (max.h - f.h) / 2
  win:setFrame(f)
end)

-- move between displays
hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'right', function()
  local win = hs.window.focusedWindow()
  local next = win:screen():toEast()
  if next then
    win:moveToScreen(next, true)
  end
end)
hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'left', function()
  local win = hs.window.focusedWindow()
  local next = win:screen():toWest()
  if next then
    win:moveToScreen(next, true)
  end
end)

-- window hints
hs.hotkey.bind({'shift', 'cmd'}, 'h', hs.hints.windowHints)
