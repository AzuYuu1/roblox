repeat
    task.wait()
until game:IsLoaded()
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

local Workspace = game:GetService("Workspace")
local Terrain = Workspace:WaitForChild("Terrain")
Terrain.WaterReflectance = 0
Terrain.WaterTransparency = 1
Terrain.WaterWaveSize = 0
Terrain.WaterWaveSpeed = 0

local Lighting = game:GetService("Lighting")
Lighting.Brightness = 0
Lighting.GlobalShadows = false
Lighting.FogEnd = 9e100
Lighting.FogStart = 0

sethiddenproperty(Lighting, "Technology", 2)
sethiddenproperty(Terrain, "Decoration", false)

local function clearTextures(v)
    if v:IsA("BasePart") and not v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif (v:IsA("Decal") or v:IsA("Texture")) then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    elseif v:IsA("SpecialMesh")  then
        v.TextureId = 0
    elseif v:IsA("ShirtGraphic") then
        v.Graphic = 1
    elseif (v:IsA("Shirt") or v:IsA("Pants")) then
        v[v.ClassName .. "Template"] = 1
    elseif v.Name == "Foilage" and v:IsA("Folder") then
        v:Destroy()
    elseif string.find(v.Name, "Tree") or string.find(v.Name, "Water") or string.find(v.Name, "Bush") or string.find(v.Name, "grass") then
        task.wait()
        v:Destroy()
    end
end

game:GetService("Lighting"):ClearAllChildren()

for _, v in pairs(Workspace:GetDescendants()) do
    clearTextures(v)
end

Workspace.DescendantAdded:Connect(function(v)
    clearTextures(v)
end)
task.wait(1)
game:GetService("ReplicatedStorage").Network["World2Teleport"]:InvokeServer()
task.wait(0.5)

--auto claim mail
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
    [2] = 1
    [1] = "616cc8525158402b830a742ef40be3b2",--rainbow codex
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
local args = {
    [1] = "7a2dd835a20340a89a46ed200e6aa2e2",--coin 7
    [1] = "6dadd10d95e8420e85d0be145bf90cde",--coin 6
    [1] = "025fa9ae960d4f0dbbb90f23a5d41449",--coin 5
    [1] = "ca23a1a46f0c4c00beb92fc949576594",--coin 5 codex     
    [1] = "0dcf7a6502fd4a3c947f8c1fd5c14d89"--coin 4
}

game:GetService("ReplicatedStorage").Network["Enchants_Equip"]:FireServer(unpack(args))
task.wait(3)
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
  
