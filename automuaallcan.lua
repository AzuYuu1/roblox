local saveModule = require(game:GetService("ReplicatedStorage").Library.Client.Save).Get()
local Network = game.ReplicatedStorage:WaitForChild('Network')
local Library = require(game.ReplicatedStorage:WaitForChild('Library'))

local rodNames = {
    Fishing = {
        ["Pro Fishing Rod"] = {100000},
        ["Super Fishing Rod"] = {25000},
        ["Advanced Fishing Rod"] = {2500},
        ["Sturdy Fishing Rod"] = {100},
    },
    AdvancedFishing = {
        ["Amethyst Fishing Rod"] = {2250000},
        ["Sapphire Fishing Rod"] = {425000},
        ["Emerald Fishing Rod"] = {150000},
        ["Platinum Fishing Rod"] = {40000},
    },
}

function getActive() return workspace.__THINGS.__INSTANCE_CONTAINER.Active:GetChildren()[1] end

function checkForRod(rodName)
    for uid,value in pairs(saveModule.Inventory.Misc)  do
        for _,v in pairs(value) do
            if v == rodName  then
                return true 
            end
        end
    end
    return false
end

function buyRod(rodName) return Network:WaitForChild("FishingMerchant_PurchaseRod"):InvokeServer(rodName) end

local Area = tostring(getActive())
local areaRodNames = rodNames[Area]
local desiredRod = ""
if Area == "Fishing" and not checkForRod("Wooden Fishing Rod") then
    Network.Instancing_FireCustomFromClient:FireServer("Fishing", "ClaimRod") 
    desiredRod = "Pro Fishing Rod"
elseif Area == "AdvancedFishing" and not checkForRod("Amethyst Fishing Rod") then
    desiredRod = "Amethyst Fishing Rod"
end

while true do task.wait(10)
    if areaRodNames and not checkForRod(desiredRod) then
        for rodName, price in pairs(areaRodNames) do
            if not checkForRod(rodName) and Library.CurrencyCmds.Get("Fishing") > price[1] then
                buyRod(rodName)
                warn("bought "..rodName, price[1])
            end
        end
    end
end
