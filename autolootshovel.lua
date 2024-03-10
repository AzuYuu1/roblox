--remove texture

local Workspace = game:GetService("Workspace")
local Terrain = Workspace:WaitForChild("Terrain")
Terrain.WaterReflectance = 0
Terrain.WaterTransparency = 0
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
        v.Transparency = 0
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 0
        v.BlastRadius = 0
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
        v[v.ClassName .. "Template"] = 0
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
task.wait(30)
--teleport
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.workspace.__THINGS.Instances.Digsite.Teleports.Enter.CFrame.Position)
task.wait(35)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_FireCustomFromClient"):FireServer("Digsite", "ClaimShovel")
task.wait(15)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.workspace.__THINGS.Instances.Digsite.Teleports.Leave.CFrame.Position)
task.wait(1)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_PlayerLeaveInstance"):FireServer("Digsite")
task.wait(120)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.workspace.__THINGS.Instances.AdvancedDigsite.Teleports.Enter.CFrame.Position)
task.wait(3)

_G.loop = true
_G.loopDelay = 2

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
while _G.loop do
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
task.wait(loopDelay)
end
