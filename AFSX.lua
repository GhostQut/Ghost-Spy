local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostQut/FreemUI/main/Source.lua"))()
local vim = game:service'VirtualInputManager'

function TPTo(PCFrame)
    local plr = game.Players.LocalPlayer;
           if plr.Character then
            plr.Character.HumanoidRootPart.CFrame = PCFrame
        end
    end
    
local function getFRUIT()
local dist, thing = math.huge
    for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v.Name == "chop" or v.Name == "gura" or v.Name == "mera" or v.Name == "ice" or v.Name == "gomu" or v.Name == "magma" then
            local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Mesh.Position).magnitude
            if mag < dist then
                dist = mag
                thing = v
            end
        end
    end
    return thing
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
        return e == loadstring(game:HttpGet("https://pastebin.com/raw/qbJ9JtTW"))()
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
local s2 = Train:CreateSection("Training Area")
local s3 = Train:CreateSection("Urgrade")
local Mob = Farm:CreateSection("Mob")
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
        while a do task.wait(.1)
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
        while b do task.wait(.1)
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
        while zzzz do task.wait(.1)
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
        while zzz do task.wait(.1)
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
        while zz do task.wait(.1)
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
    Flag = "Fruit"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
           t = Value
        while t do task.wait(.1)
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
    Name = "Auto Claim DailyQuests"; -- required: name of element
    Flag = "DailyQuests"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
           t = Value
        while t do task.wait(.1)
            game:GetService("ReplicatedStorage").Events["Quests/RemoteEvent"]:FireServer("ClaimDailyQuest","daily_quest1")
            game:GetService("ReplicatedStorage").Events["Quests/RemoteEvent"]:FireServer("ClaimDailyQuest","daily_quest2")
            game:GetService("ReplicatedStorage").Events["Quests/RemoteEvent"]:FireServer("ClaimDailyQuest","daily_quest3")
            game:GetService("ReplicatedStorage").Events["Quests/RemoteEvent"]:FireServer("ClaimDailyQuest","daily_quest4")
            game:GetService("ReplicatedStorage").Events["Quests/RemoteEvent"]:FireServer("ClaimDailyQuest","daily_quest5")
            game:GetService("ReplicatedStorage").Events["Quests/RemoteEvent"]:FireServer("ClaimDailyQuest","daily_quest6")
        end
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s2:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Upgrade Strength"; -- required: name of element
    Flag = "UpgradeStrength"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
            b = Value
        while b do task.wait(.1)
            game:GetService("ReplicatedStorage").Events["Stats/RemoteEvent"]:FireServer(Upgrade, Strength)
        end
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s2:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Upgrade Durability"; -- required: name of element
    Flag = "UpgradeDurability"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
            b = Value
        while b do task.wait(.1)
            game:GetService("ReplicatedStorage").Events["Stats/RemoteEvent"]:FireServer(Upgrade, Durability)
        end
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s2:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Upgrade Chakra"; -- required: name of element
    Flag = "UpgradeChakra"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
            b = Value
        while b do task.wait(.1)
            game:GetService("ReplicatedStorage").Events["Stats/RemoteEvent"]:FireServer(Upgrade, Chakra)
        end
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s2:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Upgrade Sword"; -- required: name of element
    Flag = "UpgradeSword"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
            b = Value
        while b do task.wait(.1)
            game:GetService("ReplicatedStorage").Events["Stats/RemoteEvent"]:FireServer(Upgrade, Sword)
        end
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s2:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Upgrade Speed"; -- required: name of element
    Flag = "UpgradeSpeed"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
            b = Value
        while b do task.wait(.1)
            game:GetService("ReplicatedStorage").Events["Stats/RemoteEvent"]:FireServer(Upgrade, Speed)
        end
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

skillm:CreateDropdown({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Upgrade Speed"; -- required: name of element
    Flag = "UpgradeSpeed"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
            b = Value
        while b do task.wait(.1)
            game:GetService("ReplicatedStorage").Events["Stats/RemoteEvent"]:FireServer(Upgrade, Speed)
        end
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

local MyDropdown = skillm:CreateDropdown({ 
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
	ItemSelecting = true; -- optional: whether to control item selecting behavior in dropdowns (see showcase video), is false by default 
	DefaultItemSelected = "None"; -- optional: default item selected, will not run the callback and does not need to be from options table. This will be ignored if ItemSelecting is not true.
	-- Scroll to the bottom of the page to read more about the following two:
	Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
	WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

game:GetService("ReplicatedStorage").Events["Quests/RemoteEvent"]:FireServer("ClaimDailyQuestBonus","Bonus_3")

local A_1 = "ActivatePower"
local A_2 = "Onigiri"
local Event = game:GetService("ReplicatedStorage").Events["Powers/RemoteFunction"]
Event:InvokeServer(A_1, A_2)
