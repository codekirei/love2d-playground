--[[--------------------------------------------------------
      Modules
--]]--------------------------------------------------------
local inspect = require 'lib.inspect'

--[[--------------------------------------------------------
      Top Level Vars
--]]--------------------------------------------------------
local window = {}
local char = {}

--[[--------------------------------------------------------
      Load Fn
--]]--------------------------------------------------------
function love.load()

  window.x, window.y = love.window.getDesktopDimensions(1)
  char.size = 100
  char.x = window.x / 2 - char.size / 2
  char.y = window.y / 2 - char.size / 2
  char.color = { 0, 0, 0 }

end

--[[--------------------------------------------------------
      Draw Fn
--]]--------------------------------------------------------
function love.draw()

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
