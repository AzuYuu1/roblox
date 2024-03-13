task.spawn(function()
    while task.wait() do
        game:GetService("ReplicatedStorage").Network["Mailbox: Claim All"]:InvokeServer()
        task.wait(5)
    end
end)

task.wait(1)

task.spawn(function()
    while task.wait() do
local Model = workspace
local ClassTypes = {
	"Decal",
	"Texture",
        "Important",
	"Terrain",
        "Ground"
}

for _, v in ipairs(workspace:GetDescendants()) do
	if table.find(ClassTypes, v.ClassName) then
		print(v.ClassName)
		v:Destroy()
	end
end
task.wait(1.5)
    end
end)

game:GetService("RunService"):Set3dRenderingEnabled(false)

task.wait(1)
--------------------------------------------

task.spawn(function()
    while task.wait() do
game:GetService("ReplicatedStorage").Network["ToyBall_Consume"]:InvokeServer()
game:GetService("ReplicatedStorage").Network["ToyBone_Consume"]:InvokeServer()
game:GetService("ReplicatedStorage").Network["SqueakyToy_Consume"]:InvokeServer()
        task.wait(1)
    end
end)
task.wait(1)

task.spawn(function()
    while task.wait() do
game:GetService("ReplicatedStorage").Network["Fruits: Consume"]:FireServer("920f3056a1ff4872a44c33760abc3ac6",1)
game:GetService("ReplicatedStorage").Network["Fruits: Consume"]:FireServer("33bd9d62962a4272bd56815dfbaf1e49",1)
game:GetService("ReplicatedStorage").Network["Fruits: Consume"]:FireServer("b854636485bc46c69e07108ed2c99194",1)
game:GetService("ReplicatedStorage").Network["Fruits: Consume"]:FireServer("616cc8525158402b830a742ef40be3b2",1)
        task.wait(1)
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
game:GetService("ReplicatedStorage").Network["Enchants_Equip"]:FireServer("ca23a1a46f0c4c00beb92fc949576594")
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
  
