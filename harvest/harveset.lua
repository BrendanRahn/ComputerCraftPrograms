X_AXIS = 9
Z_AXIS = 9
TURN_DIRECTION = "right"
NUM_LAYERS = 4
LAYER_HEIGHT = 4

function IsEven(num)
    return (num % 2 == 0)
end

function TurtleRotate(direction)
    if (direction == "right") then
        turtle.turnRight()
        turtle.forward()
        turtle.turnRight()
    elseif (direction == "left") then
        turtle.turnLeft()
        turtle.forward()
        turtle.turnLeft()
    end
end
 
function ToggleDirection(currDirection)
    if currDirection == "right" then
        return "left"
    elseif currDirection == "left" then 
        return "right"
    end
end

function SwapCrops(row)
    if (IsEven(row)) then
        turtle.select(1)
    else 
        turtle.select(2)
    end
end
 
function HarvestLayer(x_dist, z_dist)
    for x=1,x_dist do
        
        SwapCrops(x)

        for z=1,z_dist do
            turtle.digDown()
            turtle.suckDown()
            turtle.placeDown()
            if z < z_dist then
                turtle.forward()
            end
        end
        if x < x_dist then 
            if TURN_DIRECTION == "right" then
                TurtleRotate("right")
            elseif TURN_DIRECTION == "left" then
                TurtleRotate("left")
            end
        end
        
        TURN_DIRECTION = ToggleDirection(TURN_DIRECTION)
        
    end
end

function RiseToNextLayer()
    turtle.forward()
    for i=1,LAYER_HEIGHT do
        turtle.up()
    end
    turtle.turnRight()
    turtle.turnRight()
    turtle.forward()
end

function ReturnToStart()
    local distance = (NUM_LAYERS-1) * LAYER_HEIGHT
    if not (IsEven(NUM_LAYERS)) then 
        for x=1,X_AXIS+1 do
            turtle.back()
        end
    elseif (IsEven(NUM_LAYERS)) then
        turtle.forward()
    end
    for i=1,distance do
        turtle.down()
    end
    turtle.turnRight()
    turtle.turnRight()

end 

function HarvestFarm(layers)
    turtle.forward()
    for layer=1,NUM_LAYERS do
        HarvestLayer(X_AXIS, Z_AXIS)
        if (layer ~= NUM_LAYERS) then 
            RiseToNextLayer()
        end
        --if x_axis is % 2 then toggle, otherwise not
        if not (IsEven(X_AXIS)) then 
            TURN_DIRECTION = ToggleDirection(TURN_DIRECTION)
        end
    end
    ReturnToStart()
end

return {
    HarvestFarm = HarvestFarm
}