local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostQut/FreemUI-V2/main/Source.lua"))()

local window = DrRayLibrary:Load("Anime Defenders", "Default")

local tab1 = DrRayLibrary.newTab("Main", "")
local tab2 = DrRayLibrary.newTab("Macro", "")
local tab3 = DrRayLibrary.newTab("Tower", "")
local tab4 = DrRayLibrary.newTab("AutoPlay+", "")
local tab5 = DrRayLibrary.newTab("Misc", "")

local plr = game:GetService('Players').LocalPlayer
local VirtualUser = game:GetService('VirtualUser')
local CurrentCamera = game:GetService('Workspace').CurrentCamera

-- TOWER

local maps = {
    {"Map1";"Cherry Blossom"};
    {"Map2";"Safari"};
    {"Map3";"Misty Falls"};
    {"Map4";"Fire and Ice"};
}

local function getMap()
    for i,v in ipairs(maps) do

    end
end




local function getLoot()
    local cf = hrp.CFrame
    for i,v in pairs(things.Lootbags:GetChildren()) do
    v:PivotTo(cf)
    end
    for i,v in pairs(things.Orbs:GetChildren()) do
    v:PivotTo(cf)
    end
end

tab3.newToggle("AutoStart ", "", false, function(on)
    
end)