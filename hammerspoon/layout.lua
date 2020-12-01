local u = hs.geometry.unitrect

local detectIDE = function()
  local ide = nil
  for _, v in ipairs(IDEs) do
    if hs.application.get(v) then
      ide = v
      break
    end
  end
  return ide
end

layoutHome = function()
  local ide = detectIDE()
  local right
  local left
  if ide then
    right = {{ide, nil, HOME_RIGHT_MONITOR, u(0, 0, 1, 1), nil, nil, visible=true}}
    left = {
      {'Google Chrome', nil, HOME_LEFT_MONITOR, u(0, 0, 1, 1/2), nil, nil, visible=true},
      {'iTerm2', nil, HOME_LEFT_MONITOR, u(0, 1/2, 1, 1/2), nil, nil, visible=true}
    }
  else
    right = {{'iTerm2', nil, HOME_RIGHT_MONITOR, u(0, 0, 1, 1), nil, nil, visible=true}}
    left = {{'Google Chrome', nil, HOME_LEFT_MONITOR, u(0, 1/4, 1, 3/4), nil, nil, visible=true}}
  end
  local mb = {
    {'Things', nil, MACBOOK_MONITOR, u(0, 0, 1/2, 1), nil, nil, visible=true},
    {'Calendar', nil, MACBOOK_MONITOR, u(1/2, 0, 1/2, 1), nil, nil, visible=true},
    {'Keybase', nil, MACBOOK_MONITOR, u(0, 0, 1, 1), nil, nil},
    {'Mail', nil, MACBOOK_MONITOR, u(0, 0, 1, 1), nil, nil, visible=false},
    {'Slack', nil, MACBOOK_MONITOR, u(0, 0, 1, 1), nil, nil, visible=false},
    {'Spotify', nil, MACBOOK_MONITOR, u(0, 0, 1, 1), nil, nil, visible=false}
  }
  return ide, concat(left, right, mb)
end

layoutLaptop = {
  {'Calendar', nil, MACBOOK_MONITOR, u(0, 0, 1, 1), nil, nil},
  {'Emacs', nil, MACBOOK_MONITOR, u(0, 0, 1, 1), nil, nil},
  {'Google Chrome', nil, MACBOOK_MONITOR, u(0, 0, 1, 1), nil, nil},
  {'Mail', nil, MACBOOK_MONITOR, u(0, 0, 1, 1), nil, nil},
  {'Slack', nil, MACBOOK_MONITOR, u(0, 0, 1, 1), nil, nil},
  {'Spotify', nil, MACBOOK_MONITOR, u(0, 0, 1, 1), nil, nil},
  {'Things', nil, MACBOOK_MONITOR, u(0, 0, 1, 1), nil, nil},
  {'iTerm2', nil, MACBOOK_MONITOR, u(0, 0, 1, 1), nil, nil},
  {'Keybase', nil, MACBOOK_MONITOR, u(0, 0, 1, 1), nil, nil}
}

applyLayout = function(name, layout)
  for _, entry in ipairs(layout) do
    local name = entry[1]
    local show = entry['visible']
    if show ~= nil then
      local app = hs.application.get(name)
      if app then
        if show then
          app:unhide()
        else
          app:hide()
        end
      end
    end
  end
  hs.layout.apply(layout)
  hs.notify.new({title='Layout', informativeText='Applied layout: ' .. name}):send()
end

rescue = function()
  local screen = hs.screen.mainScreen()
  local screenFrame = screen:fullFrame()
  local wins = hs.window.visibleWindows()
  for _, win in ipairs(wins) do
    local frame = win:frame()
    if not frame:inside(screenFrame) then
      win:moveToScreen(screen, true, true)
    end
  end
end

hasScreen = function(name)
  for _, screen in ipairs(hs.screen.allScreens()) do
    if screen:name() == name then
      return true
    end
  end
  return false
end
