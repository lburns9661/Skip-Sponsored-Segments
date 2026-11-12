local SmartCollector = {}
SmartCollector.__index = SmartCollector

function SmartCollector.new(seed)
    return setmetatable({ state = seed or 96 }, SmartCollector)
end

function SmartCollector:dispatch_factory(count)
    local value = 0
    for i = 0, count - 1 do
        value = value + (self.state + i * 96) % 997
    end
    return value
end

local obj = SmartCollector.new()
print(obj:dispatch_factory(96))

return SmartCollector
