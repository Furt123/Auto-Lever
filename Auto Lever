local Network = require(game.ReplicatedStorage.Library.Client.Network)
local UIS = game:GetService("UserInputService")
local lp = game.Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LeverGui"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = lp.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 180, 0, 140)
frame.Position = UDim2.new(0.5, -90, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(80, 200, 120)
stroke.Thickness = 1.5
stroke.Parent = frame

local dragHandle = Instance.new("Frame")
dragHandle.Size = UDim2.new(1, 0, 0, 40)
dragHandle.Position = UDim2.new(0, 0, 0, 0)
dragHandle.BackgroundTransparency = 1
dragHandle.ZIndex = 10
dragHandle.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 24)
title.Position = UDim2.new(0, 0, 0, 6)
title.BackgroundTransparency = 1
title.Text = "🍀 Auto Lever"
title.TextColor3 = Color3.fromRGB(80, 200, 120)
title.TextSize = 14
title.Font = Enum.Font.GothamBold
title.ZIndex = 11
title.Parent = dragHandle

local author = Instance.new("TextLabel")
author.Size = UDim2.new(1, 0, 0, 10)
author.Position = UDim2.new(0, 0, 0, 30)
author.BackgroundTransparency = 1
author.Text = "by: @Artemkaktus"
author.TextColor3 = Color3.fromRGB(100, 100, 100)
author.TextSize = 9
author.Font = Enum.Font.Gotham
author.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 0, 44)
status.BackgroundTransparency = 1
status.Text = "Disabled"
status.TextColor3 = Color3.fromRGB(180, 180, 180)
status.TextSize = 11
status.Font = Enum.Font.Gotham
status.Parent = frame

local diamondLabel = Instance.new("TextLabel")
diamondLabel.Size = UDim2.new(1, 0, 0, 16)
diamondLabel.Position = UDim2.new(0, 0, 0, 64)
diamondLabel.BackgroundTransparency = 1
diamondLabel.Text = "💎 Earned: 0"
diamondLabel.TextColor3 = Color3.fromRGB(100, 180, 255)
diamondLabel.TextSize = 11
diamondLabel.Font = Enum.Font.Gotham
diamondLabel.Parent = frame

local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(1, 0, 0, 16)
timerLabel.Position = UDim2.new(0, 0, 0, 82)
timerLabel.BackgroundTransparency = 1
timerLabel.Text = "⏱ Time: 00:00:00"
timerLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
timerLabel.TextSize = 11
timerLabel.Font = Enum.Font.Gotham
timerLabel.Parent = frame

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0.8, 0, 0, 28)
toggleBtn.Position = UDim2.new(0.1, 0, 0, 104)
toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 160, 80)
toggleBtn.Text = "Enable"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.TextSize = 13
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.BorderSizePixel = 0
toggleBtn.Parent = frame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = toggleBtn

-- Draggable
local dragging = false
local dragStart = nil
local startPos = nil

dragHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

local function formatNumber(n)
    if n >= 1e9 then return string.format("%.1fb", n / 1e9)
    elseif n >= 1e6 then return string.format("%.1fm", n / 1e6)
    elseif n >= 1e3 then return string.format("%.1fk", n / 1e3)
    end
    return tostring(math.floor(n))
end

local function formatTime(seconds)
    local h = math.floor(seconds / 3600)
    local m = math.floor((seconds % 3600) / 60)
    local s = seconds % 60
    return string.format("%02d:%02d:%02d", h, m, s)
end

local function getDiamonds()
    local leaderstats = lp:FindFirstChild("leaderstats")
    if not leaderstats then return nil end
    for _, obj in pairs(leaderstats:GetChildren()) do
        if obj.Name:lower():find("diamond") then
            return obj
        end
    end
    return nil
end

local function isActivated(lever)
    local handle = lever:FindFirstChild("Handle")
    return handle and handle.Material == Enum.Material.Neon
end

local enabled = false
local startDiamonds = 0
local elapsedTime = 0

toggleBtn.MouseButton1Click:Connect(function()
    enabled = not enabled
    if enabled then
        local diamonds = getDiamonds()
        startDiamonds = diamonds and diamonds.Value or 0
        elapsedTime = 0
        toggleBtn.Text = "Disable"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
        status.Text = "Waiting for raid..."
        status.TextColor3 = Color3.fromRGB(180, 180, 180)
        diamondLabel.Text = "💎 Earned: 0"
        timerLabel.Text = "⏱ Time: 00:00:00"
    else
        toggleBtn.Text = "Enable"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 160, 80)
        status.Text = "Disabled"
        status.TextColor3 = Color3.fromRGB(180, 180, 180)
    end
end)

-- Счётчик алмазов и таймер
task.spawn(function()
    while true do
        task.wait(1)
        if enabled then
            elapsedTime = elapsedTime + 1

            local diamonds = getDiamonds()
            if diamonds then
                local earned = math.max(0, diamonds.Value - startDiamonds)
                diamondLabel.Text = "💎 Earned: " .. formatNumber(earned)
            end

            timerLabel.Text = "⏱ Time: " .. formatTime(elapsedTime)
        end
    end
end)

-- Основной цикл
task.spawn(function()
    while true do
        task.wait(1)
        if not enabled then continue end

        local rooms = nil
        pcall(function()
            rooms = game:GetService("Workspace").__THINGS.__INSTANCE_CONTAINER.Active.LuckyRaid.Rooms
        end)

        if not rooms then
            status.Text = "Waiting for raid..."
            status.TextColor3 = Color3.fromRGB(180, 180, 180)
            continue
        end

        local allDone = true

        for i, roomName in pairs({"Boss1", "Boss2", "Boss3"}) do
            if not enabled then break end

            local room = rooms:FindFirstChild(roomName)
            if not room then continue end

            local lever = room:FindFirstChild("Lever")
            if not lever then continue end

            if isActivated(lever) then continue end

            allDone = false
            pcall(function()
                Network.Invoke("LuckyRaid_PullLever", i)
            end)
            task.wait(0.35)
        end

        if allDone then
            status.Text = "✅ All levers done!"
            status.TextColor3 = Color3.fromRGB(80, 200, 120)
        else
            status.Text = "Running..."
            status.TextColor3 = Color3.fromRGB(80, 200, 120)
        end
    end
end)
