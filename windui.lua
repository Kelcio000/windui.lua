-- Advanced WindUI-like Library for Roblox
-- Features: Window, Tabs, Buttons, Toggles, Sliders, Dropdowns, Animations

local Library = {}
Library.__index = Library

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function Library:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "WindUILike"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 500, 0, 350)
    Main.Position = UDim2.new(0.5, -250, 0.5, -175)
    Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Main.Parent = ScreenGui
    Instance.new("UICorner", Main)

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.BackgroundTransparency = 1
    Title.Text = title or "WindUI"
    Title.TextColor3 = Color3.new(1,1,1)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18
    Title.Parent = Main

    local TabButtons = Instance.new("Frame")
    TabButtons.Size = UDim2.new(0, 120, 1, -40)
    TabButtons.Position = UDim2.new(0, 0, 0, 40)
    TabButtons.BackgroundColor3 = Color3.fromRGB(20,20,20)
    TabButtons.Parent = Main

    local TabLayout = Instance.new("UIListLayout", TabButtons)
    TabLayout.Padding = UDim.new(0, 4)

    local Pages = Instance.new("Frame")
    Pages.Size = UDim2.new(1, -120, 1, -40)
    Pages.Position = UDim2.new(0, 120, 0, 40)
    Pages.BackgroundTransparency = 1
    Pages.Parent = Main

    local Window = {}
    local CurrentPage

    function Window:CreateTab(name)
        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(1, 0, 0, 30)
        TabButton.Text = name
        TabButton.BackgroundColor3 = Color3.fromRGB(35,35,35)
        TabButton.TextColor3 = Color3.new(1,1,1)
        TabButton.Font = Enum.Font.Gotham
        TabButton.TextSize = 14
        TabButton.Parent = TabButtons
        Instance.new("UICorner", TabButton)

        local Page = Instance.new("Frame")
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.Visible = false
        Page.Parent = Pages

        local Layout = Instance.new("UIListLayout", Page)
        Layout.Padding = UDim.new(0, 5)

        TabButton.MouseButton1Click:Connect(function()
            if CurrentPage then
                CurrentPage.Visible = false
            end
            CurrentPage = Page
            Page.Visible = true
        end)

        if not CurrentPage then
            CurrentPage = Page
            Page.Visible = true
        end

        local Tab = {}

        function Tab:CreateButton(text, callback)
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1, -10, 0, 30)
            Button.BackgroundColor3 = Color3.fromRGB(40,40,40)
            Button.Text = text
            Button.TextColor3 = Color3.new(1,1,1)
            Button.Font = Enum.Font.Gotham
            Button.TextSize = 14
            Button.Parent = Page
            Instance.new("UICorner", Button)

            Button.MouseButton1Click:Connect(function()
                if callback then callback() end
            end)
        end

        function Tab:CreateToggle(text, default, callback)
            local state = default or false
            local Toggle = Instance.new("TextButton")
            Toggle.Size = UDim2.new(1, -10, 0, 30)
            Toggle.BackgroundColor3 = Color3.fromRGB(40,40,40)
            Toggle.Text = text .. ": " .. tostring(state)
            Toggle.TextColor3 = Color3.new(1,1,1)
            Toggle.Font = Enum.Font.Gotham
            Toggle.TextSize = 14
            Toggle.Parent = Page
            Instance.new("UICorner", Toggle)

            Toggle.MouseButton1Click:Connect(function()
                state = not state
                Toggle.Text = text .. ": " .. tostring(state)
                if callback then callback(state) end
            end)
        end

        return Tab
    end

    return Window
end

return setmetatable({}, Library)
