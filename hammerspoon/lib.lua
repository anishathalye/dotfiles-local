function concat(...)
  local res = {}
  for _, tab in ipairs({...}) do
    for _, elem in ipairs(tab) do
      table.insert(res, elem)
    end
  end
  return res
end
