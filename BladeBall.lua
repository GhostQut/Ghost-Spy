local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostQut/FreemUI/main/Source.lua"))()

local test = library.new({
    Name = "Yammi";
    ConfigFolder = "FreemScript";
    Credit = "Made by me!";
    Color = Color3.fromRGB(164, 53, 90);
    FullName = "YammiHub";
    UseLoader = false;
    UseMobile = true;
    Bind = "LeftShift";
    CheckKey = function(e) -- this can be nil to disable key checking
        return e == "OnePerNiger"
    end;
    Discord = "https://link-target.net/4r23094/yammihub"
})

local Main = test:CreatePage("Main")
local Misc = test:CreatePage("Misc")

local s1 = Train:CreateSection("Combat")
local s2 = Train:CreateSection("AI")
local s5 = Misc:CreateSection("Miscellaneous")
