
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

local Model = workspace
local ClassTypes = {
	"Decal",
	"Texture",
        "TextLabel",
        "Terrain",
        "Mesh",


}

for _, v in ipairs(workspace:GetDescendants()) do
	if table.find(ClassTypes, v.ClassName) then
		print(v.ClassName)
		v:Destroy()
	end
end
