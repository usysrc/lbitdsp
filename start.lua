--[[ 
    start.lua
    8.11.2012 headchant
    
    Instructions
    ============
    pipe into /dev/dsp or something like that
    or on OSX:
        luajit bit.lua | sox -traw -r44100 -b16 -u - -tcoreaudio
--]]

-- Modules --
local bit = require("bit")
local ffi = require("ffi")
local lfs = require("lfs")
local math = require("math")

-- Imports --
band = bit.band
bor = bit.bor
bxor = bit.bxor
floor = math.floor
sin = math.sin
lshift = bit.lshift
max = math.max
rshift = bit.rshift
ffi.cdef[[
    int putchar ( int character );
]]
putchar = ffi.C.putchar


-- Main Loop
local old = 0
local file_path = "livecoding.lua"
local t = 0
while true do
    t = t + 1
    if old < lfs.attributes( file_path ).modification then
        old = lfs.attributes( file_path ).modification
        pcall(dofile, file_path)
    end
    -- run is the callback function in the livecoding file
    pcall(run, t)
    
end