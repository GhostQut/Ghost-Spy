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