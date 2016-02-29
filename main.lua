--[[--------------------------------------------------------
      Modules
--]]--------------------------------------------------------
local inspect = require 'lib.inspect'

--[[--------------------------------------------------------
      Top Level Vars
--]]--------------------------------------------------------
local screen = {}
local window = {}
local char = {}

--[[--------------------------------------------------------
      LOVE.load
--]]--------------------------------------------------------
function love.load()

  screen.x, screen.y = love.window.getDesktopDimensions(1)
  window.x, window.y, window.flags = love.window.getMode()
  print(inspect(window))
  char.size = 100
  char.x = window.x / 2 - char.size / 2
  char.y = window.y / 2 - char.size / 2
  char.color = { 0, 0, 0 }

end

--[[--------------------------------------------------------
      LOVE.draw
--]]--------------------------------------------------------
function love.draw()

  function love.resize(w, h)
    window.x, window.y = w, h
  end

  -- background
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle(
    'fill',
    0, 0,
    window.x, window.y
  )

  -- character
  love.graphics.setColor(char.color)
  love.graphics.rectangle(
    'fill',
    char.x, char.y,
    char.size, char.size
  )

end
