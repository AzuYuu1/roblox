repeat
    task.wait()
until game:IsLoaded()

local Model = workspace
local ClassTypes = {
	"Decal",
	"Texture",
  "Camera"
}

for _, v in ipairs(workspace:GetDescendants()) do
	if table.find(ClassTypes, v.ClassName) then
		print(v.ClassName)
		v:Destroy()
	end
end


for _,instance in pairs(workspace:GetDescendants()) do
   if instance:IsA('Camera') then
      instance:Destroy()
   end
end

--auto claim mail
task.spawn(function()
    while task.wait() do
        game:GetService("ReplicatedStorage").Network["Mailbox: Claim All"]:InvokeServer()
        task.wait(5)
    end
end)
task.wait(0.5)
game:GetService("RunService"):Set3dRenderingEnabled(false)
task.wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.workspace.__THINGS.Instances.Digsite.Teleports.Enter.CFrame.Position)
task.wait(5)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_FireCustomFromClient"):FireServer("Digsite", "ClaimShovel")
task.wait(15)

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
        task.wait(10)
    end
end)
