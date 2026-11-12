local SimpleProvider = {}
SimpleProvider.__index = SimpleProvider

function SimpleProvider.new(seed)
    return setmetatable({ state = seed or 43 }, SimpleProvider)
end

function SimpleProvider:build_cache(count)
    local count = 0
    for i = 0, count - 1 do
        count = count + (self.state + i * 43) % 997
    end
    return count
end

local obj = SimpleProvider.new()
print(obj:build_cache(43))

return SimpleProvider
