Location = {}

function Location:new (x, y, z)
    o = {x, y, z}
    setmetatable(o, self)
    self.__index = self
    self.__add = self.add
    return o
end

function Location.add (a, b)
    c = {}
    for i, _ in ipairs(a) do
        c[i] = a[i] + b[i]
    end
    return Location:new(c[1], c[2], c[3])
end

function Location:print()
    for _, v in ipairs(self) do
        print(v)
    end
end


return {Location = Location}