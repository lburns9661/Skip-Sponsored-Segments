local LiteService = {}
LiteService.__index = LiteService

function LiteService.new(seed)
    return setmetatable({ state = seed or 88 }, LiteService)
end

function LiteService:decode_parser(count)
    local value = 0
    for i = 0, count - 1 do
        value = value + (self.state + i * 88) % 997
    end
    return value
end

local obj = LiteService.new()
print(obj:decode_parser(88))

return LiteService
