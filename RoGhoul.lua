repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("Remotes")
local Freem = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostQut/FreemUI/main/Source.lua"))()
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

local test = Freem.new({
    Name = "Yammi";
    ConfigFolder = "YammiHub";
    Credit = "Made by me!";
    Color = Color3.fromRGB(164, 53, 90);
    FullName = "YammiHub";
    UseLoader = true;
    Bind = "LeftShift";
    CheckKey = function(e) -- this can be nil to disable key checking
        return e == "OnePerNiger"
    end;
    Discord = "https://link-target.net/423094/yammihub"
})

local Farm = test:CreatePage("Main")
local Options = test:CreatePage("SetUp")
local Trainer = test:CreatePage("Trainer")
local Misc = test:CreatePage("Misc")
local Focus = test:CreatePage("Focus")
local Other = test:CreatePage("Other")

local s1 = Farm:CreateSection("Farm")
local s2 = Options:CreateSection("Options")
local s3 = Trainer:CreateSection("Trainer")
local s4 = Focus:CreateSection("Focus")
local s5 = Misc:CreateSection("Miscellaneous")
local s6 = Other:CreateSection("Other")

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

s2:CreateSlider({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Speed"; -- required: name of element
    Flag = "Speed"; -- required: unique flag name to use
    Min = 0; -- required: slider minimum drag
    Max = 250; -- required: slider maximum drag (Max>Min or else script will error)
    AllowOutOfRange = true; -- optional: determines whether the player can enter values outside of range Min:Max when typing in the TextBox. If left nil, this is false
    Digits = 1; -- optional: digits for rounding when dragging or entering values, default is 0 (whole numbers)
    Default = 120; -- optional: default value for slider, will be used if config saving is disabled and there is no saved data, will be the Min value if left nil
    Callback = function(newValue) -- optional: function that will be called whenever slider flag is changed
        sped = tonumber(newValue)
    end;
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})
s2:CreateSlider({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Distance From Mob"; -- required: name of element
    Flag = "DistanceFromMob"; -- required: unique flag name to use
    Min = 0; -- required: slider minimum drag
    Max = 20; -- required: slider maximum drag (Max>Min or else script will error)
    AllowOutOfRange = true; -- optional: determines whether the player can enter values outside of range Min:Max when typing in the TextBox. If left nil, this is false
    Digits = 1; -- optional: digits for rounding when dragging or entering values, default is 0 (whole numbers)
    Default = 10; -- optional: default value for slider, will be used if config saving is disabled and there is no saved data, will be the Min value if left nil
    Callback = function(newValue) -- optional: function that will be called whenever slider flag is changed
        dis = tonumber(newValue)
        dis_old = tonumber(newValue)
    end;
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

local ass = true

s1:CreateToggle({
    Name = "AutoFarm";
    Flag = "MyToggle";
    Default = true;
    Callback = function(on)
        on2 = on
        old_on2 = on
    end;
    
})
local on1 = false
s1:CreateToggle({
    Name = "Auto Collect Corpses";
    Flag = "CollectCorpses";
    Default = true;
    Callback = function(on)
        on1 = on
    end;
    
})
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
s4:CreateToggle({
    Name = "Auto Focus Physical";
    Flag = "FocusPhysical";
    Default = true;
    Callback = function(on)
        psy = on
    end;
    
})
s4:CreateToggle({
    Name = "Auto Focus Kagune / Quinque";
    Flag = "FocusKagune/Quinque";
    Default = true;
    Callback = function(on)
        kag = on
    end;
    
})
s4:CreateToggle({
    Name = "Auto Focus Durability";
    Flag = "FocusDurability";
    Default = true;
    Callback = function(on)
        dur = on
    end;
    
})
s4:CreateToggle({
    Name = "Auto Focus Speed";
    Flag = "FocusSpeed";
    Default = true;
    Callback = function(on)
        speeed = on
    end;
    
})
s4:CreateTextBox({
    Name = "Focus Delay"; -- required: name of element
    Flag = "FocusDelay"; -- required: unique flag name to use
    Callback = function(inputtedText,enterPressed) -- function to be called when the textbox's focus is lost
        print("TextBox:",inputtedText,enterPressed)
        delay = tonumber(inputtedText)
    end;
    DefaultText = "1"; -- required: text that will be in the textbox when there is no configurations saved or config saving is disabled
    PlaceholderText = "No Text"; -- optional: placeholder text that will show when no text is written
    TabComplete = function(inputtedText) -- optional: function to be called when the player presses the tab button while the textbox is in focus. The replaced text will be whatever this function returns, if it returns nil, the text will not change
        if inputtedText=="Road" then
            return "RoadToGlory"
        end
    end;
    ClearTextOnFocus = true; -- optional: whether to clear text when the textbox is focused, default is false
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

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
s5:CreateToggle({
    Name = "Auto Use E";
    Flag = "AutoUseE";
    Default = true;
    Callback = function(on)
        auto_use_e = on
    end;
    
})
s5:CreateToggle({
    Name = "Auto Use R";
    Flag = "AutoUseR";
    Default = true;
    Callback = function(on)
        auto_use_r = on
    end;
    
})
s5:CreateToggle({
    Name = "Auto Use C";
    Flag = "AutoUseC";
    Default = true;
    Callback = function(on)
        auto_use_c = on
    end;
    
})
s5:CreateToggle({
    Name = "Auto Use F";
    Flag = "AutoUseF";
    Default = true;
    Callback = function(on)
        auto_use_f = on
    end;
    
})

local name_on = false
s5:CreateToggle({
    Name = "Hide Name";
    Flag = "HideName";
    Default = true;
    Callback = function(on)
        name_on = on
    end;
    
})

local anti_afk = false
s5:CreateToggle({
    Name = "Anti Afk";
    Flag = "AntiAfk";
    Default = true;
    Callback = function(on)
        anti_afk = on
    end;
    
})

s5:CreateDropdown({
    Name = "Stage"; -- required: name of element
    Callback = function(item) -- required: function to be called an item in the dropdown is activated
        stag = item
    end;
    Options = {"One","Two","Three", "Four","Five","Six"}; -- required: dropdown options
    ItemSelecting = true; -- optional: whether to control item selecting behavior in dropdowns (see showcase video), is false by default
    DefaultItemSelected = "One"; -- optional: default item selected, will not run the callback and does not need to be from options table. This will be ignored if ItemSelecting is not true.
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

spawn(function()
    print(anti_afk)
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        if anti_afk then
            game:GetService("VirtualUser"):Button2Down(Vector2.new())
        end
    end)
end)
spawn(function()
    while wait() do
        if name_on and game.workspace:FindFirstChild(game.Players.LocalPlayer.Name) then
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
