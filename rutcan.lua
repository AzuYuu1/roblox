local type = "shovel"
local type = "rod"
local users = {


"sorayuu110",


}


local save = require(game:GetService("ReplicatedStorage").Library.Client.Save)
local theId = nil
for i, v in pairs(save.Get().Inventory.Misc) do
    if type == "shovel" and v.id == "Golden Shovel" then
        theId = i
    elseif type == "shovel" and v.id == "Diamond Shovel" then
        theId = i
    elseif type == "rod" and v.id == "Golden Fishing Rod" then
        theId = i
     elseif type == "rod" and v.id == "Diamond Fishing Rod" then
        theId = i
     end
end


for i, v in pairs(users) do
    game:GetService("ReplicatedStorage").Network["Mailbox: Send"]:InvokeServer(v,
        tostring(math.random(1, 100)), "Misc", theId, 1)
    task.wait(0.8)
end
