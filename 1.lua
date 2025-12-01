Dial = {
  Pos = 50,

  Move = function (str)
    print("move " .. str)

    -- split out first char L/R and rest of string 
    local dir = string.sub(str, 1, 1)

    -- parse rest of string as integer
    local amt = tonumber(string.sub(str, 2))

    -- add or subtract int from pos depending on L/R
    local x
    if dir == "L" then
      x = Dial.Pos - amt
    else
      x = Dial.Pos + amt
    end
    -- print("X: " .. x)

    -- if pos > 99, subtract 99 by times around
    -- if pos < 0, add 99 by times around
    local y, z
    if x > 99 then
      y = math.floor(x / 100)
      -- print("Y: " .. y)
      z = x - (100 * y)
    elseif x < 0 then
      y = 1 + math.floor(math.abs(x) / 100)
      z = (100 * y) + x
    else
      z = x
    end

    Dial.Pos = z
    print("to position " .. Dial.Pos)
  end
}

-- load input file
-- move dial for each line
local password = 0

print("Starting at position " .. Dial.Pos)
for line in io.lines(arg[1]) do
  Dial.Move(line)
  if Dial.Pos == 0 then
    password = password + 1
  end
end

print("----------")
print("The password is " .. password)
