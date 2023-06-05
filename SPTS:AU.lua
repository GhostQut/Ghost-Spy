local FS = game:GetService("ReplicatedStorage").RemoteEvents.FistStrength
local PP = game:GetService("ReplicatedStorage").RemoteEvents.TrainPsychic
local BT = game:GetService("ReplicatedStorage").RemoteEvents.Pushup
local RedeemCode = game:GetService("ReplicatedStorage").RemoteEvents.RedeemCode
local Respawn = game:GetService("ReplicatedStorage").Respawn

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostQut/FreemUI/main/Source.lua"))()

function TPTo(PCFrame)
    local plr = game.Players.LocalPlayer;
           if plr.Character then
            plr.Character.HumanoidRootPart.CFrame = PCFrame
        end
    end


local test = library.new({
    Name = "Script";
    ConfigFolder = "FreemScript";
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

local Farm = test:CreatePage("Farm")
local Teleports = test:CreatePage("Teleports")
local Misc = test:CreatePage("Misc")

local s1 = Farm:CreateSection("Farm")
local s2 = Farm:CreateSection("Zones")
local Mob = Farm:CreateSection("Farm")
local s3 = Teleports:CreateSection("Teleport")
local s5 = Misc:CreateSection("Miscellaneous")


s1:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Train Fist Strength"; -- required: name of element
    Flag = "FS"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(FSValue) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
          while FSValue == true and wait() do
        	FS:FireServer()
        	if FSValue == false then
        	break
        end
        end
    end;
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s1:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Train Body Toughness"; -- required: name of element
    Flag = "BT"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(BTValue) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
       if BTValue == true then
        	BT:FireServer(true)
        else
        	BT:FireServer(false)
        end
    end;
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s1:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Train Psychic Power"; -- required: name of element
    Flag = "PP"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(PPValue) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
        if PPValue == true then
        	PP:FireServer(true)
        else
        	PP:FireServer(false)
        end
    end;
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

Mob:CreateButton({
    Name = "Bring All Mob"; -- required: name of element
    Callback = function(item) -- required: function to be called an item in the dropdown is activated
        for I,V in pairs(game.Workspace.Npc_Mobs:GetDescendants()) do
				   if V.Name == "AttackHandler" then
				       for I2,V2 in pairs(V.Parent:GetDescendants()) do
				           if V2:IsA("BasePart") then
				               V2.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                  end
      		   end
  			end
		end
    end;
})

Mob:CreateDropdown({
    Name = "Mob Farm"; -- required: name of element
    Callback = function(item) -- required: function to be called an item in the dropdown is activated
     local gr = false
     for I,V in pairs(game.Workspace.Npc_Mobs[item]:GetDescendants()) do
				   if V.Name == "AttackHandler" then
				       for I2,V2 in pairs(V.Parent:GetDescendants()) do
				           if V2:IsA("BasePart") then
								local Pos = Vector3.new(V2.Position)
								local Event = game:GetService("ReplicatedStorage").RemoteEvents.EnergySphere
								gr = true
								if gr == true then
								while gr == true and wait(0.1) do
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = V2.CFrame
								Event:FireServer(Pos)
							end
							if V2.Name == item then
							gr = false
						end
						end
				    end
				 end
			  end
           end
        end;
    Options = {"Zombie","Alien","Greek","Thug"}; -- required: dropdown options
    ItemSelecting = true; -- optional: whether to control item selecting behavior in dropdowns (see showcase video), is false by default
    DefaultItemSelected = "None"; -- optional: default item selected, will not run the callback and does not need to be from options table. This will be ignored if ItemSelecting is not true.
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s2:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto-Best Fist"; -- required: name of element
    Flag = "Auto Fist"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(FSBest) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
    end;
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})
s2:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto-Best Body"; -- required: name of element
    Flag = "Auto body"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(BTBest) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
       BestPlayerPsychic = 1
			PlayerPsychicName = false
			for i,v in pairs(game:GetService("Players"):GetChildren()) do
				local PlayerPsychic = tonumber(game.Players[v.Name].PrivateStats.PsychicPower.Value)
				if PlayerPsychic > tonumber(BestPlayerPsychic) then 
					BestPlayerPsychic = PlayerPsychic
					PlayerPsychicName = tostring(v.Name)
				end
			end
    end;
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s2:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto-Next Body"; -- required: name of element
    Flag = "AutoNext-Body"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(BTNext) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
        
    end;
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s2:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto-Best Psychic"; -- required: name of element
    Flag = "Auto Psychic"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(PPBest) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
        
    end;
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

local FistDrop = s3:CreateDropdown({
    Name = "Fist Zones"; -- required: name of element
    Callback = function(item) -- required: function to be called an item in the dropdown is activated
        print("Dropdown button pressed:",item)
          TPTo(game:GetService("Workspace")["Training Areas"][item].CFrame)
    end;
    Options = {"NewbieFsArea","FsRockArea","1b_FsArea","100b_FsArea","10T_FsArea","1Qa_FsArea","1Qi_FsArea","1Sx_FsArea","1Sp_FsArea","1Oc_FsArea","1No_FsArea","1De_FsArea"}; -- required: dropdown options
    ItemSelecting = true; -- optional: whether to control item selecting behavior in dropdowns (see showcase video), is false by default
    DefaultItemSelected = "None"; -- optional: default item selected, will not run the callback and does not need to be from options table. This will be ignored if ItemSelecting is not true.
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

local BodyDrop = s3:CreateDropdown({
    Name = "Body Zones"; -- required: name of element
    Callback = function(item) -- required: function to be called an item in the dropdown is activated
        print("Dropdown button pressed:",item)
          TPTo(game:GetService("Workspace")["Training Areas"][item].CFrame)
    end;
    Options = {"NewbieBodyArea","100BtArea","10KBtArea","100KBtArea","10MBtArea","100MBtArea","1bBtArea","100bBtArea","10Qa_BtArea","1Qi_BtArea","1Sx_BtArea","1Sp_BtArea","1Oc_BtArea","1No_BtArea","1De_BtArea"}; -- required: dropdown options
    ItemSelecting = true; -- optional: whether to control item selecting behavior in dropdowns (see showcase video), is false by default
    DefaultItemSelected = "None"; -- optional: default item selected, will not run the callback and does not need to be from options table. This will be ignored if ItemSelecting is not true.
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

 local PsychicDrop = s3:CreateDropdown({
    Name = "Psychic Zones"; -- required: name of element
    Callback = function(item) -- required: function to be called an item in the dropdown is activated
        print("Dropdown button pressed:",item)
        TPTo(game:GetService("Workspace")["Training Areas"][item].CFrame)
    end;
    Options = {"NewbiePsychicArea","100PsychicArea","1M_PsArea","1B_PsArea","1T_PsArea","1Qa_PsArea","1Qi_PsArea","1Sx_PsArea","1Sp_PsArea","1Oc_PsArea","1No_PsArea","1De_PsArea"}; -- required: dropdown options
    ItemSelecting = true; -- optional: whether to control item selecting behavior in dropdowns (see showcase video), is false by default
    DefaultItemSelected = "None"; -- optional: default item selected, will not run the callback and does not need to be from options table. This will be ignored if ItemSelecting is not true.
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})



s5:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto-Respawn"; -- required: name of element
    Flag = "AutoRespawn"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(auteres) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
    			while wait() do
    				wait(0.4)
    		 		game:GetService("Players").LocalPlayer.Character.Humanoid.Died:Connect(function(die) 		
				end)
			if autores == true and die then
        			Respawn:FireServer()
			end
		end
    end;
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})






s5:CreateSlider({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "WalkSpeed"; -- required: name of element
    Flag = "WalkSpeed"; -- required: unique flag name to use
    Min = 1; -- required: slider minimum drag
    Max = 2000; -- required: slider maximum drag (Max>Min or else script will error)
    AllowOutOfRange = true; -- optional: determines whether the player can enter values outside of range Min:Max when typing in the TextBox. If left nil, this is false
    Digits = 0; -- optional: digits for rounding when dragging or entering values, default is 0 (whole numbers)
    Default = 16; -- optional: default value for slider, will be used if config saving is disabled and there is no saved data, will be the Min value if left nil
    Callback = function(SpeedValue) -- optional: function that will be called whenever slider flag is changed
        local Player = game:GetService("Players").LocalPlayer
		local character = Player.Character or Player.CharacterAdded:Wait()
		local HumanoidRootPart = character.HumanoidRootPart
		local Humanoid =  character.Humanoid
		if Humanoid then
			Humanoid.WalkSpeed = (SpeedValue)
		end
    end;
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s5:CreateSliderToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "JumpPower"; -- required: name of element
    SliderFlag = "JumpFl"; -- required: unique flag name to use for slider element
    ToggleFlag = "JumpToggle"; -- required: unique flag name to use for toggle element
    Min = 1; -- required: slider minimum drag
    Max = 2000; -- required: slider maximum drag (Max>Min or else script will error)
    AllowOutOfRange = true; -- optional: determines whether the player can enter values outside of range Min:Max when typing in the TextBox. If left nil, this is false
    Digits = 0; -- optional: digits for rounding when dragging or entering values, default is 0 (whole numbers)
    SliderDefault = 50; -- optional: default value for slider, will be used if config saving is disabled and there is no saved data, will be the Min value if left nil
    ToggleDefault = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    SliderCallback = function(newValue) -- optional: function that will be called whenever slider flag is changed
        print("Slider:",newValue)
    end;
    ToggleCallback = function(JumpValue) -- optional: function that will be called whenever toggle flag is changed
        game:GetService('Players').LocalPlayer.Character.Humanoid.JumpPower = JumpValue
    end;
    SavingDisabled = true; -- this is how you would disable saving on a single element, just add this argument in
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Paragraph) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})


s5:CreateButton({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
      Name = "Redeem All Codes"; -- required: name of element
    Callback = function() -- required: function to be called when button is pressed
        test:Notify({
            Title = "Codes";
            Content = "You Redeem All Codes."
        })
  	RedeemCode:FireServer("BLOXY")
  	RedeemCode:FireServer("DEFO")
  	RedeemCode:FireServer("DAVIDISCOOL")
  	RedeemCode:FireServer("NEWUNIVERSE")
  	RedeemCode:FireServer("GROWUPZAF")
  	RedeemCode:FireServer("150LIKES")
  	RedeemCode:FireServer("MYSTERYBOXREWORK")
end})
