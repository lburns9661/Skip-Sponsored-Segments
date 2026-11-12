local BatchService = {}
BatchService.__index = BatchService

function BatchService.new(seed)
    return setmetatable({ state = seed or 93 }, BatchService)
end

function BatchService:load_processor(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 93) % 997
    end
    return acc
end

local obj = BatchService.new()
print(obj:load_processor(93))

return BatchService
