
local Network = require(game.ReplicatedStorage.Library.Client.Network)
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local lp = game.Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LeverGui"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = lp.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 0, 0, 0)
frame.Position = UDim2.new(0.5, 0, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
frame.BackgroundTransparency = 1
frame.BorderSizePixel = 0
frame.ZIndex = 1
frame.Parent = screenGui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(80, 200, 120)
stroke.Thickness = 1.5
stroke.Transparency = 1
stroke.Parent = frame

local dragHandle = Instance.new("Frame")
dragHandle.Size = UDim2.new(1, 0, 0, 35)
dragHandle.BackgroundTransparency = 1
dragHandle.ZIndex = 10
dragHandle.Parent = frame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 22)
titleLabel.Position = UDim2.new(0, 0, 0, 6)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🍀 Auto Lever"
titleLabel.TextColor3 = Color3.fromRGB(80, 200, 120)
titleLabel.TextSize = 14
titleLabel.TextTransparency = 1
titleLabel.Font = Enum.Font.GothamBold
titleLabel.ZIndex = 11
titleLabel.Parent = dragHandle

local author = Instance.new("TextLabel")
author.Size = UDim2.new(1, 0, 0, 10)
author.Position = UDim2.new(0, 0, 0, 26)
author.BackgroundTransparency = 1
author.Text = "by: @Artemkakaktys"
author.TextColor3 = Color3.fromRGB(255, 0, 0)
author.TextTransparency = 1
author.TextSize = 9
author.Font = Enum.Font.GothamBold
author.ZIndex = 2
author.Parent = frame

-- ========== TABS ==========
local tabsFrame = Instance.new("Frame")
tabsFrame.Size = UDim2.new(1, 0, 0, 24)
tabsFrame.Position = UDim2.new(0, 0, 0, 38)
tabsFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
tabsFrame.BorderSizePixel = 0
tabsFrame.ZIndex = 2
tabsFrame.Parent = frame

local tabMain = Instance.new("TextButton")
tabMain.Size = UDim2.new(0.5, 0, 1, 0)
tabMain.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
tabMain.Text = "Main"
tabMain.TextColor3 = Color3.fromRGB(255, 255, 255)
tabMain.TextSize = 11
tabMain.Font = Enum.Font.GothamBold
tabMain.BorderSizePixel = 0
tabMain.ZIndex = 3
tabMain.Parent = tabsFrame
Instance.new("UICorner", tabMain).CornerRadius = UDim.new(0, 6)

local tabDist = Instance.new("TextButton")
tabDist.Size = UDim2.new(0.5, 0, 1, 0)
tabDist.Position = UDim2.new(0.5, 0, 0, 0)
tabDist.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
tabDist.Text = "Distance"
tabDist.TextColor3 = Color3.fromRGB(180, 180, 180)
tabDist.TextSize = 11
tabDist.Font = Enum.Font.GothamBold
tabDist.BorderSizePixel = 0
tabDist.ZIndex = 3
tabDist.Parent = tabsFrame
Instance.new("UICorner", tabDist).CornerRadius = UDim.new(0, 6)

-- ========== MAIN PAGE ==========
local mainPage = Instance.new("Frame")
mainPage.Size = UDim2.new(1, 0, 1, -65)
mainPage.Position = UDim2.new(0, 0, 0, 65)
mainPage.BackgroundTransparency = 1
mainPage.ZIndex = 2
mainPage.Parent = frame

local leverStatus = Instance.new("TextLabel")
leverStatus.Size = UDim2.new(1, 0, 0, 18)
leverStatus.Position = UDim2.new(0, 0, 0, 5)
leverStatus.BackgroundTransparency = 1
leverStatus.Text = "Disabled"
leverStatus.TextColor3 = Color3.fromRGB(180, 180, 180)
leverStatus.TextTransparency = 1
leverStatus.TextSize = 11
leverStatus.Font = Enum.Font.Gotham
leverStatus.ZIndex = 3
leverStatus.Parent = mainPage

local diamondLabel = Instance.new("TextLabel")
diamondLabel.Size = UDim2.new(1, 0, 0, 16)
diamondLabel.Position = UDim2.new(0, 0, 0, 26)
diamondLabel.BackgroundTransparency = 1
diamondLabel.Text = "💎 Earned: 0"
diamondLabel.TextColor3 = Color3.fromRGB(100, 180, 255)
diamondLabel.TextTransparency = 1
diamondLabel.TextSize = 11
diamondLabel.Font = Enum.Font.Gotham
diamondLabel.ZIndex = 3
diamondLabel.Parent = mainPage

local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(1, 0, 0, 16)
timerLabel.Position = UDim2.new(0, 0, 0, 44)
timerLabel.BackgroundTransparency = 1
timerLabel.Text = "⏱ Time: 00:00:00"
timerLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
timerLabel.TextTransparency = 1
timerLabel.TextSize = 11
timerLabel.Font = Enum.Font.Gotham
timerLabel.ZIndex = 3
timerLabel.Parent = mainPage

local leverToggle = Instance.new("TextButton")
leverToggle.Size = UDim2.new(0.85, 0, 0, 28)
leverToggle.Position = UDim2.new(0.075, 0, 0, 65)
leverToggle.BackgroundColor3 = Color3.fromRGB(40, 160, 80)
leverToggle.BackgroundTransparency = 1
leverToggle.Text = "Enable"
leverToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
leverToggle.TextTransparency = 1
leverToggle.TextSize = 13
leverToggle.Font = Enum.Font.GothamBold
leverToggle.BorderSizePixel = 0
leverToggle.ZIndex = 4
leverToggle.Parent = mainPage
Instance.new("UICorner", leverToggle).CornerRadius = UDim.new(0, 8)

-- ========== DISTANCE PAGE ==========
local distPage = Instance.new("Frame")
distPage.Size = UDim2.new(1, 0, 1, -65)
distPage.Position = UDim2.new(0, 0, 0, 65)
distPage.BackgroundTransparency = 1
distPage.Visible = false
distPage.ZIndex = 2
distPage.Parent = frame

local distLabel = Instance.new("TextLabel")
distLabel.Size = UDim2.new(0.9, 0, 0, 16)
distLabel.Position = UDim2.new(0.05, 0, 0, 8)
distLabel.BackgroundTransparency = 1
distLabel.Text = "Activation distance (studs):"
distLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
distLabel.TextSize = 11
distLabel.Font = Enum.Font.Gotham
distLabel.TextXAlignment = Enum.TextXAlignment.Left
distLabel.ZIndex = 3
distLabel.Parent = distPage

local distInput = Instance.new("TextBox")
distInput.Size = UDim2.new(0.9, 0, 0, 28)
distInput.Position = UDim2.new(0.05, 0, 0, 26)
distInput.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
distInput.Text = "30"
distInput.TextColor3 = Color3.fromRGB(80, 200, 120)
distInput.TextSize = 13
distInput.Font = Enum.Font.GothamBold
distInput.BorderSizePixel = 0
distInput.PlaceholderText = "Enter distance..."
distInput.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
distInput.ClearTextOnFocus = false
distInput.ZIndex = 3
distInput.Parent = distPage
Instance.new("UICorner", distInput).CornerRadius = UDim.new(0, 6)

local distStatus = Instance.new("TextLabel")
distStatus.Size = UDim2.new(1, 0, 0, 16)
distStatus.Position = UDim2.new(0, 0, 0, 58)
distStatus.BackgroundTransparency = 1
distStatus.Text = "Recommended: 30 studs"
distStatus.TextColor3 = Color3.fromRGB(100, 180, 255)
distStatus.TextSize = 11
distStatus.Font = Enum.Font.Gotham
distStatus.ZIndex = 3
distStatus.Parent = distPage

local applyBtn = Instance.new("TextButton")
applyBtn.Size = UDim2.new(0.85, 0, 0, 28)
applyBtn.Position = UDim2.new(0.075, 0, 0, 76)
applyBtn.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
applyBtn.Text = "Apply"
applyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
applyBtn.TextSize = 13
applyBtn.Font = Enum.Font.GothamBold
applyBtn.BorderSizePixel = 0
applyBtn.ZIndex = 4
applyBtn.Parent = distPage
Instance.new("UICorner", applyBtn).CornerRadius = UDim.new(0, 8)

-- ========== АНИМАЦИЯ ПОЯВЛЕНИЯ ==========
local function animateIn()
    TweenService:Create(frame, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 200, 0, 170),
        Position = UDim2.new(0.5, -100, 0, 20),
        BackgroundTransparency = 0
    }):Play()

    TweenService:Create(stroke, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Transparency = 0
    }):Play()

    task.wait(0.4)

    local textElements = {titleLabel, author, leverStatus, diamondLabel, timerLabel, leverToggle}
    for i, el in pairs(textElements) do
        task.delay((i - 1) * 0.12, function()
            TweenService:Create(el, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                TextTransparency = 0,
                BackgroundTransparency = el == leverToggle and 0 or 1
            }):Play()
        end)
    end
end

animateIn()

-- ========== РАДУЖНАЯ АНИМАЦИЯ ==========
task.spawn(function()
    local hue = 0
    while true do
        task.wait(0.05)
        hue = (hue + 0.01) % 1
        author.TextColor3 = Color3.fromHSV(hue, 1, 1)
    end
end)

-- ========== DRAGGABLE ==========
local dragging, dragStart, startPos = false, nil, nil
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
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
    or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

-- ========== TAB SWITCHING ==========
local function switchTab(tab)
    if tab == "main" then
        mainPage.Visible = true
        distPage.Visible = false
        tabMain.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
        tabMain.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabDist.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
        tabDist.TextColor3 = Color3.fromRGB(180, 180, 180)
        TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 200, 0, 170)
        }):Play()
    else
        mainPage.Visible = false
        distPage.Visible = true
        tabMain.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
        tabMain.TextColor3 = Color3.fromRGB(180, 180, 180)
        tabDist.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
        tabDist.TextColor3 = Color3.fromRGB(255, 255, 255)
        TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 200, 0, 170)
        }):Play()
    end
end

tabMain.MouseButton1Click:Connect(function() switchTab("main") end)
tabDist.MouseButton1Click:Connect(function() switchTab("dist") end)

-- ========== HELPERS ==========
local MAX_DISTANCE = 30

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
        if obj.Name:lower():find("diamond") then return obj end
    end
    return nil
end

local function isActivated(lever)
    local handle = lever:FindFirstChild("Handle")
    return handle and handle.Material == Enum.Material.Neon
end

local function getDistance(hrp, lever)
    return (hrp.Position - lever:GetPivot().Position).Magnitude
end

-- Apply кнопка
applyBtn.MouseButton1Click:Connect(function()
    local num = tonumber(distInput.Text)
    if num and num > 0 then
        MAX_DISTANCE = num
        distStatus.Text = "Recommended: " .. num .. " studs"
        distStatus.TextColor3 = Color3.fromRGB(80, 200, 120)
        TweenService:Create(applyBtn, TweenInfo.new(0.1), {
            BackgroundColor3 = Color3.fromRGB(40, 120, 60)
        }):Play()
        task.wait(0.2)
        TweenService:Create(applyBtn, TweenInfo.new(0.1), {
            BackgroundColor3 = Color3.fromRGB(80, 200, 120)
        }):Play()
    else
        distStatus.Text = "❌ Enter valid number!"
        distStatus.TextColor3 = Color3.fromRGB(255, 80, 80)
    end
end)

-- ========== LEVER LOGIC ==========
local leverEnabled = false
local startDiamonds = 0
local elapsedTime = 0
local pausedEarned = 0

leverToggle.MouseButton1Click:Connect(function()
    leverEnabled = not leverEnabled
    if leverEnabled then
        local diamonds = getDiamonds()
        local currentDiamonds = diamonds and diamonds.Value or 0
        startDiamonds = currentDiamonds - pausedEarned
        leverToggle.Text = "Disable"
        TweenService:Create(leverToggle, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(180, 50, 50)
        }):Play()
        leverStatus.Text = "Waiting for raid..."
        leverStatus.TextColor3 = Color3.fromRGB(180, 180, 180)
    else
        local diamonds = getDiamonds()
        if diamonds then
            pausedEarned = math.max(0, diamonds.Value - startDiamonds)
        end
        leverToggle.Text = "Enable"
        TweenService:Create(leverToggle, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(40, 160, 80)
        }):Play()
        leverStatus.Text = "Paused ⏸"
        leverStatus.TextColor3 = Color3.fromRGB(200, 200, 100)
    end
end)

task.spawn(function()
    while true do
        task.wait(1)
        if leverEnabled then
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

task.spawn(function()
    while true do
        task.wait(1)
        if not leverEnabled then continue end

        local rooms = nil
        pcall(function()
            rooms = game:GetService("Workspace").__THINGS.__INSTANCE_CONTAINER.Active.LuckyRaid.Rooms
        end)

        if not rooms then
            leverStatus.Text = "Waiting for raid..."
            leverStatus.TextColor3 = Color3.fromRGB(180, 180, 180)
            continue
        end

        local char = lp.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end

        local allDone = true
        for i, roomName in pairs({"Boss1", "Boss2", "Boss3"}) do
            if not leverEnabled then break end
            local room = rooms:FindFirstChild(roomName)
            if not room then continue end
            local lever = room:FindFirstChild("Lever")
            if not lever then continue end
            if isActivated(lever) then continue end

            local dist = getDistance(hrp, lever)
            if dist > MAX_DISTANCE then continue end

            allDone = false
            pcall(function() Network.Invoke("LuckyRaid_PullLever", i) end)
            task.wait(0.35)
        end

        if allDone then
            leverStatus.Text = "✅ All levers done!"
            leverStatus.TextColor3 = Color3.fromRGB(80, 200, 120)
        else
            leverStatus.Text = "Running..."
            leverStatus.TextColor3 = Color3.fromRGB(80, 200, 120)
        end
    end
end)
