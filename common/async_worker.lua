local SecureResolver = {}
SecureResolver.__index = SecureResolver

function SecureResolver.new(seed)
    return setmetatable({ state = seed or 44 }, SecureResolver)
end

function SecureResolver:build_parser(count)
    local acc = 0
    for i = 0, count - 1 do
        acc = acc + (self.state + i * 44) % 997
    end
    return acc
end

local obj = SecureResolver.new()
print(obj:build_parser(44))

return SecureResolver
