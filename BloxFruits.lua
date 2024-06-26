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

_G.Settings = {

	Main = {
		["Auto Farm Level"] = false,
		["Auto Farm"] = false,

		--[Mob Aura]

		["Distance Mob Aura"] = 1000, -- {Max : 5000} 
		["Mob Aura"] = false,

		--[World 1]
		["Auto New World"] = false,
		["Auto Saber"] = false,
		["Auto Pole"] = false,

		["Auto Buy Ablility"] = false,

		--[World 2]
		["Auto Third Sea"] = false,
		["Auto Factory"] = false,
		["Auto Factory Hop"] = false,
		["Auto Bartilo Quest"] = false,

		["Auto True Triple Katana"] = false,
		["Auto Rengoku"] = false,
		["Auto Swan Glasses"] = false,
		["Auto Dark Coat"] = false,
		["Auto Ectoplasm"] = false,

		["Auto Buy Legendary Sword"] = false,
		["Auto Buy Enchanment Haki"] = false,

		--[World 3]
		["Auto Holy Torch"] = false,
		["Auto Buddy Swords"] = false,
		["Auto Farm Boss Hallow"] = false,
		["Auto Rainbow Haki"] = false,
		["Auto Elite Hunter"] = false,
		["Auto Musketeer Hat"] = false,
		["Auto Buddy Sword"] = false,
		["Auto Farm Bone"] = false,
		["Auto Ken-Haki V2"] = false,
		["Auto Cavander"] = false,
		["Auto Yama Sword"] = false,
		["Auto Tushita Sword"] = false,
		["Auto Serpent Bow"] = false,
		["Auto Dark Dagger"] = false,
		["Auto Cake Prince"] = false,
		["Auto Dough V2"] = false,
		["Auto Random Bone"] = false,

		--[For God Human]

		["Auto Fish Tail Sea 1"] = false,
		["Auto Fish Tail Sea 3"] = false,
		["Auto Magma Ore Sea 2"] = false,
		["Auto Magma Ore Sea 1"] = false,
		["Auto Mystic Droplet"] = false,
		["Auto Dragon Scales"] = false,

	},
	FightingStyle = {
		["Auto God Human"] = false,
		["Auto Superhuman"] = false,
		["Auto Electric Claw"] = false,
		["Auto Death Step"] = false,
		["Auto Fully Death Step"] = false,
		["Auto SharkMan Karate"] = false,
		["Auto Fully SharkMan Karate"] = false,
		["Auto Dragon Talon"] = false,
	},
	Boss = {
		["Auto All Boss"] = false,
		["Auto Boss Select"] = false,
		["Select Boss"] = {},

		["Auto Quest"] = false,
	},
	Mastery = {
		["Select Multi Sword"] = {},
		["Farm Mastery SwordList"] = false,
		["Auto Farm Fruit Mastery"] = false,
		["Auto Farm Gun Mastery"] = false,
		["Mob Health (%)"] = 15,
	},
	Configs = {
		["Double Quest"] = false,
		["Bypass TP"] = false,
		["Select Team"] = {"Pirate"}, --{Pirate,Marine}

        ["CurrentQuest"] = "Bandit [Lv. 5]",

		["Fast Attack"] = true,
		["Fast Attack Type"] = {"Fast"}, --{Normal,Fast,Slow}

        ["CurrentWeapon"] = "Combat",

		--[Misc Configs]
		["Auto Haki"] = true,
		["Distance Auto Farm"] = 20, --{Max : 50}
		["Camera Shaker"] = false,

		--[Skill Configs]
		["Skill Z"] = true,
		["Skill X"] = true,
		["Skill C"] = true,
		["Skill V"] = true,

		--[Mob Configs]
		["Show Hitbox"] = false,
		["Bring Mob"] = true,
		["Disabled Damage"] = false,

	},
	Stat = {
		--[Auto Stats]
		["Enabled Auto Stats"] = false,
		["Auto Stats Kaitun"] = false,

		["Select Stats"] = {"Melee"}, --{Max Stats,Melee,Defense,Sword,Devil Fruit,Gun}
		["Point Select"] = 3, --{Recommended , Max : 9}

		--[Auto Redeem Code]

		["Enabled Auto Redeem Code"] = false,
		["Select Level Redeem Code"] = 1, --{Max : 2400}
	},

	Misc = {
		["No Soru Cooldown"] = false,
		["No Dash Cooldown"] = false,

		["Infinities Geppo"] = false,
		["Infinities Energy"] = false,

		["No Fog"] = false,
		["Wall-TP"] = false,

		["Fly"] = false,
		["Fly Speed"] = 1,

		--[Server]
		["Auto Rejoin"] = true,
	},
	Teleport = {
		["Teleport to Sea Beast"] = false,
	},

	Fruits = {
		["Auto Buy Random Fruits"] = false,
		["Auto Store Fruits"] = false,

		["Select Devil Fruits"] = {}, -- {"Bomb-Bomb","Spike-Spike","Chop-Chop","Spring-Spring","Kilo-Kilo","Spin-Spin","Kilo-Kilo","Spin-Spin","Bird: Falcon","Smoke-Smoke","Flame-Flame","Ice-Ice","Sand-Sand","Dark-Dark","Revive-Revive","Diamond-Diamond","Light-Light","Love-Love","Rubber-Rubber","Barrier-Barrier","Magma-Magma","Door-Door","Quake-Quake","Human-Human: Buddha","String-String","Bird-Bird: Phoenix","Rumble-Rumble","Paw-Paw","Gravity-Gravity","Dough-Dough","Shadow-Shadow","Venom-Venom","Control-Control","Soul-Soul","Dragon-Dragon"}
		["Auto Buy Devil Fruits Sniper"] = false,
	},

	Raids = {
		["Auto Raids"] = false,

		["Kill Aura"] = false,
		["Auto Awakened"] = false,
		["Auto Next Place"] = false,

		["Select Raids"] = {}, -- {"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix","Dough"},
	},

	Combat = {
		["Fov Size"] = 200,
		["Show Fov"] = false,
		["Aimbot Skill"] = false,
	},

	HUD = {
		["FPS"] = 60,
		["LockFPS"] = true,
		["Boost FPS Windows"] = false,
		['White Screen'] = false,
	}
}

tab1.newToggle("Auto Farm", "Auto Farms Enemies", _G.Settings.Main["Auto Farm"], function(state)
    _G.Settings.Main["Auto Farm"] = state
end)

local Weapons = {
	"Melee",
	"Sword",
	"Fruit"
}

tab1.newDropdown("Select Weapon", "Choose your tool to use!", Weapons, function(weapon)
	_G.Settings.Configs["CurrentWeapon"] = weapon
end)

tab1.newToggle("Auto Haki", "", _G.Settings.Configs["Auto Haki"], function(state)
	_G.Settings.Configs["Auto Haki"] = value
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
    _G.Settings.Configs["CurrentQuest"] = chosenQuest
end)

function enemy()
	local mobb = string.gsub(_G.Settings.Configs["CurrentQuest"], "%[Lv%.%s%d+%]", "")
    if game.Workspace.Enemies:FindFirstChild(mobb) then
        local mobs = game.Workspace.Enemies:GetChildren()
        for i = 1, #mobs do local v = mobs[i]
            if v.Name == mobb and v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                return v
            end
        end
    end
    return game.ReplicatedStorage:FindFirstChild(mobb)
end

tab4.newToggle("Auto Skill: C", "Uses Skill C", _G.Settings.Configs["Skill C"], function(state)
    _G.Settings.Configs["Skill C"] = state
end)

tab4.newToggle("Auto Skill: Z", "Uses Skill Z", _G.Settings.Configs["Skill Z"], function(state)
    _G.Settings.Configs["Skill Z"] = state
end)

tab4.newToggle("Auto Skill: X", "Uses Skill X", _G.Settings.Configs["Skill X"], function(state)
    _G.Settings.Configs["Skill X"] = state
end)

tab4.newToggle("Auto Skill: F", "Uses Skill F", _G.Settings.Configs["Skill F"], function(state)
    _G.Settings.Configs["Skill F"] = state
end)

spawn(function()
	while wait() do
        if _G.Settings.Configs["Auto Haki"] then
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            end
        end
    end
end)


game:GetService("RunService").Stepped:Connect(function()
    if _G.Settings.Main["Auto Farm"] then
        pcall(function()
			local useTool = game.Players.LocalPlayer.Backpack[_G.Settings.Configs["CurrentWeapon"]]
            plr.Character.Humanoid:EquipTool(useTool)
        end)
    end
    if _G.Settings.Configs["Skill X"] then
        pcall(function()
            keypress(0x58)
            wait(1)
            keyrelease(0x58)
        end)
    end
    if _G.Settings.Configs["Skill C"] then
        pcall(function()
            keypress(0x43)
            wait(1)
            keyrelease(0x43)
        end)
    end
    if _G.Settings.Configs["Skill F"] then
        pcall(function()
            keypress(0x46)
            wait(1)
            keyrelease(0x46)
        end)
    end
    if _G.Settings.Configs["Skill Z"] then
        pcall(function()
            keypress(0x5A)
            wait(1)
            keyrelease(0x5A)
        end)
    end
end)
coroutine.wrap(function()
    while task.wait(.1) do
        if _G.Settings.Main["Auto Farm"] then
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
