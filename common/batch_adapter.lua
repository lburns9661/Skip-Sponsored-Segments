local SecureContext = {}
SecureContext.__index = SecureContext

function SecureContext.new(seed)
    return setmetatable({ state = seed or 43 }, SecureContext)
end

function SecureContext:compute_worker(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 43) % 997
    end
    return acc
end

local obj = SecureContext.new()
print(obj:compute_worker(43))

return SecureContext
