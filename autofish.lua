--auto claim mail
task.spawn(function()
    while task.wait() do
        game:GetService("ReplicatedStorage").Network["Mailbox: Claim All"]:InvokeServer()
        task.wait(5)
    end
end)


game:GetService("RunService"):Set3dRenderingEnabled(false)
task.wait(1)
local virtualuser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    virtualuser:CaptureController()
    virtualuser:ClickButton2(Vector2.new())
end)
game.Players.LocalPlayer.PlayerScripts.Scripts.Core["Idle Tracking"].Enabled = false
game.Players.LocalPlayer.PlayerScripts.Scripts.Core["Server Closing"].Enabled = false
--remove texture

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
task.wait(30)
--teleport
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.workspace.__THINGS.Instances.Fishing.Teleports.Enter.CFrame.Position)
task.wait(35)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_FireCustomFromClient"):FireServer("Fishing", "ClaimRod",Vector3.new(1139, 75, -3445))
task.wait(15)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.workspace.__THINGS.Instances.Fishing.Teleports.Leave.CFrame.Position)
task.wait(1)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_PlayerLeaveInstance"):FireServer("Fishing")
task.wait(120)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.workspace.__THINGS.Instances.AdvancedFishing.Teleports.Enter.CFrame.Position)
task.wait(5)

repeat task.wait(1) until game:IsLoaded()
task.wait(0.5)
function claimVIP()
    local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    local chr = game.Players.LocalPlayer.Character
    local vippos = Vector3.new(1460, 61, -4442)

    chr.HumanoidRootPart.CFrame = CFrame.new(vippos)
    task.wait(0.5)
    chr.HumanoidRootPart.CFrame = oldPos
end

claimVIP()



_G.loop = true
_G.loopDelay = 0.00001
while _G.loop do
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_FireCustomFromClient"):FireServer("AdvancedFishing","RequestCast",Vector3.new(1452.843505859375, 61.114078521728516, -4437.3466796875))
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_FireCustomFromClient"):FireServer("AdvancedFishing","RequestReel")
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_InvokeCustomFromClient"):InvokeServer("AdvancedFishing","Clicked")
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_InvokeCustomFromClient"):InvokeServer("AdvancedFishing","Clicked")
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_InvokeCustomFromClient"):InvokeServer("AdvancedFishing","Clicked")
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_InvokeCustomFromClient"):InvokeServer("AdvancedFishing","Clicked")
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_InvokeCustomFromClient"):InvokeServer("AdvancedFishing","Clicked")
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_InvokeCustomFromClient"):InvokeServer("AdvancedFishing","Clicked")
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_InvokeCustomFromClient"):InvokeServer("AdvancedFishing","Clicked")
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_InvokeCustomFromClient"):InvokeServer("AdvancedFishing","Clicked")
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_InvokeCustomFromClient"):InvokeServer("AdvancedFishing","Clicked")
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_InvokeCustomFromClient"):InvokeServer("AdvancedFishing","Clicked")
task.wait(loopDelay)
end

