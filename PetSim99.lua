local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local window = DrRayLibrary:Load("Pet Simulator 99", "Default")

local tab1 = DrRayLibrary.newTab("Auto", "")
local tab2 = DrRayLibrary.newTab("Eggs", "")
local tab3 = DrRayLibrary.newTab("Merchant", "")


local remotes = game.ReplicatedStorage.Network
local teleportr = remotes.Teleports_RequestTeleport
local vending_buy = remotes.VendingMachines_Purchase
local daily_redeem = remotes.DailyRewards_Redeem
local hum = game.Players.LocalPlayer.Character.Humanoid
local merchant_buy = remotes.Merchant_RequestPurchase

local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
local b = workspace.__THINGS
local s = "Small"
local d = "Diamond Bag"

local RankStuff = {
	9,
	12,
	14,
	18,
	20,
	24,
	28,
	32
}; local MaxRank = 8


local machines = {
    {"PotionVendingMachine1";"Cherry Blossom"};
    {"PotionVendingMachine2";"Safari"};
    {"EnchantVendingMachine1";"Misty Falls"};
    {"EnchantVendingMachine2";"Fire and Ice"};
    {"FruitVendingMachine1";"Mushroom Field"};
    {"FruitVendingMachine2";"Pirate Cove"};
}

local DailyRedeemables = {
    {"Castle"; "SmallDailyDiamonds"};
    {"Jungle";"DailyPotions"};
    {"Red Desert"; "MediumDailyDiamonds"};
}

local Merchants = {
    {"RegularMerchant";"Oasis"};
    {"AdvancedMerchant"; "Ice Rink"}
}

function  Getrank()
      return game.Players.LocalPlayer.Leaderstats["⭐ Rank"].Value	
end

function  Claimrank()
      for i = 1,RankStuff[GetRank()]	 do
		  local args = {
			  [1] = i
		  }

		  game:GetService("ReplicatedStorage").Network.Ranks_ClaimReward:FireServer(unpack(args))
		  task.wait(.25)
	  end
	  task.wait(.5)
end

local function teleport(destination)
    teleportr:InvokeServer(destination)
    repeat task.wait() until hum.FloorMaterial == Enum.Material.Air
    task.wait(0.5)
    repeat task.wait() until hum.FloorMaterial == Enum.Material.Plastic
    hum:ChangeState(Enum.HumanoidStateType.Jumping)
    task.wait(1)
    hum:ChangeState(Enum.HumanoidStateType.Jumping)
end

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
        for i,v in ipairs(DailyRedeemables) do
    teleport(v[1])
    daily_redeem:InvokeServer(v[2])
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
tab1.newToggle("AutoMachiens", "", false, function(toggleState)
   if toggleState == true then
      while task.wait(0.5) do
       for i,v in ipairs(machines) do
    teleport(v[2])
    local a, b
    for i2, v2 in pairs(workspace.Map:GetChildren()) do
        if string.find(v2.Name,v[2], 1, true) then
           hum.Parent:PivotTo(v2.INTERACT.Machines[v[1]].PrimaryPart.CFrame * CFrame.new(0,9,0)) 
        end
    end

    repeat a,b = vending_buy:InvokeServer(v[1], 1)
        task.wait(0.1) 
    until a == false
end
   end
   else
        toggleState = false
   end
end)
tab1.newToggle("AutoRank", "", false, function(toggleState)
   if toggleState == true then
      while task.wait(0.5) do
       repeat task.wait()
    ClaimRank()
until GetRank() == 8;ClaimRank()
   end
   else
        toggleState = false
   end
tab2.newToggle("Animation Remove", "", false, function(toggleState)
   if toggleState == true then
      local Eggs = game.Players.LocalPlayer.PlayerScripts.Scripts.Game['Egg Opening Frontend']getsenv(Eggs).PlayEggAnimation = function() return
   end
    else
        toggleState = false
    end
end)
tab3.newToggle("AutoMerchant", "", false, function(toggleState)
      while task.wait(0.5) do
if toggleState == true then
for i,v in ipairs(Merchants) do
    teleport(v[2])
    task.wait(1)
    local a, b
    for i = 1, 6, 1 do
        repeat
            a,b = merchant_buy:InvokeServer(v[1], i)
            task.wait(0.1)
        until a == false
    end

end
   else
        toggleState = false
   end
end)