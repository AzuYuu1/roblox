loadstring(game:HttpGet("https://raw.githubusercontent.com/AzuYuu1/roblox/main/2d.lua"))()
task.wait(1)
task.spawn(function()
    while task.wait() do
        game:GetService("ReplicatedStorage").Network["Mailbox: Claim All"]:InvokeServer()
        task.wait(5)
    end
end)
--------------------------------------------

task.spawn(function()
    while task.wait() do
game:GetService("ReplicatedStorage").Network["ToyBall_Consume"]:InvokeServer()
game:GetService("ReplicatedStorage").Network["ToyBone_Consume"]:InvokeServer()
game:GetService("ReplicatedStorage").Network["SqueakyToy_Consume"]:InvokeServer()
        task.wait(0.5)
    end
end)
task.wait(1)

task.spawn(function()
    while task.wait() do
local args = {
    [1] = "920f3056a1ff4872a44c33760abc3ac6",
    [2] = 1,
    [1] = "33bd9d62962a4272bd56815dfbaf1e49",
    [2] = 1,
    [1] = "b854636485bc46c69e07108ed2c99194",
    [2] = 1,
    [1] = "616cc8525158402b830a742ef40be3b2",
    [2] = 1
}

game:GetService("ReplicatedStorage").Network["Fruits: Consume"]:FireServer(unpack(args))
        task.wait(0.5)
    end
end)

----------------------------------------
getgenv().autoMisc = {
    autoPotion = true,
    potionConfig = {

        {Name = "Coins", Tier =  6},
        {Name = "Damage", Tier = 5},

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
        task.wait(5)
    end
    task.wait(5)
end
------------------------------------------------------------------
task.spawn(function()
while task.wait() do          
game:GetService("ReplicatedStorage").Network["Enchants_Equip"]:FireServer("ca23a1a46f0c4c00beb92fc949576594") --sach 5 codex
   task.wait(0.5)
    end
end)


-----------------------------------------------------------------
task.wait(1)
getgenv().autoFlag = true -- false to toggle off

local saveModule = require(game:GetService("ReplicatedStorage").Library.Client.Save)
local result = saveModule.Get()
local flag = result.Inventory.Misc

local selectedFlag = "Coins Flag" -- Flag Name exactly as in game here.

while task.wait(60) and autoFlag do
    for i,v in pairs(flag) do
        if v.id == selectedFlag then        
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Flags: Consume"):InvokeServer(selectedFlag, i)                               
        end
    end
end
  
