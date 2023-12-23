repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("Remotes")
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local window = DrRayLibrary:Load("DrRay", "Default")

local key = "操你💦💔🍑👌💦操你💦💔🍑👌💦💔🍑👌💦💔🍑👌💔🍑👌💦💔🍑👌"

local dis = 10
local dis_old = 10
local sped = 100
local twen = nil
local on2 = false
local old_on2 = false
local rep_on = false
local auto_cash = false
local stag = 'One'

local tab1 = DrRayLibrary.newTab("Main", "")
local tab2 = DrRayLibrary.newTab("SetUp", "")
local tab3 = DrRayLibrary.newTab("Trainer", "")
local tab4 = DrRayLibrary.newTab("Misc", "")
local tab5 = DrRayLibrary.newTab("Focus", "")
local tab6 = DrRayLibrary.newTab("Other", "")

game.Players.LocalPlayer.Character.Remotes.KeyEvent:FireServer(key, stag, "Down", CFrame.new(), CFrame.new())
spawn(function()
    while wait() do
        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
	        repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("SpawnSelection")--or wait(3)
            repeat wait() until not game.Players.LocalPlayer.PlayerGui:FindFirstChild("SpawnSelection")--or wait(3)
            wait(1)
            repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("Remotes")
	        game.Players.LocalPlayer.Character.Remotes.KeyEvent:FireServer(key, stag, "Down", CFrame.new(), CFrame.new())
        end
    end
end)

tab2.newSlider("Speed", "Epic slider", 250, false, function(newValue)
    sped = tonumber(newValue)
end)

tab2.newSlider("Distance From Mob", "", 20, false, function(newValue)
	dis = tonumber(newValue)
	dis_old = tonumber(newValue)
end)

local ass = true

tab1.newToggle("AutoFarm", "Toggle! (prints the state)", true, function(on)
    if on then
        on2 = on
        old_on2 = on
    end
end)

local on1 = false

tab1.newToggle("Auto Collect Corpses", "", true, function(on)
    if on then
        on1 = on
    end
end)

local whitelist = ''
s1:CreateDropdown({
    Name = "Type"; -- required: name of element
    Callback = function(item) -- required: function to be called an item in the dropdown is activated
        whitelist = item
    end;
    Options = {"None", "Human" ,"Aogiri" ,"Investigator"}; -- required: dropdown options
    ItemSelecting = true; -- optional: whether to control item selecting behavior in dropdowns (see showcase video), is false by default
    DefaultItemSelected = "None"; -- optional: default item selected, will not run the callback and does not need to be from options table. This will be ignored if ItemSelecting is not true.
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

tab2.newDropdown("Type Mob", "", {"Human" ,"Aogiri" ,"Investigator"}, function(item)
    whitelist = item
end)

local crum = 'cummmmmmmmmm'
local dis1 = 5
local last = math.huge
local nearest = nil
spawn(function()
    while wait() do
        for i,v in pairs(game:GetService("Workspace").NPCSpawns:GetChildren()) do 
            if v:IsA("MeshPart") and v:FindFirstChildWhichIsA("Model") and not string.find(v.Name, "Human") and (not string.find(v.Name, "Boss") or whitelist == "Eto Yoshimura") and string.find(v:FindFirstChildWhichIsA("Model").Name, whitelist) then
                for i2,v2 in pairs(v:GetChildren()) do 
                    if v2:IsA("Model") and v2:FindFirstChild("HumanoidRootPart") and v2:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (v2:FindFirstChild("HumanoidRootPart").Position - game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
                        if distance < last then
                            last = distance
                            nearest = v2.HumanoidRootPart
                        end
                    end
                end
            end
        end
        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("MeshPart") or v:IsA("Part") then
                    v.CanCollide = false
                end
            end
        end
    end
end)
local times_fired = 0
spawn(function()
    while wait() do
        if on2 and game.Players.LocalPlayer.PlayerGui:FindFirstChild("HUD") then
            for i,v in pairs(game:GetService("Workspace").NPCSpawns:GetChildren()) do
                if v:IsA("MeshPart") and v:FindFirstChildWhichIsA("Model") and not string.find(v.Name, "Human") and (not string.find(v.Name, "Boss") or whitelist == "Eto Yoshimura") and string.find(v:FindFirstChildWhichIsA("Model").Name, whitelist) then
                    for i2,v2 in pairs(v:GetChildren()) do 
                        if v2:IsA("Model") and v2:FindFirstChild("HumanoidRootPart") and v2:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            if nearest ~= nil and nearest.Parent ~= nil then
                                warn(tostring(nearest.Parent.Name))
                                print("found", "      ", tostring(nearest.Parent.Name))
                                repeat 
                                local hum = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                if on2 and hum and nearest ~= nil then 
                                    twen = game:GetService("TweenService"):Create(hum,TweenInfo.new((hum.Position - nearest.Position).magnitude/sped,Enum.EasingStyle.Quad),{CFrame = nearest.CFrame * CFrame.new(0,0,dis)})
                                    times_fired = times_fired + 1
                                    if ass and twen ~= nil then  
                                        twen:Play()
                                    end
                                if game.Players.LocalPlayer.Character:FindFirstChild("Remotes") and ass and (nearest.Position - hum.Position).magnitude < 23 then
                                    game.Players.LocalPlayer.Character.Remotes.KeyEvent:FireServer(key, "Mouse1", "Down", CFrame.new(), CFrame.new())
                                end
                                end
                                wait()
                                until not v:FindFirstChildWhichIsA("Model") or nearest.Parent == nil or on2 == false
                                print("next mob please")
                                last, nearest = math.huge, nil
                                twen:Cancel()
                            end
                        end
                    end
                end
            end
        else
            last, nearest = math.huge, nil
        end
    end
end)
spawn(function()
    while wait() do
        print(times_fired)
        times_fired = 0
        wait(10)
    end
end)
local psy = false
local kag = false
local dur = false
local speeed = false
local delay = 1
function focusAdd(a)
    game.Players.LocalPlayer.PlayerFolder.StatsFunction:InvokeServer("Focus", tostring(a), 1)
end

tab4.newToggle("Auto Focus Physical", "", true, function(on)
    if on then
	psy = on
    end
end)

tab4.newToggle("cus Auto FoKagune / Quinque", "", true, function(on)
    if on then
	kag = on
    end
end)

tab4.newToggle("Auto Focus Durability", "", true, function(on)
    if on then
	dur = on
    end
end)

tab4.newToggle("Auto Focus Speed", "", true, function(on)
    if on then
	speeed = on
    end
end)

tab4.newInput("Focus Delay", "", function(text)
    delay = tonumber(text)
end)

spawn(function()
    while wait() do
        if psy then
            focusAdd("PhysicalAddButton")
        elseif kag then
            focusAdd("WeaponAddButton")
        elseif dur then
            focusAdd("DurabilityAddButton")
        elseif speeed then
            focusAdd("SpeedAddButton")
        end
        wait(delay)
    end
end)


local auto_click = false
s5:CreateToggle({
    Name = "Auto Click";
    Flag = "AutoClick";
    Default = true;
    Callback = function(on)
        auto_click = on
    end;
    
})

local auto_use_e = false
local auto_use_r = false
local auto_use_c = false
local auto_use_f = false

tab5.newToggle("Auto Use E", "", true, function(on)
    if on then
	auto_use_e = on
    end
end)
tab5.newToggle("Auto Use R", "", true, function(on)
    if on then
	auto_use_r = on
    end
end)
tab5.newToggle("Auto Use C", "", true, function(on)
    if on then
	auto_use_c = on
    end
end)
tab5.newToggle("Auto Use F", "", true, function(on)
    if on then
	auto_use_f = on
    end
end)

local name_off = false
tab5.newToggle("Hide Name", "", true, function(on)
    if on then
	name_off = on
    end
end)

local anti_afk = false
tab5.newToggle("AntiAFK", "", true, function(on)
    if on then
	anti_afk = on
    end
end)
tab5.newDropdown("Stage", "", {"One","Two","Three", "Four","Five","Six"}, function(item)
    stag = item
end)

spawn(function()
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        if anti_afk then
            game:GetService("VirtualUser"):Button2Down(Vector2.new())
        end
    end)
end)
spawn(function()
    while wait() do
        if name_off and game.workspace:FindFirstChild(game.Players.LocalPlayer.Name) then
            for i,v in pairs(game.workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                if v:FindFirstChild("PlayerStatus") then
                    v:FindFirstChild("PlayerStatus"):Destroy()
                end
            end
        end
        if game.Players.LocalPlayer.Character:FindFirstChild("Remotes") then
            if auto_click then
                game.Players.LocalPlayer.Character.Remotes.KeyEvent:FireServer(key, "Mouse1", "Down", CFrame.new(), CFrame.new())
            end
            if auto_use_e then
                game.Players.LocalPlayer.Character.Remotes.KeyEvent:FireServer(key, "E", "Down", CFrame.new(), CFrame.new())
            end
            if auto_use_r then
                game.Players.LocalPlayer.Character.Remotes.KeyEvent:FireServer(key, "R", "Down", CFrame.new(), CFrame.new())
            end
            if auto_use_c then
                game.Players.LocalPlayer.Character.Remotes.KeyEvent:FireServer(key, "C", "Down", CFrame.new(), CFrame.new())
            end
            if auto_use_f then
                game.Players.LocalPlayer.Character.Remotes.KeyEvent:FireServer(key, "F", "Down", CFrame.new(), CFrame.new())
            end
        end
    end
end)
spawn(function()
    while wait() do
    if on1 then
        for i,v in pairs(game:GetService("Workspace").NPCSpawns:GetChildren()) do 
            if v:FindFirstChildWhichIsA("Model") then 
                for i3,v3 in pairs(v:FindFirstChildWhichIsA("Model"):GetChildren()) do
                    if string.find(v3.Name:lower(), "corpse") and v3:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        if v3:FindFirstChild("ClickPart") then
                            for i4,v4 in pairs(v3:GetChildren()) do
                                if v4:FindFirstChildWhichIsA("ClickDetector") and (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v3:FindFirstChild("HumanoidRootPart").Position).magnitude < 30 then
                                warn("start eat")
                                local hum = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                twen:Pause()
                                ass = false
                                spawn(function()
                                    repeat
                                        hum.CFrame = v3.HumanoidRootPart.CFrame
                                        fireclickdetector(v4:FindFirstChildWhichIsA("ClickDetector"), 1)
                                    wait()
                                    until ass == true
                                end)
                                wait(0.3)
                                ass = true
                                warn("stop eat")
                                end
                            end
                            end
                        end
                    end
                end
            end
        end
    end
end)
