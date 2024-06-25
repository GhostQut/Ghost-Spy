local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostQut/FreemUI-V2/main/Source.lua"))()

local window = DrRayLibrary:Load("Anime Defenders", "Default")

local tab1 = DrRayLibrary.newTab("Main", "")
local tab2 = DrRayLibrary.newTab("Macro", "")
local tab3 = DrRayLibrary.newTab("Summon", "")
local tab4 = DrRayLibrary.newTab("Misc", "")
local tab5 = DrRayLibrary.newTab("Other", "")

local codes = {
    'subcool',
    'sub2toadboigaming',
    'sub2mozking',
    'sub2karizmaqt',
    'sub2jonaslyz',
    'sub2riktime',
    'sub2nagblox',
    'release2024',
    'adontop',
    '200kholymoly',
    'raidsarecool',
    'sorry4delay',
    'thanks400k',
    'dayum100m',
    'wsidach4ht',
    'thanks500k',
    'idk'
  }

local plr = game:GetService('Players').LocalPlayer
local VirtualUser = game:GetService('VirtualUser')
local CurrentCamera = game:GetService('Workspace').CurrentCamera

function v2(v)
    local x = v.X
    local y = v.Y
    return Vector2.new(x,y)
end

tab1.newToggle("AutoStart ", "", false, function(on)
    on = not on
    while on do
        local pos = plr.PlayerGui.HUD.MatchDisplayHolder.MatchDisplayFrame.OptionsHolder.StartButtonHolder.ConfirmButton.Position
        
        if plr.PlayerGui.HUD.MatchDisplayHolder.MatchDisplayFrame.Visible == true then
            VirtualUser:MoveMouse(v2(pos), CurrentCamera.CFrame)
            task.wait(.1)
        end
    end
end)

tab5.newButton("Redeem ALL Codes", "", function()
    for i, code in pairs(codes) do
        task.wait(.1)
        game:GetService("ReplicatedStorage").Actions.Invokables:FindFirstChild("0DIHrsyS"):InvokeServer(pack(code))
    end
end)