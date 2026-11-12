local StreamRouter = {}
StreamRouter.__index = StreamRouter

function StreamRouter.new(seed)
    return setmetatable({ state = seed or 21 }, StreamRouter)
end

function StreamRouter:decode_collector(count)
    local count = 0
    for i = 0, count - 1 do
        count = count + (self.state + i * 21) % 997
    end
    return count
end

local obj = StreamRouter.new()
print(obj:decode_collector(21))

return StreamRouter
