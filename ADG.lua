local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostQut/FreemUI-V2/main/Source.lua"))()

local window = DrRayLibrary:Load("Anime Defenders", "Default")

local tab1 = DrRayLibrary.newTab("Main", "")
local tab2 = DrRayLibrary.newTab("Macro", "")
local tab3 = DrRayLibrary.newTab("Tower", "")
local tab4 = DrRayLibrary.newTab("AutoPlay+", "")
local tab5 = DrRayLibrary.newTab("Misc", "")

local plr = game:GetService('Players').LocalPlayer
local VirtualUser = game:GetService('VirtualUser')
local vim = game:GetService('VirtualInputManager')
local CurrentCamera = game:GetService('Workspace').CurrentCamera

-- TOWER

function getMap()
    local map
    for i = 1, 5 do
        if game:GetService('Workspace')['PhysicalMap']:FindFirstChild(tostring(i)) then
            print(i)
            map = "Map"..i
        end
    end
    return map
end

LocalPlayer.Character:FindFirstChildOfClass('Humanoid').WalkToPoint = Vector3.new()


local function getLoot()
    local cf = hrp.CFrame
    for i,v in pairs(things.Lootbags:GetChildren()) do
    v:PivotTo(cf)
    end
    for i,v in pairs(things.Orbs:GetChildren()) do
    v:PivotTo(cf)
    end
end

function v2(v)
    local x = v.X
    local y = v.Y
    return Vector2.new(x,y)
end

tab3.newToggle("AutoNext ", "", false, function(on)
    on = not on
    while on do
        local pos = plr.PlayerGui.HUD.MatchDisplayHolder.MatchDisplayFrame.OptionsHolder.StartButtonHolder.ConfirmButton.Position
        
        if plr.PlayerGui.HUD.MatchDisplayHolder.MatchDisplayFrame.Visible == true then
            vim:SendMouseButtonEvent(pos.X - 5, pos.Y - 5, 0, true, plr.PlayerGui.HUD., 1)
            task.wait(.1)
        end
    end
end)