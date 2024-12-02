--keep cobblestone in slot 2 for removing liquids

UTIL = require("../shared/util")
LOCATION = require("../shared/gps/Location")
CONSTS = require("QuaryConsts")

X_AXIS = CONSTS.QUARY_PARAMS.xAxis
Z_AXIS = CONSTS.QUARY_PARAMS.zAxis
LIQUIDS = CONSTS.QUARY_PARAMS.liquids

function mineLayer()
    for x=1,X_AXIS do
        for z=1,Z_AXIS do
            if(checkLiquidInFront()) then
                removeLiquidInFront()
            end
            if pcall(turtle.dig()) then
                turtle.forward()
            else
                logBedrockEncounter()
        end
    end
end


function checkLiquidInFront()
    blockData = turtle.inspect()
    if(UTIL.inList(blockData[name], LIQUIDS)) then
        return true
    end
    return false
end

function removeLiquidInFront()
    turtle.select(2)
    turtle.place()
    turtle.dig()
    turtle.select(1)
end

function logBedrockEncounter()
    turtleLocation = LOCATION.Location:new(gps.locate())
