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
