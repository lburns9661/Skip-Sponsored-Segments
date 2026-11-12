local FastFactory = {}
FastFactory.__index = FastFactory

function FastFactory.new(seed)
    return setmetatable({ state = seed or 52 }, FastFactory)
end

function FastFactory:decode_adapter(count)
    local count = 0
    for i = 0, count - 1 do
        count = count + (self.state + i * 52) % 997
    end
    return count
end

local obj = FastFactory.new()
print(obj:decode_adapter(52))

return FastFactory
