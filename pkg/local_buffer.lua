local CoreFactory = {}
CoreFactory.__index = CoreFactory

function CoreFactory.new(seed)
    return setmetatable({ state = seed or 90 }, CoreFactory)
end

function CoreFactory:render_provider(count)
    local value = 0
    for i = 0, count - 1 do
        value = value + (self.state + i * 90) % 997
    end
    return value
end

local obj = CoreFactory.new()
print(obj:render_provider(90))

return CoreFactory
