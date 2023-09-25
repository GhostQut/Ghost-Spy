local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostQut/FreemUI/main/Source.lua"))()
local vim = game:service'VirtualInputManager'
local Mobs_Table = {}

function GetChestAllow()
   local ReturnTable = {}
   if Farm_Legendary then
       table.insert(ReturnTable, "legendary")
   end
   if Farm_Epic then
       table.insert(ReturnTable, "epic")
   end
   if Farm_Rare then
       table.insert(ReturnTable, "rare")
   end
   if Farm_Common then
       table.insert(ReturnTable, "common")
   end
   if Smart_Chest_Farm then
       ReturnTable = {
           'legendary',
           'epic',
           'rare',
           'common'
       }
       return ReturnTable
   end
   return ReturnTable
end

function TPTo(PCFrame)
    local plr = game.Players.LocalPlayer;
           if plr.Character then
            plr.Character.HumanoidRootPart.CFrame = PCFrame
        end
    end
    
local function getFRUIT()
local dist, thing = math.huge
    for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v.Name == "chop" or v.Name == "gura" or v.Name == "mera" or v.Name == "ice" or v.Name == "gomu" then
            local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Mesh.Position).magnitude
            if mag < dist then
                dist = mag
                thing = v
            end
        end
    end
    return thing
end

function GetRemote(name)
   for i,v in pairs(game:GetService("ReplicatedStorage").Events:GetChildren()) do
       local R_Name = string.upper(v.Name)
       if string.find(R_Name, string.upper(name)) then
           return game:GetService("ReplicatedStorage").Events[v.Name]
       end
   end
end

function SendKeyEvent(key)
   game:GetService("VirtualInputManager"):SendKeyEvent(true,key,false,game)
end

for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Mobs:GetChildren()) do
   if v.ClassName == "Folder" then
       for i,v in pairs(v:GetChildren()) do
           table.insert(Mobs_Table, v.Name)
       end
   end
   if v.ClassName == "Model" then
       table.insert(Mobs_Table, v.Name)
   end
end

local test = library.new({
    Name = "Yammi";
    ConfigFolder = "FreemScript";
    Credit = "Made by me!";
    Color = Color3.fromRGB(164, 53, 90);
    FullName = "YammiHub";
    UseLoader = true;
    Bind = "LeftShift";
    CheckKey = function(e) -- this can be nil to disable key checking
        return e == "OnePerNiger"
    end;
    Discord = "https://link-target.net/4r23094/yammihub"
})

local Train = test:CreatePage("Train")
local Farm = test:CreatePage("Farm")
local Teleports = test:CreatePage("Teleports")
local Skills = test:CreatePage("Skills")
local Group = test:CreatePage("Group")
local Misc = test:CreatePage("Misc")

local s1 = Train:CreateSection("Farm")
local s2 = Train:CreateSection("Urgrade")
local s3 = Train:CreateSection("Training Area")
local Mob = Farm:CreateSection("Mob")
local Chest = Farm:CreateSection("Chest")
local s4 = Teleports:CreateSection("Teleport")
local s5 = Misc:CreateSection("Miscellaneous")
local GroupInv = Group:CreateSection("Invite")
local GroupAcc = Group:CreateSection("Accept")
local skillm = Skills:CreateSection("Main")

s1:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Strength"; -- required: name of element
    Flag = "Strength"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
            a = Value
        while a == true do task.wait(.1)
            local args = {
                [1] = "TrainStat",
                [2] = "Strength"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Stats/RemoteFunction"):InvokeServer(unpack(args))
            
        end
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s1:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Durability"; -- required: name of element
    Flag = "Durability"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
            b = Value
        while b == true do task.wait(.1)
            local args = {
                [1] = "TrainStat",
                [2] = "Durability"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Stats/RemoteFunction"):InvokeServer(unpack(args))
            
        end
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s1:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Chakra"; -- required: name of element
    Flag = "Chakra"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
             zzzz = Value
        while zzzz == true do task.wait(.1)
            local args = {
                [1] = "TrainStat",
                [2] = "Chakra"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Stats/RemoteFunction"):InvokeServer(unpack(args))
        end
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s1:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Sword"; -- required: name of element
    Flag = "Sword"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
           zzz = Value
        while zzz == true do task.wait(.1)
            local args = {
                [1] = "TrainStat",
                [2] = "Sword"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Stats/RemoteFunction"):InvokeServer(unpack(args))
            
        end
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})


s1:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Speed"; -- required: name of element
    Flag = "Speed"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
           zz = Value
        while zz == true do task.wait(.1)
            local args = {
                [1] = "TrainStat",
                [2] = "Speed"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Stats/RemoteFunction"):InvokeServer(unpack(args))
            
        end
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})
s1:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Grab Fruit"; -- required: name of element
    Flag = "GrabFruit"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
           t = Value
        while t == true do task.wait(.1)
            pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getFRUIT().Mesh.CFrame
            vim:SendKeyEvent(true, "E", false, game)
            print("working")
        end)
        end
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s1:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Claim Daily"; -- required: name of element
    Flag = "Daily"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(t) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
           Auto_Daily = t
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})
task.spawn(function()
if Auto_Daily then
   while task.wait(.1) do
           pcall(function()
               GetRemote("Rewards/RemoteEvent"):FireServer('ClaimDaily')
           end)
       end
   end
end)

s1:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Claim Achievement"; -- required: name of element
    Flag = "Achievement"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(t) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
           Auto_Claim_Achievement = t
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})
task.spawn(function()
if Auto_Claim_Achievement then
   while task.wait(1) do
           pcall(function()
               for i,v in pairs(Client.PlayerGui.Menu.PagesContainer.Achievements.container.Content:GetChildren()) do
                   if v:IsA("ScrollingFrame") then
                       for i,v in pairs(v:GetChildren()) do
                           if v:FindFirstChildOfClass("Frame") then
                               local modifiedString = v.Name:gsub("(%a)(%d)", "%1_%2")
                               GetRemote("Achievements/RemoteEvent"):FireServer('ClaimAchievement', modifiedString)
                           end
                       end
                   end
               end
           end)
       end
   end
end)

s2:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Upgrade Strength"; -- required: name of element
    Flag = "UpgradeStrength"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(t) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
            Upgrade_Strength = t
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

task.spawn(function()
if Upgrade_Strength then
   while task.wait(.1) do
           pcall(function()
               local MainStr = "Strength"
               GetRemote("Stats/RemoteEvent"):InvokeServer("Upgrade", MainStr)
           end)
       end
   end
end)


s2:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Upgrade Durability"; -- required: name of element
    Flag = "UpgradeDurability"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(t) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
        Upgrade_Durability = t
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

task.spawn(function()
 if Upgrade_Durability then
   while task.wait(.1) do
           pcall(function()
               local MainStr = "Durability"
               GetRemote("Stats/RemoteEvent"):InvokeServer("Upgrade", MainStr)
           end)
       end
   end
end)


s2:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Upgrade Chakra"; -- required: name of element
    Flag = "UpgradeChakra"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
            Upgrade_Chakra = t
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})
task.spawn(function()
    if Upgrade_Chakra then
        while task.wait(.1) do
           pcall(function()
               local MainStr = "Chakra"
               GetRemote("Stats/RemoteEvent"):InvokeServer("Upgrade", MainStr)
           end)
       end
   end
end)

s2:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Upgrade Sword"; -- required: name of element
    Flag = "UpgradeSword"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
            Upgrade_Sword = t
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})
task.spawn(function()
   if Upgrade_Sword then
     while task.wait(.1) do
           pcall(function()
               local MainStr = "Sword"
               GetRemote("Stats/RemoteEvent"):InvokeServer("Upgrade", MainStr)
           end)
       end
   end
end)

s2:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Upgrade Speed"; -- required: name of element
    Flag = "UpgradeSpeed"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
            Upgrade_Speed = t
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})
task.spawn(function()
    if Upgrade_Speed then
        while task.wait(.1) do
           pcall(function()
               local MainStr = "Speed"
               GetRemote("Stats/RemoteEvent"):InvokeServer("Upgrade", MainStr)
           end)
       end
   end
end)

local MyDropdown = Mob:CreateDropdown({ 
	Name = "Select Mob"; -- required: name of element
	Flag = "MobSelect";
    Callback = function(t)  -- required: function to be called an item in the dropdown is activated
		Selected_Mob = t
	end;
	Options = {}; -- required: dropdown options
	ItemSelecting = true; -- optional: whether to control item selecting behavior in dropdowns (see showcase video), is false by default 
	DefaultItemSelected = "None"; -- optional: default item selected, will not run the callback and does not need to be from options table. This will be ignored if ItemSelecting is not true.
	-- Scroll to the bottom of the page to read more about the following two:
	Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
	WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

game:GetService("RunService").RenderStepped:Connect(function() -- update dropdown every frame with all players  
    for _,v in ipairs(game:GetService("ReplicatedStorage").Assets.Mobs:GetChildren()) do
        if v.ClassName == "Folder" then
            for i,v in pairs(v:GetChildren()) do
                table.insert(Mobs_Table, v.Name)
            end
        end
    if v.ClassName == "Model" then
        table.insert(Mobs_Table, v.Name)
    end
    end

	MyDropdown:Update(Mobs_Table) -- uses namecalling, ":" instead of "."
end)

Chest:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Notify Chest Spawn"; -- required: name of element
    Flag = "NotifyChestSpawn"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(t) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
            Notify_Chest_Spawn = t
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})
game:GetService("Workspace").Scriptable.Crates.ChildAdded:Connect(function(v)
   if Notify_Chest_Spawn then
       UI:Notify({
         Title = "Game";
         Content = "New: "..tostring(v.Name),
       })
   end
end)

task.spawn(function()
   while task.wait() do
       if Chest_Main or Smart_Chest_Farm then
           pcall(function()
               SendKeyEvent("E")
           end)
       end
   end
end)
   
Mob:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Farm Selected Mob"; -- required: name of element
    Flag = "FarmSelectedMob"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(t) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
            Farm_Selected_Mob = t
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})
task.spawn(function()
    if Farm_Selected_Mob then
        while task.wait() do
            if Farm_Selected_Mob then
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace").Scriptable.Mobs:GetChildren()) do
                        if string.find(string.lower(v.Name), string.lower(Selected_Mob)) and v:FindFirstChild("HumanoidRootPart") and v then
                            repeat task.wait()
                            Client.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0) * CFrame.Angles(math.rad(90), 0,0)
                            until not v:FindFirstChild("HumanoidRootPart") or not v.Parent or not v or Farm_Selected_Mob == false
                        end
                    end
                end)
            end
        end
    end
end)


local MyDropdownf = skillm:CreateDropdown({ 
	Name = "Dropdown"; -- required: name of element
	Callback = function(item)  -- required: function to be called an item in the dropdown is activated
		local A_1 = "ActivatePower"
		local A_2 = item
		local Event = game:GetService("ReplicatedStorage").Events["Powers/RemoteFunction"]
		Event:InvokeServer(A_1, A_2)
		local Af = "ForceStartCooldown"
		local An = item
		local Event = game:GetService("ReplicatedStorage").Events["Powers/RemoteEvent"]
		Event:FireServer(Af, An)
		local Ap = "PowerClean"
		local Am =  item
		local Event = game:GetService("ReplicatedStorage").Events["Powers/RemoteEvent"]
		Event:FireServer(Ap, Am)
	end;
	Options = {"Buso","Hamon","Super Saiyan", "Fourh Gate", "Hollowication", "???%"}; -- required: dropdown options
	ItemSelecting = false; -- optional: whether to control item selecting behavior in dropdowns (see showcase video), is false by default 
	DefaultItemSelected = "None"; -- optional: default item selected, will not run the callback and does not need to be from options table. This will be ignored if ItemSelecting is not true.
	-- Scroll to the bottom of the page to read more about the following two:
	Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
	WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

local anti_afk = false
s5:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Anti-Afk"; -- required: name of element
    Flag = "ANAFK"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(v) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
        anti_afk = v
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})
task.spawn(function()
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        if anti_afk then
            game:GetService("VirtualUser"):Button2Down(Vector2.new())
        end
    end)
end)
s5:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Inf Stamina"; -- required: name of element
    Flag = "InfStamina"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(t) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
        INF_Stamina = t
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

task.spawn(function()
    if INF_Stamina then
        while task.wait(.5) do
            pcall(function()
               GetRemote("Stamina/RemoteEvent"):FireServer('Use', -9e9)
            end)
        end
    end
end)

s5:CreateButton({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Redeem All Codes"; -- required: name of element
    Callback = function(t) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
        local Event = game:GetService("ReplicatedStorage").Events["Codes/RemoteFunction"]
        Event:InvokeServer("Redeem","THANKSFOR175K")
        Event:InvokeServer("Redeem","freefightpassticket")
        Event:InvokeServer("Redeem","FIGHTINGPASSISBACK")
        Event:InvokeServer("Redeem","QuickShutdown")
        Event:InvokeServer("Redeem","150K150K")
        Event:InvokeServer("Redeem","OMGUPDATE3OMG")
        Event:InvokeServer("Redeem","125KLIKESOMG")
        Event:InvokeServer("Redeem","bugFixwithYenOMG")
        Event:InvokeServer("Redeem","UPDATE2OUTNOW")
        Event:InvokeServer("Redeem","AnotherQuickPatchUpdate")
        Event:InvokeServer("Redeem","LETSGO100K")
    end,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})
