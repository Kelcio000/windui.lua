local WindUI = loadstring(game:HttpGet(
    "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
))()

-------------------------------------------------
-- TEMA PADRÃO
-------------------------------------------------
WindUI:AddTheme({
    Name = "Dex Theme",
    Accent = Color3.fromRGB(30,30,46),
    Background = Color3.fromRGB(17,17,27),
    Outline = Color3.fromRGB(255,255,255),
    Text = Color3.fromRGB(255,255,255),
    Placeholder = Color3.fromRGB(120,120,120),
    Button = Color3.fromRGB(49,50,68),
    Icon = Color3.fromRGB(170,170,200),
})

-------------------------------------------------
-- JANELA
-------------------------------------------------
local Window = WindUI:CreateWindow({
    Title = "Dex Hub",
    Icon = "zap",
    Author = "by Saint",
    Folder = "DexHub",
    Size = UDim2.fromOffset(600, 520),
    Transparent = true,
    User = { Enabled = true, Anonymous = false },
})

local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local Stats = game:GetService("Stats")
local player = Players.LocalPlayer

-------------------------------------------------
-- ABA MAIN
-------------------------------------------------
local Main = Window:Tab({ Title = "Main", Icon = "house" })

local gameName = "Loading..."
pcall(function()
    gameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
end)

Main:Paragraph({ Title = "Game", Desc = gameName })

local playerCount = Main:Paragraph({
    Title = "Players in server",
    Desc = tostring(#Players:GetPlayers())
})

local startTime = tick()

local timeLabel = Main:Paragraph({
    Title = "Server Time",
    Desc = "00:00"
})

local pingLabel = Main:Paragraph({
    Title = "Ping",
    Desc = "..."
})

local function updatePlayers()
    playerCount:SetDesc(tostring(#Players:GetPlayers()))
end

Players.PlayerAdded:Connect(updatePlayers)
Players.PlayerRemoving:Connect(updatePlayers)

local function formatTime(sec)
    local h = math.floor(sec / 3600)
    local m = math.floor((sec % 3600) / 60)
    local s = math.floor(sec % 60)
    return string.format("%02dh %02dm %02ds", h, m, s)
end

task.spawn(function()
    while true do
        timeLabel:SetDesc(formatTime(tick() - startTime))
        pingLabel:SetDesc(
            math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) .. " ms"
        )
        task.wait(1)
    end
end)

-------------------------------------------------
-- ABA TELEPORTS
-------------------------------------------------
local Teleports = Window:Tab({ Title = "Teleports", Icon = "map-pin" })

local function tp(x, y, z)
    local char = player.Character or player.CharacterAdded:Wait()
    char:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(x, y, z)
end

local function createAccordionSection(tab, title, buttons)
    local section = tab:Section({ Title = title })
    for _, info in pairs(buttons) do
        section:Button({
            Title = info.Title,
            Callback = info.Callback
        })
    end
end

createAccordionSection(Teleports, "Map Locations", {
    { Title = "Awakened Enchant", Callback = function() tp(-6217, 127, 4843) end },
    { Title = "Enchant", Callback = function() tp(-1881, -646, 2269) end },
    { Title = "Sellzone", Callback = function() tp(939, 30, -700) end },
})

createAccordionSection(Teleports, "Shops", {
    { Title = "UCS", Callback = function() tp(1259, 30, -691) end },
    { Title = "Vi's Logisc", Callback = function() tp(-5147, 66, -2835) end },
    { Title = "Lush Shop", Callback = function() tp(-586, -532, 989) end },
    { Title = "Furnitune Shop", Callback = function() tp(1167, 108, 547) end },
    { Title = "Dell's Shipyard", Callback = function() tp(-147, 7, 3418) end },
    { Title = "Oil Platform", Callback = function() tp(-2313, 78, 5367) end },
    { Title = "Nautic Finds", Callback = function() tp(1789, 3, -1394) end },
})

-------------------------------------------------
-- CAR FLY SCRIPT (ORIGINAL - SEM ALTERAÇÕES)
-------------------------------------------------
local function loadCarFly()
    print("Script Made By Dex hub")
    print("~script.lua")

    local Flymguiv2 = Instance.new("ScreenGui")
    local Drag = Instance.new("Frame")
    local FlyFrame = Instance.new("Frame")
    local ddnsfbfwewefe = Instance.new("TextLabel")
    local Speed = Instance.new("TextBox")
    local Fly = Instance.new("TextButton")
    local Speeed = Instance.new("TextLabel")
    local Stat = Instance.new("TextLabel")
    local Stat2 = Instance.new("TextLabel")
    local Unfly = Instance.new("TextButton")
    local Vfly = Instance.new("TextLabel")
    local Close = Instance.new("TextButton")
    local Minimize = Instance.new("TextButton")
    local Flyon = Instance.new("Frame")
    local W = Instance.new("TextButton")
    local S = Instance.new("TextButton")

    Flymguiv2.Name = "Flym gui v2"
    Flymguiv2.Parent = game.CoreGui
    Flymguiv2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Drag.Name = "Drag"
    Drag.Parent = Flymguiv2
    Drag.Active = true
    Drag.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Drag.BorderSizePixel = 0
    Drag.Draggable = true
    Drag.Position = UDim2.new(0.482438415, 0, 0.454874992, 0)
    Drag.Size = UDim2.new(0, 237, 0, 27)

    FlyFrame.Name = "FlyFrame"
    FlyFrame.Parent = Drag
    FlyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    FlyFrame.BorderSizePixel = 0
    FlyFrame.Draggable = true
    FlyFrame.Position = UDim2.new(-0.00200000009, 0, 0.989000022, 0)
    FlyFrame.Size = UDim2.new(0, 237, 0, 139)

    ddnsfbfwewefe.Name = "ddnsfbfwewefe"
    ddnsfbfwewefe.Parent = FlyFrame
    ddnsfbfwewefe.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    ddnsfbfwewefe.BorderSizePixel = 0
    ddnsfbfwewefe.Position = UDim2.new(-0.000210968778, 0, -0.00395679474, 0)
    ddnsfbfwewefe.Size = UDim2.new(0, 237, 0, 27)
    ddnsfbfwewefe.Font = Enum.Font.SourceSans
    ddnsfbfwewefe.Text = "Script Made By Dex hub"
    ddnsfbfwewefe.TextColor3 = Color3.fromRGB(255, 255, 255)
    ddnsfbfwewefe.TextScaled = true
    ddnsfbfwewefe.TextSize = 14.000
    ddnsfbfwewefe.TextWrapped = true

    Speed.Name = "Speed"
    Speed.Parent = FlyFrame
    Speed.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Speed.BorderColor3 = Color3.fromRGB(20, 20, 20)
    Speed.BorderSizePixel = 0
    Speed.Position = UDim2.new(0.445025861, 0, 0.402877688, 0)
    Speed.Size = UDim2.new(0, 111, 0, 33)
    Speed.Font = Enum.Font.SourceSans
    Speed.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
    Speed.Text = "50"
    Speed.TextColor3 = Color3.fromRGB(255, 255, 255)
    Speed.TextScaled = true
    Speed.TextSize = 14.000
    Speed.TextWrapped = true

    Fly.Name = "Fly"
    Fly.Parent = FlyFrame
    Fly.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Fly.BorderSizePixel = 0
    Fly.Position = UDim2.new(0.0759493634, 0, 0.705797076, 0)
    Fly.Size = UDim2.new(0, 199, 0, 32)
    Fly.Font = Enum.Font.SourceSans
    Fly.Text = "Enable"
    Fly.TextColor3 = Color3.fromRGB(255, 255, 255)
    Fly.TextScaled = true
    Fly.TextSize = 14.000
    Fly.TextWrapped = true
    Fly.MouseButton1Click:Connect(function()
            local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
            Fly.Visible = false
            Stat2.Text = "On"
            Stat2.TextColor3 = Color3.fromRGB(0, 255, 0)
            Unfly.Visible = true
            Flyon.Visible = true
            local BV = Instance.new("BodyVelocity",HumanoidRP)
            local BG = Instance.new("BodyGyro",HumanoidRP)
            BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            game:GetService('RunService').RenderStepped:connect(function()
            BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
            BG.D = 5000
            BG.P = 100000
            BG.CFrame = game.Workspace.CurrentCamera.CFrame
            end)
    end)

    Speeed.Name = "Speeed"
    Speeed.Parent = FlyFrame
    Speeed.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Speeed.BorderSizePixel = 0
    Speeed.Position = UDim2.new(0.0759493634, 0, 0.402877688, 0)
    Speeed.Size = UDim2.new(0, 87, 0, 32)
    Speeed.ZIndex = 0
    Speeed.Font = Enum.Font.SourceSans
    Speeed.Text = "Speed:"
    Speeed.TextColor3 = Color3.fromRGB(255, 255, 255)
    Speeed.TextScaled = true
    Speeed.TextSize = 14.000
    Speeed.TextWrapped = true

    Stat.Name = "Stat"
    Stat.Parent = FlyFrame
    Stat.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Stat.BorderSizePixel = 0
    Stat.Position = UDim2.new(0.299983799, 0, 0.239817441, 0)
    Stat.Size = UDim2.new(0, 85, 0, 15)
    Stat.Font = Enum.Font.SourceSans
    Stat.Text = "Status:"
    Stat.TextColor3 = Color3.fromRGB(255, 255, 255)
    Stat.TextScaled = true
    Stat.TextSize = 14.000
    Stat.TextWrapped = true

    Stat2.Name = "Stat2"
    Stat2.Parent = FlyFrame
    Stat2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Stat2.BorderSizePixel = 0
    Stat2.Position = UDim2.new(0.546535194, 0, 0.239817441, 0)
    Stat2.Size = UDim2.new(0, 27, 0, 15)
    Stat2.Font = Enum.Font.SourceSans
    Stat2.Text = "Off"
    Stat2.TextColor3 = Color3.fromRGB(255, 0, 0)
    Stat2.TextScaled = true
    Stat2.TextSize = 14.000
    Stat2.TextWrapped = true

    Unfly.Name = "Unfly"
    Unfly.Parent = FlyFrame
    Unfly.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Unfly.BorderSizePixel = 0
    Unfly.Position = UDim2.new(0.0759493634, 0, 0.705797076, 0)
    Unfly.Size = UDim2.new(0, 199, 0, 32)
    Unfly.Visible = false
    Unfly.Font = Enum.Font.SourceSans
    Unfly.Text = "Disable"
    Unfly.TextColor3 = Color3.fromRGB(255, 255, 255)
    Unfly.TextScaled = true
    Unfly.TextSize = 14.000
    Unfly.TextWrapped = true
    Unfly.MouseButton1Click:Connect(function()
            local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
            Fly.Visible = true
            Stat2.Text = "Off"
            Stat2.TextColor3 = Color3.fromRGB(255, 0, 0)
            wait()
            Unfly.Visible = false
            Flyon.Visible = false
            HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
            HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
    end)

    Vfly.Name = "Vfly"
    Vfly.Parent = Drag
    Vfly.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Vfly.BorderSizePixel = 0
    Vfly.Size = UDim2.new(0, 57, 0, 27)
    Vfly.Font = Enum.Font.SourceSans
    Vfly.Text = "Car Fly"
    Vfly.TextColor3 = Color3.fromRGB(255, 255, 255)
    Vfly.TextScaled = true
    Vfly.TextSize = 14.000
    Vfly.TextWrapped = true

    Close.Name = "Close"
    Close.Parent = Drag
    Close.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Close.BorderSizePixel = 0
    Close.Position = UDim2.new(0.875, 0, 0, 0)
    Close.Size = UDim2.new(0, 27, 0, 27)
    Close.Font = Enum.Font.SourceSans
    Close.Text = "X"
    Close.TextColor3 = Color3.fromRGB(255, 255, 255)
    Close.TextScaled = true
    Close.TextSize = 14.000
    Close.TextWrapped = true
    Close.MouseButton1Click:Connect(function()
            Flymguiv2:Destroy()
    end)

    Minimize.Name = "Minimize"
    Minimize.Parent = Drag
    Minimize.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Minimize.BorderSizePixel = 0
    Minimize.Position = UDim2.new(0.75, 0, 0, 0)
    Minimize.Size = UDim2.new(0, 27, 0, 27)
    Minimize.Font = Enum.Font.SourceSans
    Minimize.Text = "-"
    Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
    Minimize.TextScaled = true
    Minimize.TextSize = 14.000
    Minimize.TextWrapped = true
    function Mini()
            if Minimize.Text == "-" then
                    Minimize.Text = "+"
                    FlyFrame.Visible = false
            elseif Minimize.Text == "+" then
                    Minimize.Text = "-"
                    FlyFrame.Visible = true
            end
    end
    Minimize.MouseButton1Click:Connect(Mini)

    Flyon.Name = "Fly on"
    Flyon.Parent = Flymguiv2
    Flyon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Flyon.BorderSizePixel = 0
    Flyon.Position = UDim2.new(0.117647067, 0, 0.550284624, 0)
    Flyon.Size = UDim2.new(0.148000002, 0, 0.314999998, 0)
    Flyon.Visible = false
    Flyon.Active = true
    Flyon.Draggable = true

    W.Name = "W"
    W.Parent = Flyon
    W.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    W.BorderSizePixel = 0
    W.Position = UDim2.new(0.134719521, 0, 0.0152013302, 0)
    W.Size = UDim2.new(0.708999991, 0, 0.499000013, 0)
    W.Font = Enum.Font.SourceSans
    W.Text = "^"
    W.TextColor3 = Color3.fromRGB(255, 255, 255)
    W.TextScaled = true
    W.TextSize = 14.000
    W.TextWrapped = true
    W.TouchLongPress:Connect(function()
            local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * 0
    end)

    W.MouseButton1Click:Connect(function()
            local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * 0
    end)

    S.Name = "S"
    S.Parent = Flyon
    S.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    S.BorderSizePixel = 0
    S.Position = UDim2.new(0.134000003, 0, 0.479999989, 0)
    S.Rotation = 180.000
    S.Size = UDim2.new(0.708999991, 0, 0.499000013, 0)
    S.Font = Enum.Font.SourceSans
    S.Text = "^"
    S.TextColor3 = Color3.fromRGB(255, 255, 255)
    S.TextScaled = true
    S.TextSize = 14.000
    S.TextWrapped = true
    S.TouchLongPress:Connect(function()
            local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * 0
    end)

    S.MouseButton1Click:Connect(function()
            local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
            wait(.1)
            HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * 0
    end)
end

-------------------------------------------------
-- ABA SETTINGS (COM CAR FLY ORIGINAL)
-------------------------------------------------
local Settings = Window:Tab({ Title = "Settings", Icon = "settings" })

Settings:Paragraph({
    Title = "Hub Info",
    Desc = "Dex Hub - Car Fly Integrado"
})

-- Seção do Car Fly
local carFlySection = Settings:Section({ Title = "🚗 Car Fly" })

-- Botão para abrir o Car Fly original
carFlySection:Button({
    Title = "Open Car Fly",
    Desc = "Abre a GUI original do Car Fly (Preto com texto branco)",
    Callback = function()
        loadCarFly()
    end
})

carFlySection:Paragraph({
    Title = "Características",
    Desc = "• Fundo Preto (RGB 20,20,20 / 30,30,30)\n• Texto Branco\n• Botões Pretos com texto branco\n• Status: Vermelho (Off) / Verde (On)"
})

-- Seção de Informações
local infoSection = Settings:Section({ Title = "Informações" })

infoSection:Paragraph({
    Title = "Car Fly Original",
    Desc = "Script integrado ao Dex Hub | Clique em 'Open Car Fly' para abrir a GUI"
})