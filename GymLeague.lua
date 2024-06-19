local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostQut/FreemUI-V2/main/Source.lua"))()

local window = DrRayLibrary:Load("GymLeague", "Default")
local VirtualInputManager = game:GetService("VirtualInputManager")
local rm = game:GetService("ReplicatedStorage"):WaitForChild("common"):WaitForChild("packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("EquipmentService"):WaitForChild("RF")

local tab1 = DrRayLibrary.newTab("Main", "")
local tab2 = DrRayLibrary.newTab("Misc", "")
local tab3 = DrRayLibrary.newTab("Other", "")

tab1.newToggle("AutoLoad", "", false, function(on)
    on = not on
    while on do
        task.wait(.25)
        rm:WaitForChild("AutoLoad")
    end
end)

tab1.newToggle("AutoTrain", "", false, function(on)
    on = not on
    while on do
        task.wait(.25)
        VirtualInputManager:SendMouseButtonEvent(X, Y, 0, true, game, 1)
        VirtualInputManager:SendMouseButtonEvent(X, Y, 0, false, game, 1)
    end
end)

tab1.newToggle("AutoTreadmill", "", false, function(on)
    on = not on
    while on do
        task.wait(.25)
        rm:WaitForChild("ChangeSpeed"):InvokeServer(true)
    end
end)

tab1.newToggle("AutoChalenge", "", false, function(on)
    on = not on
    while on do
        task.wait(.25)
        
    end
end)
