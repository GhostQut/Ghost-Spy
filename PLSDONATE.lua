local Settings

local function solveRemote(remoteName)
    local remoteName = nil
    remoteName = require(game.ReplicatedStorage.Remotes).Event(remoteName)
end
local Event = game:GetService("ReplicatedStorage").Remotes


local Table = {
    "We're no strangers to love",
    "You know the rules and so do I",
    "A full commitment's what I'm thinking of",
    "You wouldn't get this from any other guy",
    "I just wanna tell you how I'm feeling",
    "Gotta make you understand",
    "Never gonna give you up",
    "Never gonna let you down",
    "Never gonna run around and desert you",
    "Never gonna make you cry",
    "Never gonna say goodbye",
    "Never gonna tell a lie and hurt you",
    "We've known each other for so long",
    "Your heart's been aching but you're too shy to say it",
    "Inside we both know what's been going on",
    "We know the game and we're gonna play it",
    "And if you ask me how I'm feeling",
    "Don't tell me you're too blind to see",
    "Never gonna give you up",
    "Never gonna let you down",
    "Never gonna run around and desert you",
    "Never gonna make you cry",
    "Never gonna say goodbye",
    "Never gonna tell a lie and hurt you"
}

local Freem = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostQut/FreemUI/main/Source.lua"))()

local test = library.new({
    Name = "Yammi";
    ConfigFolder = "FreemScript";
    Credit = "Made by me!";
    Color = Color3.fromRGB(164, 53, 90);
    FullName = "YammiHub";
    UseLoader = true;
    Bind = "LeftShift";
    CheckKey = function(e) -- this can be nil to disable key checking
        return e == "OnePerNiger"
    end;
    Discord = "https://link-target.net/423094/yammihub"
})


local Tab1 = test:CreatePage("PLSDONATE")
