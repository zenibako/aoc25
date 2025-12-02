M = {
  position = 50,
  verbose = false
}

function M:move(str)
  -- print("move " .. str)

  -- split out first char L/R and rest of string 
  local dir = string.sub(str, 1, 1)

  -- parse rest of string as integer
  local amt = tonumber(string.sub(str, 2))

  -- add or subtract int from pos depending on L/R
  local x
  if dir == "L" then
    x = self.position - amt
  else
    x = self.position + amt
  end

  if self.verbose then print("\nx: " .. x) end

  -- if pos > 99, subtract 99 by times around
  -- if pos < 0, add 99 by times around
  local y, z
  if x > 99 then
    y = math.floor(x / 100)
    if self.verbose then print("go above 99 -> y: " .. y) end
    z = x - (100 * y)
  elseif x < 0 then
    y = 1 + math.floor(math.abs(x) / 100)
    if self.verbose then print("go below 0 -> y: " .. y) end
    z = (100 * y) + x
  else
    if self.verbose then print("no y") end
    z = x
  end
  if self.verbose then print("z: " .. z) end

  self.position = z
end

return M
