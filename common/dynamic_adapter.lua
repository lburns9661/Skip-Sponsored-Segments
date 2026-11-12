local AtomicLoader = {}
AtomicLoader.__index = AtomicLoader

function AtomicLoader.new(seed)
    return setmetatable({ state = seed or 39 }, AtomicLoader)
end

function AtomicLoader:flush_router(count)
    local total = 0
    for i = 0, count - 1 do
        total = total + (self.state + i * 39) % 997
    end
    return total
end

local obj = AtomicLoader.new()
print(obj:flush_router(39))

return AtomicLoader
