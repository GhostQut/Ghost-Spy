local DrRayLibrary = loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostQut/FreemUI-V2/main/Source.lua', true))()

local window = DrRayLibrary:Load("SwordBurst 3", "Default")

local tab = DrRayLibrary.newTab("Main", "2174510075")
local teleporttab = DrRayLibrary.newTab("Teleport", "8569322835")
local minetab = DrRayLibrary.newTab("Mine", "8569322835")
local funtab = DrRayLibrary.newTab("Misc", "8569322835")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local lplr = Players.LocalPlayer

local Stamina = require(game:GetService("ReplicatedStorage").Systems.Stamina)

local mobs = {}
local mines = {}
local bosses = {}
local quests = {}
local waystone = {}
local swordburst = {}

local mine
local boss
local insert
local waystones
local choosemob
local choosequest

local function getchar()
    return lplr.Character or lplr.CharacterAdded:Wait()
end

for i,v in next, workspace.BossArenas:GetChildren() do
    table.insert(bosses, v.Name)
end

for i,v in next, workspace.MobSpawns:GetChildren() do
    table.insert(mobs,v.Name)
end

for i,v in next, workspace.Waystones:GetChildren() do
    table.insert(waystone, v.Name)
end

for i,v in next, workspace.Ores:GetChildren() do
    insert = true
    for _,v2 in next, mines do
        if v2 == v.Name then
            insert = false
        end
    end
    if insert then
        table.insert(mines, v.Name)
    end
end

local Quest = require(game:GetService("ReplicatedStorage").Systems.Quests.QuestList)
for i,v in next, Quest do
    table.insert(quests, "Level " .. v.Level .. " " .. v.Target .. " " .. (v.Repeatable and "Repeatable" or ""))
end

for i, v in next, getconnections(lplr.Idled) do
    if v["Disable"] then
        v["Disable"](v)
    elseif v["Disconnect"] then
        v["Disconnect"](v)
    end
end
tab.newDropdown("Select Mobs", "", mobs, function(item)
    choosemob = item
end)

tab.newToggle("Auto Farm Mobs", "", false, function(toggleState)
   if toggleState == true then
	    swordburst["automobs"] = toggleState
   else
      toggleState = false
   end
end)

tab.newDropdown("Select Boss", "", bosses, function(item)
    choosemob = item
end)

tab.newToggle("Auto Farm Boss", "", false, function(toggleState)
   if toggleState == true then
	    swordburst["autoboss"] = toggleState
   else
      toggleState = false
   end
end)

tab.newToggle("KillAura", "Doesnt work with killaura for players", false, function(toggleState)
   if toggleState == true then
	    swordburst["killaura"] = toggleState
   else
      toggleState = false
   end
end)

tab.newToggle("KillAura Players", "Turn on pvp and doesnt work with killaura", false, function(toggleState)
   if toggleState == true then
	    swordburst["killauraplr"] = toggleState
   else
      toggleState = false
   end
end)

tab.newToggle("Auto Collect", "", false, function(toggleState)
   if toggleState == true then
	    swordburst["autocollect"] = toggleState
   else
      toggleState = false
   end
end)

tab.newDropdown("Select Quest", "", quests, function(item)
    choosequest = item
end)

tab.newToggle("Auto Quest", "", false, function(toggleState)
   if toggleState == true then
	    swordburst["autoquest"] = toggleState
   else
      toggleState = false
   end
end)

teleporttab.newDropdown("Select Waystones", "", waystone, function(item)
    waystones = item
end)

teleporttab.newButton("Teleport Waystones", "", function()
    if waystones then
        lplr.Character.HumanoidRootPart.CFrame = waystones.Main.CFrame * CFrame.new(0,0,5)
    end
end)

minetab.newDropdown("Select Ores", "", mines, function(item)
    mine = item
end)

minetab.newToggle("AutoMine Ores", "", false, function(toggleState)
   if toggleState == true then
	    swordburst["automine"] = toggleState
   else
      toggleState = false
   end
end)

funtab.newButton("Infinite Stamina", "", function()
    debug.setupvalue(Stamina.SetMaxStamina,1,99999999)
    debug.setupvalue(Stamina.CanUseStamina,1, 99999999)
end)

local function getclosestmobs(mob)
    local distance = math.huge
    local target
    local multitarget = {}
    for i,v in next, workspace.Mobs:GetChildren() do
        if v:FindFirstChild("HumanoidRootPart") and getchar() and getchar():FindFirstChild("HumanoidRootPart") then
            local magnitude = (getchar().HumanoidRootPart.Position - v:FindFirstChild("HumanoidRootPart").Position).magnitude
            if mob and string.find(v.Name, mob) then
                if magnitude < distance then
                    target = v
                    distance = magnitude
                end
            end
            if magnitude < 100 then
                table.insert(multitarget, v)
            end
        end
    end
    return target , multitarget
end

local function getplr() 
    local distance = 100
    local target = {}
    for i,v in next, Players:GetPlayers() do
        if v ~= lplr and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and getchar() and getchar():FindFirstChild("HumanoidRootPart") then
            local magnitude = (getchar().HumanoidRootPart.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
            if magnitude < distance then
                table.insert(target, v.Character)
            end
        end
    end
    return target
end

local function getores()
    local distance = math.huge
    local target
    for i,v in next, workspace.Ores:GetChildren() do
        if v.Name == mine and getchar() and getchar():FindFirstChild("HumanoidRootPart") and v:FindFirstChildWhichIsA("MeshPart").CFrame then
            local magnitude = (getchar().HumanoidRootPart.Position - v:FindFirstChildWhichIsA("MeshPart").Position).magnitude
            if magnitude < distance then
                target = v
                distance = magnitude
            end
        end
    end
    return target
end

local function getquest(chosequest) 
    for i,v in next, Quest do
        if string.find("Level " .. v.Level .. " " .. v.Target  .. " " .. (v.Repeatable and "Repeatable" or "") , chosequest) then
            return i
        end
    end
    return
end


task.spawn(function()
    while task.wait() do
        if swordburst["automobs"] == true and choosemob then
            local enemy = getclosestmobs(choosemob)
            if getchar() and getchar():FindFirstChild("HumanoidRootPart") and enemy and enemy:FindFirstChild("HumanoidRootPart") then
                getchar().HumanoidRootPart.CFrame = enemy:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 0, 25)
            end
        end 
    end
end)

task.spawn(function()
    while task.wait() do
        if swordburst["autoboss"] == true then
            if getchar() and getchar():FindFirstChild("HumanoidRootPart") and boss then
                local enemy = getclosestmobs(boss)
                if enemy and enemy:FindFirstChild("HumanoidRootPart") then
                    lplr.Character.HumanoidRootPart.CFrame = enemy:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 0, 25)
                else
                    for i,v in next, workspace.BossArenas:GetChildren() do
                        if string.find(v.Name, boss) then
                            lplr.Character.HumanoidRootPart.CFrame = v:FindFirstChild("Spawn").CFrame 
                        end
                    end
                end
            end
        end 
    end
end)

task.spawn(function()
    while task.wait(.3) do
        if swordburst["killauraplr"] == true and #getplr() >= 1 then
            ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Combat"):WaitForChild("PlayerAttack"):FireServer(getplr())
        end
        if swordburst["killaura"] == true then
            local enemy,multienemy = getclosestmobs()
            if #multienemy >= 1 then
                ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Combat"):WaitForChild("PlayerAttack"):FireServer(multienemy)
            end
        end
    end
end)

task.spawn(function()
    while task.wait(.5) do
        for i,v in next, lplr.PlayerGui.SkillBar.Frame:GetChildren() do
            if v:FindFirstChild("Hotkey") then
                if swordburst["killauraplr"] == true and #getplr() >= 1 then
                    ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Skills"):WaitForChild("UseSkill"):FireServer(v.Name)
                    for i = 1, 8 do
                        ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Combat"):WaitForChild("PlayerSkillAttack"):FireServer(getplr(), v.Name, i)
                    end
                end
                if swordburst["killaura"] == true then
                    local e = choosemob or boss
                    local enemy,multienemy = getclosestmobs(e)
                    if #multienemy >= 1 then
                        ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Skills"):WaitForChild("UseSkill"):FireServer(v.Name)
                        for i = 1, 8 do
                            ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Combat"):WaitForChild("PlayerSkillAttack"):FireServer(multienemy, v.Name, i)
                        end     
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(.1) do
        if swordburst["autocollect"] == true then
            for i,v in next, ReplicatedStorage.Drops:GetChildren() do
                if v:GetAttributes("Owner").Owner == lplr.Name then
                    ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Drops"):WaitForChild("Pickup"):FireServer(v)
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(.1) do
        if swordburst["autoquest"] == true and choosequest then
            ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Quests"):WaitForChild("AcceptQuest"):FireServer(getquest(choosequest))
            ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Quests"):WaitForChild("CompleteQuest"):FireServer(getquest(choosequest))
        end
    end
end)

task.spawn(function()
    while task.wait(.3) do
        if swordburst["automine"] == true and mine then
            if getores() and getores():FindFirstChildWhichIsA("MeshPart") and getchar() and getchar():FindFirstChild("HumanoidRootPart") then
                getchar():FindFirstChild("HumanoidRootPart").CFrame =  getores():FindFirstChildWhichIsA("MeshPart").CFrame * CFrame.new(0,3,0)
                ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Equipment"):WaitForChild("EquipTool"):FireServer("Pickaxe", true) 
                ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Mining"):WaitForChild("Mine"):FireServer()
            end
        end
    end
end)
