local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local window = DrRayLibrary:Load("Pet Simulator 99", "Default")

local tab1 = DrRayLibrary.newTab("Auto", "13075622619")
local tab2 = DrRayLibrary.newTab("Eggs", "")
local tab3 = DrRayLibrary.newTab("Merchant", "")
local tab4 = DrRayLibrary.newTab("Games", "")
local tab5 = DrRayLibrary.newTab("Misc", "13075268290")

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

local e = Instance.new("BillboardGui",v)
        e.Name = "ESP"
        e.Size = UDim2.new(5,0, 5,0)
        e.AlwaysOnTop = true
local s = Instance.new("Frame",a)
        s.Size = UDim2.new(1,0, 1,0)
        s.BackgroundTransparency = 0.80
        s.BorderSizePixel = 0
        s.BackgroundColor3 = tcolor
local p = Instance.new('TextLabel',b)
        p.Size = UDim2.new(1,0,1,1)
        p.BorderSizePixel = 0
        p.TextSize = 17
        p.Text = "Chest"
        p.BackgroundTransparency = 1
        p.TextColor3 = tcolor
        p.TextStrokeColor3 = Color3.fromRGB(6, 6, 6)
        p.TextStrokeTransparency = 0.7
    end
end
end

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

tab4.newToggle("ESP DigSite", "", false, function(toggleState)
   if toggleState == true then
      while true do
task.wait()
for __,v in pairs(game.Workspace["__THINGS"].__INSTANCE_CONTAINER.Active.Digsite.Important.ActiveChests:GetChildren()) do
    if v:FindFirstChild("ESP") then v:FindFirstChild("ESP"):Destroy() end
    if contains(chestsn, v.Name) then
        if v.Name == "Animated" then
            tcolor = Color3.fromRGB(222, 184, 135)
        end
   end
    else
        toggleState = false
    end
end)