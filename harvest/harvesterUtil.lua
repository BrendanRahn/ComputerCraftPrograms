
function RefuelFromStorage()
    function MoveSeeds(select_slot, to_slot, amount)
        turtle.select(select_slot)
        turtle.transferTo(to_slot, amount)
        turtle.select(1)
    end

    MoveSeeds(1,16,64)

    turtle.turnLeft()
    turtle.suck(32)
    turtle.refuel()
    turtle.turnRight()

    MoveSeeds(16,1,64)
end

function UnloadItems()
    --omit 1st and 2nd slots to keep stack of seeds and taters
    for i=3,16 do
        turtle.select(i)
        turtle.dropDown()
    end
    turtle.select(1)
end

function StartTimer()
    local minutes = 35
    local time_seconds = minutes * 60
    local quarter_interval = time_seconds / 4
    
    print("--- 0% ---")
    os.sleep(quarter_interval)
    print("--- 25% ---")
    os.sleep(quarter_interval)
    print("--- 50% ---")
    os.sleep(quarter_interval)
    print("--- 75% ---")
    os.sleep(quarter_interval)
    print("--- 100% ---")
end



return {
    Refuel = RefuelFromStorage,
    Unload = UnloadItems,
    StartTimer = StartTimer,
}