local webhook =
   "https://discord.com/api/webhooks/1254784102092243026/wjm4xIGLksDH2o8LItYAROeXgWizbjRvWjC5J8OxPEUaZPPQOUprSdb34Qb4UOgynCHt"
local interval = 5

local plr = game:GetService('Players').LocalPlayer
for i,v in pairs(plr.PlayerGui.PAGES.SummonPage.Holder.HolderBannerScene.ViewportFrame.WorldModel:GetChildren()) do
    print(v)
end

while true do
    local currentTime = os.time(os.date("!*t"))
    
    local currentTime = os.date("%c")

    local data = {
        ["embeds"] = {
            {
                ["title"] = "**JSQ | Public Banner Display**",
                ["description"] = "Последнее обновление: "..currentTime.." \n Banner",
                ["type"] = "rich",
                ["color"] = 6165903,
                ["fields"] = {
                    {
                        ["name"] = "Standard Banner",
                        ["value"] = "🔵 Rare (27.5%):\n🟣 Epic (15.25%): \n🟡 Legendary (2%):\n⭐ Mythic (0.25%): \n:004aastar: Secret (0.005%):",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Limited Banner",
                        ["value"] = "🔵 Rare (27.5%):\n🟣 Epic (15.25%): \n🟡 Legendary (2%):\n⭐ Mythic (0.25%): \n:004aastar: Secret (0.005%):",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Current Challenge 1",
                        ["value"] = "Map + Challenge Info: Mob City - Tank Enemies\nAct: (Reckoning Of the Mind's Eye)\nRewards: Star Rift (Purple), Star Rift (Red), Star Rift (Yellow), Gems, Star Rift (Rainbow), Star Rift (Green), Energy Crystal, Star Rift (Dark), Star Rift (Blue)\nRefreshes in: 00:32:14"
                    },
                    {
                        ["name"] = "Current Challenge 2",
                        ["value"] = "Map + Challenge Info: Mob City - Tank Enemies\nAct: (Unraveling The Psychic Mystery)\nRewards: Energy Crystal, Gems, Frost Bind, Risky Dice\nRefreshes in: 00:32:14"
                    },
                    {
                        ["name"] = "Current Challenge 3",
                        ["value"] = "Map + Challenge Info: Swordsman Dojo - Tank Enemies\nAct: (Warrior's Path)\nRewards: Ancient Scroll, Gems, Trait Crystal\nRefreshes in: 00:32:14"
                    },
                    {
                        ["name"] = "Raid Info",
                        ["value"] = "Raids Status: Open!\n**Raids Open/Close In:** ()"
                    },
                    {
                        ["name"] = "Raid Shop Info 1",
                        ["value"] = "Item 1:  **[Currency] 30x Gems**\nCost: **25**\nStock: **5**\n\nItem 2:  **[Item] 1x Trait Crystal**\nCost: **15**\nStock: **3**\n\nItem 3:  **[Item] 1x Risky Dice**\nCost: **18**\nStock: **3**",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Raid Shop Info 2",
                        ["value"] = "Item 4:  **[Item] 1x Frost Bind**\nCost: **20**\nStock: **3**\n\nItem 5:  **[Unit] 1x Bear King**\nCost: **2000**\nStock: **1**\n\nItem 6:  **[Item] 1x Otherworldly Gauntlet**\nCost: **990**\nStock: **1**",
                        ["inline"] = true
                    }
                }
            }
        }
    }

    local newdata = game:GetService("HttpService"):JSONEncode(data)
     
    local headers = {
        ["content-type"] = "application/json"
    }
    request = http_request or request or HttpPost or syn.request
    local abcdef = {Url = webhook, Body = newdata, Method = "POST", Headers = headers}
    request(abcdef)
    wait(interval)
end