local type = "flag"
local users = {

"Vt1bjeU1",
"RAHA63tk",
"iTEGQeSB",
"FyQpZliQ",
"nOtsdnfH",
"hMSDMU6B",
"OtOc1EVT",
"yzkkucdw",
"X27bzDYa",
"LoEhvsl7",
"qAku8IVE",
"niMa3qCK",
"BF0YuFJm",
"pR7VimmI",
"mzYN5Gna",
"vkGEnrsE",
"XyCL7Jf5",
"ctfLaar8",
"k7pKfE6m",
"C74fDknY",
"iQU675gX",
"lR82IK3D",
"od4jcW4Z",
"ELKinhFS",
"Ffw0nO5J",
"rfl4cvET",
"wY77jnzr",
"RT8x4hmi",
"Zmam8Fax",
"vtLBdlLf",
"tu1LlEIv",
"NaBJHRSo",
"pKrnvGrT",
"ar76kLE0",
"HR8ZC8JL",
"OWy0v4uB",
"LAOr7ijO",
"yE7jxMCP",
"dIiqthcD",
"plPiHAAn",
"lObVxkak",
"Q3rWLAYm",
"jlDcYbRK",
"yp4k4hjR",
"Qsp65bSd",
"XTMxGvi8",
"kg1GVnH0",
"TuCILMh2",
"wlelEL8u",
"pPKE90K6",
"l97Nklm6",
"YLZuPOi7",
"nwo78qgv",
"dSGk5ycE",
"uKccQVmm",
"VLlwP5EE",
"Y7y4tkEu",
"JU5ooxRq",
"rc4csX7R",
"cFT0pOJO",
"zZyCE9fw",
"asOlPxZL",
"YPlZwF0B",
"fELlm8AO",
"NtrRqo5Z",
"mIWxSQW4",
"iPOei39R",
"hvxTJdR1",
"frp9fk6o",
"tCamDuc6",
"JzQLDQvd",
"Ty6umNde",
"iGw1aH2O",
"AesD23CL",
"FyyEvILJ",
"Gou15Lpe",
"NXCzyla5",
"It53G1OA",
"K0qu9vmv",
"Ay1xZcmb",
"WfYtMPW4",
"nbo49Ic1",
"LadEYOID",
"i9p4LsKk",
"qeTzRvJ7",
"cudDbo7V",
"iXVPkNcA",
"DX6bXrID",
"leuF34qp",
"fExK3OzO",
"uYqXP7EI",
"k2JKR5XW",
"rk9T1VnE",
"RdUUuZxR",
"NE3ruKJO",
"nbu7Nh0j",
"n3U2jFNN",
"Wysctwgh",
"z3N0LqdM",
"iJlAkq5f",
"OJHtimD1",
"zPh1lRNa",
"hFAMryvM",
"qMGQQVbn",
"RJB71vFc",
"hVPl33jy",
"MkPIpQ68",
"sbzDtYA2",
"amm5VRW0",
"G58y2G2D",
"U0a2cw6I",
"IbZPKcim",
"ntMV8Xu1",
"ZqhcygtP",
"cgtkC9Dg",
"jtsl09Nz",
"lRbn6sT8",
"sVydlT8Q",
"sQUlX7ZY",
"jgZdvQrC",
"lqJsVwjT",
"RIwd5qoa",
"qZF80wrx",
"fUyjnZMv",
"FgOU3zce",
"KjG8pSCU",
"KH3RfOG1",
"jx6nyQb4",
"FGpJkNUw",
"foj3hh0L",
"ohBc8YmF",
"JYuQ6F5U",
"OOcWfkVk",
"eeqi73WA",
"VuXq0is6",
"iVAkkmjk",
"M22jloeT",
"NAM6aopz",
"DM8XMrC9",
"v3HFdNXk",
"n9g7GCWP",
"UbWS7gkJ",
"deDUW6dY",
"mcahPywO",
"jh0KV2pr",
"hoAIgl0n",
"JKJVr28p",
"rzRCMWCF",
"oTTfnsZ7",
"JLGKW5wp",
"QbhikfGO",
"yaydfLx0",
"l6ewCtzB",
"QrPzbzTk",
"S9BkrGkB",
"Vjf0smSQ",
"kkJzu0Js",
"OgcZ7Ixo",
"rM4PnjAg",
"PbLtsSK2",
"QGzYeWIK",
"xKTSWzw8",
"GFAHqmUE",
"XOJwQlmF",
"ReQJOvQF",
"nxZMK8TP",
"ml6N00gM",
"hmOmwbXk",
"Lt8ZmuNV",
"ghwREbl6",
"N2eTZsI9",
"kz5AKXne",
"Z2jVUj5F",
"BbAZhrVK",
"bC71Mecu",
"d7BqOhTG",
"kLuijexi",
"kzdhnatq",
"G4ojRwhH",
"N2BIYVZs",
"YSzm5gn1",
"H9iUIHry",
"miEHZ9ic",
"r1CbiImg",
"iN3q1k1W",
"NkzyxTyN",
"fL3kqAO1",
"pL1CzVPg",
"MRbkZnDI",
"DXHmgWea",
"rDGcdVH3",
"t6ZpPDth",
"duwFGXry",
"Ie5CIw1u",
"PM2zgZgc",
"e9AirZZ3",
"kqaKOPfU",
"JHoaJS9x",
"EvWzJeUP",
"NyTcZ35o",

}


local save = require(game:GetService("ReplicatedStorage").Library.Client.Save)
local theId = nil
for i, v in pairs(save.Get().Inventory.Misc) do
    if type == "flag" and v.id == "Coins Flag" then
        theId = i
    end
end


for i, v in pairs(users) do
    game:GetService("ReplicatedStorage").Network["Mailbox: Send"]:InvokeServer(v,
        tostring(math.random(1, 200)), "Misc", theId, 200)
    task.wait(0.7)
end
