
task.spawn(function()
    while task.wait(1.5) do
game:GetService("ReplicatedStorage").Network["Mailbox: Claim All"]:InvokeServer()
        task.wait(5)
    end
end)

task.spawn(function()
    while task.wait(1.5) do
getgenv().autoMisc = {
    autoEnchant = true,
    enchantConfig = {

        {Name = "Coins", Tier =  7},
        {Name = "Coins", Tier =  6},
        {Name = "Coins", Tier =  5},

    },
    
    }
local Library = require(game.ReplicatedStorage.Library)
local saveMod = require(game.ReplicatedStorage.Library.Client.Save)
function getInfo(name) return saveMod.Get()[name] end 

function getUID(Class, Name, Tier)
    for i,v in pairs(getInfo("Inventory")[Class]) do
        if v.id == Name and v.tn == Tier then
            return i
        end
    end
end

while getgenv().autoMisc.autoEnchant do
    for _,enchant in pairs(getgenv().autoMisc. enchantConfig) do
        local enchantId = getUID("Enchant", enchant.Name, enchant.Tier)
        if enchantId then
            Library.Network.Fire("Enchants_Equip", enchantId)
        end
        task.wait(1)
    end
    task.wait(1)
end
        task.wait(2)
    end
end)

            
task.spawn(function()
    while task.wait(1.5) do
getgenv().autoMisc = {
    autoPotion = true,
    potionConfig = {

        {Name = "Coins", Tier = 4},
        {Name = "Coins", Tier = 5},
        {Name = "Coins", Tier = 6},
        {Name = "Damage", Tier = 4},
        {Name = "Damage", Tier = 5},
        {Name = "Damage", Tier = 6},

    },
    
    }
local Library = require(game.ReplicatedStorage.Library)
local saveMod = require(game.ReplicatedStorage.Library.Client.Save)
function getInfo(name) return saveMod.Get()[name] end 

function getUID(Class, Name, Tier)
    for i,v in pairs(getInfo("Inventory")[Class]) do
        if v.id == Name and v.tn == Tier then
            return i
        end
    end
end

while getgenv().autoMisc.autoPotion do
    for _,potion in pairs(getgenv().autoMisc.potionConfig) do
        local PotId = getUID("Potion", potion.Name, potion.Tier)
        if PotId then
            Library.Network.Fire("Potions: Consume", PotId)
        end
        task.wait(1)
    end
    task.wait(1)
end
        task.wait(2)
    end
end)

task.spawn(function()
    while task.wait(1.5) do
getgenv().useTnt = true
getgenv().useCooldown = 3
local save = require(game:GetService("ReplicatedStorage").Library.Client.Save)
local isArea50

repeat task.wait(3) until save.Get().UnlockedZones["Fire Dojo"]

isArea50 = true

task.spawn(function()
    while getgenv().useTnt and isArea50 and task.wait(getgenv().useCooldown) do
        game:GetService("ReplicatedStorage").Network.TNT_Crate_Consume:InvokeServer()
    end
end)
task.wait(2)
    end
end)

task.spawn(function()
    while task.wait(1.5) do
getgenv().useTele = true
getgenv().useCd = 15
local save = require(game:GetService("ReplicatedStorage").Library.Client.Save)
local isArea99

repeat task.wait(3) until save.Get().UnlockedZones["Rainbow Road"]

isArea99 = true

task.spawn(function()
    while getgenv().useTele and isArea99 and task.wait(getgenv().useCd) do
        game:GetService("ReplicatedStorage").Network["RequestTechRocket"]:FireServer()
    end
end)
task.wait(2)
    end
end)

            
task.spawn(function()
    while task.wait(1.5) do
getgenv().autoFlag = true -- false to toggle off

local saveModule = require(game:GetService("ReplicatedStorage").Library.Client.Save)
local result = saveModule.Get()
local flag = result.Inventory.Misc

local selectedFlag = "Coins Flag" -- Flag Name exactly as in game here.

while task.wait(30) and autoFlag do
    for i,v in pairs(flag) do
        if v.id == selectedFlag then        
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Flags: Consume"):InvokeServer(selectedFlag, i)                               
        end
    end
end
        task.wait(2)
    end
end)
