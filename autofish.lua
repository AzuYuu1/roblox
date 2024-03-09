

--teleport
repeat task.wait() until game:IsLoaded() task.wait(2.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.workspace.__THINGS.Instances.Fishing.Teleports.Enter.CFrame.Position)
task.wait(15)
game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Instancing_FireCustomFromClient"):FireServer("Fishing", "ClaimRod",Vector3.new(1139, 75, -3445))

task.wait(50)
game:GetService("RunService"):Set3dRenderingEnabled(false)
