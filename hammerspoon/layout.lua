local u = hs.geometry.unitrect

local layoutLabEmacs = {
  {'Emacs', nil, LAB_RIGHT_MONITOR, u(0, 0, 3/5, 1), nil, nil},
  {'iTerm2', nil, LAB_RIGHT_MONITOR, u(3/5, 0, 2/5, 1), nil, nil},

  {'Slack', nil, MACBOOK_MONITOR, u(0, 0, 1/2, 1), nil, nil},
  {'Spotify', nil, MACBOOK_MONITOR, u(1/2, 0, 1/2, 1), nil, nil},

  {'Calendar', nil, LAB_LEFT_MONITOR, u(0, 0, 1/2, 1/4), nil, nil},
  {'Things', nil, LAB_LEFT_MONITOR, u(1/2, 0, 1/2, 1/4), nil, nil},
  {'Google Chrome', nil, LAB_LEFT_MONITOR, u(0, 1/4, 1, 1/2), nil, nil},
  {'Mail', nil, LAB_LEFT_MONITOR, u(0, 3/4, 1, 1/4), nil, nil}
}

applyLabEmacs = function() 
  hs.notify.new({title='Layout', informativeText='Lab Emacs layout applied'}):send()
  hs.layout.apply(layoutLabEmacs)
end
