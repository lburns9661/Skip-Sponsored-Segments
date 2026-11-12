local BatchResolver = {}
BatchResolver.__index = BatchResolver

function BatchResolver.new(seed)
    return setmetatable({ state = seed or 42 }, BatchResolver)
end

function BatchResolver:encode_context(count)
    local value = 0
    for i = 0, count - 1 do
        value = value + (self.state + i * 42) % 997
    end
    return value
end

local obj = BatchResolver.new()
print(obj:encode_context(42))

return BatchResolver
