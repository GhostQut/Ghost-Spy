local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local window = DrRayLibrary:Load("Pet Simulator 99", "Default")

-- Create the first tab with an image ID
local tab1 = DrRayLibrary.newTab("Auto", "")

local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
local b = workspace.__THINGS
local s = "Small"
local d = "Diamond Bag"


local function get()
    local cf = hrp.CFrame
    for i,v in pairs(b.Lootbags:GetChildren()) do
    v:PivotTo(cf)
    end
    for i,v in pairs(b.Orbs:GetChildren()) do
    v:PivotTo(cf)

    end
end

tab1.newToggle("AutoRewards", "", false, function(toggleState)
    if toggleState then
        while task.wait(1) do
game:GetService("ReplicatedStorage").Network.DailyRewards_Redeem:InvokeServer("SmallDailyDiamonds")
game:GetService("ReplicatedStorage").Network.DailyRewards_Redeem:InvokeServer("DailyPotions")        
game:GetService("ReplicatedStorage").Network.DailyRewards_Redeem:InvokeServer("DailyEnchants")
game:GetService("ReplicatedStorage").Network.DailyRewards_Redeem:InvokeServer("DailyItems")
game:GetService("ReplicatedStorage").Network.DailyRewards_Redeem:InvokeServer("MediumDailyDiamonds")
end
    else
        toggleState = false
    end
end)

tab1.newToggle("AutoLootbags", "", false, function(toggleState)
   if toggleState == true then
      while task.wait(0.5) do
       get()
   end
end
    else
        toggleState = false
    end
end)


