function inList(val, list)
    for _, v in pairs(list) do
        if val == v then return true end
    end
    return false