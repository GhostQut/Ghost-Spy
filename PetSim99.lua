local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local window = DrRayLibrary:Load("Pet Simulator 99", "Default")

local tab1 = DrRayLibrary.newTab("Auto", "")
local tab2 = DrRayLibrary.newTab("Eggs", "")

local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
local b = workspace.__THINGS
local s = "Small"
local d = "Diamond Bag"


local function getLoot()
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
       getLoot()
   end
   else
        toggleState = false
   end
end)
tab2.newToggle("Animation Remove", "", false, function(toggleState)
   if toggleState == true then
      local Eggs = game.Players.LocalPlayer.PlayerScripts.Scripts.Game['Egg Opening Frontend']getsenv(Eggs).PlayEggAnimation = function() return end
   end
end
    else
        toggleState = false
    end
end)


