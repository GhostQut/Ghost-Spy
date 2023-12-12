local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local window = DrRayLibrary:Load("Pet Simulator 99", "Default")

local tab1 = DrRayLibrary.newTab("Auto", "13075622619")
local tab2 = DrRayLibrary.newTab("Eggs", "")
local tab3 = DrRayLibrary.newTab("Merchant", "")
local tab4 = DrRayLibrary.newTab("Games", "")
local tab5 = DrRayLibrary.newTab("Misc", "13075268290")

local InGame = false
local plr = game:GetService("Players").LocalPlayer
local things = game:GetService("Workspace"):WaitForChild("__THINGS")
local Actives = things:WaitForChild("__INSTANCE_CONTAINER"):WaitForChild("Active")
local Debris = game:GetService("Workspace"):WaitForChild("__DEBRIS")
local Network = game:GetService("ReplicatedStorage"):WaitForChild("Network")
local FishingGame = plr:WaitForChild("PlayerGui"):WaitForChild("_INSTANCES").FishingGame.GameBar

local teleportr = Network.Teleports_RequestTeleport
local vending_buy = Network.VendingMachines_Purchase
local daily_redeem = Network.DailyRewards_Redeem
local hum = plr.Character.Humanoid
local merchant_buy = Network.Merchant_RequestPurchase

local hrp = plr.Character.HumanoidRootPart
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
};
local MaxRank = 8

local chestsn = {
    "Animated",
    }
local function contains(table, val)
   for i=1,#table do
      if table[i] == val then return true end
   end
   return false
end

local machines = {
    {"PotionVendingMachine1";"Cherry Blossom"};
    {"PotionVendingMachine2";"Safari"};
    {"EnchantVendingMachine1";"Misty Falls"};
    {"EnchantVendingMachine2";"Fire and Ice"};
    {"FruitVendingMachine1";"Mushroom Field"};
    {"FruitVendingMachine2";"Pirate Cove"};
}
local OldPlayerHooks = {}

local DailyRedeemables = {
    {"Castle"; "SmallDailyDiamonds"};
    {"Jungle";"DailyPotions"};
    {"Red Desert"; "MediumDailyDiamonds"};
}

local Merchants = {
    {"RegularMerchant";"Oasis"};
    {"AdvancedMerchant"; "Ice Rink"}
}

function  GetRank()
      return game.Players.LocalPlayer.leaderstats["⭐ Rank"].Value	
end

function  ClaimRank()
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

local CurrentFishingModule = require(Actives:FindFirstChild("Fishing").ClientModule.FishingGame)

for i, v in pairs(CurrentFishingModule) do
    OldPlayerHooks[i] = v
end

CurrentFishingModule.IsFishInBar = function()
    return math.random(1, 6) ~= 1
end

CurrentFishingModule.StartGame = function(...)
    InGame = true
    return OldPlayerHooks.StartGame(...)
end

CurrentFishingModule.StopGame = function(...)
    InGame = false
    return OldPlayerHooks.StopGame(...)
end
      
local function waitForGameState(state)
    repeat
        game:GetService("RunService").RenderStepped:Wait()
    until InGame == state
end

local function getRod()
    return plr.Character and plr.Character:FindFirstChild("Rod", true)
end

local function getBubbles(anchor)
    local myBobber = nil
    local myBubbles = false
    local closestBobber = math.huge

    for _, v in pairs(Actives.Fishing.Bobbers:GetChildren()) do
        local distance = (v.Bobber.CFrame.Position - anchor.CFrame.Position).Magnitude

        if distance <= closestBobber then
            myBobber = v.Bobber
            closestBobber = distance
        end
    end

    if myBobber then
        for _, v in pairs(Debris:GetChildren()) do
            if v.Name == "host" and v:FindFirstChild("Attachment") and (v.Attachment:FindFirstChild("Bubbles") or v.Attachment:FindFirstChild("Rare Bubbles")) and (v.CFrame.Position - myBobber.CFrame.Position).Magnitude <= 1 then
                myBubbles = true
                break
            end
        end
    end

    return myBubbles
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
    ClaimRank()
   end
   else
       if GetRank() == 8 then
ClaimRank()
end
   end
end)

tab2.newToggle("Animation Remove", "", false, function(toggleState)
   if toggleState == true then
      local Eggs = game.Players.LocalPlayer.PlayerScripts.Scripts.Game['Egg Opening Frontend']getsenv(Eggs).PlayEggAnimation = function() return
      end
    else
        toggleState = false
    end
end)
  
tab4.newToggle("AutoFish", "", false, function(toggleState)
   if toggleState == true then
     while task.wait(1) do
    pcall(function()
        local fishingInstance = things.__INSTANCE_CONTAINER.Active:FindFirstChild("Fishing")
        if fishingInstance and not InGame then
            Network.Instancing_FireCustomFromClient:FireServer("Fishing", "RequestCast", Vector3.new(1158 + math.random(-10, 10), 75, -3454 + math.random(-10, 10)))

            local myAnchor = getRod():WaitForChild("FishingLine").Attachment0
            repeat
                game:GetService("RunService").RenderStepped:Wait()
            until not Actives:FindFirstChild("Fishing") or (myAnchor and getBubbles(myAnchor)) or InGame

            if Actives:FindFirstChild("Fishing") then
                Network.Instancing_FireCustomFromClient:FireServer("Fishing", "RequestReel")
                waitForGameState(true)
                waitForGameState(false)
            end

            repeat
                game:GetService("RunService").RenderStepped:Wait()
            until not Actives:FindFirstChild("Fishing") or (getRod() and getRod().Parent.Bobber.Transparency <= 0)
        end
    end)
end
    else
        toggleState = false
    end
end)