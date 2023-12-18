local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua")()

local pet = "ea376d75fc2548feb12296464127a90a"
local price = 1000
local count = 100
local x = 1

print(unpack(pet))

local function GetMyPets()
    		local returntable = {}
    		for i,v in pairs(GameLibrary.Save.Get().Pets) do
    			if v.e then 
    				table.insert(returntable, v.uid)
    			end
    		end
    		return returntable
 end

for x = 1, 50 do
local y = tostring(x)
task.wait(0.5)
game:GetService("ReplicatedStorage").Network.Booths_ClaimBooth:InvokeServer(y)
end



local window = DrRayLibrary:Load("TradingPlaza99", "Default")

local tab1 = DrRayLibrary.newTab("Main", "")
local tab2 = DrRayLibrary.newTab("Misc", "")

tab1.newInput("Price", "Prints your input.", function(text)
    price = tonumber(text)
end)

tab1.newInput("Count", "Prints your input.", function(text)
    count = tonumber(text)
end)


tab1.newToggle("AutoSell", "Selling your pets", false, function(toggleState)
    if toggleState then
        while task.wait(0.4) do
game:GetService("ReplicatedStorage").Network.Booths_CreateListing:InvokeServer(pet, price, count)
end
    end
end)

tab1.newToggle("ServerHop", "", true, function(toggleState)
    if toggleState then
        while task.wait(1800) do
module:Teleport(game.PlaceId)
end
    end
end)

