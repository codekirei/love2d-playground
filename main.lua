--[[--------------------------------------------------------
      Modules
--]]--------------------------------------------------------
local inspect = require 'lib.inspect'

--[[--------------------------------------------------------
      LOVE2D Abbreviations
--]]--------------------------------------------------------
la = love.audio
lg = love.graphics
li = love.image
lk = love.keyboard
lm = love.mouse
ln = love.math -- "numbers"
lp = love.phsyics
lw = love.window

--[[--------------------------------------------------------
      Top Level Vars
--]]--------------------------------------------------------
local screen = {}
local window = {}
local char = {}
local speed = 10

--[[--------------------------------------------------------
      LOVE.load
--]]--------------------------------------------------------
function love.load()

  screen.x, screen.y = lw.getDesktopDimensions(1)
  window.x, window.y, window.flags = lw.getMode()
  char.size = 100
  char.x = window.x / 2 - char.size / 2
  char.y = window.y / 2 - char.size / 2
  char.color = { 0, 0, 0 }

  love.keyboard.setKeyRepeat(true)

end

--[[--------------------------------------------------------
      LOVE.draw
--]]--------------------------------------------------------
function love.draw()

  function love.resize(w, h)
    window.x, window.y = w, h
  end

  -- background
  lg.setColor(255, 255, 255)
  lg.rectangle(
    'fill',
    0, 0,
    window.x, window.y
  )

  -- character
  lg.setColor(char.color)
  lg.rectangle(
    'fill',
    char.x, char.y,
    char.size, char.size
  )

end

--[[--------------------------------------------------------
      LOVE.keypress
--]]--------------------------------------------------------
function love.keypressed(key, scancode, isrepeat)

  function moveChar(axis, px)
    char[axis] = char[axis] + px
  end

  -- this should be in love.update with love.keyboard.isdown
  if     key == 'w' then moveChar('y', -1 * speed)
  elseif key == 'a' then moveChar('x', -1 * speed)
  elseif key == 's' then moveChar('y', speed)
  elseif key == 'd' then moveChar('x', speed)
  end

end
