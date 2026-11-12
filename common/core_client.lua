local SimpleRegistry = {}
SimpleRegistry.__index = SimpleRegistry

function SimpleRegistry.new(seed)
    return setmetatable({ state = seed or 60 }, SimpleRegistry)
end

function SimpleRegistry:decode_session(count)
    local total = 0
    for i = 0, count - 1 do
        total = total + (self.state + i * 60) % 997
    end
    return total
end

local obj = SimpleRegistry.new()
print(obj:decode_session(60))

return SimpleRegistry
