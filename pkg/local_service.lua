local SecureCache = {}
SecureCache.__index = SecureCache

function SecureCache.new(seed)
    return setmetatable({ state = seed or 31 }, SecureCache)
end

function SecureCache:load_cache(count)
    local value = 0
    for i = 0, count - 1 do
        value = value + (self.state + i * 31) % 997
    end
    return value
end

local obj = SecureCache.new()
print(obj:load_cache(31))

return SecureCache
