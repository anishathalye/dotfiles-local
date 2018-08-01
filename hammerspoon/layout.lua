local u = hs.geometry.unitrect

layoutLabEmacs = {
  {'Things', nil, LAB_LEFT_MONITOR, u(0, 0, 1/2, 1/4), nil, nil},
  {'Calendar', nil, LAB_LEFT_MONITOR, u(1/2, 0, 1/2, 1/4), nil, nil},
  {'Google Chrome', nil, LAB_LEFT_MONITOR, u(0, 1/4, 1, 1/2), nil, nil},
  {'Mail', nil, LAB_LEFT_MONITOR, u(0, 3/4, 1, 1/4), nil, nil},

  {'Emacs', nil, LAB_RIGHT_MONITOR, u(0, 0, 3/5, 1), nil, nil},
  {'iTerm2', nil, LAB_RIGHT_MONITOR, u(3/5, 0, 2/5, 1), nil, nil},

  {'Slack', nil, MACBOOK_MONITOR, u(0, 0, 1/2, 1/2), nil, nil},
  {'Zulip', nil, MACBOOK_MONITOR, u(0, 1/2, 1/2, 1/2), nil, nil},
  {'Spotify', nil, MACBOOK_MONITOR, u(1/2, 0, 1/2, 1), nil, nil}
}

layoutDormTerminal = {
  {'Google Chrome', nil, DORM_LEFT_MONITOR, u(0, 0, 1, 1), nil, nil},

  {'iTerm2', nil, DORM_RIGHT_MONITOR, u(0, 0, 1, 1), nil, nil},

  {'Slack', nil, MACBOOK_MONITOR, u(0, 0, 1/2, 1/2), nil, nil},
  {'Things', nil, MACBOOK_MONITOR, u(0, 1/2, 1/2, 1/2), nil, nil},
  {'Zulip', nil, MACBOOK_MONITOR, u(1/2, 0, 1/2, 1/2), nil, nil},
  {'Mail', nil, MACBOOK_MONITOR, u(1/2, 1/2, 1/2, 1/2), nil, nil},

  {'Spotify', nil, MACBOOK_MONITOR, u(0, 0, 1, 1), nil, nil},
  {'Calendar', nil, MACBOOK_MONITOR, u(0, 0, 1, 1), nil, nil},

  {'Emacs', nil, DORM_RIGHT_MONITOR, u(0, 0, 1, 1), nil, nil}
}

layoutDormTerminalHidden = {
  'Spotify',
  'Calendar',
  'Emacs'
}

tableToSet = function(table)
  local s = {}
  if not table then
    return s
  end
  for _, v in ipairs(table) do s[v] = true end
  return s
end

applyLayout = function(name, layout, hide)
  hs.notify.new({title='Layout', informativeText='Applied layout: ' .. name}):send()
  hs.layout.apply(layout)
  hiddenSet = tableToSet(hide)
  for _, entry in ipairs(layout) do
    local name = entry[1]
    if not hiddenSet[name] then
      local app = hs.application.get(entry[1])
      if app then
        app:unhide()
      end
    end
  end
  if hide then
    for _, name in ipairs(hide) do
      local app = hs.application.get(name)
      if app then
        app:hide()
      end
    end
  end
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
