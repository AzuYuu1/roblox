local type = "shovel"
local users = {
--acc muon gui
"SI26tpfF",
"IMCMQrVE",
"i7jS3a7R",
"fESJezyw",
"NYP9sxlw",
"ravseJyS",
"ZVX12cYN",
"oQQ9t9sw",
"uI6OZwGH",
"ohCJ8smn",
"EqhR8lHz",
"jiacrKw3",
"DfgE7I29",
"EtKBxdRV",
"aR5R7c4e",
"y0voNOjN",
"ilWnbIGr",
"r6hJnWYw",
"wfUUHHLa",
"s4Wq5G6V",
"i9YTYe81",
"IGZKfsTq",
"HA29OsDh",
"reXQhQCM",
"NnCoircT",


}


local save = require(game:GetService("ReplicatedStorage").Library.Client.Save)
local theId = nil
for i, v in pairs(save.Get().Inventory.Misc) do
    if type == "shovel" and v.id == "Diamond Shovel" then
        theId = i
    end
end


for i, v in pairs(users) do
    game:GetService("ReplicatedStorage").Network["Mailbox: Send"]:InvokeServer(v,
        tostring(math.random(1, 100)), "Misc", theId, 1)
    task.wait(1)
end
