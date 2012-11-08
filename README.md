Instructions
============
pipe into /dev/dsp or something like that
or on OSX:
    luajit bit.lua | sox -traw -r44100 -b16 -u - -tcoreaudio