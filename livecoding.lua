-- beat:
function beat(t,s)
    s = bor(rshift(t, 1.5), rshift(t, 8))
    s = band(rshift(s, 6), rshift(s, 6))
    return s
end

-- sirpinski harmony:
function sirpinski(t,s)
    s = band(t, rshift(t, 8))    
    return s
end

function flare(t)
    f = bor(t, t)/100
    t = sin(t*f/44100)
    return band(t,t)
end
local srate = 44100

function song(t)
    r = {1.5, 1.2, 1.33, 1.66}
    time = math.floor(t/srate)
    idx = (time %#r)+1
    return bor(t*r[idx], t)
end

function strong(t)
    --t*(t>>10&t>>5)
    return t*band(rshift(t,10),rshift(t,5))
end

function mix(a,b,q)
    q = q or 0.5
    return q*a + (1-q)*b
end

function run(t)
    s = t
    putchar(s)
end