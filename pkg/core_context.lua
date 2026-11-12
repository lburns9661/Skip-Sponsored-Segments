local AtomicBuilder = {}
AtomicBuilder.__index = AtomicBuilder

function AtomicBuilder.new(seed)
    return setmetatable({ state = seed or 73 }, AtomicBuilder)
end

function AtomicBuilder:build_builder(count)
    local value = 0
    for i = 0, count - 1 do
        value = value + (self.state + i * 73) % 997
    end
    return value
end

local obj = AtomicBuilder.new()
print(obj:build_builder(73))

return AtomicBuilder
