local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local window = DrRayLibrary:Load("RoGhoul", "Default")

local tab1 = DrRayLibrary.newTab("Main", "13075622619")
local tab2 = DrRayLibrary.newTab("Farm Options", "13075622619")
local tab3 = DrRayLibrary.newTab("Trainer", "13075622619")
local tab4 = DrRayLibrary.newTab("Misc", "13075622619")


local get = setmetatable({}, {
    __index = function(a, b)
        return game:GetService(b) or game[b]
    end
})

local btn, btn2, btn3, key, nmc, trainers, labels
local findobj, findobjofclass, waitforobj, fire, invoke = get.FindFirstChild, get.FindFirstChildOfClass, get.WaitForChild, Instance.new("RemoteEvent").FireServer, Instance.new("RemoteFunction").InvokeServer
local player = get.Players.LocalPlayer

repeat wait() until player:FindFirstChild("PlayerFolder")

local team, remotes, stat = player.PlayerFolder.Customization.Team.Value, get.ReplicatedStorage.Remotes, player.PlayerFolder.StatsFunction
local oldtick, farmtick = 0, 0
local camera = workspace.CurrentCamera
local myData = loadstring(game:HttpGet("https://raw.githubusercontent.com/z4gs/scripts/master/Settings.lua"))()("Ro-Ghoul Autofarm", {
    Skills = {
        E = false,
        F = false,
        C = false,
        R = false
    },
    Boss = {
        ["Gyakusatsu"] = false,
        ["Eto Yoshimura"] = false,
        ["Koutarou Amon"] = false,
        ["Nishiki Nishio"] = false
    },
    DistanceFromNpc = 5,
    DistanceFromBoss = 8,
    TeleportSpeed = 150,
    ReputationFarm = false,
    ReputationCashout = false,
    AutoKickWhitelist = ""
})

local array = {
    boss = {
        ["Gyakusatsu"] = 1250,
        ["Eto Yoshimura"] = 1250,
        ["Koutarou Amon"] = 750,
        ["Nishiki Nishio"] = 250
    },

    npcs = {["Aogiri Members"] = "GhoulSpawns", Investigators = "CCGSpawns", Humans = "HumanSpawns"},

    stages = {"One", "Two", "Three", "Four", "Five", "Six"},

    skills = {
        E = player.PlayerFolder.Special1CD,
        F = player.PlayerFolder.Special3CD,
        C = player.PlayerFolder.SpecialBonusCD,
        R = player.PlayerFolder.Special2CD
    }
}
tab1:newLabel("Target")

local drop = tab1:newDropdown("Select", function(opt)
    array.targ = array.npcs[opt]
end)

btn = tab1:newButton("Start", function()
    if not array.autofarm then
        if key then
            btn.Text, array.autofarm = "Stop", true
            local farmtick = tick()
            while array.autofarm do
                labels("tfarm", "Time elapsed: "..os.date("!%H:%M:%S", tick() - farmtick))
                wait(1)
            end
        else
            player:Kick("Failed to get the Remote key, please try to execute the script again")
        end
    else
        btn.Text, array.autofarm, array.died = "Start", false, false
    end
end)

local function format(number)
    local i, k, j = tostring(number):match("(%-?%d?)(%d*)(%.?.*)")
    return i..k:reverse():gsub("(%d%d%d)", "%1,"):reverse()..j
end

labels = setmetatable({
    text = {label = tab1:newLabel("")},
    tfarm = {label = tab1:newLabel("")},
    space = {label = tab1:newLabel("")},
    Quest = {prefix = "Current Quest: ", label = tab1:newLabel("Current Quest: None")},
    Yen = {prefix = "Yen: ", label = tab1:newLabel("Yen: 0"), value = 0, oldval = player.PlayerFolder.Stats.Yen.Value},
    RC = {prefix = "RC: ", label = tab1:newLabel("RC: 0"), value = 0, oldval = player.PlayerFolder.Stats.RC.Value},
    Kills = {prefix = "Kills: ", label = tab1:newLabel("Kills: 0"), value = 0} 
}, {
    __call = function (self, typ, newv, oldv)
        if typ and newv then
            local object = self[typ]
            if type(newv) == "number" then
                object.value = object.value + newv
                object.label.Text = object.prefix..format(object.value)
                if oldv then
                    object.oldval = oldv
                end
            elseif object.prefix then
                object.label.Text = object.prefix..newv
            else
                object.label.Text = newv
            end
            return
        end
        for i,v in pairs(labels) do
            v.value = 0
            v.label.Text = v.prefix.."0"
        end
    end
})

local function getLabel(la)
    return labels[la].value and labels[la].value or labels[la].label.Text
end