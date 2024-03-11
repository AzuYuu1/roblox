task.spawn(function()
    while task.wait() do
            
local saveModule = require(game:GetService("ReplicatedStorage").Library.Client.Save).Get()
local Network = game.ReplicatedStorage:WaitForChild('Network')
local Library = require(game.ReplicatedStorage:WaitForChild('Library'))

local shovelNames = {

    AdvancedDigsite = {
        ["Amethyst Shovel"] = {12500000},
    },
}

function getActive() return workspace.__THINGS.__INSTANCE_CONTAINER.Active:GetChildren()[1] end

function checkForShovel(shovelName)
    for uid,value in pairs(saveModule.Inventory.Misc)  do
        for _,v in pairs(value) do
            if v == shovelName  then
                return true 
            end
        end
    end
    return false
end

function buyShovel(shovelName) return Network:WaitForChild("DigsiteMerchant_PurchaseShovel"):InvokeServer(shovelName) end

local Area = tostring(getActive())
local areaShovelNames = shovelNames[Area]
local desiredShovel = ""
if Area == "Digsite" and not checkForShovel("Wooden Shovel") then
    Network.Instancing_FireCustomFromClient:FireServer("Digsite", "ClaimShovel") 
    desiredShovel = "Pro Shovel"
elseif Area == "AdvancedDigsite" and not checkForShovel("Amethyst Shovel") then
    desiredShovel = "Amethyst Shovel"
end

while true do task.wait(3)
    if areaShovelNames and not checkForShovel(desiredShovel) then
        for shovelName, price in pairs(areaShovelNames) do
            if not checkForShovel(shovelName) and Library.CurrencyCmds.Get("Digsite") > price[1] then
                buyShovel(shovelName)
                warn("bought "..shovelName, price[1])
            end
        end
    end
end
        task.wait(5)
    end
end)
