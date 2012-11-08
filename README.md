Instructions
============
pipe into /dev/dsp or something like that

or on OSX:
    luajit start.lua | sox -traw -r44100 -b16 -u - -tcoreaudio