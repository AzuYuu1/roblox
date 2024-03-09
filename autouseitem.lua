repeat
    task.wait()
until game:IsLoaded()

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
game:GetService("RunService"):Set3dRenderingEnabled(false)

_G.loop = true
_G.loopDelay = 30
while _G.loop do
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("ToyBall_Consume"):InvokeServer()
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("ToyBone_Consume"):InvokeServer()
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("SqueakyToy_Consume"):InvokeServer()
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("ToyBall_Consume"):InvokeServer()
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("ToyBone_Consume"):InvokeServer()
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("SqueakyToy_Consume"):InvokeServer()
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("ToyBall_Consume"):InvokeServer()
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("ToyBone_Consume"):InvokeServer()
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("SqueakyToy_Consume"):InvokeServer()
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("ToyBall_Consume"):InvokeServer()
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("ToyBone_Consume"):InvokeServer()
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("SqueakyToy_Consume"):InvokeServer()
task.wait(loopDelay)
end


--auto use fruits, postion
_G.loop = true
_G.loopDelay = 15
while _G.loop do
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Fruits: Consume"):FireServer("69c7fbeed3524224aaabeb54e3b2e1ee",2)
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Fruits: Consume"):FireServer("9fb26a7a409f4965b18d88b3d78651d2",2)
--fluxus
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Fruits: Consume"):FireServer("b854636485bc46c69e07108ed2c99194",20)
task.wait(0.5)
--codex
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Fruits: Consume"):FireServer("49244dda524848b19d42438af7b337ff",10)
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Fruits: Consume"):FireServer("49244dda524848b19d42438af7b337ff",10)
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Fruits: Consume"):FireServer("49244dda524848b19d42438af7b337ff",10)
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Fruits: Consume"):FireServer("49244dda524848b19d42438af7b337ff",10)
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Fruits: Consume"):FireServer("49244dda524848b19d42438af7b337ff",10)
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Fruits: Consume"):FireServer("49244dda524848b19d42438af7b337ff",10)
task.wait(loopDelay)
end
task.wait(3.5)
--fluxus
_G.loop = true
_G.loopDelay = 15
while _G.loop do
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Potions: Consume"):FireServer("6d8605ac7bda42508ba13fcf9893dbf7")
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Potions: Consume"):FireServer("36b2906ccac548a48536f3fdca803bdc")
task.wait(0.5)
--codex
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Potions: Consume"):FireServer("d35c953fa68a441da7b40f560a00bedb",5)
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Potions: Consume"):FireServer("993d741352e8418d8dd58b1da6d3198c",5)
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Potions: Consume"):FireServer("d35c953fa68a441da7b40f560a00bedb",5)
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Potions: Consume"):FireServer("993d741352e8418d8dd58b1da6d3198c",5)
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Potions: Consume"):FireServer("d35c953fa68a441da7b40f560a00bedb",5)
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Potions: Consume"):FireServer("993d741352e8418d8dd58b1da6d3198c",5)
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Potions: Consume"):FireServer("d35c953fa68a441da7b40f560a00bedb",5)
task.wait(0.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Potions: Consume"):FireServer("993d741352e8418d8dd58b1da6d3198c",5)
task.wait(loopDelay)
end


task.wait(5)
_G.loop = true
_G.loopDelay = 5
while _G.loop do
--mang sach coin 7
task.wait(0.3)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Enchants_Equip"):FireServer("7a2dd835a20340a89a46ed200e6aa2e2")
task.wait(0.3)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Enchants_Equip"):FireServer("7a2dd835a20340a89a46ed200e6aa2e2")
task.wait(0.3)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Enchants_Equip"):FireServer("7a2dd835a20340a89a46ed200e6aa2e2")
task.wait(0.3)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Enchants_Equip"):FireServer("7a2dd835a20340a89a46ed200e6aa2e2")
task.wait(0.3)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Enchants_Equip"):FireServer("ca23a1a46f0c4c00beb92fc949576594")
task.wait(0.3)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Enchants_Equip"):FireServer("ca23a1a46f0c4c00beb92fc949576594")
task.wait(0.3)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Enchants_Equip"):FireServer("ca23a1a46f0c4c00beb92fc949576594")
task.wait(0.3)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Enchants_Equip"):FireServer("ca23a1a46f0c4c00beb92fc949576594")
task.wait(loopDelay)
end
--use coin flag for codex
task.wait(5)
_G.loop = true
_G.loopDelay = 300
while _G.loop do
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Flags: Consume"):InvokeServer("Coins Flag","a1b47d1d9f28407db7d5b19a1d71d438")
    task.wait(loopDelay)
end
