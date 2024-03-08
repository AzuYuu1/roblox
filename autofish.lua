--anti afk
local virtualuser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    virtualuser:CaptureController()
    virtualuser:ClickButton2(Vector2.new())
end)
game.Players.LocalPlayer.PlayerScripts.Scripts.Core["Idle Tracking"].Enabled = false
game.Players.LocalPlayer.PlayerScripts.Scripts.Core["Server Closing"].Enabled = false

task.wait(5)

--teleport
repeat task.wait() until game:IsLoaded() task.wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.workspace.__THINGS.Instances.Fishing.Teleports.Enter.CFrame.Position) task.wait(3.5)

game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_FireCustomFromClient"):FireServer("Fishing", "ClaimRod",Vector3.new(1139, 75, -3445)) task.wait(5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.workspace.__THINGS.Instances.Fishing.Teleports.Leave.CFrame.Position) task.wait(5)

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.workspace.__THINGS.Instances.AdvancedFishing.Teleports.Enter.CFrame.Position) task.wait(3.5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_FireCustomFromClient"):FireServer("AdvancedFishing","RequestCast",Vector3.new(1460, 61, -4442))

task.wait(100)

local saveModule = require(game:GetService("ReplicatedStorage").Library.Client.Save).Get()
local Network = game.ReplicatedStorage:WaitForChild('Network')
local Library = require(game.ReplicatedStorage:WaitForChild('Library'))

local rodNames = {

    AdvancedFishing = {

        ["Amethyst Fishing Rod"] = {2250000},

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

task.wait(120)

game:GetService("RunService"):Set3dRenderingEnabled(false)
