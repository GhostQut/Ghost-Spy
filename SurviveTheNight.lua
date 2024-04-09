for i, v in pairs(game:GetDescendants()) do
    if v.Name == "ScreenGui" then
        v:Destroy()
    end
end

local DrRayLibrary = loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostQut/FreemUI-V2/main/Source.lua', true))()

local window = DrRayLibrary:Load("SurviveTheNight", "Default")

local tab1 = DrRayLibrary.newTab("Main", "13075622619")
local tab2 = DrRayLibrary.newTab("ESP", "")
local tab3 = DrRayLibrary.newTab("Misc", "13075268290")

local cool = true
local on = true
local oN = true


tab2.newToggle("RelicESP", "", false, function(toggleState)
   if toggleState == true then
        for i,v in pairs(game:GetService("Workspace").TempMap.Main.Relics:GetChildren()) do
          if v.ClassName == "Relic" or v:IsA("MeshPart") then
  
              local function addGui(part)
                  if v:FindFirstChild("STNESP") ~= nil then
                      v:FindFirstChild("STNESP"):Destroy()
                      print("Removing old ESP on " .. part.parent.Name)
                  end
  
                  local gui = Instance.new("BillboardGui", part)
                  gui.Name = "STNESP"
                  gui.Size = UDim2.new(1, 0, 1, 0)
                  gui.AlwaysOnTop = true
  
                  local frame = Instance.new("Frame", gui)
                  frame.Size = UDim2.new(3, 0, 3, 0)
                  frame.BackgroundTransparency = 0.5
                  frame.BorderSizePixel = 0
  
                  if part.parent.Name == "Relic" then
                      frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                  end
  
                  print("Added ESP to " .. part.parent.Name .. "!")
              end
              addGui(v)
          end
      end
    end
end)

tab1.newToggle("RelicAura", "", false, function(toggleState)
     if toggleState == true then
        if not on then on = true
        _G.On = true
        if game:GetService("Workspace").TempMap.Main.Relics.Relic then
            while _G.On and wait(0.1) do
                for i,v in pairs(game:GetService("Workspace").TempMap.Main.Relics:GetChildren()) do
                    if v.Name == "Relic" then
                        fireproximityprompt(v.RelicPrompt)
                    end
                end
            end
        end
    else on = false
        _G.On = false
        if game:GetService("Workspace").TempMap.Main.Relics.Relic then
            while _G.On and wait(0.1) do
                for i,v in pairs(game:GetService("Workspace").TempMap.Main.Relics:GetChildren()) do
                    if v.Name == "Relic" then
                        fireproximityprompt(v.RelicPrompt)
                    end
                end
            end
        end
    end
    end
end)

tab2.newToggle("PlayerESP", "", false, function(toggleState)
   if toggleState == true then
        local workspace = game:GetService("Workspace")
    local player = game:GetService("Players").LocalPlayer
    local camera = workspace.CurrentCamera

    --// Settings:
    local on = true -- Use this if your making gui

    local Box_Color = Color3.fromRGB(255, 0, 0)
    local Box_Thickness = 2
    local Box_Transparency = 1

    local Tracers = true
    local Tracer_Color = Color3.fromRGB(255, 0, 0)
    local Tracer_Thickness = 2
    local Tracer_Transparency = 1

    local Autothickness = true

    local Team_Check = true
    local red = Color3.fromRGB(227, 52, 52)
    local green = Color3.fromRGB(88, 217, 24)

    local function NewLine()
        local line = Drawing.new("Line")
        line.Visible = false
        line.From = Vector2.new(0, 0)
        line.To = Vector2.new(1, 1)
        line.Color = Box_Color
        line.Thickness = Box_Thickness
        line.Transparency = Box_Transparency
        return line
    end

    for i, v in pairs(game.Players:GetChildren()) do

        local lines = {
            line1 = NewLine(),
            line2 = NewLine(),
            line3 = NewLine(),
            line4 = NewLine(),
            line5 = NewLine(),
            line6 = NewLine(),
            line7 = NewLine(),
            line8 = NewLine(),
            line9 = NewLine(),
            line10 = NewLine(),
            line11 = NewLine(),
            line12 = NewLine(),
            Tracer = NewLine()
        }

        lines.Tracer.Color = Tracer_Color
        lines.Tracer.Thickness = Tracer_Thickness
        lines.Tracer.Transparency = Tracer_Transparency

        local function ESP()
            local connection
            connection = game:GetService("RunService").RenderStepped:Connect(function()
                if on and v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v.Name ~= player.Name and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("Head") ~= nil then
                    local pos, vis = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                    if vis then
                        local Scale = v.Character.Head.Size.Y/2
                        local Size = Vector3.new(2, 3, 1.5) * (Scale * 2)

                        local Top1 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, -Size.Z)).p)
                        local Top2 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, Size.Z)).p)
                        local Top3 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, Size.Z)).p)
                        local Top4 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, -Size.Z)).p)

                        local Bottom1 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, -Size.Z)).p)
                        local Bottom2 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, Size.Z)).p)
                        local Bottom3 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, Size.Z)).p)
                        local Bottom4 = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, -Size.Z)).p)

                        lines.line1.From = Vector2.new(Top1.X, Top1.Y)
                        lines.line1.To = Vector2.new(Top2.X, Top2.Y)

                        lines.line2.From = Vector2.new(Top2.X, Top2.Y)
                        lines.line2.To = Vector2.new(Top3.X, Top3.Y)

                        lines.line3.From = Vector2.new(Top3.X, Top3.Y)
                        lines.line3.To = Vector2.new(Top4.X, Top4.Y)

                        lines.line4.From = Vector2.new(Top4.X, Top4.Y)
                        lines.line4.To = Vector2.new(Top1.X, Top1.Y)

                        lines.line5.From = Vector2.new(Bottom1.X, Bottom1.Y)
                        lines.line5.To = Vector2.new(Bottom2.X, Bottom2.Y)

                        lines.line6.From = Vector2.new(Bottom2.X, Bottom2.Y)
                        lines.line6.To = Vector2.new(Bottom3.X, Bottom3.Y)

                        lines.line7.From = Vector2.new(Bottom3.X, Bottom3.Y)
                        lines.line7.To = Vector2.new(Bottom4.X, Bottom4.Y)

                        lines.line8.From = Vector2.new(Bottom4.X, Bottom4.Y)
                        lines.line8.To = Vector2.new(Bottom1.X, Bottom1.Y)

                        lines.line9.From = Vector2.new(Bottom1.X, Bottom1.Y)
                        lines.line9.To = Vector2.new(Top1.X, Top1.Y)

                        lines.line10.From = Vector2.new(Bottom2.X, Bottom2.Y)
                        lines.line10.To = Vector2.new(Top2.X, Top2.Y)

                        lines.line11.From = Vector2.new(Bottom3.X, Bottom3.Y)
                        lines.line11.To = Vector2.new(Top3.X, Top3.Y)

                        lines.line12.From = Vector2.new(Bottom4.X, Bottom4.Y)
                        lines.line12.To = Vector2.new(Top4.X, Top4.Y)

                        if Tracers then
                            local trace = camera:WorldToViewportPoint((v.Character.HumanoidRootPart.CFrame * CFrame.new(0, -Size.Y, 0)).p)

                            lines.Tracer.From = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)
                            lines.Tracer.To = Vector2.new(trace.X, trace.Y)
                        end

                        if Team_Check then
                            if v.TeamColor == player.TeamColor then
                                for u, x in pairs(lines) do
                                    x.Color = green
                                end
                            else
                                for u, x in pairs(lines) do
                                    x.Color = red
                                end
                            end
                        end

                        --// Autothickness:
                        if Autothickness then
                            local distance = (player.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
                            local value = math.clamp(1/distance*100, 0.1, 4) --0.1 is min thickness, 6 is max
                            for u, x in pairs(lines) do
                                x.Thickness = value
                            end
                        else
                            for u, x in pairs(lines) do
                                x.Thickness = Box_Thickness
                            end
                        end

                        for u, x in pairs(lines) do
                            if x ~= lines.Tracer then
                                x.Visible = true
                            end
                        end
                        if Tracers then
                            lines.Tracer.Visible = true
                        end
                    else
                        for u, x in pairs(lines) do
                            x.Visible = false
                        end
                    end
                else
                    for u, x in pairs(lines) do
                        x.Visible = false
                    end
                    if game.Players:FindFirstChild(v.Name) == nil then
                        connection:Disconnect()
                    end
                end
            end)
        end
        coroutine.wrap(ESP)()
    end

    game.Players.PlayerAdded:Connect(function(newplr)
        --// Lines for 3D box (12)
        local lines = {
            line1 = NewLine(),
            line2 = NewLine(),
            line3 = NewLine(),
            line4 = NewLine(),
            line5 = NewLine(),
            line6 = NewLine(),
            line7 = NewLine(),
            line8 = NewLine(),
            line9 = NewLine(),
            line10 = NewLine(),
            line11 = NewLine(),
            line12 = NewLine(),
            Tracer = NewLine()
        }

        lines.Tracer.Color = Tracer_Color
        lines.Tracer.Thickness = Tracer_Thickness
        lines.Tracer.Transparency = Tracer_Transparency

        --// Updates ESP (lines) in render loop
        local function ESP()
            local connection
            connection = game:GetService("RunService").RenderStepped:Connect(function()
                if on and newplr.Character ~= nil and newplr.Character:FindFirstChild("Humanoid") ~= nil and newplr.Character:FindFirstChild("HumanoidRootPart") ~= nil and newplr.Name ~= player.Name and newplr.Character.Humanoid.Health > 0 and newplr.Character:FindFirstChild("Head") ~= nil then
                    local pos, vis = camera:WorldToViewportPoint(newplr.Character.HumanoidRootPart.Position)
                    if vis then
                        local Scale = newplr.Character.Head.Size.Y/2
                        local Size = Vector3.new(2, 3, 1.5) * (Scale * 2) -- Change this for different box size

                        local Top1 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, -Size.Z)).p)
                        local Top2 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, Size.Y, Size.Z)).p)
                        local Top3 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, Size.Z)).p)
                        local Top4 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, Size.Y, -Size.Z)).p)

                        local Bottom1 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, -Size.Z)).p)
                        local Bottom2 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(-Size.X, -Size.Y, Size.Z)).p)
                        local Bottom3 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, Size.Z)).p)
                        local Bottom4 = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(Size.X, -Size.Y, -Size.Z)).p)

                        --// Top:
                        lines.line1.From = Vector2.new(Top1.X, Top1.Y)
                        lines.line1.To = Vector2.new(Top2.X, Top2.Y)

                        lines.line2.From = Vector2.new(Top2.X, Top2.Y)
                        lines.line2.To = Vector2.new(Top3.X, Top3.Y)

                        lines.line3.From = Vector2.new(Top3.X, Top3.Y)
                        lines.line3.To = Vector2.new(Top4.X, Top4.Y)

                        lines.line4.From = Vector2.new(Top4.X, Top4.Y)
                        lines.line4.To = Vector2.new(Top1.X, Top1.Y)

                        --// Bottom:
                        lines.line5.From = Vector2.new(Bottom1.X, Bottom1.Y)
                        lines.line5.To = Vector2.new(Bottom2.X, Bottom2.Y)

                        lines.line6.From = Vector2.new(Bottom2.X, Bottom2.Y)
                        lines.line6.To = Vector2.new(Bottom3.X, Bottom3.Y)

                        lines.line7.From = Vector2.new(Bottom3.X, Bottom3.Y)
                        lines.line7.To = Vector2.new(Bottom4.X, Bottom4.Y)

                        lines.line8.From = Vector2.new(Bottom4.X, Bottom4.Y)
                        lines.line8.To = Vector2.new(Bottom1.X, Bottom1.Y)

                        --//S ides:
                        lines.line9.From = Vector2.new(Bottom1.X, Bottom1.Y)
                        lines.line9.To = Vector2.new(Top1.X, Top1.Y)

                        lines.line10.From = Vector2.new(Bottom2.X, Bottom2.Y)
                        lines.line10.To = Vector2.new(Top2.X, Top2.Y)

                        lines.line11.From = Vector2.new(Bottom3.X, Bottom3.Y)
                        lines.line11.To = Vector2.new(Top3.X, Top3.Y)

                        lines.line12.From = Vector2.new(Bottom4.X, Bottom4.Y)
                        lines.line12.To = Vector2.new(Top4.X, Top4.Y)

                        --// Tracer:
                        if Tracers then
                            local trace = camera:WorldToViewportPoint((newplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -Size.Y, 0)).p)
                            lines.Tracer.From = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)
                            lines.Tracer.To = Vector2.new(trace.X, trace.Y)
                        end

                        --// Teamcheck:
                        if Team_Check then
                            if newplr.TeamColor == player.TeamColor then
                                for u, x in pairs(lines) do
                                    x.Color = green
                                end
                            else
                                for u, x in pairs(lines) do
                                    x.Color = red
                                end
                            end
                        end

                        --// Autothickness:
                        if Autothickness then
                            local distance = (player.Character.HumanoidRootPart.Position - newplr.Character.HumanoidRootPart.Position).magnitude
                            local value = math.clamp(1/distance*100, 0.1, 4) --0.1 is min thickness, 6 is max
                            for u, x in pairs(lines) do
                                x.Thickness = value
                            end
                        else
                            for u, x in pairs(lines) do
                                x.Thickness = Box_Thickness
                            end
                        end

                        for u, x in pairs(lines) do
                            if x ~= lines.Tracer then
                                x.Visible = true
                            end
                        end
                        if Tracers then
                            lines.Tracer.Visible = true
                        end
                    else
                        for u, x in pairs(lines) do
                            x.Visible = false
                        end
                    end
                else
                    for u, x in pairs(lines) do
                        x.Visible = false
                    end
                    if game.Players:FindFirstChild(newplr.Name) == nil then
                        connection:Disconnect()
                    end
                end
            end)
        end
        coroutine.wrap(ESP)()
    end)

    function Create(base, team)
        local bb = Instance.new('BillboardGui', game.CoreGui)
        bb.Adornee = base
        bb.ExtentsOffset = Vector3.new(0,1,0)
        bb.AlwaysOnTop = true
        bb.Size = UDim2.new(0,5,0,5)
        bb.StudsOffset = Vector3.new(0,1,0)
        bb.Name = 'tracker'
        local frame = Instance.new('Frame',bb)
        frame.ZIndex = 10
        frame.BackgroundTransparency = 0.3
        frame.Size = UDim2.new(1,0,1,0)
        local txtlbl = Instance.new('TextLabel',bb)
        txtlbl.ZIndex = 10
        txtlbl.BackgroundTransparency = 1
        txtlbl.Position = UDim2.new(0,0,0,-35)
        txtlbl.Size = UDim2.new(1,0,10,0)
        txtlbl.Font = 'ArialBold'
        txtlbl.FontSize = 'Size12'
        txtlbl.Text = base.Parent.Name:upper()
        txtlbl.TextStrokeTransparency = 0.5
        if team then
            txtlbl.TextColor3 = Color3.new(0,1,1)
            frame.BackgroundColor3 = Color3.new(0,1,1)
        else
            txtlbl.TextColor3 = Color3.new(1,0,0)
            frame.BackgroundColor3 = Color3.new(1,0,0)
        end
    end

    function Clear()
        for _,v in pairs(game.CoreGui:children()) do
            if v.Name == 'tracker' and v:isA('BillboardGui') then
                v:Destroy()
            end
        end
    end

    function Find()
        Clear()
        track = true
        spawn(function()
            while wait(1) do
                if track then
                    Clear()
                    for _,v in pairs(game.Players:GetChildren()) do
                        if v.Name ~= game.Players.LocalPlayer.Name then
                            if v.Character and v.Character.Head then
                                Create(v.Character.Head, false)
                            end
                        end
                    end
                end
                wait(1)
            end
        end)
    end

    Find()
    end
end)

tab1.newToggle("InstaBuild", "", false, function(toggleState)
     if toggleState == true then
        for i = 1,100 do
        for i,v in pairs(game:GetService("Workspace").Misc:GetDescendants()) do
            if v.Name == "BarricadePrompt" then
                fireproximityprompt(v)
            end
        end
      end
    end
end)

tab1.newToggle("TaskAura", "", false, function(toggleState)
     if toggleState == true then
        if not oN then oN = true
        _G.ON = true
        while _G.ON and wait(0.1) do
            for i,v in pairs(game:GetService("Workspace").TempMap.Main.BonusItems:GetDescendants()) do
                if v.ClassName == "ProximityPrompt" then
                    fireproximityprompt(v)
                end
            end
        end
    else oN = false
        _G.ON = false
        while _G.ON and wait(0.1) do
            for i,v in pairs(game:GetService("Workspace").TempMap.Main.BonusItems:GetDescendants()) do
                if v.ClassName == "ProximityPrompt" then
                    fireproximityprompt(v)
                end
            end
        end
    end
    end
end)
tab2.newToggle("TaskESP", "", false, function(toggleState)
     if toggleState == true then
        for i, v in pairs(game:GetService("Workspace").TempMap.Main.BonusItems:GetDescendants()) do
            if v:FindFirstChild("BillboardGui") ~= nil then
                v:FindFirstChild("BillboardGui"):Destroy()
            end

            if v.ClassName == "Model" then
                local BillboardGui = Instance.new("BillboardGui")
                local TextLabel = Instance.new("TextLabel")
    
                BillboardGui.Parent = v.Parent
                BillboardGui.AlwaysOnTop = true
                BillboardGui.LightInfluence = 1
                BillboardGui.Size = UDim2.new(0, 50, 0, 50)
                BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
    
                TextLabel.Parent = BillboardGui
                TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
                TextLabel.BackgroundTransparency = 1
                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                TextLabel.Text = v.parent.Name
                TextLabel.TextColor3 = Color3.new(1, 0, 0)
                TextLabel.TextScaled = true
            end
        end
    end
end)

tab3.newButton("FullBright", "", function()
    game:GetService("Lighting").Skybox:Destroy()
    game:GetService("Lighting").FlareColorCorrection.Enabled = false
    game:GetService("Lighting").BasicColorCorrection.Enabled = false
    game:GetService("Lighting").PlayerBlur.Enabled = false
    game:GetService("Lighting").DefaultColorCorrection.Enabled = false
    game:GetService("Lighting").DefaultBloom.Enabled = false
    game:GetService("Lighting").DefaultSunRays.Enabled = false
    game:GetService("Lighting").DefaultBlur.Enabled = false
    game:GetService("Lighting").Ambient = Color3.fromRGB(236, 236, 236)
    game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(70, 70, 70)
    game:GetService("Lighting").Brightness = 3
    game:GetService("Lighting").ExposureCompensation = 0.25
    game:GetService("Lighting").ClockTime = 14.5
    game:GetService("Lighting").FogEnd = 10000000
    game:GetService("Lighting").Atmosphere.Enabled = false
end)
