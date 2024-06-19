local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostQut/FreemUI-V2/main/Source.lua"))()

local window = DrRayLibrary:Load("Anime Defenders", "Default")

local tab1 = DrRayLibrary.newTab("Main", "")
local tab2 = DrRayLibrary.newTab("Macro", "")
local tab3 = DrRayLibrary.newTab("AutoPlay+", "")
local tab4 = DrRayLibrary.newTab("Misc", "")

local plr = game:GetService('Players').LocalPlayer
local VirtualUser = game:GetService('VirtualUser')
local CurrentCamera = game:GetService('Workspace').CurrentCamera

tab1.newToggle("AutoStart ", "", false, function(on)
    on = not on
    while on do
        local pos = plr.PlayerGui.HUD.MatchDisplayHolder.MatchDisplayFrame.OptionsHolder.StartButtonHolder.ConfirmButton.Position
        VirtualUser:Button1Down(pos, CurrentCamera.CFrame)
                
        task.wait(.1)
                
        VirtualUser:Button1Up(pos, CurrentCamera.CFrame)
    end
end)