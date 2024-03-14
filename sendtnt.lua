local type = "tnt"
local users = {

"sorayuu110",

}

local save = require(game:GetService("ReplicatedStorage").Library.Client.Save)
local theId = nil
for i, v in pairs(save.Get().Inventory.Misc) do
    if type == "tnt" and v.id == "TNT Crate" then
        theId = i
    end
end


for i, v in pairs(users) do
    game:GetService("ReplicatedStorage").Network["Mailbox: Send"]:InvokeServer(v,
        tostring(math.random(1, 300)), "Misc", theId, 200)
    task.wait(1)
end

