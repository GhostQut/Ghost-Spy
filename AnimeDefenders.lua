local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostQut/FreemUI-V2/main/Source.lua"))()

local window = DrRayLibrary:Load("Anime Defenders", "Default")

local tab1 = DrRayLibrary.newTab("Main", "")
local tab2 = DrRayLibrary.newTab("SetUp", "")
local tab3 = DrRayLibrary.newTab("Summon", "")
local tab4 = DrRayLibrary.newTab("Misc", "")
local tab6 = DrRayLibrary.newTab("Other", "")

local codes = {"idk", "thanks500k", "MEMBEREREBREWRERES", "raidsarecool", "sorry4delay", "dayum100m", "wsindach4ht", "200kholymoly", "adontop", "subcool", "sub2toadboigaming", "sub2jonaslyz", "sub2riktime", "sub2mozking", "sub2karizmaqt", "sub2nagblox"}

tab3.newButton("Redeem ALL Codes", "", function()
    for code, _ ipairs(codes) then
        task.wait(.1)
        game:GetService("ReplicatedStorage").Remotes.UseCode:InvokeServer(code)
    end
end)