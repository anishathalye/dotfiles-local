function reload()
  hs.notify.new({title='Reloading', informativeText='Reloading Hammerspoon config'}):send()
  hs.reload()
end

reloadWatcher = hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reload):start()
