if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
	game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy()
end
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
	game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy()
end

local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostQut/FreemUI-V2/main/Source.lua"))()

local window = DrRayLibrary:Load("Blox Fruits", "Default")

local tab1 = DrRayLibrary.newTab("Main", "")
local tab2 = DrRayLibrary.newTab("Macro", "")
local tab3 = DrRayLibrary.newTab("Fruits", "")
local tab4 = DrRayLibrary.newTab("Other", "")
local tab5 = DrRayLibrary.newTab("Misc", "")

local plr = game:GetService('Players').LocalPlayer

local tools = {}

for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
	if v:IsA("Tool") then
		table.insert(tools, v.Name)
	end
end

getgenv().AutoFarm = false
getgenv().CurrentQuest = "Bandit [Lv. 5]"
getgenv().FruitEsp = false
getgenv().ChestEsp = false

getgenv().SkillZ = false
getgenv().SkillC = false
getgenv().SkillX = false
getgenv().SKillF = false

tab1.NewToggle("Auto Farm", "Auto Farms Enemies", function(state)
    getgenv().AutoFarm = state
end)

tab1.newDropdown("Select Weapon", "Choose your tool to use!", tools, function(weapon)
	getgenv().CurrentWeapon = weapon
end)

local quests = {
	"Bandit [Lv. 5]",
	"Monkey [Lv. 14]", 
	"Gorilla [Lv. 20]",
	"Pirate [Lv. 35]", 
	"Brute [Lv. 45]", 
	"Desert Bandit [Lv. 60]", 
	"Desert Officer [Lv. 70]", 
	"Snow Bandit [Lv. 90]", 
	"Snowman [Lv. 100]",
	"Chief Petty Officer [Lv. 120]" ,
	"Sky Bandit [Lv. 150]", 
	"Toga Warrior [Lv. 225]", 
	"Gladiator [Lv. 275]", 
	"Military Soldier [Lv. 300]", 
	"Military Spy [Lv. 330]", 
	"God's Guard [Lv. 450]",
	"Shanda [Lv. 475]", 
	"Galley Pirate [Lv. 625]"
}

tab1.newDropdown("Mob", "Choose Your Mob To Farm", quests, function(chosenQuest)
    getgenv().CurrentQuest = chosenQuest
end)

function enemy()
    if game.Workspace.Enemies:FindFirstChild(getgenv().CurrentQuest) then
        local mobs = game.Workspace.Enemies:GetChildren()
        for i = 1, #mobs do local v = mobs[i]
            if v.Name == getgenv().CurrentQuest and v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                return v
            end
        end
    end
    return game.ReplicatedStorage:FindFirstChild(getgenv().CurrentQuest)
end

tab4.NewToggle("Auto Skill: C", "Uses Skill C", function(state)
    getgenv().SkillC = state
end)

tab4.NewToggle("Auto Skill: Z", "Uses Skill Z", function(state)
    getgenv().SkillZ = state
end)

tab4.NewToggle("Auto Skill: X", "Uses Skill X", function(state)
    getgenv().SkillX = state
end)

tab4.NewToggle("Auto Skill: F", "Uses Skill F", function(state)
    getgenv().SkillF = state
end)


game:GetService("RunService").Stepped:Connect(function()
    if getgenv().AutoFarm then
        pcall(function()
			local useTool = game.Players.LocalPlayer.Backpack[getgenv().CurrentWeapon]
            plr.Character.Humanoid:EquipTool(useTool)
        end)
    end
    if getgenv().SkillX then
        pcall(function()
            keypress(0x58)
            wait(1)
            keyrelease(0x58)
        end)
    end
    if getgenv().SkillC then
        pcall(function()
            keypress(0x43)
            wait(1)
            keyrelease(0x43)
        end)
    end
    if getgenv().SkillF then
        pcall(function()
            keypress(0x46)
            wait(1)
            keyrelease(0x46)
        end)
    end
    if getgenv().SkillZ then
        pcall(function()
            keypress(0x5A)
            wait(1)
            keyrelease(0x5A)
        end)
    end
end)
coroutine.wrap(function()
    while wait() do
        if getgenv().AutoFarm and not getgenv().FarmStopped then
            local v = enemy()
            local vuser = game:GetService("VirtualUser")
            vuser:CaptureController()
            vuser:ClickButton1(Vector2.new())
            pcall(function()
                plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame - v.HumanoidRootPart.CFrame.lookVector * 2
            end)
        end
    end
end)()
