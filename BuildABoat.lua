local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostQut/FreemUI/main/Source.lua"))()
local blur = Instance.new("BlurEffect", game.Lighting)
blur.Size = 0
local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
ScreenGui.Parent = game.CoreGui
ImageLabel.Parent = ScreenGui
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Position = UDim2.new(0.5, -(303 / 2), 0.5, -(263 / 2))
ImageLabel.Rotation = 0
ImageLabel.Size = UDim2.new(0, 303, 0, 263)
ImageLabel.Image = "rbxassetid://6587457747"
ImageLabel.ImageTransparency = 1

for i = 1, 50, 2 do
    blur.Size = i
    ImageLabel.ImageTransparency = ImageLabel.ImageTransparency - 0.1
    wait()
end
wait(0.1)

for i = 1, 50, 2 do
    blur.Size = 50 - i
    ImageLabel.ImageTransparency = ImageLabel.ImageTransparency + 0.1
    wait()
end
blur:Destroy()
ScreenGui:Destroy()

local test = library.new({
    Name = "Yammi";
    ConfigFolder = "FreemScript";
    Credit = "Made by me!";
    Color = Color3.fromRGB(164, 53, 90);
    FullName = "YammiHub";
    UseLoader = true;
    UseMobile = true;
    Bind = "LeftShift";
    CheckKey = function(e) -- this can be nil to disable key checking
        return e == "OnePerNiger"
    end;
    Discord = "https://link-target.net/4r23094/yammihub"
})

repeat wait() until game:IsLoaded() wait()
game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(...)
    local Args = {...}
    local Self = Args[1]
    if getnamecallmethod()=="FireServer" and tostring(Self) == "Received" or tostring(Self) == "Sent" then
            return wait(math.huge)
    end
    return OldNameCall(...)
end)
function ToxmodsisHOT()
    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-51.1823959, 80.6168747, -536.437805)
    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(30, Enum.EasingStyle.Linear)
    tween =
        tweenService:Create(
        game:GetService("Players")["LocalPlayer"].Character:WaitForChild("HumanoidRootPart"),
        tweenInfo,
        {CFrame = CFrame.new(-60.5737877, 53.9498825, 8666.35059)}
    )
    tween:Play()
    wait(30)
    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(0, Enum.EasingStyle.Linear)
    tween =
        tweenService:Create(
        game:GetService("Players")["LocalPlayer"].Character:WaitForChild("HumanoidRootPart"),
        tweenInfo,
        {CFrame = CFrame.new(-55.5486526, -360.063782, 9489.0498)}
    )
    tween:Play()
end
getgenv().Number = 1

local Main = test:CreatePage("Main")
local Misc = test:CreatePage("Misc")


local s3 = Main:CreateSection("Farm Settings")
local s2 = Main:CreateSection("Game Farm Mode")
local s1 = Main:CreateSection("Auto Farm")
local s5 = Misc:CreateSection("Miscellaneous")

s1:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Auto Farm "; -- required: name of element
    Flag = "Autofarm"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(Value) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
            getgenv().Autofarm = Value
game:GetService("RunService").Stepped:connect(
        ()
            if getgenv().Autofarm then
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
            endfunction
        end
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

if getgenv().Autofarm then
    ToxmodsisHOT()
end

if not getgenv().Autofarm then
    game.Players.LocalPlayer.Character.Head:Destroy()
end

s2:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Water GodMode"; -- required: name of element
    Flag = "WaterGodMode"; -- required: unique flag name to use
    Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
    Callback = function(v) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
               getgenv().Water = State 
            game:GetService('RunService').Stepped:connect(function()
            pcall(function()
            if getgenv().Water and game.Players.LocalPlayer.Character:FindFirstChild("WaterDetector")  then
                game.Players.LocalPlayer.Character.WaterDetector:remove()
            end 
    end,
    Enabled = false,
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

s1:CreateDropdown({ 
	Name = "Auto Chests"; -- required: name of element
	Callback = function(item)  -- required: function to be called an item in the dropdown is activated
		workspace.ItemBoughtFromShop:InvokeServer(item,getgenv().Number)
	end;
	Options = {"Common Chest", "UnCommon Chest", "Rare Chest", "Epic Chest", "Legendary Chest"}; -- required: dropdown options
	ItemSelecting = true; -- optional: whether to control item selecting behavior in dropdowns (see showcase video), is false by default 
	DefaultItemSelected = ""; -- optional: default item selected, will not run the callback and does not need to be from options table. This will be ignored if ItemSelecting is not true.
	-- Scroll to the bottom of the page to read more about the following two:
	Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
	WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})


s5:CreateButton({
	Name = "Unlock Gamepass"; -- required: name of element
	Flag = "UnlockGamepass";
	Callback = function()  -- required: function to be called when button is pressed
		    local a = require(game:GetService("ReplicatedStorage").CommonLogic.Model.GamePasses)
    a.HasGamePass = function() return true end
 
    game:GetService("Players").LocalPlayer.PlayerGui.MainGui.ScreenGui.MainLeftBarView.FrameChild4.BgTeleport.ImgMask.Visible = false
end
})
