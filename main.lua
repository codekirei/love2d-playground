--[[--------------------------------------------------------
      Modules
--]]--------------------------------------------------------
-- local inspect = require 'lib.inspect'

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
local speed = 500

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
      LOVE.update
--]]--------------------------------------------------------
function love.update(dt)

  -- move character around
  local keymap = {
    { key = 'w', axis = 'y', sign = -1 },
    { key = 'a', axis = 'x', sign = -1 },
    { key = 's', axis = 'y', sign = 1 },
    { key = 'd', axis = 'x', sign = 1 }
  }
  for _,t in ipairs (keymap) do
    if lk.isDown(t.key) then
      char[t.axis] = char[t.axis] + speed * dt * t.sign
    end
  end

end

--[[--------------------------------------------------------
      LOVE.keypress
--]]--------------------------------------------------------
-- function love.keypressed(key, scancode, isrepeat)
-- end
