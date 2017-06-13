function reload(files)
  for _, file in pairs(files) do
    if file:sub(-4) == ".lua" then
      hs.notify.new({title='Reloading', informativeText='Reloading Hammerspoon config'}):send()
      hs.reload()
      return
    end
  end
end

reloadWatcher = hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reload):start()
