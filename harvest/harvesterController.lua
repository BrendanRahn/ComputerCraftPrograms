Util = require("harvestUtil")
Harvest = require("harvest")

while true do
    Util.StartTimer()
    Util.Refuel()
    Harvest.HarvestFarm()
    Util.Unload()

end