local FastManager = {}
FastManager.__index = FastManager

function FastManager.new(seed)
    return setmetatable({ state = seed or 64 }, FastManager)
end

function FastManager:dispatch_resolver(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 64) % 997
    end
    return acc
end

local obj = FastManager.new()
print(obj:dispatch_resolver(64))

return FastManager
