local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostQut/FreemUI/main/Source.lua"))()
local vim = game:service'VirtualInputManager'
local bb = game:GetService("VirtualUser")

_G.autofarm = false
_G.farmType = "Nearest"
_G.farmMethod = "MoveTo"
_G.autoCollect = false
_G.autoGamble = false
_G.infTower = false
_G.Gamble = "None"
_G.autoBoss = false

local tickk = tick()

game:GetService("Players").LocalPlayer.Idled:Connect(function()
    bb:CaptureController()
    bb:ClickButton2(Vector2.new())
end)

local alive = true
 
if _G.checkAlive then _G.checkAlive:Disconnect() end
_G.checkAlive = game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Died:Connect(function()
    alive = false print(alive) wait(6) alive = true print(alive)
    game.Players.LocalPlayer.CharacterAdded:Connect(function(a)
        a:WaitForChild("Humanoid").Died:Connect(function()
            alive = false wait(6) alive = true
        end)
    end)
end)

function hrt()
    local lol = game.Players.LocalPlayer.Character.HumanoidRootPart
    return lol
end

function TPTo(PCFrame)
    local plr = game.Players.LocalPlayer;
           if plr.Character then
            plr.Character.HumanoidRootPart.CFrame = PCFrame
        end
    end
    
function MoveTo(enemy)
    game.Players.LocalPlayer.Character.Humanoid:MoveTo(enemy.Position)
end

function teleport(part)
    local player = game.Players.LocalPlayer.Character.HumanoidRootPart
    player.CFrame = part.CFrame * CFrame.new(0,2,5)
end

function sendKey(key)
    game:GetService('VirtualInputManager'):SendKeyEvent(true, key, false, game) wait()
    game:GetService('VirtualInputManager'):SendKeyEvent(false, key, false, game)
end

function getHighest()
    local high = {}
    for i, v in pairs(game:GetService("Workspace").Fight.Chests:GetChildren()) do
        for x, y in pairs(game.Workspace.Fight[_G.selectedArea].Root:GetChildren()) do
            if v.Name == y.Name then
                table.insert(high,v.ChestHp.Value)
                table.sort(high, function(a,b) return a > b end)
            end
        end
    end
 
    for a, b in pairs(game:GetService("Workspace").Fight.Chests:GetChildren()) do
        for x, y in pairs(game.Workspace.Fight[_G.selectedArea].Root:GetChildren()) do
            if b.Name == y.Name and high[1] == b.ChestHp.Value then
                return b.Name
            end
        end
    end    
end
 
function getMid()
    local mid = {}
    for i, v in pairs(game:GetService("Workspace").Fight.Chests:GetChildren()) do
        for x, y in pairs(game.Workspace.Fight[_G.selectedArea].Root:GetChildren()) do
            if v.Name == y.Name then
                table.insert(mid,v.ChestHp.Value)
                table.sort(mid, function(a,b) return a < b end)            
            end
        end
    end
 
    for a, b in pairs(game:GetService("Workspace").Fight.Chests:GetChildren()) do
        for x, y in pairs(game.Workspace.Fight[_G.selectedArea].Root:GetChildren()) do
            if b.Name == y.Name and mid[tonumber(string.format("%.g",#mid/2))] == b.ChestHp.Value then
                return b.Name
            end
        end
    end  
end
 
function getLowest()
    local low = {}
    for i, v in pairs(game:GetService("Workspace").Fight.Chests:GetChildren()) do
        for x, y in pairs(game.Workspace.Fight[_G.selectedArea].Root:GetChildren()) do
            if v.Name == y.Name then
                table.insert(low,v.ChestHp.Value)
                table.sort(low, function(a,b) return a < b end)            
            end
        end
    end
 
    for a, b in pairs(game:GetService("Workspace").Fight.Chests:GetChildren()) do
        for x, y in pairs(game.Workspace.Fight[_G.selectedArea].Root:GetChildren()) do
            if b.Name == y.Name and low[1] == b.ChestHp.Value then
                return b.Name
            end
        end
    end  
end
 
function getNear()
    local near;
    local nearr = math.huge
    local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
 
    for i, v in pairs(game:GetService("Workspace").Fight.ClientChests:GetChildren()) do
        if (plr.Position - v.Root.Position).Magnitude < nearr then
            near = v
            nearr = (plr.Position - v.Root.Position).Magnitude
        end
    end
 
    return near
end
 
function getQiChest()
    for i, v in pairs(game:GetService("Workspace").Fight.CLientChests:GetChildren()) do
        for x, y in pairs(game.Workspace.Fight[_G.selectedArea].Root:GetChildren()) do
            if v.Name == y.Name and string.find(v.Value,"ChestBaoXiang") then
                return v.Name
            end
        end
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

local Main = test:CreatePage("Main")
local Misc = test:CreatePage("Misc")


local s1 = Main:CreateSection("Farm Settings")
local s2 = Main:CreateSection("Game Farm Mode")
local s3 = Main:CreateSection("Auto Farm")
local s5 = Misc:CreateSection("Miscellaneous")

local MyDropdown = s1:CreateDropdown({ 
	Name = "Select Area"; -- required: name of element
	Callback = function(item)  -- required: function to be called an item in the dropdown is activated
		_G.selectedArea = item
		TPTo(game:GetService("Workspace")["Training Areas"][item].CFrame)
	end;
	Options = {}; -- required: dropdown options
	ItemSelecting = true; -- optional: whether to control item selecting behavior in dropdowns (see showcase video), is false by default 
	DefaultItemSelected = "None"; -- optional: default item selected, will not run the callback and does not need to be from options table. This will be ignored if ItemSelecting is not true.
	-- Scroll to the bottom of the page to read more about the following two:
	Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
	WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})
game:GetService("RunService").RenderStepped:Connect(function() -- update dropdown every frame with all players  
	local tbl = {}
	for _,v in  ipairs(game:GetService("Workspace").Fight:GetChildren()) do
	if string.find(v.Name,"FightAre") and not table.find(tbl,v.Name)then
            table.insert(tbl,v.Name)
    	end
    end
	MyDropdown:Update(tbl) -- uses namecalling, ":" instead of "."
end)

s1:CreateDropdown({ 
	Name = "Farm Type"; -- required: name of element
	Callback = function(v)  -- required: function to be called an item in the dropdown is activated
		_G.farmType = v
	end;
	Options = {"Nearest","High Hp","Mid Hp","Low Hp","Qi Chest"}; -- required: dropdown options
	ItemSelecting = true; -- optional: whether to control item selecting behavior in dropdowns (see showcase video), is false by default 
	DefaultItemSelected = "Nearest"; -- optional: default item selected, will not run the callback and does not need to be from options table. This will be ignored if ItemSelecting is not true.
	-- Scroll to the bottom of the page to read more about the following two:
	Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
	WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s1:CreateDropdown({ 
	Name = "Farm Method"; -- required: name of element
	Callback = function(v)  -- required: function to be called an item in the dropdown is activated
		_G.farmMethod = v
	end;
	Options = {"Teleport","MoveTo"}; -- required: dropdown options
	ItemSelecting = true; -- optional: whether to control item selecting behavior in dropdowns (see showcase video), is false by default 
	DefaultItemSelected = "MoveTo"; -- optional: default item selected, will not run the callback and does not need to be from options table. This will be ignored if ItemSelecting is not true.
	-- Scroll to the bottom of the page to read more about the following two:
	Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
	WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s2:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Claim"; -- required: name of element
    Flag = "Claim"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
            a = Value
        while a do task.wait(.1)
            for i,v in pairs(game:GetService("Workspace").Rewards:GetChildren()) do
        		if v:IsA("Part") then
            		v.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
       			end
    		end
        end
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

local GambleSelect = s2:CreateDropdown({ 
	Name = "Gamble Select"; -- required: name of element
	Callback = function(v)  -- required: function to be called an item in the dropdown is activated
		_G.Gamble = v
	end;
	Options = {}; -- required: dropdown options
	ItemSelecting = true; -- optional: whether to control item selecting behavior in dropdowns (see showcase video), is false by default 
	DefaultItemSelected = "None"; -- optional: default item selected, will not run the callback and does not need to be from options table. This will be ignored if ItemSelecting is not true.
	-- Scroll to the bottom of the page to read more about the following two:
	Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
	WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

game:GetService("RunService").RenderStepped:Connect(function() -- update dropdown every frame with all players  
	local tbl = {}
	for _,v in ipairs(game:GetService("Workspace").Fight[_G.selectedArea].Gamble:GetChildren()) do
            table.insert(tbl,v.Name)
    end
	GambleSelect:Update(tbl) -- uses namecalling, ":" instead of "."
end)

s2:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Gamble"; -- required: name of element
    Flag = "AutoGamble"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(v) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
               _G.autoGamble = v
 
	    task.spawn(function()
	        while task.wait() do
	            if not _G.autoGamble then break end
	            	for i, v in pairs(game.Workspace.Fight[_G.selectedArea].Gamble:GetChildren()) do
	                	if v == _G.Gamble then
	                    	teleport(v)
	                    	sendKey("E")
	                	end
	            	end
	        	end
	    	end)
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s1:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Enabled"; -- required: name of element
    Flag = "autofarm"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
	            _G.autofarm = Value
	 
	    task.spawn(function()
	        while task.wait() do
	            if not _G.autofarm then break end
	            pcall(function()
	                local tickk = tick()
	                if alive == true then
	                    if _G.farmType == "Nearest" then
	                        local nearest = getNear()
	 
	                        if _G.farmMethod == "MoveTo" then
	                            MoveTo(nearest.Root)
	                        else 
	                            teleport(nearest.Root)
	                        end
	 
	                        wait(.5)
	                        fireclickdetector(nearest.Root.ClickDetector,69)  
	                        repeat task.wait() 
	                            MoveTo(nearest.Root)
	                        until nearest.Root == nil or not _G.autofarm or alive == false or tick()-tickk > 45
	                    elseif _G.farmType == "High Hp" then
	                        local highest = getHighest()
	                        local highestChest = game:GetService("Workspace").Fight.ClientChests[highest].Root
	 
	                        if _G.farmMethod == "MoveTo" then
	                            MoveTo(highestChest)
	                        else
	                            teleport(highestChest)
	                        end
	 
	                        wait(.5)
	                        fireclickdetector(highestChest.ClickDetector,69)
	                        repeat task.wait()
	                            MoveTo(highestChest)
	                        until not game:GetService("Workspace").Fight.ClientChests[highest].Root or not _G.autofarm or alive == false or tick()-tickk > 45
	                    elseif _G.farmType == "Mid Hp" then
	                        local mid = getMid()
	                        local midChest = game:GetService("Workspace").Fight.ClientChests[mid].Root
	 
	                        if _G.farmMethod == "MoveTo" then
	                            MoveTo(midChest)
	                        else 
	                            teleport(midChest)
	                        end
	 
	                        wait(.5)
	                        fireclickdetector(midChest.ClickDetector,69)
	                        repeat task.wait()
	                            MoveTo(midChest)
	                        until not game:GetService("Workspace").Fight.ClientChests[mid].Root or not _G.autofarm or alive == false or tick()-tickk > 45
	                    elseif _G.farmType == "Low Hp" then
	                        local lowest = getLowest()
	                        local lowestChest = game:GetService("Workspace").Fight.ClientChests[lowest].Root
	 
	                        if _G.farmMethod == "MoveTo" then
	                            MoveTo(lowestChest)
	                        else 
	                            teleport(lowestChest)
	                        end
	 
	                        wait(.5)
	                        fireclickdetector(lowestChest.ClickDetector,69)
	                        repeat task.wait() 
	                            MoveTo(lowestChest)
	                        until not game:GetService("Workspace").Fight.ClientChests[lowest].Root or not _G.autofarm or alive == false or tick()-tickk > 45
	                    elseif _G.farmType == "Qi Chest" then
	                        local qiChest = getQiChest()
	                        local chest = game:GetService("Workspace").Fight.ClientChests[qiChest].Root
	 
	                        if _G.farmMethod == "MoveTo" then
	                            MoveTo(chest)
	                        else 
	                            teleport(chest)
	                        end
	 
	                        wait(.5)
	                        fireclickdetector(chest.ClickDetector,69)
	                        repeat task.wait()
	                            MoveTo(chest)
	                        until not game:GetService("Workspace").Fight.ClientChests[qiChest].Root or not _G.autofarm or alive == false or tick()-tickk > 45
	                    end
	                end
	            end)
	        end
	    end)
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})


s1:CreateButton({
	Name = "Unlock Gamepass"; -- required: name of element
	Flag = "UnlockGamepass";
	Callback = function()  -- required: function to be called when button is pressed
		    local a = require(game:GetService("ReplicatedStorage").CommonLogic.Model.GamePasses)
    a.HasGamePass = function() return true end
 
    game:GetService("Players").LocalPlayer.PlayerGui.MainGui.ScreenGui.MainLeftBarView.FrameChild4.BgTeleport.ImgMask.Visible = false
end
})

s3:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Infinity Tower"; -- required: name of element
    Flag = "InfinityTower"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
	            _G.infTower = Value
	            local tow = nil
	            local nearest = getNear()
	            for _,v in  ipairs(game:GetService("Workspace").Fight:GetChildren()) do
				if string.find(v.Name,"FightAren") then
			            tow = v.Name
			    	end
			    end
		
		
		task.spawn(function()
		while _G.infTower == true do
		if not _G.infTower then break end
				TPTo(game:GetService("Workspace")["Fight"][tow].Spawn.CFrame)
				TPTo(game:GetService("Workspace")["Fight"][tow].Tele.Next.CFrame)
                teleport(nearest.Root)
                wait(.5)
                fireclickdetector(nearest.Root.ClickDetector,69)
                if tow == nil then 
                	TPTo(game:GetService("Workspace")["Fight"][tow].Tele.Next.CFrame)
                end 
              	if nearest.Root.Magnitude >= hrt.Magnitude then
                	tow = nil
                end
     	    end
        end)
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})
