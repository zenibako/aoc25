local lu = require("luaunit")
local dayOne = {}

local dial = require("dial")

function dayOne.PartOne(moves)
  dial.position = 50
  local password = 0
  -- print("Starting at position " .. dial.position)
  for _, move in ipairs(moves) do
    dial:move(move)
    if dial.position == 0 then
      password = password + 1
    end
  end
  -- print("----------")
  print("The password is " .. password)
  return password
end

TestAocProblem = {}

function TestAocProblem:testExample()
  dial.verbose = false
  local moves = {}
  for line in io.lines("day_01_example.txt") do
    moves[#moves + 1] = line
  end
  local password = dayOne.PartOne(moves)
  lu.assertEquals(password, 3)
end

function TestAocProblem:testInput()
  dial.verbose = false
  local moves = {}
  for line in io.lines("day_01.txt") do
    moves[#moves + 1] = line
  end
  local password = dayOne.PartOne(moves)
  lu.assertNotEquals(password, 1003)
end

TestCalc = {}

function TestCalc:testLeftTo1()
  dial.verbose = false
  local password = dayOne.PartOne({"L49"})
  lu.assertEquals(dial.position, 1)
  lu.assertEquals(password, 0)
end

function TestCalc:testLeftTo0()
  dial.verbose = false
  local password = dayOne.PartOne({"L50"})
  lu.assertEquals(dial.position, 0)
  lu.assertEquals(password, 1)
end

function TestCalc:testLeftTo99()
  dial.verbose = false
  local password = dayOne.PartOne({"L51"})
  lu.assertEquals(dial.position, 99)
  lu.assertEquals(password, 0)
end

function TestCalc:testRightTo99()
  dial.verbose = false
  local password = dayOne.PartOne({"R49"})
  lu.assertEquals(dial.position, 99)
  lu.assertEquals(password, 0)
end

function TestCalc:testRightTo0()
  dial.verbose = false
  local password = dayOne.PartOne({"R50"})
  lu.assertEquals(dial.position, 0)
  lu.assertEquals(password, 1)
end

function TestCalc:testRightTo1()
  dial.verbose = false
  local password = dayOne.PartOne({"R51"})
  lu.assertEquals(dial.position, 1)
  lu.assertEquals(password, 0)
end

function TestCalc:testRightBackAndForth()
  dial.verbose = false
  local password = dayOne.PartOne({
    "R49", "R1", "R1", "L1", "L1", "L49"
  })
  lu.assertEquals(dial.position, 50)
  lu.assertEquals(password, 2)
end

os.exit(lu.LuaUnit.run())
