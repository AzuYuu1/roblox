
task.spawn(function()
    while task.wait(1.5) do
game:GetService("ReplicatedStorage").Network["Mailbox: Claim All"]:InvokeServer()
        task.wait(5)
    end
end)

task.spawn(function()
    while task.wait(1.5) do
local fruitsModule = require(game:GetService("ReplicatedStorage").Library.Client.FruitCmds)

local fruitIds = {}
local neededFruits = {}

for itemId, itemData in pairs(require(game:GetService("ReplicatedStorage").Library).Save.Get().Inventory.Fruit) do
    if itemData["id"] ~= "Candycane" then
        local fruitName = itemData["id"]
        fruitIds[fruitName] = itemId
        table.insert(neededFruits, fruitName)
    end
end

for fruitName, fruitData in pairs(fruitsModule.GetActiveFruits()) do
    if #fruitData < 20 then
        fruitsModule.Consume(fruitIds[fruitName], (20 - #fruitData))
    end
    for i = 1, #neededFruits do
        if neededFruits[i] == fruitName then
            table.remove(neededFruits, i)
        end
    end
    task.wait(0.15)
end

for _, fruit in neededFruits do
    fruitsModule.Consume(fruitIds[fruit], 20)
    task.wait(0.15)
end

require(game:GetService("ReplicatedStorage").Library.Client.Network).Fired("Fruits: Update"):Connect(function(data)
    task.wait(1)
    for fruitName, fruitData in pairs(data) do
        if #fruitData < 20 then
            fruitsModule.Consume(fruitIds[fruitName])
            task.wait(0.15)
        end
    end
end)
task.wait(2)
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
getgenv().autoFlag = true

local saveModule = require(game:GetService("ReplicatedStorage").Library.Client.Save)
local result = saveModule.Get()
local flag = result.Inventory.Misc

local selectedFlag = "Coins Flag"

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
