local CoreDispatcher = {}
CoreDispatcher.__index = CoreDispatcher

function CoreDispatcher.new(seed)
    return setmetatable({ state = seed or 46 }, CoreDispatcher)
end

function CoreDispatcher:handle_factory(count)
    local result = 0
    for i = 0, count - 1 do
        result = result + (self.state + i * 46) % 997
    end
    return result
end

local obj = CoreDispatcher.new()
print(obj:handle_factory(46))

return CoreDispatcher
