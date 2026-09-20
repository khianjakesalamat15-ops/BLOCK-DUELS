-- ============================================================
-- BLOCK DUELS - INTRO + MAIN SCRIPT
-- ============================================================

-- ============================================================
-- BLOCK DUELS INTRO - STANDALONE VERSION
-- ============================================================
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
local Lighting = game:GetService("Lighting")

local LP = Players.LocalPlayer
if not LP then LP = Players.PlayerAdded:Wait() end

local function showIntro()
    local playerGui = LP:WaitForChild("PlayerGui")

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "BlockDuelsIntro"
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = playerGui

    local introSkipped = false
    local skipConnection = nil
    local introSound = nil

    local SOUND_ID = 120267378058133
    local SKIP_SECONDS = 10

    local blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = Lighting

    local overlay = Instance.new("Frame")
    overlay.Size = UDim2.fromScale(1, 1)
    overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    overlay.BackgroundTransparency = 0.3
    overlay.BorderSizePixel = 0
    overlay.ZIndex = 1
    overlay.Parent = screenGui

    local darkOverlay = Instance.new("Frame")
    darkOverlay.Size = UDim2.fromScale(1, 1)
    darkOverlay.BackgroundColor3 = Color3.fromRGB(5, 5, 10)
    darkOverlay.BackgroundTransparency = 0.5
    darkOverlay.BorderSizePixel = 0
    darkOverlay.ZIndex = 1
    darkOverlay.Parent = screenGui

    local vignette = Instance.new("ImageLabel")
    vignette.Size = UDim2.fromScale(1, 1)
    vignette.BackgroundTransparency = 1
    vignette.Image = "rbxassetid://195611797"
    vignette.ImageColor3 = Color3.fromRGB(0, 0, 0)
    vignette.ImageTransparency = 0.35
    vignette.ZIndex = 2
    vignette.Parent = screenGui

    local container = Instance.new("Frame")
    container.Size = UDim2.new(0, 850, 0, 130)
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.Position = UDim2.new(0.5, 0, 0.5, 0)
    container.BackgroundTransparency = 1
    container.BorderSizePixel = 0
    container.ClipsDescendants = false
    container.ZIndex = 5
    container.Parent = screenGui

    local mainLabel = Instance.new("TextLabel")
    mainLabel.Size = UDim2.new(1, 0, 1, 0)
    mainLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    mainLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainLabel.BackgroundTransparency = 1
    mainLabel.Text = "BLOCK DUELS"
    mainLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    mainLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    mainLabel.TextStrokeTransparency = 0
    mainLabel.Font = Enum.Font.GothamBlack
    mainLabel.TextSize = 88
    mainLabel.TextXAlignment = Enum.TextXAlignment.Center
    mainLabel.TextTransparency = 1
    mainLabel.ZIndex = 5
    mainLabel.Parent = container

    local leftLabel = Instance.new("TextLabel")
    leftLabel.Size = UDim2.new(0, 400, 1, 0)
    leftLabel.AnchorPoint = Vector2.new(1, 0.5)
    leftLabel.Position = UDim2.new(0.5, -10, 0.5, 0)
    leftLabel.BackgroundTransparency = 1
    leftLabel.Text = "BLOCK"
    leftLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    leftLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    leftLabel.TextStrokeTransparency = 0
    leftLabel.Font = Enum.Font.GothamBlack
    leftLabel.TextSize = 88
    leftLabel.TextXAlignment = Enum.TextXAlignment.Right
    leftLabel.TextTransparency = 1
    leftLabel.ZIndex = 5
    leftLabel.Visible = true
    leftLabel.Parent = container

    local rightLabel = Instance.new("TextLabel")
    rightLabel.Size = UDim2.new(0, 250, 1, 0)
    rightLabel.AnchorPoint = Vector2.new(0, 0.5)
    rightLabel.Position = UDim2.new(0.5, -10, 0.5, 0)
    rightLabel.BackgroundTransparency = 1
    rightLabel.Text = "DUELS"
    rightLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    rightLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    rightLabel.TextStrokeTransparency = 0
    rightLabel.Font = Enum.Font.GothamBlack
    rightLabel.TextSize = 88
    rightLabel.TextXAlignment = Enum.TextXAlignment.Left
    rightLabel.TextTransparency = 1
    rightLabel.ZIndex = 5
    rightLabel.Visible = true
    rightLabel.Parent = container

    local lightBeam = Instance.new("Frame")
    lightBeam.Size = UDim2.new(0, 0, 1.1, 0)
    lightBeam.AnchorPoint = Vector2.new(0, 0.5)
    lightBeam.Position = UDim2.new(0, -20, 0.5, 0)
    lightBeam.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    lightBeam.BackgroundTransparency = 0.5
    lightBeam.BorderSizePixel = 0
    lightBeam.ZIndex = 6
    lightBeam.Parent = container

    local beamGlow = Instance.new("Frame")
    beamGlow.Size = UDim2.new(0, 0, 1.3, 0)
    beamGlow.AnchorPoint = Vector2.new(0, 0.5)
    beamGlow.Position = UDim2.new(0, -20, 0.5, 0)
    beamGlow.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    beamGlow.BackgroundTransparency = 0.7
    beamGlow.BorderSizePixel = 0
    beamGlow.ZIndex = 5
    beamGlow.Parent = container

    local beamSparkles = Instance.new("Frame")
    beamSparkles.Size = UDim2.new(0, 0, 1, 0)
    beamSparkles.AnchorPoint = Vector2.new(0, 0.5)
    beamSparkles.Position = UDim2.new(0, -20, 0.5, 0)
    beamSparkles.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    beamSparkles.BackgroundTransparency = 0.8
    beamSparkles.BorderSizePixel = 0
    beamSparkles.ZIndex = 7
    beamSparkles.Parent = container

    local subLabel = Instance.new("TextLabel")
    subLabel.Size = UDim2.new(1, 0, 0, 40)
    subLabel.AnchorPoint = Vector2.new(0.5, 0)
    subLabel.Position = UDim2.new(0.5, 0, 0.5, 70)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = "THE ONE THAT DOMINATES ALL. . ."
    subLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    subLabel.Font = Enum.Font.GothamBold
    subLabel.TextSize = 14
    subLabel.TextXAlignment = Enum.TextXAlignment.Center
    subLabel.TextTransparency = 1
    subLabel.ZIndex = 5
    subLabel.Parent = screenGui

    local subLabel2 = Instance.new("TextLabel")
    subLabel2.Size = UDim2.new(1, 0, 0, 25)
    subLabel2.AnchorPoint = Vector2.new(0.5, 0)
    subLabel2.Position = UDim2.new(0.5, 0, 0.5, 105)
    subLabel2.BackgroundTransparency = 1
    subLabel2.Text = "TAP THE SCREEN TO SKIP INTRO"
    subLabel2.TextColor3 = Color3.fromRGB(150, 150, 150)
    subLabel2.Font = Enum.Font.Gotham
    subLabel2.TextSize = 11
    subLabel2.TextXAlignment = Enum.TextXAlignment.Center
    subLabel2.TextTransparency = 1
    subLabel2.ZIndex = 5
    subLabel2.Parent = screenGui

    local accentBar = Instance.new("Frame")
    accentBar.Size = UDim2.new(0, 0, 0, 2)
    accentBar.AnchorPoint = Vector2.new(0.5, 0)
    accentBar.Position = UDim2.new(0.5, 0, 0.5, 62)
    accentBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    accentBar.BackgroundTransparency = 0
    accentBar.BorderSizePixel = 0
    accentBar.ZIndex = 5
    accentBar.Parent = screenGui

    local flashFrame = Instance.new("Frame")
    flashFrame.Size = UDim2.fromScale(1, 1)
    flashFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    flashFrame.BackgroundTransparency = 1
    flashFrame.BorderSizePixel = 0
    flashFrame.ZIndex = 10
    flashFrame.Parent = screenGui

    local glitchContainer = Instance.new("Frame")
    glitchContainer.Size = UDim2.new(1, 0, 1, 0)
    glitchContainer.BackgroundTransparency = 1
    glitchContainer.ZIndex = 6
    glitchContainer.Parent = screenGui

    local dripContainer = Instance.new("Frame")
    dripContainer.Size = UDim2.new(1, 0, 1, 0)
    dripContainer.BackgroundTransparency = 1
    dripContainer.ZIndex = 7
    dripContainer.Parent = screenGui

    local tapToRemoveLabel = Instance.new("TextLabel")
    tapToRemoveLabel.Size = UDim2.new(0, 150, 0, 24)
    tapToRemoveLabel.AnchorPoint = Vector2.new(0.5, 1)
    tapToRemoveLabel.Position = UDim2.new(0.5, 0, 1, -20)
    tapToRemoveLabel.BackgroundTransparency = 1
    tapToRemoveLabel.Text = "✦ TAP TO REMOVE ✦"
    tapToRemoveLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    tapToRemoveLabel.Font = Enum.Font.GothamBold
    tapToRemoveLabel.TextSize = 10
    tapToRemoveLabel.TextXAlignment = Enum.TextXAlignment.Center
    tapToRemoveLabel.TextTransparency = 0.5
    tapToRemoveLabel.ZIndex = 15
    tapToRemoveLabel.Parent = screenGui

    local function doFlash(color, alpha, duration)
        flashFrame.BackgroundColor3 = color or Color3.new(1,1,1)
        flashFrame.BackgroundTransparency = 1 - (alpha or 0.85)
        task.delay(duration or 0.06, function()
            if not introSkipped then
                TweenService:Create(
                    flashFrame,
                    TweenInfo.new(0.1, Enum.EasingStyle.Quad),
                    {BackgroundTransparency = 1}
                ):Play()
            else
                flashFrame.BackgroundTransparency = 1
            end
        end)
    end

    local function runLightBeam()
        lightBeam.Size = UDim2.new(0, 45, 1.1, 0)
        beamGlow.Size = UDim2.new(0, 65, 1.3, 0)
        beamSparkles.Size = UDim2.new(0, 45, 1, 0)

        lightBeam.BackgroundTransparency = 0.35
        beamGlow.BackgroundTransparency = 0.55
        beamSparkles.BackgroundTransparency = 0.75

        local beamTween = TweenService:Create(
            lightBeam,
            TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
            {Position = UDim2.new(1, 20, 0.5, 0)}
        )
        beamTween:Play()

        local glowTween = TweenService:Create(
            beamGlow,
            TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
            {Position = UDim2.new(1, 20, 0.5, 0)}
        )
        glowTween:Play()

        local sparkleTween = TweenService:Create(
            beamSparkles,
            TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
            {Position = UDim2.new(1, 20, 0.5, 0)}
        )
        sparkleTween:Play()

        local pulseCount = 0
        local pulseConnection

        pulseConnection = RunService.Heartbeat:Connect(function()
            if introSkipped then
                if pulseConnection then pulseConnection:Disconnect() end
                return
            end

            pulseCount = pulseCount + 1

            if pulseCount % 3 == 0 then
                local pulseIntensity = 0.3 + math.sin(pulseCount * 0.5) * 0.15
                lightBeam.BackgroundTransparency = 0.3 - (pulseIntensity * 0.2)
                beamGlow.BackgroundTransparency = 0.5 - (pulseIntensity * 0.1)
                beamSparkles.BackgroundTransparency = 0.7 - (pulseIntensity * 0.15)
            end
        end)

        beamTween.Completed:Wait()

        if pulseConnection then pulseConnection:Disconnect() end

        TweenService:Create(
            lightBeam,
            TweenInfo.new(0.25),
            {
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 0, 1.1, 0)
            }
        ):Play()

        TweenService:Create(
            beamGlow,
            TweenInfo.new(0.25),
            {
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 0, 1.3, 0)
            }
        ):Play()

        TweenService:Create(
            beamSparkles,
            TweenInfo.new(0.25),
            {
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 0, 1, 0)
            }
        ):Play()
    end

    local glitchChars = {
        "!", "#", "%", "/", "[", "]", "░", "▒",
        "▓", "—", "=", "*", "^", "~", "¦", "¤"
    }

    local function glitchText(lbl, original)
        if introSkipped then return end

        for i = 1, 4 do
            if introSkipped then break end

            local s = ""

            for c in original:gmatch(".") do
                s = s .. (
                    math.random() < 0.35
                    and glitchChars[math.random(#glitchChars)]
                    or c
                )
            end

            lbl.Text = s
            task.wait(0.03)
        end

        if not introSkipped then
            lbl.Text = original
        end
    end

    local function addGlitchBar()
        local bar = Instance.new("Frame")
        bar.Size = UDim2.new(1, 0, 0, math.random(2, 12))
        bar.Position = UDim2.new(0, 0, math.random(10, 90)/100, 0)
        bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        bar.BackgroundTransparency = math.random(45, 70) / 100
        bar.BorderSizePixel = 0
        bar.ZIndex = 6
        bar.Parent = glitchContainer

        task.delay(0.1, function()
            if bar then
                TweenService:Create(
                    bar,
                    TweenInfo.new(0.1),
                    {BackgroundTransparency = 1}
                ):Play()

                task.delay(0.1, function()
                    if bar then bar:Destroy() end
                end)
            end
        end)
    end

    local function setupAudio()
        introSound = Instance.new("Sound")
        introSound.SoundId = "rbxassetid://" .. SOUND_ID
        introSound.Volume = 0.7
        introSound.PlayOnRemove = false
        introSound.Parent = screenGui
        introSound.Loaded:Wait()
        introSound:Play()
        introSound.TimePosition = SKIP_SECONDS
        return introSound
    end

    local function stopAudio()
        if introSound then
            introSound:Stop()
            introSound:Destroy()
        end
    end

    local activeDrips = 0

    local function createDrip(startX, startY, width, height, duration, delay)
        task.wait(delay)
        if introSkipped then return end

        activeDrips = activeDrips + 1

        local drip = Instance.new("Frame")
        drip.Size = UDim2.new(0, width, 0, height)
        drip.Position = UDim2.new(0.5, startX, 0.5, startY)
        drip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        drip.BackgroundTransparency = 0.25
        drip.BorderSizePixel = 0
        drip.ZIndex = 7
        drip.Parent = dripContainer

        local stretch = TweenService:Create(
            drip,
            TweenInfo.new(duration * 0.35),
            {
                Size = UDim2.new(0, width, 0, height + 22),
                BackgroundTransparency = 0.1
            }
        )
        stretch:Play()

        task.wait(duration * 0.35)

        if introSkipped then
            drip:Destroy()
            activeDrips = activeDrips - 1
            return
        end

        local fall = TweenService:Create(
            drip,
            TweenInfo.new(
                duration * 0.65,
                Enum.EasingStyle.Quad,
                Enum.EasingDirection.In
            ),
            {
                Position = UDim2.new(
                    0.5,
                    startX + math.random(-3, 3),
                    0.5,
                    startY + 80
                ),
                BackgroundTransparency = 1
            }
        )
        fall:Play()

        fall.Completed:Connect(function()
            drip:Destroy()
            activeDrips = activeDrips - 1
        end)
    end

    local function startDripping()
        if introSkipped then return end

        local fullText = "BLOCK DUELS"
        local font = Enum.Font.GothamBlack
        local textSize = 88

        local textBoundsFull = TextService:GetTextSize(
            fullText,
            textSize,
            font,
            Vector2.new(math.huge, math.huge)
        )

        local textHeight = textBoundsFull.Y
        local drips = {}
        local delayCounter = 0

        for i = 1, #fullText do
            local char = fullText:sub(i, i)

            local charBounds = TextService:GetTextSize(
                char,
                textSize,
                font,
                Vector2.new(math.huge, math.huge)
            )

            local charWidth = charBounds.X
            local precedingText = fullText:sub(1, i - 1)
            local precedingWidth = 0

            if i > 1 then
                precedingWidth = TextService:GetTextSize(
                    precedingText,
                    textSize,
                    font,
                    Vector2.new(math.huge, math.huge)
                ).X
            end

            local totalTextWidth = textBoundsFull.X
            local leftEdgeOffset = -totalTextWidth / 2
            local charLeft = leftEdgeOffset + precedingWidth
            local charCenterX = charLeft + charWidth / 2
            local startY = textHeight / 2 + 3

            local rx = math.random(-2, 2)
            local ry = math.random(0, 4)

            local dripWidth = math.clamp(math.floor(charWidth * 0.35), 3, 7)
            local dripHeight = math.random(4, 7)
            local duration = 0.5 + math.random() * 0.2
            local delay = delayCounter * 0.07

            table.insert(drips, {
                startX = charCenterX + rx,
                startY = startY + ry,
                width = dripWidth,
                height = dripHeight,
                duration = duration,
                delay = delay
            })

            delayCounter = delayCounter + 1
        end

        for _, d in ipairs(drips) do
            if introSkipped then break end

            createDrip(
                d.startX,
                d.startY,
                d.width,
                d.height,
                d.duration,
                d.delay
            )
        end
    end

    local function skipIntro()
        if introSkipped then return end

        introSkipped = true
        stopAudio()

        if skipConnection then skipConnection:Disconnect() end

        doFlash(Color3.fromRGB(255, 255, 255), 0.8, 0.1)

        mainLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        mainLabel.Text = "BLOCK DUELS"

        local fadeInfo = TweenInfo.new(
            0.25,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.In
        )

        TweenService:Create(mainLabel, fadeInfo, {
            TextTransparency = 1
        }):Play()

        TweenService:Create(leftLabel, fadeInfo, {
            TextTransparency = 1
        }):Play()

        TweenService:Create(rightLabel, fadeInfo, {
            TextTransparency = 1
        }):Play()

        TweenService:Create(subLabel, fadeInfo, {
            TextTransparency = 1
        }):Play()

        TweenService:Create(subLabel2, fadeInfo, {
            TextTransparency = 1
        }):Play()

        TweenService:Create(accentBar, fadeInfo, {
            BackgroundTransparency = 1
        }):Play()

        TweenService:Create(overlay, fadeInfo, {
            BackgroundTransparency = 1
        }):Play()

        TweenService:Create(darkOverlay, fadeInfo, {
            BackgroundTransparency = 1
        }):Play()

        TweenService:Create(
            blur,
            TweenInfo.new(0.25),
            {Size = 0}
        ):Play()

        task.wait(0.3)

        screenGui:Destroy()
        blur:Destroy()
    end

    local function playIntro()
        setupAudio()

        skipConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end

            if input.UserInputType == Enum.UserInputType.Touch
                or input.UserInputType == Enum.UserInputType.MouseButton1 then
                skipIntro()
            end
        end)

        task.spawn(function()
            while not introSkipped and tapToRemoveLabel.Parent do
                for t = 0.4, 0.8, 0.05 do
                    if introSkipped then break end
                    tapToRemoveLabel.TextTransparency = t
                    task.wait(0.05)
                end

                for t = 0.8, 0.4, -0.05 do
                    if introSkipped then break end
                    tapToRemoveLabel.TextTransparency = t
                    task.wait(0.05)
                end
            end
        end)

        leftLabel.Position = UDim2.new(-0.9, 0, -0.6, 0)
        rightLabel.Position = UDim2.new(1.9, 0, 1.6, 0)
        leftLabel.Rotation = -30
        rightLabel.Rotation = 30
        mainLabel.TextTransparency = 1

        TweenService:Create(
            blur,
            TweenInfo.new(0.7),
            {Size = 18}
        ):Play()

        TweenService:Create(
            overlay,
            TweenInfo.new(0.7),
            {BackgroundTransparency = 0.2}
        ):Play()

        TweenService:Create(
            darkOverlay,
            TweenInfo.new(0.7),
            {BackgroundTransparency = 0.4}
        ):Play()

        task.wait(0.35)

        if introSkipped then return end

        TweenService:Create(leftLabel, TweenInfo.new(0.45), {
            TextTransparency = 0
        }):Play()

        TweenService:Create(rightLabel, TweenInfo.new(0.45), {
            TextTransparency = 0
        }):Play()

        TweenService:Create(
            leftLabel,
            TweenInfo.new(
                0.55,
                Enum.EasingStyle.Elastic,
                Enum.EasingDirection.Out
            ),
            {
                Position = UDim2.new(0.5, -10, 0.5, 0),
                Rotation = 0
            }
        ):Play()

        TweenService:Create(
            rightLabel,
            TweenInfo.new(
                0.55,
                Enum.EasingStyle.Elastic,
                Enum.EasingDirection.Out
            ),
            {
                Position = UDim2.new(0.5, -10, 0.5, 0),
                Rotation = 0
            }
        ):Play()

        TweenService:Create(
            accentBar,
            TweenInfo.new(
                0.7,
                Enum.EasingStyle.Quad,
                Enum.EasingDirection.Out
            ),
            {
                Size = UDim2.new(0.4, 0, 0, 2)
            }
        ):Play()

        TweenService:Create(
            subLabel,
            TweenInfo.new(0.6, Enum.EasingStyle.Quad),
            {TextTransparency = 0}
        ):Play()

        TweenService:Create(
            subLabel2,
            TweenInfo.new(0.6, Enum.EasingStyle.Quad),
            {TextTransparency = 0.3}
        ):Play()

        task.wait(0.45)

        if introSkipped then return end

        runLightBeam()
        doFlash(Color3.fromRGB(255, 255, 255), 0.85, 0.08)

        task.wait(0.1)

        if introSkipped then return end

        glitchText(leftLabel, "BLOCK")
        glitchText(rightLabel, "DUELS")

        doFlash(Color3.fromRGB(200, 200, 255), 0.6, 0.06)

        TweenService:Create(
            accentBar,
            TweenInfo.new(0.5),
            {
                Size = UDim2.new(0.6, 0, 0, 2)
            }
        ):Play()

        task.wait(0.3)

        if introSkipped then return end

        startDripping()

        for i = 1, 3 do
            if introSkipped then break end

            task.wait(0.15 + math.random() * 0.1)

            if not introSkipped then
                addGlitchBar()
                doFlash(
                    Color3.fromRGB(255, 255, 255),
                    0.3,
                    0.04
                )
            end
        end

        task.wait(0.5)

        if introSkipped then return end

        task.wait(3.5)

        if not introSkipped then
            skipIntro()
        end
    end

    playIntro()
end

task.spawn(showIntro)

task.wait(1.5)

-- ============================================================
-- BLOCK DUELS MAIN SCRIPT
-- ============================================================

--[[
    BLOCK DUELS
    All rights reserved.
--]]

repeat task.wait() until game:IsLoaded()
local Players,RunService,UIS,TS,Lighting,HS = game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),game:GetService("TweenService"),game:GetService("Lighting"),game:GetService("HttpService")
local LP = Players.LocalPlayer
local NS,CS = 60,29
local LAGGER_SPEED = 15
local LAGGER_CARRY_SPEED = 24.5
local speedMode,antiRagdollEnabled,infJumpEnabled = false,false,false
local laggerToggled = false
local laggerPhase = 0
local medusaCounterEnabled = false
local batCounterEnabled = false
local unwalkEnabled = false
local medusaDebounce,medusaLastUsed,dropActive = false,0,false
local autoLeftEnabled,autoRightEnabled = false,false
local autoLeftSetVisual,autoRightSetVisual = nil,nil
local speedLabel = nil
local autoBatEnabled = false
local autoSwingEnabled = true
local autoBatSetVisual = nil
local _autoBatTarget = nil
local resetAutoBatMotion = nil
local _batSwingCooldown = 0
local BAT_SWING_INTERVAL = 0.08
local AUTO_BAT_SPEED = 60
local setBatCounterVisual = nil
local startBatCounter,stopBatCounter
local antiLagEnabled = false
local removeAccessoriesEnabled = false
local antiLagDescConn = nil
local stretchRezEnabled = false
local stretchRezConn = nil
local setStretchRezVisual = nil

local _anyKeyListening = false
local autoTPConn = nil
local setAutoTPVisual = nil

-- ============================================
-- PROXY BYPASS SYSTEM
-- ============================================

local _alProxy = {part=nil, weld=nil}
local _alCleanupProxy = function()
    if _alProxy.part then pcall(function() _alProxy.part:Destroy() end) end
    if _alProxy.weld then pcall(function() _alProxy.weld:Destroy() end) end
    _alProxy.part, _alProxy.weld = nil, nil
end
local _alCreateProxy = function()
    _alCleanupProxy()
    local c = LP.Character
    local hrp = c and c:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    _alProxy.part = Instance.new("Part")
    _alProxy.part.Name = "ZHAutoLProxy"
    _alProxy.part.Size = Vector3.new(1,1,1)
    _alProxy.part.Transparency = 1
    _alProxy.part.CanCollide = false
    _alProxy.part.Massless = true
    _alProxy.part.Parent = c
    _alProxy.weld = Instance.new("Weld")
    _alProxy.weld.Part0 = hrp
    _alProxy.weld.Part1 = _alProxy.part
    _alProxy.weld.C0 = CFrame.new(0,0,0)
    _alProxy.weld.Parent = _alProxy.part
end

local _arBypassPart, _arBypassWeld = nil, nil
local _arCleanupProxy = function()
    if _arBypassPart then pcall(function() _arBypassPart:Destroy() end) end
    if _arBypassWeld then pcall(function() _arBypassWeld:Destroy() end) end
    _arBypassPart, _arBypassWeld = nil, nil
end
local _arCreateProxy = function()
    _arCleanupProxy()
    local c = LP.Character
    local hrp = c and c:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    _arBypassPart = Instance.new("Part")
    _arBypassPart.Name = "ZHAutoRProxy"
    _arBypassPart.Size = Vector3.new(1,1,1)
    _arBypassPart.Transparency = 1
    _arBypassPart.CanCollide = false
    _arBypassPart.Massless = true
    _arBypassPart.Parent = c
    _arBypassWeld = Instance.new("Weld")
    _arBypassWeld.Part0 = hrp
    _arBypassWeld.Part1 = _arBypassPart
    _arBypassWeld.C0 = CFrame.new(0,0,0)
    _arBypassWeld.Parent = _arBypassPart
end

local _batProxyPart = nil
local _batProxyWeld = nil
local _batCleanupProxy = function()
    if _batProxyPart then pcall(function() _batProxyPart:Destroy() end) end
    if _batProxyWeld then pcall(function() _batProxyWeld:Destroy() end) end
    _batProxyPart, _batProxyWeld = nil, nil
end
local _batCreateProxy = function()
    _batCleanupProxy()
    local c = LP.Character
    local hrp = c and c:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    _batProxyPart = Instance.new("Part")
    _batProxyPart.Name = "ZHBatProxy"
    _batProxyPart.Size = Vector3.new(1,1,1)
    _batProxyPart.Transparency = 1
    _batProxyPart.CanCollide = false
    _batProxyPart.Massless = true
    _batProxyPart.Parent = c
    _batProxyWeld = Instance.new("Weld")
    _batProxyWeld.Part0 = hrp
    _batProxyWeld.Part1 = _batProxyPart
    _batProxyWeld.C0 = CFrame.new(0,0,0)
    _batProxyWeld.Parent = _batProxyPart
end

local _antiDesyncProxyPart = nil
local _antiDesyncProxyWeld = nil
local _antiDesyncCleanupProxy = function()
    if _antiDesyncProxyPart then pcall(function() _antiDesyncProxyPart:Destroy() end) end
    if _antiDesyncProxyWeld then pcall(function() _antiDesyncProxyWeld:Destroy() end) end
    _antiDesyncProxyPart, _antiDesyncProxyWeld = nil, nil
end
local _antiDesyncCreateProxy = function()
    _antiDesyncCleanupProxy()
    local c = LP.Character
    local hrp = c and c:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    _antiDesyncProxyPart = Instance.new("Part")
    _antiDesyncProxyPart.Name = "ZHADProxy"
    _antiDesyncProxyPart.Size = Vector3.new(1,1,1)
    _antiDesyncProxyPart.Transparency = 1
    _antiDesyncProxyPart.CanCollide = false
    _antiDesyncProxyPart.Massless = true
    _antiDesyncProxyPart.Parent = c
    _antiDesyncProxyWeld = Instance.new("Weld")
    _antiDesyncProxyWeld.Part0 = hrp
    _antiDesyncProxyWeld.Part1 = _antiDesyncProxyPart
    _antiDesyncProxyWeld.C0 = CFrame.new(0,0,0)
    _antiDesyncProxyWeld.Parent = _antiDesyncProxyPart
end

-- ============================================
-- SKY THEME SYSTEM
-- ============================================

SKY_PRESETS_LIST = {
    "Off",
    "Night",
    "Aurora",
    "Sunset",
    "Galaxy",
    "Tech",
    "Sakura",
    "Pink Night",
    "Blood Moon",
    "Emerald Dawn",
    "Volcanic",
    "Arctic",
    "Midnight Ocean",
    "Vaporwave",
    "Toxic",
    "Solar Eclipse",
    "Hellscape",
    "Heaven",
    "Storm",
    "Sunrise",
    "Deep Space",
    "Lavender Dream",
    "Inferno",
    "Mint Sky"
}

SKY_PRESETS = {
    ["Off"] = {kind = "off"},
    
    ["Night"] = {
        clock = 22,
        brightness = 2,
        ambient = {110, 100, 130},
        outAmb = {120, 110, 140},
        sky = {stars = 4000, moon = 18, sun = 0, moonTex = true},
        atm = {dens = 0.45, color = {120, 60, 180}, decay = {60, 20, 100}, glare = 0.5, haze = 1.2}
    },
    
    ["Aurora"] = {
        clock = 14,
        brightness = 3,
        ambient = {150, 120, 150},
        outAmb = {160, 130, 150},
        atm = {dens = 0.55, color = {255, 80, 200}, decay = {255, 20, 150}, glare = 2.5, haze = 3},
        clouds = {cover = 0.7, dens = 0.7, color = {255, 240, 250}}
    },
    
    ["Sunset"] = {
        clock = 17.2,
        brightness = 2.5,
        ambient = {170, 120, 100},
        outAmb = {180, 130, 110},
        sky = {stars = 0, sun = 25, moon = 0},
        atm = {dens = 0.5, color = {255, 130, 60}, decay = {255, 80, 30}, glare = 2, haze = 2.5},
        clouds = {cover = 0.55, dens = 0.55, color = {255, 200, 140}}
    },
    
    ["Galaxy"] = {
        clock = 0,
        brightness = 1.5,
        ambient = {70, 60, 100},
        outAmb = {80, 70, 110},
        sky = {stars = 10000, moon = 30, sun = 0},
        atm = {dens = 0.15, color = {40, 20, 80}, decay = {20, 10, 50}, glare = 0.3, haze = 0.5}
    },
    
    ["Tech"] = {
        clock = 21,
        brightness = 2.2,
        ambient = {90, 130, 170},
        outAmb = {100, 140, 180},
        sky = {stars = 2000, moon = 12},
        atm = {dens = 0.4, color = {0, 200, 255}, decay = {150, 0, 255}, glare = 2, haze = 2},
        clouds = {cover = 0.4, dens = 0.6, color = {100, 200, 255}}
    },
    
    ["Sakura"] = {
        clock = 11,
        brightness = 3.5,
        ambient = {170, 150, 160},
        outAmb = {180, 160, 170},
        sky = {sun = 8},
        atm = {dens = 0.3, color = {255, 200, 220}, decay = {255, 170, 200}, glare = 1, haze = 1.5},
        clouds = {cover = 0.6, dens = 0.4, color = {255, 250, 252}}
    },
    
    ["Pink Night"] = {
        clock = 23,
        brightness = 2.2,
        ambient = {120, 60, 110},
        outAmb = {140, 70, 120},
        sky = {stars = 5000, moon = 22, sun = 0, moonTex = true},
        atm = {dens = 0.5, color = {255, 80, 180}, decay = {140, 30, 100}, glare = 0.7, haze = 1.4},
        clouds = {cover = 0.3, dens = 0.5, color = {180, 90, 150}}
    },
    
    ["Blood Moon"] = {
        clock = 22.5,
        brightness = 1.6,
        ambient = {130, 40, 40},
        outAmb = {150, 50, 50},
        sky = {stars = 1500, moon = 28, sun = 0, moonTex = true},
        atm = {dens = 0.6, color = {220, 30, 30}, decay = {120, 10, 10}, glare = 1.4, haze = 2},
        clouds = {cover = 0.5, dens = 0.7, color = {120, 30, 30}}
    },
    
    ["Emerald Dawn"] = {
        clock = 6.5,
        brightness = 2.8,
        ambient = {130, 170, 140},
        outAmb = {140, 180, 150},
        sky = {sun = 18, moon = 0, stars = 0},
        atm = {dens = 0.4, color = {80, 200, 140}, decay = {40, 150, 90}, glare = 1.8, haze = 2.2},
        clouds = {cover = 0.5, dens = 0.5, color = {200, 255, 220}}
    },
    
    ["Volcanic"] = {
        clock = 19,
        brightness = 2,
        ambient = {180, 80, 40},
        outAmb = {200, 90, 50},
        sky = {stars = 200, sun = 12, moon = 0},
        atm = {dens = 0.75, color = {255, 60, 0}, decay = {180, 20, 0}, glare = 3, haze = 3.5},
        clouds = {cover = 0.8, dens = 0.9, color = {120, 40, 20}}
    },
    
    ["Arctic"] = {
        clock = 9,
        brightness = 3.2,
        ambient = {200, 220, 235},
        outAmb = {210, 230, 245},
        sky = {sun = 10, stars = 0, moon = 0},
        atm = {dens = 0.3, color = {180, 220, 255}, decay = {140, 200, 240}, glare = 1.5, haze = 1.8},
        clouds = {cover = 0.7, dens = 0.6, color = {250, 253, 255}}
    },
    
    ["Midnight Ocean"] = {
        clock = 1.5,
        brightness = 1.7,
        ambient = {60, 90, 130},
        outAmb = {70, 100, 140},
        sky = {stars = 6000, moon = 24, sun = 0, moonTex = true},
        atm = {dens = 0.5, color = {20, 60, 140}, decay = {10, 30, 90}, glare = 0.6, haze = 1.5}
    },
    
    ["Vaporwave"] = {
        clock = 19.5,
        brightness = 2.4,
        ambient = {180, 120, 200},
        outAmb = {190, 130, 210},
        sky = {stars = 1000, moon = 14},
        atm = {dens = 0.45, color = {255, 100, 220}, decay = {120, 60, 255}, glare = 2.2, haze = 2.4},
        clouds = {cover = 0.5, dens = 0.55, color = {200, 150, 255}}
    },
    
    ["Toxic"] = {
        clock = 13,
        brightness = 2.5,
        ambient = {140, 180, 80},
        outAmb = {150, 190, 90},
        atm = {dens = 0.55, color = {100, 220, 40}, decay = {60, 150, 20}, glare = 1.8, haze = 2.6},
        clouds = {cover = 0.65, dens = 0.7, color = {180, 255, 120}}
    },
    
    ["Solar Eclipse"] = {
        clock = 12,
        brightness = 0.9,
        ambient = {50, 40, 60},
        outAmb = {60, 50, 70},
        sky = {stars = 3500, sun = 22, moon = 0},
        atm = {dens = 0.5, color = {255, 140, 40}, decay = {30, 20, 40}, glare = 2.8, haze = 1.8}
    },
    
    ["Hellscape"] = {
        clock = 18,
        brightness = 1.8,
        ambient = {200, 60, 30},
        outAmb = {220, 70, 40},
        sky = {stars = 100, sun = 30, moon = 0},
        atm = {dens = 0.85, color = {255, 30, 0}, decay = {120, 0, 0}, glare = 3.5, haze = 4},
        clouds = {cover = 0.95, dens = 0.95, color = {80, 20, 10}}
    },
    
    ["Heaven"] = {
        clock = 12,
        brightness = 4,
        ambient = {240, 235, 210},
        outAmb = {250, 245, 220},
        sky = {sun = 16, moon = 0, stars = 0},
        atm = {dens = 0.25, color = {255, 250, 220}, decay = {255, 240, 200}, glare = 3, haze = 1.5},
        clouds = {cover = 0.85, dens = 0.5, color = {255, 255, 255}}
    },
    
    ["Storm"] = {
        clock = 15,
        brightness = 1.4,
        ambient = {90, 90, 110},
        outAmb = {100, 100, 120},
        sky = {stars = 0, sun = 6, moon = 0},
        atm = {dens = 0.65, color = {80, 90, 120}, decay = {40, 50, 80}, glare = 0.5, haze = 3},
        clouds = {cover = 0.95, dens = 0.95, color = {60, 65, 80}}
    },
    
    ["Sunrise"] = {
        clock = 6.2,
        brightness = 2.8,
        ambient = {220, 180, 130},
        outAmb = {230, 190, 140},
        sky = {sun = 22, stars = 0, moon = 0},
        atm = {dens = 0.45, color = {255, 180, 100}, decay = {255, 140, 80}, glare = 2.4, haze = 2.2},
        clouds = {cover = 0.4, dens = 0.4, color = {255, 220, 180}}
    },
    
    ["Deep Space"] = {
        clock = 0,
        brightness = 1,
        ambient = {30, 25, 50},
        outAmb = {40, 35, 60},
        sky = {stars = 15000, moon = 0, sun = 0},
        atm = {dens = 0.08, color = {15, 5, 40}, decay = {5, 0, 20}, glare = 0.2, haze = 0.3}
    },
    
    ["Lavender Dream"] = {
        clock = 18.5,
        brightness = 2.6,
        ambient = {180, 160, 220},
        outAmb = {190, 170, 230},
        sky = {stars = 800, moon = 16, sun = 0},
        atm = {dens = 0.4, color = {200, 160, 255}, decay = {160, 120, 220}, glare = 1.4, haze = 1.8},
        clouds = {cover = 0.55, dens = 0.5, color = {220, 200, 255}}
    },
    
    ["Inferno"] = {
        clock = 17.5,
        brightness = 2.2,
        ambient = {220, 100, 40},
        outAmb = {235, 110, 50},
        sky = {sun = 26, moon = 0, stars = 0},
        atm = {dens = 0.6, color = {255, 90, 20}, decay = {200, 40, 0}, glare = 3, haze = 3.2},
        clouds = {cover = 0.7, dens = 0.7, color = {200, 80, 40}}
    },
    
    ["Mint Sky"] = {
        clock = 10,
        brightness = 3.2,
        ambient = {180, 230, 210},
        outAmb = {190, 240, 220},
        sky = {sun = 10},
        atm = {dens = 0.32, color = {150, 255, 210}, decay = {100, 220, 180}, glare = 1.6, haze = 1.6},
        clouds = {cover = 0.55, dens = 0.45, color = {240, 255, 250}}
    }
}

local skyTheme = "Off"
local skyValueLabel = nil
local skyIndex = 1

local function _vC3(t)
    if type(t) == "table" then
        return Color3.fromRGB(t[1] or 0, t[2] or 0, t[3] or 0)
    end
    return Color3.new(0, 0, 0)
end

local function _v4mpClearSky()
    for _, v in ipairs(Lighting:GetChildren()) do
        if v:GetAttribute("_AceDuelsSky") then
            pcall(function() v:Destroy() end)
        end
    end
    
    local terrain = Workspace:FindFirstChildOfClass("Terrain")
    if terrain then
        for _, v in ipairs(terrain:GetChildren()) do
            if v:GetAttribute("_AceDuelsSky") then
                pcall(function() v:Destroy() end)
            end
        end
    end
end

function applyCustomSky(mode)
    _v4mpClearSky()
    
    local preset = SKY_PRESETS[mode]
    if not preset or preset.kind == "off" then
        Lighting.FogEnd = 100000
        Lighting.FogStart = 0
        Lighting.FogColor = Color3.fromRGB(192, 192, 192)
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.GlobalShadows = true
        skyTheme = "Off"
        if skyValueLabel then skyValueLabel.Text = "Off" end
        return
    end
    
    Lighting.FogEnd = 100000
    Lighting.FogStart = 0
    Lighting.FogColor = Color3.fromRGB(200, 200, 200)
    Lighting.GlobalShadows = true
    Lighting.ClockTime = preset.clock or 14
    Lighting.Brightness = preset.brightness or 2
    
    if preset.outAmb then
        Lighting.OutdoorAmbient = _vC3(preset.outAmb)
    end
    if preset.ambient then
        Lighting.Ambient = _vC3(preset.ambient)
    end
    
    if preset.sky then
        local sky = Instance.new("Sky")
        sky:SetAttribute("_AceDuelsSky", true)
        
        if preset.sky.stars then
            sky.StarCount = preset.sky.stars
        end
        if preset.sky.moon then
            sky.MoonAngularSize = preset.sky.moon
        end
        if preset.sky.sun then
            sky.SunAngularSize = preset.sky.sun
        end
        if preset.sky.moonTex then
            sky.MoonTextureId = "rbxasset://sky/moon.jpg"
        end
        
        sky.Parent = Lighting
    end
    
    if preset.atm then
        local atm = Instance.new("Atmosphere")
        atm:SetAttribute("_AceDuelsSky", true)
        
        atm.Density = preset.atm.dens or 0.3
        atm.Color = _vC3(preset.atm.color)
        atm.Decay = _vC3(preset.atm.decay)
        atm.Glare = preset.atm.glare or 1
        atm.Haze = preset.atm.haze or 1
        
        atm.Parent = Lighting
    end
    
    if preset.clouds then
        local terrain = Workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            local clouds = Instance.new("Clouds")
            clouds:SetAttribute("_AceDuelsSky", true)
            
            clouds.Cover = preset.clouds.cover or 0.5
            clouds.Density = preset.clouds.dens or 0.5
            clouds.Color = _vC3(preset.clouds.color)
            
            clouds.Parent = terrain
        end
    end
    
    skyTheme = mode
    if skyValueLabel then skyValueLabel.Text = mode end
end

function skyThemeSelectorRow(parent, order)
    local row = Instance.new("Frame")
    row.Name = "Sky Theme"
    row.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    row.BackgroundTransparency = 0.28
    row.Size = UDim2.new(1, -4, 0, 42)
    row.BorderSizePixel = 0
    row.LayoutOrder = order or 20
    row.ZIndex = 4
    row.ClipsDescendants = true
    row.Parent = parent
    
    local corner = Instance.new("UICorner", row)
    corner.CornerRadius = UDim.new(0, 9)
    
    local stroke = Instance.new("UIStroke", row)
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Thickness = 1.15
    stroke.Transparency = 0.38
    
    local label = Instance.new("TextLabel", row)
    label.Name = "Label"
    label.BackgroundTransparency = 1
    label.Text = "Sky Theme"
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.TextStrokeTransparency = 0
    label.TextSize = 12
    label.Font = Enum.Font.GothamSemibold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Position = UDim2.new(0, 12, 0, 0)
    label.Size = UDim2.new(0, 92, 1, 0)
    label.ZIndex = 5
    
    local left = Instance.new("TextButton", row)
    left.Name = "SkyLeft"
    left.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    left.BackgroundTransparency = 0.04
    left.Text = "<"
    left.TextColor3 = Color3.fromRGB(255, 255, 255)
    left.TextSize = 12
    left.Font = Enum.Font.GothamSemibold
    left.Size = UDim2.new(0, 42, 0, 28)
    left.Position = UDim2.new(1, -186, 0.5, -14)
    left.BorderSizePixel = 0
    left.ZIndex = 8
    left.AutoButtonColor = false
    left.Parent = row
    
    local leftCorner = Instance.new("UICorner", left)
    leftCorner.CornerRadius = UDim.new(0, 8)
    
    local leftStroke = Instance.new("UIStroke", left)
    leftStroke.Color = Color3.fromRGB(255, 255, 255)
    leftStroke.Thickness = 1
    leftStroke.Transparency = 0.42
    
    local holder = Instance.new("Frame", row)
    holder.Name = "SkyValueHolder"
    holder.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    holder.BackgroundTransparency = 0.28
    holder.BorderSizePixel = 0
    holder.Size = UDim2.new(0, 92, 0, 28)
    holder.Position = UDim2.new(1, -139, 0.5, -14)
    holder.ClipsDescendants = true
    holder.ZIndex = 7
    
    local holderCorner = Instance.new("UICorner", holder)
    holderCorner.CornerRadius = UDim.new(0, 8)
    
    local holderStroke = Instance.new("UIStroke", holder)
    holderStroke.Color = Color3.fromRGB(255, 255, 255)
    holderStroke.Thickness = 1
    holderStroke.Transparency = 0.35
    
    skyValueLabel = Instance.new("TextLabel", holder)
    skyValueLabel.Name = "SkyValue"
    skyValueLabel.BackgroundTransparency = 1
    skyValueLabel.Text = skyTheme
    skyValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    skyValueLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    skyValueLabel.TextStrokeTransparency = 0
    skyValueLabel.TextSize = 12
    skyValueLabel.Font = Enum.Font.GothamSemibold
    skyValueLabel.TextXAlignment = Enum.TextXAlignment.Center
    skyValueLabel.Size = UDim2.new(1, 0, 1, 0)
    skyValueLabel.ZIndex = 9
    
    local right = Instance.new("TextButton", row)
    right.Name = "SkyRight"
    right.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    right.BackgroundTransparency = 0.04
    right.Text = ">"
    right.TextColor3 = Color3.fromRGB(255, 255, 255)
    right.TextSize = 12
    right.Font = Enum.Font.GothamSemibold
    right.Size = UDim2.new(0, 42, 0, 28)
    right.Position = UDim2.new(1, -42, 0.5, -14)
    right.BorderSizePixel = 0
    right.ZIndex = 8
    right.AutoButtonColor = false
    right.Parent = row
    
    local rightCorner = Instance.new("UICorner", right)
    rightCorner.CornerRadius = UDim.new(0, 8)
    
    local rightStroke = Instance.new("UIStroke", right)
    rightStroke.Color = Color3.fromRGB(255, 255, 255)
    rightStroke.Thickness = 1
    rightStroke.Transparency = 0.42
    
    for i, name in ipairs(SKY_PRESETS_LIST) do
        if name == skyTheme then
            skyIndex = i
            break
        end
    end
    
    local function setSkyIndex(nextIndex)
        if nextIndex < 1 then nextIndex = #SKY_PRESETS_LIST end
        if nextIndex > #SKY_PRESETS_LIST then nextIndex = 1 end
        skyIndex = nextIndex
        skyTheme = SKY_PRESETS_LIST[skyIndex]
        
        applyCustomSky(skyTheme)
        skyValueLabel.Text = skyTheme
        
        if saveConfig then pcall(saveConfig) end
    end
    
    left.Activated:Connect(function()
        setSkyIndex(skyIndex - 1)
    end)
    
    right.Activated:Connect(function()
        setSkyIndex(skyIndex + 1)
    end)
    
    return row
end

function getSkyTheme()
    return skyTheme
end

function setSkyTheme(mode)
    applyCustomSky(mode)
end

-- ============================================
-- RAGDOLL COUNTDOWN SYSTEM
-- ============================================

local ragdollCountdownEnabled = false
local ragdollCountdownLabel = nil
local ragdollCountdownConn = nil
local ragdollCountdownCharConn = nil
local ragdollCountdownEndTime = 0
local RAGDOLL_COUNTDOWN_SECONDS = 2.6
local overheadGui = nil
local overheadSpeedLabel = nil
setRagdollCountdownVisual = nil

function stopRagdollCountdown()
    if ragdollCountdownConn then 
        ragdollCountdownConn:Disconnect()
        ragdollCountdownConn = nil 
    end
    if ragdollCountdownCharConn then 
        ragdollCountdownCharConn:Disconnect()
        ragdollCountdownCharConn = nil 
    end
    if ragdollCountdownLabel then
        ragdollCountdownLabel.Visible = false
        ragdollCountdownLabel.Text = ""
    end
end

function hookRagdollCountdown(char)
    stopRagdollCountdown()
    if not ragdollCountdownEnabled then return end
    
    char = char or LP.Character
    if not char then return end
    
    local hum = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid", 4)
    if not hum then return end
    
    local function beginCountdown()
        ragdollCountdownEndTime = tick() + RAGDOLL_COUNTDOWN_SECONDS
        if ragdollCountdownLabel then
            ragdollCountdownLabel.Visible = true
        end
    end
    
    local function isRagdollStateForCountdown()
        local st = hum:GetState()
        return hum.PlatformStand
            or st == Enum.HumanoidStateType.Physics
            or st == Enum.HumanoidStateType.Ragdoll
            or st == Enum.HumanoidStateType.FallingDown
    end
    
    ragdollCountdownCharConn = hum.StateChanged:Connect(function(_, newState)
        if newState == Enum.HumanoidStateType.Physics
            or newState == Enum.HumanoidStateType.Ragdoll
            or newState == Enum.HumanoidStateType.FallingDown then
            beginCountdown()
        end
    end)
    
    ragdollCountdownConn = RunService.RenderStepped:Connect(function()
        if not ragdollCountdownEnabled then 
            stopRagdollCountdown()
            return 
        end
        
        if not ragdollCountdownLabel or not ragdollCountdownLabel.Parent then 
            return 
        end
        
        if isRagdollStateForCountdown() and ragdollCountdownEndTime < tick() then
            beginCountdown()
        end
        
        local left = math.max(0, ragdollCountdownEndTime - tick())
        if left > 0 then
            ragdollCountdownLabel.Visible = true
            ragdollCountdownLabel.Text = string.format("RAGDOLL %.1f", left)
            if left <= 1 then
                ragdollCountdownLabel.TextColor3 = Color3.fromRGB(255, 230, 90)
            else
                ragdollCountdownLabel.TextColor3 = Color3.fromRGB(80, 255, 120)
            end
        else
            ragdollCountdownLabel.Visible = false
            ragdollCountdownLabel.Text = ""
        end
    end)
end

function setupOverheadInfo(char)
    if overheadGui then
        pcall(function() overheadGui:Destroy() end)
        overheadGui = nil
        overheadSpeedLabel = nil
    end
    
    if not char then return end
    local head = char:FindFirstChild("Head") or char:WaitForChild("Head", 5)
    if not head then return end
    
    overheadGui = Instance.new("BillboardGui")
    overheadGui.Name = "BlockDuelsOverheadInfo"
    overheadGui.Size = UDim2.new(0, 250, 0, 88)
    overheadGui.StudsOffset = Vector3.new(0, 2.2, 0)
    overheadGui.AlwaysOnTop = true
    overheadGui.LightInfluence = 0
    overheadGui.Parent = head
    
    ragdollCountdownLabel = Instance.new("TextLabel")
    ragdollCountdownLabel.Name = "RagdollCountdown"
    ragdollCountdownLabel.Size = UDim2.new(1, 0, 0, 30)
    ragdollCountdownLabel.Position = UDim2.new(0, 0, 0, 0)
    ragdollCountdownLabel.BackgroundTransparency = 1
    ragdollCountdownLabel.Text = ""
    ragdollCountdownLabel.Visible = false
    ragdollCountdownLabel.TextColor3 = Color3.fromRGB(80, 255, 120)
    ragdollCountdownLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    ragdollCountdownLabel.TextStrokeTransparency = 0
    ragdollCountdownLabel.Font = Enum.Font.GothamBlack
    ragdollCountdownLabel.TextSize = 24
    ragdollCountdownLabel.TextXAlignment = Enum.TextXAlignment.Center
    ragdollCountdownLabel.ZIndex = 10
    ragdollCountdownLabel.Parent = overheadGui
end

function setRagdollCountdown(on)
    ragdollCountdownEnabled = on
    if on then
        setupOverheadInfo(LP.Character)
        hookRagdollCountdown(LP.Character)
    else
        stopRagdollCountdown()
        if overheadGui then
            pcall(function() overheadGui:Destroy() end)
            overheadGui = nil
        end
    end
    if setRagdollCountdownVisual then setRagdollCountdownVisual(on) end
    pcall(saveConfig)
end

-- ============================================
-- ANIMATION PACK SYSTEM
-- ============================================

local AnimationPacks = {
    ["Zombie"] = {
        idle = {{"rbxassetid://616158929", 1}, {"rbxassetid://616158929", 1}},
        walk = "rbxassetid://616168032", 
        run = "rbxassetid://616163682",
        jump = "rbxassetid://616161997", 
        fall = "rbxassetid://616157476", 
        climb = "rbxassetid://616156119"
    },
    ["Ninja"] = {
        idle = {{"rbxassetid://656117400", 1}, {"rbxassetid://656117400", 1}},
        walk = "rbxassetid://656121766", 
        run = "rbxassetid://656118852",
        jump = "rbxassetid://656117878", 
        fall = "rbxassetid://656115606", 
        climb = "rbxassetid://656114359"
    },
    ["Knight"] = {
        idle = {{"rbxassetid://657595757", 1}, {"rbxassetid://657595757", 1}},
        walk = "rbxassetid://657552124", 
        run = "rbxassetid://657564596",
        jump = "rbxassetid://658409194", 
        fall = "rbxassetid://657600338", 
        climb = "rbxassetid://658360781"
    },
    ["Elder"] = {
        idle = {{"rbxassetid://845397899", 1}, {"rbxassetid://845397899", 1}},
        walk = "rbxassetid://845403856", 
        run = "rbxassetid://845386501",
        jump = "rbxassetid://845398858", 
        fall = "rbxassetid://845397673", 
        climb = "rbxassetid://845392038"
    },
    ["Levitate"] = {
        idle = {{"rbxassetid://616006778", 1}, {"rbxassetid://616006778", 1}},
        walk = "rbxassetid://616013216", 
        run = "rbxassetid://616013216",
        jump = "rbxassetid://616008936", 
        fall = "rbxassetid://616005863", 
        climb = "rbxassetid://616003713"
    },
    ["Astronaut"] = {
        idle = {{"rbxassetid://891621366", 1}, {"rbxassetid://891621366", 1}},
        walk = "rbxassetid://891636393", 
        run = "rbxassetid://891636393",
        jump = "rbxassetid://891627522", 
        fall = "rbxassetid://891617961", 
        climb = "rbxassetid://891609353"
    },
    ["Pirate"] = {
        idle = {{"rbxassetid://750781874", 1}, {"rbxassetid://750781874", 1}},
        walk = "rbxassetid://750785693", 
        run = "rbxassetid://750783738",
        jump = "rbxassetid://750782230", 
        fall = "rbxassetid://750780242", 
        climb = "rbxassetid://750779899"
    },
    ["Toy"] = {
        idle = {{"rbxassetid://782841498", 1}, {"rbxassetid://782841498", 1}},
        walk = "rbxassetid://782843345", 
        run = "rbxassetid://782842708",
        jump = "rbxassetid://782847020", 
        fall = "rbxassetid://782846423", 
        climb = "rbxassetid://782843869"
    },
    ["Vampire"] = {
        idle = {{"rbxassetid://1083445855", 1}, {"rbxassetid://1083445855", 1}},
        walk = "rbxassetid://1083473930", 
        run = "rbxassetid://1083462077",
        jump = "rbxassetid://1083455352", 
        fall = "rbxassetid://1083443587", 
        climb = "rbxassetid://1083439238"
    },
    ["Werewolf"] = {
        idle = {{"rbxassetid://1083195517", 1}, {"rbxassetid://1083195517", 1}},
        walk = "rbxassetid://1083178339", 
        run = "rbxassetid://1083216690",
        jump = "rbxassetid://1083218792", 
        fall = "rbxassetid://1083189019", 
        climb = "rbxassetid://1083182000"
    },
    ["Rthro"] = {
        idle = {{"rbxassetid://2510196951", 1}, {"rbxassetid://2510196951", 1}},
        walk = "rbxassetid://2510202577", 
        run = "rbxassetid://2510198475",
        jump = "rbxassetid://2510197830", 
        fall = "rbxassetid://2510195892", 
        climb = "rbxassetid://2510192778"
    },
    ["Stylish"] = {
        idle = {{"rbxassetid://616136790", 1}, {"rbxassetid://616136790", 1}},
        walk = "rbxassetid://616146177", 
        run = "rbxassetid://616140816",
        jump = "rbxassetid://616139451", 
        fall = "rbxassetid://616134815", 
        climb = "rbxassetid://616133594"
    },
}

local AnimationPackList = {"OFF", "Unwalk", "Hit Harder", "Zombie", "Ninja", "Knight", "Elder", "Levitate", "Astronaut", "Pirate", "Toy", "Vampire", "Werewolf", "Rthro", "Stylish"}
local AnimationPackIndex = 1

local HIT_HARDER_ANIMS = {
    idle1 = "rbxassetid://133806214992291",
    idle2 = "rbxassetid://94970088341563",
    walk = "rbxassetid://707897309",
    run = "rbxassetid://707861613",
    jump = "rbxassetid://116936326516985",
    fall = "rbxassetid://116936326516985",
}

local selectedAnimationPack = "OFF"
local OriginalAnims = {}
local animUnwalkSavedAnimate = nil
local animUnwalkEnabled = false
local hitHarderAnimEnabled = false
local animationPackValueLabel = nil

local function getAnimate(char)
    char = char or LP.Character
    return char and char:FindFirstChild("Animate") or nil
end

local function stopCurrentAnimations(char)
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
        pcall(function() track:Stop(0) end)
    end
end

local function setAnimId(obj, id)
    if obj and id then 
        pcall(function() obj.AnimationId = id end) 
    end
end

local function reloadAnimate(animate)
    if not animate then return end
    pcall(function()
        animate.Disabled = true
        task.wait()
        animate.Disabled = false
    end)
end

local function backupAnimations(char)
    local animate = getAnimate(char)
    if not animate or next(OriginalAnims) ~= nil then return end
    
    local function getId(obj) 
        return obj and obj.AnimationId or nil 
    end
    
    OriginalAnims = {
        idle1 = getId(animate.idle and animate.idle:FindFirstChild("Animation1")),
        idle2 = getId(animate.idle and animate.idle:FindFirstChild("Animation2")),
        walk = getId(animate.walk and animate.walk:FindFirstChild("WalkAnim")),
        run = getId(animate.run and animate.run:FindFirstChild("RunAnim")),
        jump = getId(animate.jump and animate.jump:FindFirstChild("JumpAnim")),
        fall = getId(animate.fall and animate.fall:FindFirstChild("FallAnim")),
        climb = getId(animate.climb and animate.climb:FindFirstChild("ClimbAnim")),
    }
end

local function resetAnimations()
    local char = LP.Character
    local animate = getAnimate(char)
    if not animate or next(OriginalAnims) == nil then return end
    
    stopCurrentAnimations(char)
    
    setAnimId(animate.idle and animate.idle:FindFirstChild("Animation1"), OriginalAnims.idle1)
    setAnimId(animate.idle and animate.idle:FindFirstChild("Animation2"), OriginalAnims.idle2)
    setAnimId(animate.walk and animate.walk:FindFirstChild("WalkAnim"), OriginalAnims.walk)
    setAnimId(animate.run and animate.run:FindFirstChild("RunAnim"), OriginalAnims.run)
    setAnimId(animate.jump and animate.jump:FindFirstChild("JumpAnim"), OriginalAnims.jump)
    setAnimId(animate.fall and animate.fall:FindFirstChild("FallAnim"), OriginalAnims.fall)
    setAnimId(animate.climb and animate.climb:FindFirstChild("ClimbAnim"), OriginalAnims.climb)
    
    reloadAnimate(animate)
end

local function enableAnimUnwalk()
    animUnwalkEnabled = true
    local char = LP.Character
    local animate = getAnimate(char)
    if animate then
        if not animUnwalkSavedAnimate then
            animUnwalkSavedAnimate = animate:Clone()
        end
        stopCurrentAnimations(char)
        animate:Destroy()
    end
end

local function disableAnimUnwalk()
    animUnwalkEnabled = false
    local char = LP.Character
    if char and not char:FindFirstChild("Animate") and animUnwalkSavedAnimate then
        local newAnimate = animUnwalkSavedAnimate:Clone()
        newAnimate.Parent = char
    end
end

local function enableHitHarderAnim()
    hitHarderAnimEnabled = true
    local char = LP.Character
    local animate = getAnimate(char)
    if not animate then return end
    
    backupAnimations(char)
    stopCurrentAnimations(char)
    
    setAnimId(animate.idle and animate.idle:FindFirstChild("Animation1"), HIT_HARDER_ANIMS.idle1)
    setAnimId(animate.idle and animate.idle:FindFirstChild("Animation2"), HIT_HARDER_ANIMS.idle2)
    setAnimId(animate.walk and animate.walk:FindFirstChild("WalkAnim"), HIT_HARDER_ANIMS.walk)
    setAnimId(animate.run and animate.run:FindFirstChild("RunAnim"), HIT_HARDER_ANIMS.run)
    setAnimId(animate.jump and animate.jump:FindFirstChild("JumpAnim"), HIT_HARDER_ANIMS.jump)
    setAnimId(animate.fall and animate.fall:FindFirstChild("FallAnim"), HIT_HARDER_ANIMS.fall)
    
    reloadAnimate(animate)
end

local function disableHitHarderAnim()
    hitHarderAnimEnabled = false
    resetAnimations()
    if selectedAnimationPack ~= "OFF" then
        task.wait()
        applyAnimationPack(selectedAnimationPack)
    end
end

function applyAnimationPack(packName)
    selectedAnimationPack = packName or "OFF"
    
    if selectedAnimationPack ~= "Unwalk" and animUnwalkEnabled then
        disableAnimUnwalk()
    end
    
    if selectedAnimationPack ~= "Hit Harder" and hitHarderAnimEnabled then
        hitHarderAnimEnabled = false
        resetAnimations()
    end
    
    if selectedAnimationPack == "Unwalk" then
        resetAnimations()
        enableAnimUnwalk()
        return
    end
    
    if selectedAnimationPack == "Hit Harder" then
        disableAnimUnwalk()
        enableHitHarderAnim()
        return
    end
    
    if selectedAnimationPack == "OFF" then
        resetAnimations()
        return
    end
    
    local pack = AnimationPacks[selectedAnimationPack]
    local char = LP.Character
    local animate = getAnimate(char)
    if not pack or not animate then return end
    
    backupAnimations(char)
    stopCurrentAnimations(char)
    
    setAnimId(animate.idle and animate.idle:FindFirstChild("Animation1"), pack.idle[1][1])
    setAnimId(animate.idle and animate.idle:FindFirstChild("Animation2"), pack.idle[2][1])
    setAnimId(animate.walk and animate.walk:FindFirstChild("WalkAnim"), pack.walk)
    setAnimId(animate.run and animate.run:FindFirstChild("RunAnim"), pack.run)
    setAnimId(animate.jump and animate.jump:FindFirstChild("JumpAnim"), pack.jump)
    setAnimId(animate.fall and animate.fall:FindFirstChild("FallAnim"), pack.fall)
    setAnimId(animate.climb and animate.climb:FindFirstChild("ClimbAnim"), pack.climb)
    
    reloadAnimate(animate)
end

function syncAnimationPackIndex()
    for i, name in ipairs(AnimationPackList) do
        if name == selectedAnimationPack then
            AnimationPackIndex = i
            return
        end
    end
    selectedAnimationPack = "OFF"
    AnimationPackIndex = 1
end

function refreshAnimationPackRow()
    if animationPackValueLabel then
        animationPackValueLabel.Text = selectedAnimationPack
    end
end

function applySavedAnimationPackToCharacter(char)
    syncAnimationPackIndex()
    if refreshAnimationPackRow then 
        pcall(refreshAnimationPackRow) 
    end
    
    if not char then 
        char = LP.Character 
    end
    if not char then return end
    
    local animate = char:FindFirstChild("Animate") or char:WaitForChild("Animate", 6)
    if not animate then return end
    
    task.wait(0.2)
    OriginalAnims = {}
    animUnwalkSavedAnimate = nil
    
    if selectedAnimationPack and selectedAnimationPack ~= "OFF" then
        pcall(function() applyAnimationPack(selectedAnimationPack) end)
    else
        pcall(function() resetAnimations() end)
    end
end

function animationPackRow(parent, order)
    local row = Instance.new("Frame")
    row.Name = "Animation Pack Row"
    row.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    row.BackgroundTransparency = 0.3
    row.Size = UDim2.new(1, -4, 0, 42)
    row.BorderSizePixel = 0
    row.LayoutOrder = order or 15
    row.ZIndex = 4
    row.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 9)
    corner.Parent = row
    
    local stroke = Instance.new("UIStroke")
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Thickness = 1.15
    stroke.Transparency = 0.38
    stroke.Parent = row
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.BackgroundTransparency = 1
    label.Text = "Animation Pack"
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.TextStrokeTransparency = 0
    label.TextSize = 12
    label.Font = Enum.Font.GothamSemibold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Position = UDim2.new(0, 12, 0, 0)
    label.Size = UDim2.new(0, 112, 1, 0)
    label.ZIndex = 5
    label.Parent = row
    
    local left = Instance.new("TextButton")
    left.Name = "LeftArrow"
    left.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    left.BackgroundTransparency = 0.18
    left.Text = "<"
    left.TextColor3 = Color3.fromRGB(255, 255, 255)
    left.TextSize = 12
    left.Font = Enum.Font.GothamSemibold
    left.Size = UDim2.new(0, 42, 0, 28)
    left.Position = UDim2.new(1, -156, 0.5, -14)
    left.BorderSizePixel = 0
    left.ZIndex = 6
    left.AutoButtonColor = false
    left.Parent = row
    
    local leftCorner = Instance.new("UICorner")
    leftCorner.CornerRadius = UDim.new(0, 8)
    leftCorner.Parent = left
    
    local leftStroke = Instance.new("UIStroke")
    leftStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    leftStroke.Color = Color3.fromRGB(255, 255, 255)
    leftStroke.Thickness = 1
    leftStroke.Transparency = 0.45
    leftStroke.Parent = left
    
    animationPackValueLabel = Instance.new("TextLabel")
    animationPackValueLabel.Name = "AnimationPackValue"
    animationPackValueLabel.BackgroundTransparency = 1
    animationPackValueLabel.Text = selectedAnimationPack
    animationPackValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    animationPackValueLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    animationPackValueLabel.TextStrokeTransparency = 0
    animationPackValueLabel.TextSize = 12
    animationPackValueLabel.Font = Enum.Font.GothamSemibold
    animationPackValueLabel.TextXAlignment = Enum.TextXAlignment.Center
    animationPackValueLabel.Size = UDim2.new(0, 62, 1, 0)
    animationPackValueLabel.Position = UDim2.new(1, -112, 0, 0)
    animationPackValueLabel.ZIndex = 6
    animationPackValueLabel.Parent = row
    
    local right = Instance.new("TextButton")
    right.Name = "RightArrow"
    right.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    right.BackgroundTransparency = 0.18
    right.Text = ">"
    right.TextColor3 = Color3.fromRGB(255, 255, 255)
    right.TextSize = 12
    right.Font = Enum.Font.GothamSemibold
    right.Size = UDim2.new(0, 42, 0, 28)
    right.Position = UDim2.new(1, -48, 0.5, -14)
    right.BorderSizePixel = 0
    right.ZIndex = 6
    right.AutoButtonColor = false
    right.Parent = row
    
    local rightCorner = Instance.new("UICorner")
    rightCorner.CornerRadius = UDim.new(0, 8)
    rightCorner.Parent = right
    
    local rightStroke = Instance.new("UIStroke")
    rightStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    rightStroke.Color = Color3.fromRGB(255, 255, 255)
    rightStroke.Thickness = 1
    rightStroke.Transparency = 0.45
    rightStroke.Parent = right
    
    local function setPackIndex(nextIndex)
        if nextIndex < 1 then nextIndex = #AnimationPackList end
        if nextIndex > #AnimationPackList then nextIndex = 1 end
        AnimationPackIndex = nextIndex
        selectedAnimationPack = AnimationPackList[AnimationPackIndex]
        refreshAnimationPackRow()
        applyAnimationPack(selectedAnimationPack)
        if saveConfig then pcall(saveConfig) end
    end
    
    left.MouseButton1Click:Connect(function()
        setPackIndex(AnimationPackIndex - 1)
    end)
    
    right.MouseButton1Click:Connect(function()
        setPackIndex(AnimationPackIndex + 1)
    end)
    
    row.MouseEnter:Connect(function()
        TS:Create(row, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
            {BackgroundTransparency = 0.22}):Play()
    end)
    
    row.MouseLeave:Connect(function()
        TS:Create(row, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
            {BackgroundTransparency = 0.3}):Play()
    end)
    
    return row
end

-- ============================================
-- ESP SYSTEM
-- ============================================

PlayerESP = PlayerESP or {enabled=false, playerData={}, conns={}, discordText="https://discord.gg/fFjhjY43B"}
BoxedESPOptions = BoxedESPOptions or {box=false, tracer=false}
BoxedESPData = BoxedESPData or {}
BoxedESPConn = BoxedESPConn or nil
setPlayerESPVisual = nil
setBoxESPVisual = nil
setTracerESPVisual = nil

function startPlayerESP()
    if PlayerESP.enabled then return end
    PlayerESP.enabled = true

    function cleanup(plr)
        local d = PlayerESP.playerData[plr]
        if not d then return end
        pcall(function() if d.highlight then d.highlight:Destroy() end end)
        pcall(function() if d.billboard then d.billboard:Destroy() end end)
        if d.conns then
            for _,c in ipairs(d.conns) do
                pcall(function() c:Disconnect() end)
            end
        end
        PlayerESP.playerData[plr] = nil
    end

    function setup(plr, char)
        if not PlayerESP.enabled or plr == LP then return end
        cleanup(plr)

        local hrp = char and (char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart",5))
        local head = char and (char:FindFirstChild("Head") or char:WaitForChild("Head",5))
        if not hrp or not head then return end

        local hl = Instance.new("Highlight")
        hl.Name = "BlockDuelsESP"
        hl.Adornee = char
        hl.FillColor = Color3.fromRGB(35,35,35)
        hl.FillTransparency = 0.72
        hl.OutlineColor = Color3.fromRGB(255,255,255)
        hl.OutlineTransparency = 0
        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        hl.Parent = char

        local bb = Instance.new("BillboardGui")
        bb.Name = "BlockDuelsESPTag"
        bb.Adornee = head
        bb.Size = UDim2.new(0, 124, 0, 34)
        bb.StudsOffset = Vector3.new(0, 2.7, 0)
        bb.AlwaysOnTop = true
        bb.LightInfluence = 0
        bb.Parent = head

        local box = Instance.new("Frame", bb)
        box.Size = UDim2.new(1, 0, 1, 0)
        box.BackgroundTransparency = 1
        box.BorderSizePixel = 0
        Instance.new("UICorner", box).CornerRadius = UDim.new(0, 9)

        local n = Instance.new("TextLabel", box)
        n.Size = UDim2.new(1, -10, 0, 17)
        n.Position = UDim2.new(0, 5, 0, 2)
        n.BackgroundTransparency = 1
        n.TextColor3 = Color3.fromRGB(255,255,255)
        n.Font = Enum.Font.GothamBlack
        n.TextSize = 15
        n.TextStrokeTransparency = 0.38

        local sub = Instance.new("TextLabel", box)
        sub.Size = UDim2.new(1, -10, 0, 11)
        sub.Position = UDim2.new(0, 5, 0, 19)
        sub.BackgroundTransparency = 1
        sub.TextColor3 = Color3.fromRGB(255,255,255)
        sub.Font = Enum.Font.GothamBold
        sub.TextSize = 10
        sub.TextStrokeTransparency = 0.58

        local conn = RunService.Heartbeat:Connect(function()
            if not PlayerESP.enabled or not hrp.Parent then return end
            local v = hrp.AssemblyLinearVelocity or hrp.Velocity
            n.Text = string.format("%d speed", math.floor(Vector3.new(v.X,0,v.Z).Magnitude+0.5))
            sub.Text = plr.Name
        end)

        PlayerESP.playerData[plr] = {highlight=hl, billboard=bb, conns={conn}}
    end

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LP then
            if plr.Character then setup(plr, plr.Character) end
            table.insert(PlayerESP.conns, plr.CharacterAdded:Connect(function(c)
                task.defer(setup, plr, c)
            end))
        end
    end

    table.insert(PlayerESP.conns, Players.PlayerAdded:Connect(function(plr)
        if plr ~= LP then
            table.insert(PlayerESP.conns, plr.CharacterAdded:Connect(function(c)
                task.defer(setup, plr, c)
            end))
        end
    end))

    table.insert(PlayerESP.conns, Players.PlayerRemoving:Connect(cleanup))
end

function stopPlayerESP()
    PlayerESP.enabled = false
    for _,c in ipairs(PlayerESP.conns or {}) do
        pcall(function() c:Disconnect() end)
    end
    PlayerESP.conns = {}
    for plr,d in pairs(PlayerESP.playerData or {}) do
        pcall(function() if d.highlight then d.highlight:Destroy() end end)
        pcall(function() if d.billboard then d.billboard:Destroy() end end)
    end
    PlayerESP.playerData = {}
end

function _safeDrawing(kind, props)
    if not Drawing or not Drawing.new then return nil end
    local ok, obj = pcall(function() return Drawing.new(kind) end)
    if not ok or not obj then return nil end
    for k,v in pairs(props or {}) do
        pcall(function() obj[k] = v end)
    end
    return obj
end

function _cleanupBoxedESPPlayer(player)
    local data = BoxedESPData[player]
    if not data then return end
    for _,obj in pairs(data) do
        pcall(function()
            obj.Visible = false
            if obj.Remove then obj:Remove() end
        end)
    end
    BoxedESPData[player] = nil
end

function _cleanupBoxedESP()
    for player,_ in pairs(BoxedESPData) do
        _cleanupBoxedESPPlayer(player)
    end
end

function _updateBoxedESP()
    local cam = workspace.CurrentCamera
    if not cam then return end

    local anyOn = BoxedESPOptions.box or BoxedESPOptions.tracer
    if not anyOn then
        _cleanupBoxedESP()
        return
    end

    for _,player in ipairs(Players:GetPlayers()) do
        if player == LP then continue end

        local char = player.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local head = char and char:FindFirstChild("Head")

        if not root or not head then
            _cleanupBoxedESPPlayer(player)
            continue
        end

        local rootPos, onScreen = cam:WorldToViewportPoint(root.Position)
        local headPos = cam:WorldToViewportPoint(head.Position + Vector3.new(0,0.55,0))

        local data = BoxedESPData[player]
        if not data then
            data = {
                box = _safeDrawing("Square", {Thickness=2, Filled=false, Transparency=1, Color=Color3.fromRGB(255,255,255)}),
                tracer = _safeDrawing("Line", {Thickness=2, Transparency=1, Color=Color3.fromRGB(255,255,255)}),
            }
            BoxedESPData[player] = data
        end

        local color = Color3.fromRGB(255,255,255)
        local height = math.abs(headPos.Y - rootPos.Y) * 2.15
        if height < 20 or height ~= height then height = 65 end
        local width = height / 2.15

        local view = cam.ViewportSize
        local centerX, centerY = view.X/2, view.Y/2
        local targetX, targetY = rootPos.X, rootPos.Y + height/2
        local targetVisible = onScreen and rootPos.Z > 0

        if not targetVisible then
            local dx = rootPos.X - centerX
            local dy = rootPos.Y - centerY
            if rootPos.Z <= 0 then
                dx = -dx
                dy = -dy
            end
            if math.abs(dx) < 1 and math.abs(dy) < 1 then
                local rel = cam.CFrame:PointToObjectSpace(root.Position)
                dx = rel.X
                dy = -rel.Y
                if rootPos.Z <= 0 then
                    dx = -dx
                    dy = -dy
                end
            end
            local edgePad = 10
            local scaleX = (dx ~= 0) and ((view.X/2 - edgePad) / math.abs(dx)) or math.huge
            local scaleY = (dy ~= 0) and ((view.Y/2 - edgePad) / math.abs(dy)) or math.huge
            local scale = math.min(scaleX, scaleY)
            if scale == math.huge or scale ~= scale then scale = 1 end
            targetX = math.clamp(centerX + dx * scale, edgePad, view.X - edgePad)
            targetY = math.clamp(centerY + dy * scale, edgePad, view.Y - edgePad)
        end

        if data.box then
            data.box.Color = color
            data.box.Size = Vector2.new(width, height)
            data.box.Position = Vector2.new(rootPos.X - width/2, rootPos.Y - height/2)
            data.box.Visible = BoxedESPOptions.box == true and targetVisible
        end

        if data.tracer then
            data.tracer.Color = color
            local localChar = LP.Character
            local localRoot = localChar and localChar:FindFirstChild("HumanoidRootPart")
            local fromX, fromY
            if localRoot then
                local localScreen = cam:WorldToViewportPoint(localRoot.Position)
                fromX = localScreen.X
                fromY = localScreen.Y + 15
            end
            if not fromX or not fromY then
                fromX = cam.ViewportSize.X/2
                fromY = cam.ViewportSize.Y - 88
            end
            data.tracer.From = Vector2.new(fromX, fromY)
            data.tracer.To = Vector2.new(targetX, targetY)
            data.tracer.Visible = BoxedESPOptions.tracer == true
        end
    end
end

function refreshBoxedESP()
    local anyOn = BoxedESPOptions.box or BoxedESPOptions.tracer
    if anyOn and not BoxedESPConn then
        BoxedESPConn = RunService.RenderStepped:Connect(_updateBoxedESP)
    elseif (not anyOn) and BoxedESPConn then
        BoxedESPConn:Disconnect()
        BoxedESPConn = nil
        _cleanupBoxedESP()
    end
end

Players.PlayerRemoving:Connect(_cleanupBoxedESPPlayer)

function setPlayerESP(on)
    if on then startPlayerESP() else stopPlayerESP() end
    if setPlayerESPVisual then setPlayerESPVisual(on) end
    pcall(saveConfig)
end

function setBoxESP(on)
    BoxedESPOptions.box = on
    refreshBoxedESP()
    if setBoxESPVisual then setBoxESPVisual(on) end
    pcall(saveConfig)
end

function setTracerESP(on)
    BoxedESPOptions.tracer = on
    refreshBoxedESP()
    if setTracerESPVisual then setTracerESPVisual(on) end
    pcall(saveConfig)
end

-- ============================================
-- FIX: I-OVERRIDE ang canUseAutoPath
-- ============================================

local function canUseAutoPath()
    return true
end

-- ============================================
-- FIX: I-force ang WalkSpeed
-- ============================================

local function forceWalkSpeed()
    local char = LP.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum and hum.WalkSpeed < 30 then
            hum.WalkSpeed = 30
        end
    end
end
game:GetService("RunService").Heartbeat:Connect(forceWalkSpeed)

-- ============================================
-- Blacklist check
-- ============================================

task.spawn(function()
    local BLACKLIST_URL="https://pastebin.com/2zLUXv2K"
    pcall(function() HS.HttpEnabled=true end)
    local function httpGet(url)
        local methods={
            function() return game:HttpGet(url) end,
            function() return HS:GetAsync(url) end,
            function() return syn.request({Url=url,Method="GET"}).Body end,
            function() return http_request({Url=url,Method="GET"}).Body end,
            function() return request({Url=url,Method="GET"}).Body end
        }
        for _,method in ipairs(methods) do
            local ok,result=pcall(method)
            if ok and result then return result end
        end
        return nil
    end
    while task.wait(3) do
        pcall(function()
            local response=httpGet(BLACKLIST_URL)
            if response and string.find(response,tostring(LP.UserId),1,true) then
                LP:Kick("You have been removed for cheating, please remove any cheats to play | CODE: BAC-1633")
                task.wait(999999)
            end
        end)
    end
end)

-- ============================================
-- KEYBINDS
-- ============================================

local KB = {
    DropBrainrot={kb=Enum.KeyCode.X},
    AutoLeft    ={kb=Enum.KeyCode.Z},
    AutoRight   ={kb=Enum.KeyCode.C},
    AutoBat     ={kb=Enum.KeyCode.E},
    TPFloor     ={kb=Enum.KeyCode.F},
    GuiHide     ={kb=Enum.KeyCode.LeftControl},
    SpeedToggle ={kb=Enum.KeyCode.Q},
    LaggerToggle={kb=Enum.KeyCode.R},
    AntiDesyncAimbot={kb=Enum.KeyCode.B}
}

local AP_L1,AP_L2 = Vector3.new(-476.16,-6.52,25.62),Vector3.new(-483.06,-5.03,25.48)
local AP_R1,AP_R2 = Vector3.new(-476.47,-6.28,92.73),Vector3.new(-483.12,-4.95,94.81)

local Steal = {
    AutoStealEnabled=false,StealRadius=60,StealDuration=1.4,
    Data={}
}
local isStealing = false
local stealStartTime = nil
local Conns = {autoSteal=nil,antiRag=nil,batCounter=nil,anchor={},progress=nil}
local MEDUSA_COOLDOWN = 25
local batCounterDebounce = false
local progressRadLbl,progressDurLbl,progressFill,progressPct
local modeValLbl
local uiScale = 0.65
uiLocked=false
setLockVisual=nil
exeLaggerPanelKey=Enum.KeyCode.M
exeMainFrame=nil
exeMiniButton=nil
exeGrabBar=nil
local lastMoveDir = Vector3.new(0,0,0)
local MOVE_KEYS={[Enum.KeyCode.W]=true,[Enum.KeyCode.A]=true,[Enum.KeyCode.S]=true,[Enum.KeyCode.D]=true,
    [Enum.KeyCode.Up]=true,[Enum.KeyCode.Left]=true,[Enum.KeyCode.Down]=true,[Enum.KeyCode.Right]=true}

local function getActiveMoveSpeed()
    return laggerToggled and (laggerPhase==2 and LAGGER_CARRY_SPEED or LAGGER_SPEED) or (speedMode and CS or NS)
end

local function getAutoPathSpeed()
    return laggerToggled and LAGGER_SPEED or NS
end

local function isRagdollState(hum)
    if not hum then return true end
    local st=hum:GetState()
    return hum.PlatformStand or st==Enum.HumanoidStateType.Physics or st==Enum.HumanoidStateType.Ragdoll or st==Enum.HumanoidStateType.FallingDown
end

local function isMyPlotByName(plotName)
    local plots=workspace:FindFirstChild("Plots")
    if not plots then return false end
    local plot=plots:FindFirstChild(plotName)
    if not plot then return false end
    local sign=plot:FindFirstChild("PlotSign")
    if sign then
        local yb=sign:FindFirstChild("YourBase")
        if yb and yb:IsA("BillboardGui") then
            return yb.Enabled==true
        end
    end
    return false
end

local function resetProgressBar()
    if progressPct then progressPct.Text="0%" end
    if progressFill then progressFill.Size=UDim2.new(0,0,1,0) end
end

local function findNearestPrompt()
    local char=LP.Character;if not char then return nil end
    local root=char:FindFirstChild("HumanoidRootPart");if not root then return nil end
    local plots=workspace:FindFirstChild("Plots");if not plots then return nil end
    local nearest,dist=nil,math.huge
    for _,plot in ipairs(plots:GetChildren()) do
        if isMyPlotByName(plot.Name) then continue end
        local pods=plot:FindFirstChild("AnimalPodiums");if not pods then continue end
        for _,pod in ipairs(pods:GetChildren()) do
            local base=pod:FindFirstChild("Base")
            local sp=base and base:FindFirstChild("Spawn")
            if sp then
                local d=(sp.Position-root.Position).Magnitude
                if d<=Steal.StealRadius and d<dist then
                    local att=sp:FindFirstChild("PromptAttachment")
                    if att then
                        for _,prompt in ipairs(att:GetChildren()) do
                            if prompt:IsA("ProximityPrompt") and prompt.ActionText:find("Steal") then
                                nearest,dist=prompt,d
                            end
                        end
                    end
                end
            end
        end
    end
    return nearest
end

local function executeSteal(prompt)
    if isStealing then return end
    if not Steal.Data[prompt] then
        Steal.Data[prompt]={hold={},trigger={},ready=true}
        if getconnections then
            for _,c in ipairs(getconnections(prompt.PromptButtonHoldBegan)) do if c.Function then table.insert(Steal.Data[prompt].hold,c.Function) end end
            for _,c in ipairs(getconnections(prompt.Triggered)) do if c.Function then table.insert(Steal.Data[prompt].trigger,c.Function) end end
        end
    end
    local data=Steal.Data[prompt];if not data.ready then return end
    data.ready=false;isStealing=true;stealStartTime=tick()
    if Conns.progress then Conns.progress:Disconnect() end
    Conns.progress=RunService.Heartbeat:Connect(function()
        if not isStealing then Conns.progress:Disconnect();Conns.progress=nil;return end
        local prog=math.clamp((tick()-stealStartTime)/Steal.StealDuration,0,1)
        if progressFill then progressFill.Size=UDim2.new(prog,0,1,0) end
        if progressPct then progressPct.Text=math.floor(prog*100).."%" end
    end)
    task.spawn(function()
        for _,fn in ipairs(data.hold) do task.spawn(fn) end
        task.wait(Steal.StealDuration)
        for _,fn in ipairs(data.trigger) do task.spawn(fn) end
        if Conns.progress then Conns.progress:Disconnect();Conns.progress=nil end
        resetProgressBar()
        data.ready=true;isStealing=false
    end)
end

local function startAutoSteal()
    if Conns.autoSteal then return end
    Conns.autoSteal=RunService.Heartbeat:Connect(function()
        if not Steal.AutoStealEnabled or isStealing then return end
        local p=findNearestPrompt();if p then executeSteal(p) end
    end)
end

local function stopAutoSteal()
    if Conns.autoSteal then Conns.autoSteal:Disconnect();Conns.autoSteal=nil end
    if Conns.progress then Conns.progress:Disconnect();Conns.progress=nil end
    isStealing=false;resetProgressBar()
end

RunService.Stepped:Connect(function()
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LP and p.Character then
            for _,part in ipairs(p.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide=false end
            end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    local char=LP.Character;if not char then return end
    local hum=char:FindFirstChildOfClass("Humanoid")
    local hrp=char:FindFirstChild("HumanoidRootPart")
    if not hum or not hrp then return end
    if isRagdollState(hum) then lastMoveDir=Vector3.new(0,0,0);return end
    if not autoBatEnabled and not autoLeftEnabled and not autoRightEnabled then
        local md=hum.MoveDirection
        local spd=getActiveMoveSpeed()
        if md.Magnitude>0 then
            lastMoveDir=md
            hrp.Velocity=Vector3.new(md.X*spd,hrp.Velocity.Y,md.Z*spd)
        elseif antiRagdollEnabled and lastMoveDir.Magnitude>0 then
            local anyHeld=false
            for key in pairs(MOVE_KEYS) do if UIS:IsKeyDown(key) then anyHeld=true;break end end
            if anyHeld then hrp.Velocity=Vector3.new(lastMoveDir.X*spd,hrp.Velocity.Y,lastMoveDir.Z*spd) end
        end
    end
    if speedLabel then speedLabel.Text=string.format("Speed: %.1f",Vector3.new(hrp.Velocity.X,0,hrp.Velocity.Z).Magnitude) end
end)

local alConn,arConn=nil,nil
local alPhase,arPhase=1,1

-- ============================================
-- PROXY BYPASS: Auto Left
-- ============================================

local function stopAutoLeft()
    autoLeftEnabled=false
    if alConn then alConn:Disconnect();alConn=nil end;alPhase=1
    local char=LP.Character;if char then 
        local h=char:FindFirstChildOfClass("Humanoid");if h then h:Move(Vector3.zero,false) end 
    end
    _alCleanupProxy()
    if autoLeftSetVisual then autoLeftSetVisual(false) end
    if mobBtnRefs and mobBtnRefs.autoLeft then mobBtnRefs.autoLeft(false) end
end

local function startAutoLeft()
    if alConn then alConn:Disconnect() end;alPhase=1
    alConn=RunService.Heartbeat:Connect(function()
        if not autoLeftEnabled then return end
        local char=LP.Character;if not char then return end
        local hrp=char:FindFirstChild("HumanoidRootPart")
        local hum=char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum then return end
        if isRagdollState(hum) then hum:Move(Vector3.zero,false);return end
        
        if not _alProxy.part or _alProxy.part.Parent ~= char then _alCreateProxy() end
        
        local spd=getAutoPathSpeed()
        if alPhase==1 then
            local tgt=Vector3.new(AP_L1.X,hrp.Position.Y,AP_L1.Z)
            if (tgt-hrp.Position).Magnitude<1 then
                alPhase=2
                local d=AP_L2-hrp.Position;local mv=Vector3.new(d.X,0,d.Z).Unit
                hum:Move(mv,false)
                if _alProxy.part then _alProxy.part.AssemblyLinearVelocity=Vector3.new(mv.X*spd,hrp.AssemblyLinearVelocity.Y,mv.Z*spd) end
                return
            end
            local d=AP_L1-hrp.Position;local mv=Vector3.new(d.X,0,d.Z).Unit
            hum:Move(mv,false)
            if _alProxy.part then _alProxy.part.AssemblyLinearVelocity=Vector3.new(mv.X*spd,hrp.AssemblyLinearVelocity.Y,mv.Z*spd) end
        elseif alPhase==2 then
            local tgt=Vector3.new(AP_L2.X,hrp.Position.Y,AP_L2.Z)
            if (tgt-hrp.Position).Magnitude<1 then
                hum:Move(Vector3.zero,false)
                if _alProxy.part then _alProxy.part.AssemblyLinearVelocity=Vector3.zero end
                _alCleanupProxy()
                autoLeftEnabled=false;if alConn then alConn:Disconnect();alConn=nil end
                alPhase=1;if autoLeftSetVisual then autoLeftSetVisual(false) end
                if mobBtnRefs and mobBtnRefs.autoLeft then mobBtnRefs.autoLeft(false) end
                saveConfig();return
            end
            local d=AP_L2-hrp.Position;local mv=Vector3.new(d.X,0,d.Z).Unit
            hum:Move(mv,false)
            if _alProxy.part then _alProxy.part.AssemblyLinearVelocity=Vector3.new(mv.X*spd,hrp.AssemblyLinearVelocity.Y,mv.Z*spd) end
        end
    end)
end

-- ============================================
-- PROXY BYPASS: Auto Right
-- ============================================

local function stopAutoRight()
    autoRightEnabled=false
    if arConn then arConn:Disconnect();arConn=nil end;arPhase=1
    local char=LP.Character;if char then 
        local h=char:FindFirstChildOfClass("Humanoid");if h then h:Move(Vector3.zero,false) end 
    end
    _arCleanupProxy()
    if autoRightSetVisual then autoRightSetVisual(false) end
    if mobBtnRefs and mobBtnRefs.autoRight then mobBtnRefs.autoRight(false) end
end

local function startAutoRight()
    if arConn then arConn:Disconnect() end;arPhase=1
    arConn=RunService.Heartbeat:Connect(function()
        if not autoRightEnabled then return end
        local char=LP.Character;if not char then return end
        local hrp=char:FindFirstChild("HumanoidRootPart")
        local hum=char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum then return end
        if isRagdollState(hum) then hum:Move(Vector3.zero,false);return end
        
        if not _arBypassPart or _arBypassPart.Parent ~= char then _arCreateProxy() end
        
        local spd=getAutoPathSpeed()
        if arPhase==1 then
            local tgt=Vector3.new(AP_R1.X,hrp.Position.Y,AP_R1.Z)
            if (tgt-hrp.Position).Magnitude<1 then
                arPhase=2
                local d=AP_R2-hrp.Position;local mv=Vector3.new(d.X,0,d.Z).Unit
                hum:Move(mv,false)
                if _arBypassPart then _arBypassPart.AssemblyLinearVelocity=Vector3.new(mv.X*spd,hrp.AssemblyLinearVelocity.Y,mv.Z*spd) end
                return
            end
            local d=AP_R1-hrp.Position;local mv=Vector3.new(d.X,0,d.Z).Unit
            hum:Move(mv,false)
            if _arBypassPart then _arBypassPart.AssemblyLinearVelocity=Vector3.new(mv.X*spd,hrp.AssemblyLinearVelocity.Y,mv.Z*spd) end
        elseif arPhase==2 then
            local tgt=Vector3.new(AP_R2.X,hrp.Position.Y,AP_R2.Z)
            if (tgt-hrp.Position).Magnitude<1 then
                hum:Move(Vector3.zero,false)
                if _arBypassPart then _arBypassPart.AssemblyLinearVelocity=Vector3.zero end
                _arCleanupProxy()
                autoRightEnabled=false;if arConn then arConn:Disconnect();arConn=nil end
                arPhase=1;if autoRightSetVisual then autoRightSetVisual(false) end
                if mobBtnRefs and mobBtnRefs.autoRight then mobBtnRefs.autoRight(false) end
                saveConfig();return
            end
            local d=AP_R2-hrp.Position;local mv=Vector3.new(d.X,0,d.Z).Unit
            hum:Move(mv,false)
            if _arBypassPart then _arBypassPart.AssemblyLinearVelocity=Vector3.new(mv.X*spd,hrp.AssemblyLinearVelocity.Y,mv.Z*spd) end
        end
    end)
end

local function setupSpeedIndicator(char)
    local head=char:WaitForChild("Head",5);if not head then return end
    local bb=Instance.new("BillboardGui",head)
    bb.Size=UDim2.new(0,160,0,44);bb.StudsOffset=Vector3.new(0,3,0);bb.AlwaysOnTop=true
    speedLabel=Instance.new("TextLabel",bb)
    speedLabel.Size=UDim2.new(1,0,0.55,0);speedLabel.BackgroundTransparency=1
    speedLabel.Text="Speed: 0";speedLabel.TextColor3=Color3.fromRGB(255,255,255)
    speedLabel.Font=Enum.Font.GothamBlack;speedLabel.TextScaled=true
    speedLabel.TextStrokeTransparency=0;speedLabel.TextStrokeColor3=Color3.fromRGB(0,0,0)
    local discordLabel=Instance.new("TextLabel",bb)
    discordLabel.Size=UDim2.new(1,0,0.45,0);discordLabel.Position=UDim2.new(0,0,0.55,0);discordLabel.BackgroundTransparency=1
    discordLabel.Text="https://discord.gg/fFjhjY43B"
    discordLabel.TextColor3=Color3.fromRGB(255,255,255)
    discordLabel.Font=Enum.Font.GothamBlack;discordLabel.TextScaled=true
    discordLabel.TextStrokeTransparency=0;discordLabel.TextStrokeColor3=Color3.fromRGB(0,0,0)
end

local function startAntiRagdoll()
    if Conns.antiRag then return end
    Conns.antiRag=RunService.Heartbeat:Connect(function()
        if not antiRagdollEnabled then return end
        local char=LP.Character
        if not char then return end
        local hum=char:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then return end
        local state=hum:GetState()
        local isRagdolled = state==Enum.HumanoidStateType.Physics or state==Enum.HumanoidStateType.Ragdoll or state==Enum.HumanoidStateType.FallingDown
        if isRagdolled then
            pcall(function()
                hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                local root=char:FindFirstChild("HumanoidRootPart")
                if root then
                    root.Velocity=Vector3.zero
                    root.RotVelocity=Vector3.zero
                    root.AssemblyLinearVelocity=Vector3.zero
                    root.AssemblyAngularVelocity=Vector3.zero
                end
                for _,obj in ipairs(char:GetDescendants()) do
                    if obj:IsA("Motor6D") then obj.Enabled=true end
                    if obj:IsA("Constraint") then obj.Enabled=true end
                end
                workspace.CurrentCamera.CameraSubject=hum
                local PM=LP.PlayerScripts:FindFirstChild("PlayerModule")
                if PM then
                    local CM=require(PM:FindFirstChild("ControlModule"))
                    if CM then CM:Enable() end
                end
                hum.AutoRotate=true
                hum.PlatformStand=false
                hum.Sit=false
            end)
        end
    end)
end

local function stopAntiRagdoll()
    if Conns.antiRag then Conns.antiRag:Disconnect();Conns.antiRag=nil end
end

-- INFINITE JUMP
local InfJumpPlatform = nil
local function CreateIJP()
    if InfJumpPlatform then return end
    InfJumpPlatform = Instance.new("Part")
    InfJumpPlatform.Name = "InfJumpPlatform"
    InfJumpPlatform.Size = Vector3.new(8, 0.5, 8)
    InfJumpPlatform.Anchored = true
    InfJumpPlatform.CanCollide = true
    InfJumpPlatform.Transparency = 1
    InfJumpPlatform.Material = Enum.Material.ForceField
    InfJumpPlatform.Parent = workspace
end
CreateIJP()
RunService.Heartbeat:Connect(function()
    if not infJumpEnabled then
        if InfJumpPlatform then InfJumpPlatform.Position = Vector3.new(0, -1000, 0) end
        return
    end
    local char = LP.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not (char and root and hum) then
        if InfJumpPlatform then InfJumpPlatform.Position = Vector3.new(0, -1000, 0) end
        return
    end
    local isJumping = UIS:IsKeyDown(Enum.KeyCode.Space)
        or hum:GetState() == Enum.HumanoidStateType.Jumping
        or hum.Jump
    if isJumping then
        if not InfJumpPlatform then CreateIJP() end
        InfJumpPlatform.Position = root.Position - Vector3.new(0, 3.5, 0)
        if root.Velocity.Y < 50 then
            root.Velocity = Vector3.new(root.Velocity.X, 50, root.Velocity.Z)
        end
    else
        if InfJumpPlatform then InfJumpPlatform.Position = Vector3.new(0, -1000, 0) end
    end
end)

local _wfConns={}
local function runDrop()
    if dropActive then return end
    if autoBatEnabled then
        autoBatEnabled=false
        if resetAutoBatMotion then resetAutoBatMotion() end
        if autoBatSetVisual then autoBatSetVisual(false) end
    end
    dropActive=true
    local colConn=RunService.Stepped:Connect(function()
        if not dropActive then return end
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and p.Character then
                for _,part in ipairs(p.Character:GetChildren()) do
                    if part:IsA("BasePart") then part.CanCollide=false end
                end
            end
        end
    end)
    table.insert(_wfConns,colConn)
    local flingThread=coroutine.create(function()
        while dropActive do
            RunService.Heartbeat:Wait()
            local c=LP.Character
            local root=c and c:FindFirstChild("HumanoidRootPart")
            if not root then break end
            local vel=root.Velocity
            root.Velocity=vel*10000+Vector3.new(0,10000,0)
            RunService.RenderStepped:Wait()
            if root and root.Parent then root.Velocity=vel end
            RunService.Stepped:Wait()
            if root and root.Parent then root.Velocity=vel+Vector3.new(0,0.1,0) end
        end
    end)
    table.insert(_wfConns,flingThread)
    coroutine.resume(flingThread)
    task.delay(0.1,function()
        dropActive=false
        for _,c in ipairs(_wfConns) do
            if typeof(c)=="RBXScriptConnection" then c:Disconnect()
            elseif type(c)=="thread" then pcall(coroutine.close,c) end
        end
        _wfConns={}
    end)
end

function runDropKeybindBurst()
    task.spawn(function()
        for i=1,3 do
            pcall(runDrop)
            task.wait(0.14)
        end
    end)
end

local function doTPDown(force)
    local char=LP.Character;if not char then return end
    local hrp=char:FindFirstChild("HumanoidRootPart");if not hrp then return end
    local hum2=char:FindFirstChildOfClass("Humanoid");if not hum2 then return end
    if not force then
        if hum2.FloorMaterial~=Enum.Material.Air then return end
        if hrp.Position.Y<autoTPHeight then return end
    end
    hrp.CFrame=CFrame.new(hrp.Position.X,-7.00,hrp.Position.Z)
        *CFrame.Angles(0,select(2,hrp.CFrame:ToEulerAnglesYXZ()),0)
    hrp.AssemblyLinearVelocity=Vector3.zero
    hrp.Velocity=Vector3.zero
end

local function runTPFloor()
    pcall(function() doTPDown(true) end)
end

local defLightBrightness,defLightClock,defLightAmbient
pcall(function()
   if not getgenv().Resolution then
       getgenv().Resolution = { [".gg/scripters"] = 0.65 }
   end
end)

local enableStretchRez, disableStretchRez
do
   local stretchRezOriginalCFrame=nil
   function enableStretchRez()
       stretchRezEnabled=true
       local camera=workspace.CurrentCamera
       if stretchRezConn then stretchRezConn:Disconnect() end
       stretchRezOriginalCFrame=camera.CFrame
       stretchRezConn=RunService.RenderStepped:Connect(function()
           if not stretchRezEnabled then stretchRezConn:Disconnect(); stretchRezConn=nil; return end
           local cam=workspace.CurrentCamera
           local scaleY=(getgenv().Resolution and getgenv().Resolution[".gg/scripters"]) or 0.65
           if cam then cam.CFrame=cam.CFrame*CFrame.new(0,0,0,1,0,0,0,scaleY,0,0,0,1) end
       end)
   end
   function disableStretchRez()
       stretchRezEnabled=false
       if stretchRezConn then stretchRezConn:Disconnect(); stretchRezConn=nil end
       if stretchRezOriginalCFrame then local cam=workspace.CurrentCamera; if cam then cam.CFrame=stretchRezOriginalCFrame end end
   end
end

local function applyAntiLagDerender(obj)
    pcall(function()
        if obj:IsA("Accessory") or obj:IsA("Hat") then obj:Destroy()
        elseif obj:IsA("BasePart") then obj.Material=Enum.Material.Plastic;obj.Reflectance=0;obj.CastShadow=false
        elseif obj:IsA("Decal") or obj:IsA("Texture") then obj.Transparency=1
        elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") then obj.Enabled=false
        elseif obj:IsA("AnimationController") or obj:IsA("Animator") then
            for _,t in ipairs(obj:GetPlayingAnimationTracks()) do pcall(function() t:Stop(0) end) end
        end
    end)
end

local function enableAntiLag()
    removeAccessoriesEnabled=true
    antiLagEnabled=true
    defLightBrightness=defLightBrightness or Lighting.Brightness
    defLightClock=defLightClock or Lighting.ClockTime
    defLightAmbient=defLightAmbient or Lighting.OutdoorAmbient
    Lighting.GlobalShadows=false;Lighting.FogEnd=1e10;Lighting.Brightness=1
    Lighting.EnvironmentDiffuseScale=0;Lighting.EnvironmentSpecularScale=0
    for _,e in pairs(Lighting:GetChildren()) do
        pcall(function()
            if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then e.Enabled=false end
        end)
    end
    for _,obj in ipairs(workspace:GetDescendants()) do applyAntiLagDerender(obj) end
    if antiLagDescConn then antiLagDescConn:Disconnect() end
    antiLagDescConn=workspace.DescendantAdded:Connect(function(obj)
        if removeAccessoriesEnabled then applyAntiLagDerender(obj) end
    end)
end

local function disableAntiLag()
    removeAccessoriesEnabled=false
    antiLagEnabled=false
    if antiLagDescConn then antiLagDescConn:Disconnect();antiLagDescConn=nil end
    pcall(function()
        if defLightBrightness then Lighting.Brightness=defLightBrightness end
        if defLightClock then Lighting.ClockTime=defLightClock end
        if defLightAmbient then Lighting.OutdoorAmbient=defLightAmbient end
        Lighting.ExposureCompensation=0
    end)
end

local function findMedusa()
    local c=LP.Character;if not c then return nil end
    for _,t in ipairs(c:GetChildren()) do if t:IsA("Tool") then local n=t.Name:lower();if n:find("medusa") or n:find("head") or n:find("stone") then return t end end end
    local bp=LP:FindFirstChild("Backpack")
    if bp then for _,t in ipairs(bp:GetChildren()) do if t:IsA("Tool") then local n=t.Name:lower();if n:find("medusa") or n:find("head") or n:find("stone") then return t end end end end
    return nil
end

local function useMedusaCounter()
    if medusaDebounce then return end;if tick()-medusaLastUsed<MEDUSA_COOLDOWN then return end
    local c=LP.Character;if not c then return end;medusaDebounce=true
    local med=findMedusa();if not med then medusaDebounce=false;return end
    if med.Parent~=c then local hum2=c:FindFirstChildOfClass("Humanoid");if hum2 then hum2:EquipTool(med) end end
    pcall(function() med:Activate() end);medusaLastUsed=tick();medusaDebounce=false
end

local function onAnchorChanged(part)
    return part:GetPropertyChangedSignal("Anchored"):Connect(function()
        if part.Anchored and part.Transparency==1 then useMedusaCounter() end
    end)
end

local function setupMedusa(char)
    for _,c in pairs(Conns.anchor) do pcall(function() c:Disconnect() end) end;Conns.anchor={}
    if not char then return end
    for _,part in ipairs(char:GetDescendants()) do if part:IsA("BasePart") then table.insert(Conns.anchor,onAnchorChanged(part)) end end
    table.insert(Conns.anchor,char.DescendantAdded:Connect(function(part)
        if part:IsA("BasePart") then table.insert(Conns.anchor,onAnchorChanged(part)) end
    end))
end

local function stopMedusaCounter()
    for _,c in pairs(Conns.anchor) do pcall(function() c:Disconnect() end) end;Conns.anchor={}
end

local BAT_COUNTER_SLAP_LIST={"Bat","Slap","Iron Slap","Gold Slap","Diamond Slap","Emerald Slap","Ruby Slap","Dark Matter Slap","Flame Slap","Nuclear Slap","Galaxy Slap","Glitched Slap"}
local function findBatForCounter()
    local c=LP.Character;if not c then return nil end
    local bp=LP:FindFirstChildOfClass("Backpack")
    for _,name in ipairs(BAT_COUNTER_SLAP_LIST) do
        local t=c:FindFirstChild(name) or (bp and bp:FindFirstChild(name));if t then return t end
    end
    for _,ch in ipairs(c:GetChildren()) do if ch:IsA("Tool") and ch.Name:lower():find("bat") then return ch end end
    if bp then for _,ch in ipairs(bp:GetChildren()) do if ch:IsA("Tool") and ch.Name:lower():find("bat") then return ch end end end
    return nil
end

local function swingBatForCounter(bat,char)
    local hum2=char:FindFirstChildOfClass("Humanoid")
    if bat.Parent~=char then if hum2 then pcall(function() hum2:EquipTool(bat) end) end;task.wait(0.05) end
    local remote=bat:FindFirstChildOfClass("RemoteEvent") or bat:FindFirstChildOfClass("RemoteFunction")
    if remote and remote:IsA("RemoteEvent") then
        pcall(function() remote:FireServer() end);task.wait(0.15);pcall(function() remote:FireServer() end)
    else pcall(function() bat:Activate() end);task.wait(0.15);pcall(function() bat:Activate() end) end
end

startBatCounter=function()
    if Conns.batCounter then return end
    Conns.batCounter=RunService.Heartbeat:Connect(function()
        if not batCounterEnabled then return end
        if batCounterDebounce then return end
        local char=LP.Character;if not char then return end
        local hum2=char:FindFirstChildOfClass("Humanoid");if not hum2 then return end
        local st=hum2:GetState()
        if st==Enum.HumanoidStateType.Physics or st==Enum.HumanoidStateType.Ragdoll or st==Enum.HumanoidStateType.FallingDown then
            batCounterDebounce=true
            task.spawn(function()
                local bat=findBatForCounter()
                if bat then swingBatForCounter(bat,char) end
                task.wait(0.5);batCounterDebounce=false
            end)
        end
    end)
end

stopBatCounter=function()
    if Conns.batCounter then Conns.batCounter:Disconnect();Conns.batCounter=nil end
    batCounterDebounce=false
end

local function findBat()
    local char=LP.Character; if not char then return nil end
    for _,tool in ipairs(char:GetChildren()) do if tool:IsA("Tool") and (tool.Name:lower():find("bat") or tool.Name:lower():find("slap")) then return tool end end
    local bp=LP:FindFirstChildOfClass("Backpack") or LP:FindFirstChild("Backpack")
    if bp then for _,tool in ipairs(bp:GetChildren()) do if tool:IsA("Tool") and (tool.Name:lower():find("bat") or tool.Name:lower():find("slap")) then return tool end end end
    return nil
end

local function getAutoBatTarget()
    local root=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    local closest,minDist=nil,math.huge
    for _,plr in ipairs(Players:GetPlayers()) do
        if plr~=LP and plr.Character then
            local tRoot=plr.Character:FindFirstChild("HumanoidRootPart")
            local hum=plr.Character:FindFirstChildOfClass("Humanoid")
            if tRoot and hum and hum.Health>0 then
                local dist=(tRoot.Position-root.Position).Magnitude
                if dist<minDist then minDist=dist;closest=tRoot end
            end
        end
    end
    return closest
end

resetAutoBatMotion=function()
    local char=LP.Character
    local hrp=char and char:FindFirstChild("HumanoidRootPart")
    local hum=char and char:FindFirstChildOfClass("Humanoid")
    if hrp then hrp.AssemblyLinearVelocity=Vector3.zero;hrp.AssemblyAngularVelocity=Vector3.zero end
    if hum then hum.AutoRotate=true end
end

local function enableAutoBat()
    if autoLeftEnabled then autoLeftEnabled=false;if autoLeftSetVisual then autoLeftSetVisual(false) end;stopAutoLeft() end
    if autoRightEnabled then autoRightEnabled=false;if autoRightSetVisual then autoRightSetVisual(false) end;stopAutoRight() end
    local char=LP.Character
    if char then
        local hum2=char:FindFirstChildOfClass("Humanoid")
        if hum2 then hum2.AutoRotate=false end
    end
    autoBatEnabled=true
    _batCreateProxy()
end

local function disableAutoBat()
    autoBatEnabled=false
    local char=LP.Character
    if char then
        local hum2=char:FindFirstChildOfClass("Humanoid")
        if hum2 then hum2.AutoRotate=true end
    end
    if resetAutoBatMotion then resetAutoBatMotion() end
    _batCleanupProxy()
end

local function queueAutoLeftStart()
    autoLeftEnabled=true
    if autoRightEnabled then autoRightEnabled=false;if autoRightSetVisual then autoRightSetVisual(false) end;stopAutoRight() end
    if autoBatEnabled then disableAutoBat();if autoBatSetVisual then autoBatSetVisual(false) end end
    _alCreateProxy()
    startAutoLeft()
end

local function queueAutoRightStart()
    autoRightEnabled=true
    if autoLeftEnabled then autoLeftEnabled=false;if autoLeftSetVisual then autoLeftSetVisual(false) end;stopAutoLeft() end
    if autoBatEnabled then disableAutoBat();if autoBatSetVisual then autoBatSetVisual(false) end end
    _arCreateProxy()
    startAutoRight()
end

local function queueAutoBatStart()
    if autoLeftEnabled then autoLeftEnabled=false;if autoLeftSetVisual then autoLeftSetVisual(false) end;stopAutoLeft() end
    if autoRightEnabled then autoRightEnabled=false;if autoRightSetVisual then autoRightSetVisual(false) end;stopAutoRight() end
    enableAutoBat()
end

-- ============================================
-- PROXY BYPASS: Bat Aimbot
-- ============================================

RunService.Heartbeat:Connect(function()
    if not autoBatEnabled then return end
    local char=LP.Character
    local hum=char and char:FindFirstChildOfClass("Humanoid")
    local root=char and char:FindFirstChild("HumanoidRootPart")
    if not root or not hum then return end
    
    if not _batProxyPart or _batProxyPart.Parent ~= char then _batCreateProxy() end
    
    if not char:FindFirstChildOfClass("Tool") then
        local bp=LP:FindFirstChildOfClass("Backpack") or LP:FindFirstChild("Backpack")
        local bpBat=bp and bp:FindFirstChild("Bat")
        if bpBat then pcall(function() hum:EquipTool(bpBat) end) end
    end
    local target=getAutoBatTarget()
    if target then
        local targetVel=target.AssemblyLinearVelocity
        local targetPos=target.Position
        local myPos=root.Position
        local predictPos=targetPos+targetVel*0.14
        predictPos=predictPos+target.CFrame.LookVector*0.3
        local direction=predictPos-myPos
        local flatDir=Vector3.new(direction.X,0,direction.Z)
        if flatDir.Magnitude>0 then flatDir=flatDir.Unit else flatDir=Vector3.zero end
        local chaseSpeed=AUTO_BAT_SPEED
        local desiredHeight=targetPos.Y+3.7
        local yVel=(desiredHeight-myPos.Y)*19.5+targetVel.Y*0.8
        if hum.FloorMaterial~=Enum.Material.Air then yVel=math.max(yVel,13) end
        yVel=math.clamp(yVel,-70,110)
        local desiredVel=Vector3.new(flatDir.X*chaseSpeed,yVel,flatDir.Z*chaseSpeed)
        
        if _batProxyPart then
            _batProxyPart.AssemblyLinearVelocity = _batProxyPart.AssemblyLinearVelocity:Lerp(desiredVel,0.8)
        end
        
        local speed3=targetVel.Magnitude
        local predictTime=math.clamp(speed3/150,0.05,0.2)
        local predictedPos=targetPos+targetVel*predictTime
        local toPredict=predictedPos-myPos
        if toPredict.Magnitude>0.1 then
            hum.AutoRotate=false
            local goalCF=CFrame.lookAt(myPos,predictedPos)
            local diffCF=root.CFrame:Inverse()*goalCF
            local rx,ry,rz=diffCF:ToEulerAnglesXYZ()
            rx=math.clamp(rx,-2.5,2.5); ry=math.clamp(ry,-2.5,2.5); rz=math.clamp(rz,-2.5,2.5)
            root.AssemblyAngularVelocity=root.CFrame:VectorToWorldSpace(Vector3.new(rx*42,ry*42,rz*42))
        end
    else
        hum.AutoRotate=true
        root.AssemblyAngularVelocity=Vector3.zero
        if _batProxyPart then _batProxyPart.AssemblyLinearVelocity=Vector3.zero end
    end
    if autoSwingEnabled then
        local bat=char:FindFirstChild("Bat")
        if bat then
            pcall(function() bat:Activate() end)
        else
            local tool=char:FindFirstChildOfClass("Tool")
            if tool then
                pcall(function() tool:Activate() end)
            end
        end
    end
end)

autoSwitchSpeedEnabled=false
autoTurnOffSpeedEnabled=false
autoSwitchLaggerSpeedEnabled=false
autoSwitchSpeedConn=nil
AUTO_SWITCH_THRESHOLD=25
fpsBoostEnabled=false
fovEnabled=false
fovValue=90
fovConn=nil

setAutoSwitchSpeedVisual,setAutoTurnOffSpeedVisual,setAutoSwitchLaggerSpeedVisual,setFpsBoostVisual,setFovVisual=nil,nil,nil,nil,nil
fovValueBox=nil

function applyFPSBoost()
    pcall(function() settings().Rendering.QualityLevel=Enum.QualityLevel.Level01 end)
end

-- ============================================
-- PROXY BYPASS: Anti-Desync Aimbot
-- ============================================

if antiDesyncAimbotEnabled==nil then antiDesyncAimbotEnabled=false end
antiDesyncCooldown=antiDesyncCooldown or false
antiDesyncConn=antiDesyncConn or nil
setAntiDesyncAimbotVisual=setAntiDesyncAimbotVisual or nil

function antiDesyncGetBat()
    local char=LP.Character
    if not char then return nil end
    local tool=char:FindFirstChild("Bat")
    if tool then return tool end
    local bp=LP:FindFirstChild("Backpack")
    if bp then
        tool=bp:FindFirstChild("Bat")
        if tool then tool.Parent=char;return tool end
    end
    return nil
end
function antiDesyncTryHitBat()
    if antiDesyncCooldown then return end
    antiDesyncCooldown=true
    pcall(function()
        local bat=antiDesyncGetBat()
        if bat then
            bat:Activate()
            local ev=bat:FindFirstChildWhichIsA("RemoteEvent")
            if ev then ev:FireServer() end
        end
    end)
    task.delay(0.08,function() antiDesyncCooldown=false end)
end
function antiDesyncClosestPlayer(hrp)
    if not hrp then return nil,math.huge end
    local closest,dist=nil,math.huge
    for _,p in pairs(Players:GetPlayers()) do
        if p~=LP and p.Character then
            local tr=p.Character:FindFirstChild("HumanoidRootPart")
            if tr then
                local d=(hrp.Position-tr.Position).Magnitude
                if d<dist then dist=d;closest=p end
            end
        end
    end
    return closest,dist
end
function startAntiDesyncAimbot()
    if antiDesyncConn then return end
    antiDesyncAimbotEnabled=true
    _antiDesyncCreateProxy()
    antiDesyncConn=RunService.Heartbeat:Connect(function()
        if not antiDesyncAimbotEnabled then return end
        local char=LP.Character;if not char then return end
        local hum=char:FindFirstChildOfClass("Humanoid")
        local hrp=char:FindFirstChild("HumanoidRootPart")
        if not hum or not hrp then return end
        
        if not _antiDesyncProxyPart or _antiDesyncProxyPart.Parent ~= char then _antiDesyncCreateProxy() end
        
        local target=antiDesyncClosestPlayer(hrp)
        if target and target.Character then
            local tr=target.Character:FindFirstChild("HumanoidRootPart")
            if tr then
                pcall(function() if sethiddenproperty then sethiddenproperty(hrp,"PhysicsRepRootPart",tr) end end)
                local targetPos=tr.Position+Vector3.new(0,0.9,0)
                if (hrp.Position-targetPos).Magnitude>8 then
                    hrp.CFrame=CFrame.new(targetPos)
                end
                pcall(function()
                    local cam=workspace.CurrentCamera
                    if cam then cam.CFrame=CFrame.new(cam.CFrame.Position,tr.Position) end
                end)
                antiDesyncTryHitBat()
            end
        end
    end)
end
function stopAntiDesyncAimbot()
    antiDesyncAimbotEnabled=false
    if antiDesyncConn then antiDesyncConn:Disconnect();antiDesyncConn=nil end
    _antiDesyncCleanupProxy()
end
function setAntiDesyncAimbot(on)
    antiDesyncAimbotEnabled=on
    if on then startAntiDesyncAimbot() else stopAntiDesyncAimbot() end
    if setAntiDesyncAimbotVisual then setAntiDesyncAimbotVisual(on) end
    if mobBtnRefs and mobBtnRefs.antiDesync then mobBtnRefs.antiDesync(on) end
    pcall(saveConfig)
end

-- BODY LOCK
if bodyLockEnabled==nil then bodyLockEnabled=false end
bodyLockRadius=bodyLockRadius or 60
bodyLockConn=bodyLockConn or nil
setBodyLockVisual=setBodyLockVisual or nil
bodyLockRadiusBox=bodyLockRadiusBox or nil

function getNearestBodyLockTarget()
    local character=LP.Character
    local root=character and character:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    local nearest=nil
    local shortest=math.huge
    for _,plr in ipairs(Players:GetPlayers()) do
        if plr~=LP and plr.Character then
            local tr=plr.Character:FindFirstChild("HumanoidRootPart")
            local hum=plr.Character:FindFirstChildOfClass("Humanoid")
            if tr and hum and hum.Health>0 then
                local d=(tr.Position-root.Position).Magnitude
                if d<=bodyLockRadius and d<shortest then
                    shortest=d
                    nearest=plr
                end
            end
        end
    end
    return nearest
end

function startBodyLock()
    if bodyLockConn then return end
    bodyLockEnabled=true
    bodyLockConn=RunService.Heartbeat:Connect(function()
        if not bodyLockEnabled then return end
        local character=LP.Character
        local myRoot=character and character:FindFirstChild("HumanoidRootPart")
        local humanoid=character and character:FindFirstChildOfClass("Humanoid")
        if not myRoot or not humanoid or humanoid.Health<=0 then return end
        local target=getNearestBodyLockTarget()
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local targetPos=target.Character.HumanoidRootPart.Position
            local myPos=myRoot.Position
            local offset=Vector3.new(targetPos.X,myPos.Y,targetPos.Z)-myPos
            if offset.Magnitude>0.1 then
                humanoid.AutoRotate=false
                local lookDir=offset.Unit
                local currentDir=myRoot.CFrame.LookVector
                local cross=currentDir:Cross(lookDir)
                local currentVel=myRoot.AssemblyAngularVelocity
                myRoot.AssemblyAngularVelocity=Vector3.new(currentVel.X,cross.Y*40,currentVel.Z)
            end
        else
            humanoid.AutoRotate=true
        end
    end)
end

function stopBodyLock()
    bodyLockEnabled=false
    if bodyLockConn then bodyLockConn:Disconnect();bodyLockConn=nil end
    local hum=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.AutoRotate=true end
end

function setBodyLock(on)
    bodyLockEnabled=on
    if on then startBodyLock() else stopBodyLock() end
    if setBodyLockVisual then setBodyLockVisual(on) end
    pcall(saveConfig)
end

-- ============================================
-- CHARACTER ADDED EVENTS
-- ============================================

LP.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    setupSpeedIndicator(char)
    if medusaCounterEnabled then setupMedusa(char) end
    if batCounterEnabled then startBatCounter() end
    task.wait(0.15)
    applySavedAnimationPackToCharacter(char)
    if ragdollCountdownEnabled then
        setupOverheadInfo(char)
        hookRagdollCountdown(char)
    end
end)

if LP.Character then 
    setupSpeedIndicator(LP.Character)
    task.wait(0.5)
    applySavedAnimationPackToCharacter(LP.Character)
    if ragdollCountdownEnabled then
        setupOverheadInfo(LP.Character)
        hookRagdollCountdown(LP.Character)
    end
end

-- ============================================
-- MOBILE BUTTONS
-- ============================================

if mobileButtonsSize==nil then mobileButtonsSize=100 end
if mobileButtonShape==nil then mobileButtonShape="box" end
if mobileDragSmall==nil then mobileDragSmall=false end
if mobileMovingMode==nil then mobileMovingMode=false end
mobBtnRefs=mobBtnRefs or {}
mobLastLiveSave=mobLastLiveSave or 0
mobGuiRef=mobGuiRef or nil
mobBtnSavedContainerPos=mobBtnSavedContainerPos or nil
mobBtnSavedIndPos=mobBtnSavedIndPos or {}
setMobileDragSmallVisual=setMobileDragSmallVisual or nil

function saveMobileButtonPositions()
    if not mobGuiRef then return end
    local container=mobGuiRef:FindFirstChild("Buttons")
    if not container then return end
    mobBtnSavedContainerPos={xs=container.Position.X.Scale,xo=container.Position.X.Offset,ys=container.Position.Y.Scale,yo=container.Position.Y.Offset}
    mobBtnSavedIndPos={}
    for _,b in ipairs(container:GetChildren()) do
        if b:IsA("Frame") and b:GetAttribute("Idx") then
            mobBtnSavedIndPos[tostring(b:GetAttribute("Idx"))]={xs=b.Position.X.Scale,xo=b.Position.X.Offset,ys=b.Position.Y.Scale,yo=b.Position.Y.Offset}
        end
    end
end

function saveMobileButtonsConfigOnly()
    pcall(saveMobileButtonPositions)
    pcall(function()
        if not (writefile and HS) then return end
        local cfg={}
        pcall(function()
            if isfile and isfile("exeMobile.json") and readfile then
                local old=HS:JSONDecode(readfile("exeMobile.json"))
                if type(old)=="table" then cfg=old end
            end
        end)
        cfg.mobileButtonsSize=mobileButtonsSize
        cfg.mobileButtonShape=mobileButtonShape
        cfg.mobileDragSmall=mobileDragSmall
        cfg.mobileMovingMode=mobileMovingMode
        cfg.mobBtnSavedContainerPos=mobBtnSavedContainerPos
        cfg.mobBtnSavedIndPos=mobBtnSavedIndPos
        cfg.uiScale=uiScale
        cfg.selectedAnimationPack=selectedAnimationPack
        cfg.AnimationPackIndex=AnimationPackIndex
        cfg.playerESP=PlayerESP.enabled
        cfg.boxESP=BoxedESPOptions.box
        cfg.tracerESP=BoxedESPOptions.tracer
        cfg.ragdollCountdown=ragdollCountdownEnabled
        cfg.skyTheme=skyTheme
        writefile("exeMobile.json",HS:JSONEncode(cfg))
    end)
end

function destroyMobileButtons()
    if mobGuiRef then pcall(saveMobileButtonPositions);pcall(function() mobGuiRef:Destroy() end);mobGuiRef=nil end
    for _,n in ipairs({"BlockDuelsMobileButtons","WhiteMobileButtons","AdaptMobileButtons"}) do
        local old=game:GetService("CoreGui"):FindFirstChild(n);if old then old:Destroy() end
        local pg=LP:FindFirstChild("PlayerGui");if pg then local o=pg:FindFirstChild(n);if o then o:Destroy() end end
    end
    mobBtnRefs={}
end

function resetMobileButtonPositions()
    if mobGuiRef then pcall(function() mobGuiRef:Destroy() end);mobGuiRef=nil end
    for _,n in ipairs({"BlockDuelsMobileButtons","WhiteMobileButtons","AdaptMobileButtons"}) do
        local old=game:GetService("CoreGui"):FindFirstChild(n);if old then old:Destroy() end
        local pg=LP:FindFirstChild("PlayerGui");if pg then local o=pg:FindFirstChild(n);if o then o:Destroy() end end
    end
    mobBtnSavedContainerPos=nil
    mobBtnSavedIndPos={}
    mobileMovingMode=false
    buildMobileButtons()
    pcall(saveConfig);saveMobileButtonsConfigOnly()
    task.delay(0.2,function() pcall(saveConfig);saveMobileButtonsConfigOnly() end)
end

task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            saveMobileButtonPositions()
            saveConfig()
            saveMobileButtonsConfigOnly()
        end)
    end
end)

function buildMobileButtons()
    destroyMobileButtons()
    local MB_SIZE=math.floor(56*(mobileButtonsSize or 100)/100)
    local MB_GAP=8
    local COLS=2
    local ROWS=4
    local totalW=COLS*MB_SIZE+(COLS-1)*MB_GAP
    local totalH=ROWS*MB_SIZE+(ROWS-1)*MB_GAP
    local WHITE=Color3.fromRGB(255,255,255)
    local BG=Color3.fromRGB(0,0,0)
    local OFF=Color3.fromRGB(20,20,25)
    local DIM=Color3.fromRGB(150,150,150)
    local W=Color3.fromRGB(255,255,255)
    local ON_BG=Color3.fromRGB(45,45,55)
    
    local defs={
        {top="DROP",bot="BRAINROT",key="drop",oneShot=true,layout="stacked"},
        {top="AUTO",bot="RIGHT",key="autoLeft",layout="sideBySide"},
        {top="BAT",bot="AIMBOT",key="autoBat",layout="stacked"},
        {top="AUTO",bot="LEFT",key="autoRight",layout="sideBySide"},
        {top="TP",bot="DOWN",key="tpDown",oneShot=true,layout="sideBySide"},
        {top="CARRY",bot="SPEED",key="carrySpeed",layout="stacked"},
        {top="LAGGER",bot="MODE",key="lagger",layout="stacked"},
        {top="ANTI DESYNC",bot="AIMBOT",key="antiDesync",layout="stacked"},
    }
    local function getCorner()
        if mobileButtonShape=="circle" then return UDim.new(1,0)
        elseif mobileButtonShape=="straight" then return UDim.new(0,0)
        else return UDim.new(0,12) end
    end
    local g=Instance.new("ScreenGui");g.Name="BLOCK DUELS";g.ResetOnSpawn=false;g.DisplayOrder=20;g.IgnoreGuiInset=true
    pcall(function() if syn and syn.protect_gui then syn.protect_gui(g) end end)
    if not pcall(function() g.Parent=game:GetService("CoreGui") end) then g.Parent=LP:WaitForChild("PlayerGui") end
    mobGuiRef=g
    local container=Instance.new("Frame",g);container.Name="Buttons";container.Size=UDim2.new(0,totalW,0,totalH);container.Position=UDim2.new(1,-(totalW+10),0.5,-totalH/2);container.BackgroundTransparency=1;container.BorderSizePixel=0;container.Active=false
    if mobBtnSavedContainerPos then container.Position=UDim2.new(mobBtnSavedContainerPos.xs,mobBtnSavedContainerPos.xo,mobBtnSavedContainerPos.ys,mobBtnSavedContainerPos.yo) end
    
    -- Rotating white outline effect for selected premium buttons
    local function addRotatingWhiteStroke(target, thickness)
        local stroke = Instance.new("UIStroke")
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Color = Color3.fromRGB(255,255,255)
        stroke.Thickness = thickness or 1.8
        stroke.Transparency = 0
        stroke.Parent = target

        local gradient = Instance.new("UIGradient")
        gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
            ColorSequenceKeypoint.new(0.45, Color3.fromRGB(255,255,255)),
            ColorSequenceKeypoint.new(0.58, Color3.fromRGB(80,80,80)),
            ColorSequenceKeypoint.new(0.78, Color3.fromRGB(255,255,255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255,255,255))
        })
        gradient.Rotation = 0
        gradient.Parent = stroke

        task.spawn(function()
            while gradient.Parent and target.Parent do
                local tw = TS:Create(
                    gradient,
                    TweenInfo.new(1.35, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
                    {Rotation = gradient.Rotation + 360}
                )
                tw:Play()
                tw.Completed:Wait()
            end
        end)

        return stroke
    end

    for i,def in ipairs(defs) do
        local col=(i-1)%COLS;local row=math.floor((i-1)/COLS)
        local b=Instance.new("Frame",container);b:SetAttribute("Idx",i);b.Size=UDim2.new(0,MB_SIZE,0,MB_SIZE);b.Position=UDim2.new(0,col*(MB_SIZE+MB_GAP),0,row*(MB_SIZE+MB_GAP));b.BackgroundColor3=OFF;b.BorderSizePixel=0;b.ClipsDescendants=true;b.Active=false
        if mobBtnSavedIndPos and mobBtnSavedIndPos[tostring(i)] then local sp=mobBtnSavedIndPos[tostring(i)];b.Position=UDim2.new(sp.xs,sp.xo,sp.ys,sp.yo) end
        Instance.new("UICorner",b).CornerRadius=getCorner()
        
        local st=addRotatingWhiteStroke(b, 1.7)
        
        local top=Instance.new("TextLabel",b);top.BackgroundTransparency=1;top.Text=def.top;top.TextColor3=W;top.Font=Enum.Font.GothamBlack;
        top.TextSize=math.max(8,math.floor(9*mobileButtonsSize/100))
        top.TextStrokeTransparency=0;top.TextStrokeColor3=Color3.fromRGB(0,0,0);top.ZIndex=3
        local bot=Instance.new("TextLabel",b);bot.BackgroundTransparency=1;bot.Text=def.bot;bot.TextColor3=W;bot.Font=Enum.Font.GothamBlack;
        bot.TextSize=math.max(7,math.floor(7*mobileButtonsSize/100))
        bot.TextStrokeTransparency=0;bot.TextStrokeColor3=Color3.fromRGB(0,0,0);bot.ZIndex=3
        if def.key=="antiDesync" then bot.TextScaled=true;bot.TextSize=7 end
        if def.layout=="sideBySide" then
            top.Size=UDim2.new(0.48,0,1,0);top.Position=UDim2.new(0.02,0,0,0);top.TextXAlignment=Enum.TextXAlignment.Center
            bot.Size=UDim2.new(0.48,0,1,0);bot.Position=UDim2.new(0.5,0,0,0);bot.TextXAlignment=Enum.TextXAlignment.Center
        else
            top.Size=UDim2.new(1,-4,0,20);top.Position=UDim2.new(0,2,0.5,-14);top.TextXAlignment=Enum.TextXAlignment.Center
            bot.Size=UDim2.new(1,-4,0,16);bot.Position=UDim2.new(0,2,0.5,2);bot.TextXAlignment=Enum.TextXAlignment.Center
        end
        local on=false
        local function setOn(state)
            on=state
            b.BackgroundColor3=state and ON_BG or OFF
            st.Thickness=state and 2.35 or 1.7
            st.Transparency=state and 0 or 0.05
            top.TextColor3=W
            bot.TextColor3=W
        end
        mobBtnRefs[def.key]=setOn
        if def.key=="autoLeft" then setOn(autoLeftEnabled)
        elseif def.key=="autoRight" then setOn(autoRightEnabled)
        elseif def.key=="autoBat" then setOn(autoBatEnabled)
        elseif def.key=="carrySpeed" then setOn(speedMode)
        elseif def.key=="lagger" then setOn(laggerToggled)
        elseif def.key=="antiDesync" then setOn(antiDesyncAimbotEnabled) end
        local hit=Instance.new("TextButton",b)
        hit.Name="Hitbox";hit.Size=UDim2.new(1,0,1,0);hit.Position=UDim2.new(0,0,0,0);hit.BackgroundTransparency=1;hit.Text="";hit.ZIndex=20;hit.AutoButtonColor=false
        
        local dragging=false
        local dragStart=nil
        local startPos=nil
        local moved=false
        
        hit.InputBegan:Connect(function(input)
            if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
                if not mobileDragSmall and not mobileMovingMode then return end
                dragging=true
                moved=false
                dragStart=input.Position
                startPos=b.Position
                input.Changed:Connect(function()
                    if input.UserInputState==Enum.UserInputState.End then
                        dragging=false
                    end
                end)
            end
        end)
        
        hit.InputChanged:Connect(function(input)
            if not dragging then return end
            if input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch then
                local d=input.Position-dragStart
                if math.abs(d.X)>5 or math.abs(d.Y)>5 then moved=true end
                if moved then
                    b.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
                    mobBtnSavedIndPos[tostring(i)]={xs=b.Position.X.Scale,xo=b.Position.X.Offset,ys=b.Position.Y.Scale,yo=b.Position.Y.Offset}
                    saveMobileButtonsConfigOnly()
                end
            end
        end)
        
        hit.InputEnded:Connect(function(input)
            if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
                if not moved and not mobileMovingMode then
                    if def.key=="drop" then runDropKeybindBurst();setOn(true);task.delay(0.45,function() setOn(false) end)
                    elseif def.key=="tpDown" then task.spawn(runTPFloor);setOn(true);task.delay(0.35,function() setOn(false) end)
                    elseif def.key=="autoLeft" then
                        autoLeftEnabled=not autoLeftEnabled
                        if autoLeftEnabled then queueAutoLeftStart() else stopAutoLeft() end
                        if autoLeftSetVisual then autoLeftSetVisual(autoLeftEnabled) end
                        setOn(autoLeftEnabled)
                        if mobBtnRefs.autoLeft then mobBtnRefs.autoLeft(autoLeftEnabled) end
                        saveConfig();saveMobileButtonsConfigOnly()
                    elseif def.key=="autoRight" then
                        autoRightEnabled=not autoRightEnabled
                        if autoRightEnabled then queueAutoRightStart() else stopAutoRight() end
                        if autoRightSetVisual then autoRightSetVisual(autoRightEnabled) end
                        setOn(autoRightEnabled)
                        if mobBtnRefs.autoRight then mobBtnRefs.autoRight(autoRightEnabled) end
                        saveConfig();saveMobileButtonsConfigOnly()
                    elseif def.key=="autoBat" then 
                        if autoBatEnabled then 
                            autoBatEnabled=false;disableAutoBat();setOn(false);if autoBatSetVisual then autoBatSetVisual(false) end 
                        else 
                            queueAutoBatStart();setOn(autoBatEnabled);if autoBatSetVisual then autoBatSetVisual(autoBatEnabled) end
                            if mobBtnRefs.autoLeft then mobBtnRefs.autoLeft(autoLeftEnabled) end
                            if mobBtnRefs.autoRight then mobBtnRefs.autoRight(autoRightEnabled) end
                        end
                        saveConfig();saveMobileButtonsConfigOnly()
                    elseif def.key=="carrySpeed" then
                            if laggerToggled then laggerToggled=false;laggerPhase=0;speedMode=true else speedMode=not speedMode end
                            if modeValLbl then modeValLbl.Text=laggerToggled and (laggerPhase==2 and "LAGGER CARRY" or "LAGGER NORMAL") or (speedMode and "CARRY" or "NORMAL") end
                            setOn(speedMode);if mobBtnRefs.lagger then mobBtnRefs.lagger(laggerToggled) end;saveConfig();saveMobileButtonsConfigOnly()
                    elseif def.key=="lagger" then
                            if not laggerToggled then speedMode=false;laggerToggled=true;laggerPhase=2 elseif laggerPhase==2 then laggerPhase=1 else laggerPhase=2 end
                            if modeValLbl then modeValLbl.Text=laggerToggled and (laggerPhase==2 and "LAGGER CARRY" or "LAGGER NORMAL") or (speedMode and "CARRY" or "NORMAL") end
                            setOn(laggerToggled);if mobBtnRefs.carrySpeed then mobBtnRefs.carrySpeed(speedMode) end;saveConfig();saveMobileButtonsConfigOnly()
                    elseif def.key=="antiDesync" then setAntiDesyncAimbot(not antiDesyncAimbotEnabled);setOn(antiDesyncAimbotEnabled);saveConfig();saveMobileButtonsConfigOnly()
                    end
                end
                dragging=false
                moved=false
            end
        end)
    end
end

function saveConfig()
    pcall(saveMobileButtonPositions)
    local function ks(e) return {kb=e.kb and e.kb.Name or nil} end
    local function ps(o) return o and {xs=o.Position.X.Scale,xo=o.Position.X.Offset,ys=o.Position.Y.Scale,yo=o.Position.Y.Offset} or nil end
    local cfg={
        normalSpeed=NS,carrySpeed=CS,
        dropBrainrotKey=ks(KB.DropBrainrot),autoLeftKey=ks(KB.AutoLeft),autoRightKey=ks(KB.AutoRight),
        autoBatKey=ks(KB.AutoBat),laggerToggleKey=ks(KB.LaggerToggle),tpFloorKey=ks(KB.TPFloor),guiHideKey=ks(KB.GuiHide),
        speedToggleKey=ks(KB.SpeedToggle),antiDesyncAimbotKey=ks(KB.AntiDesyncAimbot),laggerPanelKey=exeLaggerPanelKey and exeLaggerPanelKey.Name or nil,
        grabRadius=Steal.StealRadius,stealDuration=Steal.StealDuration,
        antiRagdoll=antiRagdollEnabled,autoStealEnabled=Steal.AutoStealEnabled,
        infiniteJump=infJumpEnabled,medusaCounter=medusaCounterEnabled,
        batCounter=batCounterEnabled,bodyLockEnabled=bodyLockEnabled,bodyLockRadius=bodyLockRadius,
        carryMode=speedMode,laggerMode=laggerToggled,laggerCarryMode=laggerPhase==2,laggerSpeed=LAGGER_SPEED,laggerCarrySpeed=LAGGER_CARRY_SPEED,
        autoBat=autoBatEnabled,autoSwing=autoSwingEnabled,autoBatSpeed=AUTO_BAT_SPEED,antiDesyncAimbot=antiDesyncAimbotEnabled,
        unwalkEnabled=animUnwalkEnabled,
        antiLag=antiLagEnabled,stretchRez=stretchRezEnabled,fpsBoostEnabled=fpsBoostEnabled,
        autoSwitchSpeed=autoSwitchSpeedEnabled,autoTurnOffSpeed=autoTurnOffSpeedEnabled,autoSwitchLaggerSpeed=autoSwitchLaggerSpeedEnabled,
        fovEnabled=fovEnabled,fovValue=fovValue,
        uiScale=0.65,
        uiLocked=uiLocked,
        mobileButtonsSize=mobileButtonsSize,mobileButtonShape=mobileButtonShape,mobileDragSmall=mobileDragSmall,mobileMovingMode=mobileMovingMode,
        mobBtnSavedContainerPos=mobBtnSavedContainerPos,mobBtnSavedIndPos=mobBtnSavedIndPos,
        guiPos=ps(exeMainFrame),miniPos=ps(exeMiniButton),grabBarPos=ps(exeGrabBar),
        selectedAnimationPack=selectedAnimationPack,
        AnimationPackIndex=AnimationPackIndex,
        playerESP=PlayerESP.enabled,
        boxESP=BoxedESPOptions.box,
        tracerESP=BoxedESPOptions.tracer,
        ragdollCountdown=ragdollCountdownEnabled,
        skyTheme=skyTheme,
        backgroundImageIndex=backgroundImageIndex
    }
    if writefile then pcall(function() writefile("exeMobile.json",HS:JSONEncode(cfg)) end) end
end

task.spawn(function() while task.wait(1) do pcall(saveConfig) end end)
pcall(function() game:BindToClose(function() pcall(saveConfig) end) end)
pcall(function() LP.AncestryChanged:Connect(function(_,parent) if not parent then pcall(saveConfig) end end) end)

local setInstaGrab,setInfJumpVisual,setAntiRagVisual,setMedusaVisual
local setUnwalkVisual,setAntiLagVisual,setAutoSwingVisual
local normalBox,carryBox,laggerBox,laggerCarryBox,radInput,durationBox,uiScaleBox
local function refreshSpeedModeLabel()
    if modeValLbl then modeValLbl.Text=laggerToggled and (laggerPhase==2 and "LAGGER CARRY" or "LAGGER NORMAL") or (speedMode and "CARRY" or "NORMAL") end
end

local function toggleCarryMode()
    if laggerToggled then
        laggerToggled=false
        laggerPhase=0
        speedMode=true
    else
        speedMode=not speedMode
    end
    refreshSpeedModeLabel()
end

local function toggleLaggerMode()
    if not laggerToggled then
        speedMode=false
        laggerToggled=true
        laggerPhase=2
    elseif laggerPhase==2 then
        laggerPhase=1
    else
        laggerPhase=2
    end
    refreshSpeedModeLabel()
end

local function setModeNormal()
    speedMode=false;laggerToggled=false;laggerPhase=0;refreshSpeedModeLabel()
    if mobBtnRefs and mobBtnRefs.carrySpeed then mobBtnRefs.carrySpeed(false) end
    if mobBtnRefs and mobBtnRefs.lagger then mobBtnRefs.lagger(false) end
end
local function setModeCarry()
    speedMode=true;laggerToggled=false;laggerPhase=0;refreshSpeedModeLabel()
    if mobBtnRefs and mobBtnRefs.carrySpeed then mobBtnRefs.carrySpeed(true) end
    if mobBtnRefs and mobBtnRefs.lagger then mobBtnRefs.lagger(false) end
end

local function stopAutoSwitchSpeed()
    if autoSwitchSpeedConn then autoSwitchSpeedConn:Disconnect();autoSwitchSpeedConn=nil end
end

local function startAutoSwitchSpeed()
    if autoSwitchSpeedConn then return end
    autoSwitchSpeedConn=RunService.Heartbeat:Connect(function()
        if not autoSwitchSpeedEnabled and not autoTurnOffSpeedEnabled and not autoSwitchLaggerSpeedEnabled then stopAutoSwitchSpeed();return end
        local char=LP.Character;if not char then return end
        local hum=char:FindFirstChildOfClass("Humanoid");if not hum then return end
        local ws=hum.WalkSpeed or 16
        if autoSwitchSpeedEnabled and ws<=AUTO_SWITCH_THRESHOLD and not speedMode then
            setModeCarry()
        elseif autoTurnOffSpeedEnabled and ws>AUTO_SWITCH_THRESHOLD and speedMode then
            setModeNormal()
        end
        if autoSwitchLaggerSpeedEnabled and ws<=AUTO_SWITCH_THRESHOLD and not laggerToggled then
            speedMode=false
            laggerToggled=true
            laggerPhase=2
            refreshSpeedModeLabel()
            if mobBtnRefs and mobBtnRefs.carrySpeed then mobBtnRefs.carrySpeed(false) end
            if mobBtnRefs and mobBtnRefs.lagger then mobBtnRefs.lagger(true) end
        elseif autoSwitchLaggerSpeedEnabled and ws>AUTO_SWITCH_THRESHOLD and laggerToggled then
            setModeNormal()
        end
    end)
end

-- ============================================
-- BEAUTIFUL BACKGROUND IMAGE SELECTOR
-- ============================================

local BACKGROUND_IMAGE_LIST = {
    "rbxassetid://90631990302263",
    "rbxassetid://109619268613730",
    "rbxassetid://88369503310562",
    "rbxassetid://80708025126373",
    "rbxassetid://102253425322931",
}

local backgroundImageIndex = 1
local backgroundImageLabel = nil
local backgroundImageValueLabel = nil
local backgroundImagePreview = nil

local function applyBackgroundImage(index)
    index = math.clamp(tonumber(index) or 1, 1, #BACKGROUND_IMAGE_LIST)
    backgroundImageIndex = index
    local imageId = BACKGROUND_IMAGE_LIST[backgroundImageIndex]

    if backgroundImageLabel then backgroundImageLabel.Image = imageId end
    if backgroundImagePreview then backgroundImagePreview.Image = imageId end
    if backgroundImageValueLabel then
        backgroundImageValueLabel.Text = string.format("%d / %d", backgroundImageIndex, #BACKGROUND_IMAGE_LIST)
    end
end

local function setBackgroundImageIndex(index)
    applyBackgroundImage(index)
    pcall(saveConfig)
end

-- ============================================
-- BUILD GUI FUNCTION (Black BG, White Outlines)
-- ============================================

local function buildGui()
    local BG    = Color3.fromRGB(0,0,0)
    local BG2   = Color3.fromRGB(5,5,8)
    local CARD  = Color3.fromRGB(10,10,14)
    local HOV   = Color3.fromRGB(18,18,22)
    local WHITE = Color3.fromRGB(255,255,255)
    local WHITEDIM= Color3.fromRGB(200,200,200)
    local STROKE= Color3.fromRGB(255,255,255)
    local W     = Color3.fromRGB(255,255,255)
    local DIM   = Color3.fromRGB(180,180,180)
    local INP   = Color3.fromRGB(10,10,14)
    local OFF   = Color3.fromRGB(20,20,25)
    local old=game:GetService("CoreGui"):FindFirstChild("BlockDuelsHub") or game:GetService("CoreGui"):FindFirstChild(".exe");if old then old:Destroy() end
    local pg=LP:FindFirstChild("PlayerGui");if pg then local o=pg:FindFirstChild("BlockDuelsHub") or pg:FindFirstChild(".exe");if o then o:Destroy() end end
    local gui=Instance.new("ScreenGui")
    gui.Name="BLOCK DUELS";gui.ResetOnSpawn=false;gui.DisplayOrder=10;gui.IgnoreGuiInset=true
    pcall(function() if syn and syn.protect_gui then syn.protect_gui(gui) end end)
    if not pcall(function() gui.Parent=game:GetService("CoreGui") end) then gui.Parent=LP:WaitForChild("PlayerGui") end
    local main=Instance.new("Frame",gui)
    main.Size=UDim2.new(0,320,0,510);main.Position=UDim2.new(0.5,-160,0.5,-255);exeMainFrame=main
    main.BackgroundColor3=BG;main.BackgroundTransparency=0;main.BorderSizePixel=0;main.ClipsDescendants=false

    backgroundImageLabel=Instance.new("ImageLabel",main)
    backgroundImageLabel.Name="BackgroundImage"
    backgroundImageLabel.Size=UDim2.new(1,0,1,0)
    backgroundImageLabel.Position=UDim2.new(0,0,0,0)
    backgroundImageLabel.BackgroundTransparency=1
    backgroundImageLabel.BorderSizePixel=0
    backgroundImageLabel.Image=BACKGROUND_IMAGE_LIST[backgroundImageIndex]
    backgroundImageLabel.ImageTransparency=0.18
    backgroundImageLabel.ScaleType=Enum.ScaleType.Crop
    backgroundImageLabel.ZIndex=1
    Instance.new("UICorner",backgroundImageLabel).CornerRadius=UDim.new(0,12)

    local backgroundShade=Instance.new("Frame",main)
    backgroundShade.Name="BackgroundShade"
    backgroundShade.Size=UDim2.new(1,0,1,0)
    backgroundShade.BackgroundColor3=Color3.fromRGB(0,0,0)
    backgroundShade.BackgroundTransparency=0.48
    backgroundShade.BorderSizePixel=0
    backgroundShade.ZIndex=1
    Instance.new("UICorner",backgroundShade).CornerRadius=UDim.new(0,12)

    Instance.new("UICorner",main).CornerRadius=UDim.new(0,12)
    
    local mainStroke=Instance.new("UIStroke",main)
    mainStroke.Color=Color3.fromRGB(255,255,255)
    mainStroke.Thickness=1.35
    mainStroke.Transparency=0.22

    local mainGradient=Instance.new("UIGradient",mainStroke)
    mainGradient.Color=ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(90,90,90)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255,255,255))
    })
    mainGradient.Rotation=0
    task.spawn(function()
        while mainGradient.Parent and main.Parent do
            local tw=TS:Create(mainGradient,TweenInfo.new(2.2,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{
                Rotation=mainGradient.Rotation+360
            })
            tw:Play()
            tw.Completed:Wait()
        end
    end)
    
    local scaleObj=Instance.new("UIScale",main);scaleObj.Scale=uiScale
    local function drag(f,lockable)
        local dn,ds,sp,di=false
        f.InputBegan:Connect(function(i)
            if lockable and uiLocked then return end
            if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
                dn=true;ds=i.Position;sp=f.Position
                i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then dn=false;pcall(saveConfig) end end)
            end
        end)
        f.InputChanged:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch then di=i end
        end)
        UIS.InputChanged:Connect(function(i)
            if lockable and uiLocked then dn=false;return end
            if i==di and dn then
                local nX=sp.X.Offset+(i.Position.X-ds.X)
                local nY=sp.Y.Offset+(i.Position.Y-ds.Y)
                f.Position=UDim2.new(sp.X.Scale,nX,sp.Y.Scale,nY)
            end
        end)
    end
    drag(main,true)
    
    local hdr=Instance.new("Frame",main)
    hdr.Size=UDim2.new(1,0,0,44);hdr.BackgroundColor3=BG2;hdr.BackgroundTransparency=1;hdr.BorderSizePixel=0;hdr.ZIndex=2
    Instance.new("UICorner",hdr).CornerRadius=UDim.new(0,12)
    local ttl=Instance.new("TextLabel",hdr)
    ttl.Size=UDim2.new(0,60,1,0);ttl.Position=UDim2.new(0,10,0,0)
    ttl.BackgroundTransparency=1;ttl.Text="Block Duels";ttl.ZIndex=4
    ttl.TextColor3=WHITE;ttl.Font=Enum.Font.GothamBlack;ttl.TextSize=16
    ttl.TextXAlignment=Enum.TextXAlignment.Left

    local bottomNav=Instance.new("Frame",main)
    bottomNav.Size=UDim2.new(1,0,0,50);bottomNav.Position=UDim2.new(0,0,1,-50);bottomNav.BackgroundColor3=BG2;bottomNav.BorderSizePixel=0;bottomNav.ZIndex=10
    Instance.new("UICorner",bottomNav).CornerRadius=UDim.new(0,12)
    local navStroke=Instance.new("UIStroke",bottomNav);navStroke.Color=STROKE;navStroke.Thickness=1;navStroke.Transparency=0.3
    
    local pages,tabButtons={},{}
    local function selectPage(id)
        for name,page in pairs(pages) do page.Visible=(name==id) end
        for name,btn in pairs(tabButtons) do
            local active=name==id
            TS:Create(btn,TweenInfo.new(0.12),{BackgroundColor3=active and Color3.fromRGB(30,30,40) or Color3.fromRGB(10,10,14),TextColor3=active and WHITE or DIM}):Play()
        end
    end
    
    local tabs={
        {"menu","BLOCK DUELS"},
        {"lock","LOCK"},
        {"aimbot","AIMBOT"},
        {"esp","ESP"},
        {"keys","KEYBINDS"},
        {"config","CONFIG"}
    }
    
    for i,t in ipairs(tabs) do
        local btn=Instance.new("TextButton",bottomNav)
        btn.Size=UDim2.new(0,50,0,40);btn.Position=UDim2.new(0,3+(i-1)*52,0.5,-20)
        btn.BackgroundColor3=Color3.fromRGB(10,10,14);btn.BackgroundTransparency=0;btn.BorderSizePixel=0;btn.Text=t[2];btn.TextColor3=DIM
        btn.Font=Enum.Font.GothamBlack;btn.TextSize=9
        btn.ZIndex=11
        Instance.new("UICorner",btn).CornerRadius=UDim.new(0,6)
        local btnStroke=Instance.new("UIStroke",btn)
        btnStroke.Color=Color3.fromRGB(255,255,255)
        btnStroke.Thickness=1
        btnStroke.Transparency=0.3
        tabButtons[t[1]]=btn
        btn.MouseEnter:Connect(function() if not pages[t[1]].Visible then TS:Create(btn,TweenInfo.new(0.08),{BackgroundColor3=HOV,TextColor3=WHITE}):Play() end end)
        btn.MouseLeave:Connect(function() if not pages[t[1]].Visible then TS:Create(btn,TweenInfo.new(0.08),{BackgroundColor3=Color3.fromRGB(10,10,14),TextColor3=DIM}):Play() end end)
        btn.Activated:Connect(function() selectPage(t[1]) end)
    end

    local miniBtn=Instance.new("TextButton",gui)
    miniBtn.Size=UDim2.new(0,100,0,28);miniBtn.Position=UDim2.new(0,26,0,26);exeMiniButton=miniBtn
    miniBtn.BackgroundColor3=BG2;miniBtn.BorderSizePixel=0
    miniBtn.Text="BLOCK DUELS";miniBtn.TextColor3=WHITE;miniBtn.Font=Enum.Font.GothamBold;miniBtn.TextSize=12
    miniBtn.ZIndex=20;miniBtn.Visible=false
    Instance.new("UICorner",miniBtn).CornerRadius=UDim.new(0,8)
    local miniStroke=Instance.new("UIStroke",miniBtn)
    miniStroke.Color=Color3.fromRGB(255,255,255)
    miniStroke.Thickness=2
    miniStroke.Transparency=0

    local miniGradient=Instance.new("UIGradient",miniStroke)
    miniGradient.Color=ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
        ColorSequenceKeypoint.new(0.42, Color3.fromRGB(255,255,255)),
        ColorSequenceKeypoint.new(0.55, Color3.fromRGB(70,70,70)),
        ColorSequenceKeypoint.new(0.72, Color3.fromRGB(255,255,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255,255,255))
    })
    miniGradient.Rotation=0

    task.spawn(function()
        while miniGradient.Parent and miniBtn.Parent do
            local tw=TS:Create(
                miniGradient,
                TweenInfo.new(1.15,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
                {Rotation=miniGradient.Rotation+360}
            )
            tw:Play()
            tw.Completed:Wait()
        end
    end)

    miniBtn.MouseEnter:Connect(function()
        TS:Create(miniBtn,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
            BackgroundColor3=HOV,
            Size=UDim2.new(0,106,0,30)
        }):Play()
        miniStroke.Thickness=2.6
    end)
    miniBtn.MouseLeave:Connect(function()
        TS:Create(miniBtn,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
            BackgroundColor3=BG2,
            Size=UDim2.new(0,100,0,28)
        }):Play()
        miniStroke.Thickness=2
    end)
    drag(miniBtn,false)
    local function showGui() main.Visible=true;miniBtn.Visible=false end
    local function hideGui() main.Visible=false;miniBtn.Visible=true end
    
    local closeBtn=Instance.new("TextButton",hdr)
    closeBtn.Size=UDim2.new(0,28,0,28);closeBtn.Position=UDim2.new(1,-34,0.5,-14)
    closeBtn.BackgroundColor3=BG2;closeBtn.BackgroundTransparency=1;closeBtn.BorderSizePixel=0;closeBtn.ZIndex=4
    closeBtn.Text="-";closeBtn.TextColor3=WHITEDIM;closeBtn.Font=Enum.Font.GothamBold;closeBtn.TextSize=22
    Instance.new("UICorner",closeBtn).CornerRadius=UDim.new(0,6)
    closeBtn.MouseEnter:Connect(function() TS:Create(closeBtn,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(32,32,40),TextColor3=WHITEDIM}):Play() end)
    closeBtn.MouseLeave:Connect(function() TS:Create(closeBtn,TweenInfo.new(0.1),{BackgroundColor3=BG2,TextColor3=WHITEDIM}):Play() end)
    closeBtn.MouseButton1Click:Connect(hideGui)
    miniBtn.MouseButton1Click:Connect(showGui)

    local function mkPage(id)
        local sf=Instance.new("ScrollingFrame",main)
        sf.Size=UDim2.new(1,0,1,-94);sf.Position=UDim2.new(0,0,0,44)
        sf.BackgroundTransparency=1;sf.BorderSizePixel=0;sf.ClipsDescendants=true;sf.Visible=false;sf.ZIndex=2
        sf.ScrollBarThickness=3;sf.ScrollBarImageColor3=WHITE
        sf.CanvasSize=UDim2.new(0,0,0,0);sf.AutomaticCanvasSize=Enum.AutomaticSize.Y
        local ll=Instance.new("UIListLayout",sf);ll.SortOrder=Enum.SortOrder.LayoutOrder;ll.Padding=UDim.new(0,2)
        local pad=Instance.new("UIPadding",sf)
        pad.PaddingLeft=UDim.new(0,7);pad.PaddingRight=UDim.new(0,7)
        pad.PaddingTop=UDim.new(0,7);pad.PaddingBottom=UDim.new(0,7)
        pages[id]=sf
        return sf
    end
    
    local menuPage,lockPage,aimbotPage,espPage,keysPage,configPage=mkPage("menu"),mkPage("lock"),mkPage("aimbot"),mkPage("esp"),mkPage("keys"),mkPage("config")
    local loByPage={}
    local function LO(page) loByPage[page]=(loByPage[page] or 0)+1;return loByPage[page] end
    
    local function mkSect(page,txt)
        local f=Instance.new("Frame",page);f.Size=UDim2.new(1,0,0,22);f.BackgroundTransparency=1;f.BorderSizePixel=0;f.LayoutOrder=LO(page);f.ZIndex=3
        local l=Instance.new("TextLabel",f);l.Size=UDim2.new(1,-8,1,0);l.Position=UDim2.new(0,8,0,0)
        l.BackgroundTransparency=1;l.Text=txt:upper();l.TextColor3=WHITE;l.ZIndex=4
        l.Font=Enum.Font.GothamBlack;l.TextSize=10
        l.TextXAlignment=Enum.TextXAlignment.Left
        l.TextStrokeTransparency=0
        l.TextStrokeColor3=Color3.fromRGB(0,0,0)
    end
    
    local function mkRow(page,h)
        local f=Instance.new("Frame",page);f.Size=UDim2.new(1,0,0,h or 34)
        f.BackgroundColor3=CARD;f.BackgroundTransparency=0.5;f.BorderSizePixel=0;f.LayoutOrder=LO(page);f.ZIndex=3
        Instance.new("UICorner",f).CornerRadius=UDim.new(0,7)
        local rowStroke=Instance.new("UIStroke",f);rowStroke.Color=Color3.fromRGB(255,255,255);rowStroke.Thickness=0.8;rowStroke.Transparency=0.25
        f.MouseEnter:Connect(function() TS:Create(f,TweenInfo.new(0.08),{BackgroundColor3=HOV,BackgroundTransparency=0.5}):Play() end)
        f.MouseLeave:Connect(function() TS:Create(f,TweenInfo.new(0.08),{BackgroundColor3=CARD,BackgroundTransparency=0.5}):Play() end)
        return f
    end
    
    local function mkLabel(row,txt)
        local l=Instance.new("TextLabel",row);l.Size=UDim2.new(0.58,0,1,0);l.Position=UDim2.new(0,10,0,0)
        l.BackgroundTransparency=1;l.Text=txt:upper();l.TextColor3=W;l.ZIndex=4
        l.Font=Enum.Font.GothamBlack;l.TextSize=11
        l.TextStrokeTransparency=0
        l.TextStrokeColor3=Color3.fromRGB(0,0,0)
        l.TextXAlignment=Enum.TextXAlignment.Left
    end
    
    local function mkPill(row,offset)
        local pill=Instance.new("Frame",row);pill.Size=UDim2.new(0,36,0,19)
        pill.Position=UDim2.new(1,-(offset or 42),0.5,-9.5)
        pill.BackgroundColor3=OFF;pill.BorderSizePixel=0;pill.ZIndex=3
        Instance.new("UICorner",pill).CornerRadius=UDim.new(1,0)
        local pillStroke=Instance.new("UIStroke",pill)
        pillStroke.Color=Color3.fromRGB(255,255,255)
        pillStroke.Thickness=1
        local dot=Instance.new("Frame",pill);dot.Size=UDim2.new(0,13,0,13);dot.Position=UDim2.new(0,3,0.5,-6.5)
        dot.BackgroundColor3=DIM;dot.BorderSizePixel=0;dot.ZIndex=4
        Instance.new("UICorner",dot).CornerRadius=UDim.new(1,0)
        return pill,dot
    end
    
    local function animPill(pill,dot,on)
        TS:Create(pill,TweenInfo.new(0.18,Enum.EasingStyle.Quad),{BackgroundColor3=on and Color3.fromRGB(50,50,70) or OFF}):Play()
        TS:Create(dot,TweenInfo.new(0.18,Enum.EasingStyle.Back),{
            Position=on and UDim2.new(1,-16,0.5,-6.5) or UDim2.new(0,3,0.5,-6.5),
            BackgroundColor3=on and WHITE or DIM
        }):Play()
    end
    
    local function mkToggle(page,txt,cb)
        local row=mkRow(page,34);mkLabel(row,txt)
        local pill,dot=mkPill(row,42)
        local on=false
        local function sv(s) on=s;animPill(pill,dot,s) end
        local clk=Instance.new("TextButton",pill);clk.Size=UDim2.new(1,0,1,0);clk.BackgroundTransparency=1;clk.Text="";clk.ZIndex=5
        clk.Activated:Connect(function() if _anyKeyListening then return end;on=not on;sv(on);cb(on) end)
        pill.ZIndex=3;dot.ZIndex=4
        return sv
    end
    
    local function mkBox(parent,default,w,xOff,cb)
        local tb=Instance.new("TextBox",parent)
        tb.Size=UDim2.new(0,w or 55,0,24);tb.Position=UDim2.new(1,-(xOff or 60),0.5,-12)
        tb.BackgroundColor3=INP;tb.BorderSizePixel=0;tb.Text=tostring(default);tb.TextColor3=W
        tb.Font=Enum.Font.GothamBlack;tb.TextSize=11
        tb.ClearTextOnFocus=false;tb.ZIndex=5
        Instance.new("UICorner",tb).CornerRadius=UDim.new(0,5)
        local bs=Instance.new("UIStroke",tb);bs.Color=Color3.fromRGB(255,255,255);bs.Thickness=1;bs.Transparency=0.3
        tb.Focused:Connect(function() TS:Create(bs,TweenInfo.new(0.12),{Color=WHITEDIM,Transparency=0}):Play() end)
        tb.FocusLost:Connect(function()
            TS:Create(bs,TweenInfo.new(0.12),{Color=Color3.fromRGB(255,255,255),Transparency=0.3}):Play()
            if cb then local n=tonumber(tb.Text);if n then cb(n) else tb.Text=tostring(default) end end
        end)
        return tb
    end
    
    local function isGamepadInput(inp) return inp and inp.UserInputType and inp.UserInputType.Name:match("^Gamepad")~=nil end
    local function isBindableInput(inp)
        if not inp or inp.KeyCode==Enum.KeyCode.Unknown then return false end
        if inp.UserInputType==Enum.UserInputType.Keyboard then return true end
        return isGamepadInput(inp)
    end
    local function kbMatch(entry,kc) return kc and (kc==entry.kb) end
    local keyRefs={}
    local function keyLabel(entry) return (entry.kb and entry.kb.Name:upper()) or "NONE" end
    local function refreshKeyRefs(entry)
        for _,r in ipairs(keyRefs) do if r.entry==entry then r.btn.Text=keyLabel(entry) end end
    end
    local function mkKBButton(parent,kbEntry)
        local btn=Instance.new("TextButton",parent)
        btn.Size=UDim2.new(0,70,0,24);btn.Position=UDim2.new(1,-76,0.5,-12)
        btn.BackgroundColor3=INP;btn.BorderSizePixel=0
        btn.Text=keyLabel(kbEntry);btn.TextColor3=W
        btn.Font=Enum.Font.GothamBlack;btn.TextSize=10
        btn.ZIndex=5
        Instance.new("UICorner",btn).CornerRadius=UDim.new(0,5)
        local btnStroke=Instance.new("UIStroke",btn)
        btnStroke.Color=Color3.fromRGB(255,255,255)
        btnStroke.Thickness=1
        btnStroke.Transparency=0.3
        table.insert(keyRefs,{entry=kbEntry,btn=btn})
        local listening=false        local conn=nil
        local previous=btn.Text
        local listenStart=0
        local function stopListen(cancel)
            listening=false
            _anyKeyListening=false
            if conn then conn:Disconnect();conn=nil end
            if cancel then btn.Text=previous else refreshKeyRefs(kbEntry) end
            btn.TextColor3=W
        end
        btn.Activated:Connect(function()
            if listening then stopListen(true);return end
            previous=btn.Text
            listening=true
            _anyKeyListening=true
            listenStart=tick()
            btn.Text="..."
            btn.TextColor3=WHITE
            conn=UIS.InputBegan:Connect(function(inp,gpe)
                if not listening then return end
                if inp.KeyCode==Enum.KeyCode.Escape then stopListen(true);return end
                if inp.KeyCode==Enum.KeyCode.Unknown then return end
                if inp.UserInputType~=Enum.UserInputType.Keyboard then return end
                kbEntry.kb=inp.KeyCode
                stopListen(false)
                pcall(saveConfig)
                pcall(function() if saveMobileButtonsConfigOnly then saveMobileButtonsConfigOnly() end end)
            end)
        end)
        return btn
    end
    local function mkKeyRow(page,txt,kbEntry)
        local row=mkRow(page,34);mkLabel(row,txt);mkKBButton(row,kbEntry)
    end
    local function mkModeRow(page)
        local row=mkRow(page,34);mkLabel(row,"Mode")
        modeValLbl=Instance.new("TextLabel",row)
        modeValLbl.Size=UDim2.new(0,110,1,0);modeValLbl.Position=UDim2.new(1,-116,0,0)
        modeValLbl.BackgroundTransparency=1;modeValLbl.Text="NORMAL";modeValLbl.TextColor3=WHITE
        modeValLbl.Font=Enum.Font.GothamBlack;modeValLbl.TextSize=11
        modeValLbl.TextStrokeTransparency=0
        modeValLbl.TextStrokeColor3=Color3.fromRGB(0,0,0)
        modeValLbl.TextXAlignment=Enum.TextXAlignment.Right
        refreshSpeedModeLabel()
    end
    local function mkActionButton(page,labelTxt,btnTxt,cb)
        local row=mkRow(page,34);mkLabel(row,labelTxt)
        local btn=Instance.new("TextButton",row)
        btn.Size=UDim2.new(0,70,0,24);btn.Position=UDim2.new(1,-76,0.5,-12)
        btn.BackgroundColor3=INP;btn.BorderSizePixel=0;btn.Text=btnTxt:upper();btn.TextColor3=WHITE
        btn.Font=Enum.Font.GothamBlack;btn.TextSize=10
        btn.ZIndex=5
        Instance.new("UICorner",btn).CornerRadius=UDim.new(0,6)
        local bs=Instance.new("UIStroke",btn);bs.Color=STROKE;bs.Thickness=1;bs.Transparency=0.3
        btn.MouseEnter:Connect(function() TS:Create(btn,TweenInfo.new(0.08),{BackgroundColor3=HOV}):Play() end)
        btn.MouseLeave:Connect(function() TS:Create(btn,TweenInfo.new(0.08),{BackgroundColor3=INP}):Play() end)
        btn.Activated:Connect(cb)
        return btn
    end

    local pbFrame=Instance.new("Frame",gui)
    pbFrame.Size=UDim2.new(0,220,0,34);pbFrame.Position=UDim2.new(0.5,-110,1,-50);exeGrabBar=pbFrame
    pbFrame.BackgroundColor3=BG2;pbFrame.BorderSizePixel=0;pbFrame.Active=true;pbFrame.ClipsDescendants=false
    Instance.new("UICorner",pbFrame).CornerRadius=UDim.new(0,9)
    local pbStroke=Instance.new("UIStroke",pbFrame)
    pbStroke.Color=Color3.fromRGB(255,255,255)
    pbStroke.Thickness=1
    pbStroke.Transparency=0.3
    drag(pbFrame,false)
    progressPct=Instance.new("TextLabel",pbFrame)
    progressPct.Size=UDim2.new(0,44,0,14);progressPct.Position=UDim2.new(0,9,0,3)
    progressPct.BackgroundTransparency=1;progressPct.Text="0%";progressPct.TextColor3=W
    progressPct.Font=Enum.Font.GothamBlack;progressPct.TextSize=10;progressPct.TextXAlignment=Enum.TextXAlignment.Left
    progressRadLbl=Instance.new("TextLabel",pbFrame)
    progressRadLbl.Size=UDim2.new(0,120,0,16);progressRadLbl.Position=UDim2.new(1,-128,0,7)
    progressRadLbl.BackgroundTransparency=1;progressRadLbl.Text=string.format("RADIUS: %.2g",Steal.StealRadius)
    progressRadLbl.TextColor3=W;progressRadLbl.Font=Enum.Font.GothamBlack;progressRadLbl.TextSize=11;progressRadLbl.TextXAlignment=Enum.TextXAlignment.Right;progressRadLbl.Visible=false
    progressDurLbl=Instance.new("TextLabel",pbFrame)
    progressDurLbl.Size=UDim2.new(0,120,0,14);progressDurLbl.Position=UDim2.new(1,-128,0,21)
    progressDurLbl.BackgroundTransparency=1;progressDurLbl.Text=string.format("DURATION: %.2gs",Steal.StealDuration)
    progressDurLbl.TextColor3=W;progressDurLbl.Font=Enum.Font.GothamBlack;progressDurLbl.TextSize=10;progressDurLbl.TextXAlignment=Enum.TextXAlignment.Right;progressDurLbl.Visible=false
    local pbg=Instance.new("Frame",pbFrame)
    pbg.Size=UDim2.new(1,-18,0,8);pbg.Position=UDim2.new(0,9,0,21)
    pbg.BackgroundColor3=Color3.fromRGB(15,15,17);pbg.BorderSizePixel=0
    Instance.new("UICorner",pbg).CornerRadius=UDim.new(1,0)
    progressFill=Instance.new("Frame",pbg)
    progressFill.Size=UDim2.new(0,0,1,0);progressFill.BackgroundColor3=WHITE;progressFill.BorderSizePixel=0
    Instance.new("UICorner",progressFill).CornerRadius=UDim.new(1,0)

    -- MENU PAGE
    mkSect(menuPage,"Speed Configuration")
    do local row=mkRow(menuPage,34);mkLabel(row,"Normal Speed");normalBox=mkBox(row,NS,55,62,function(v) if v>0 and v<=500 then NS=v end;saveConfig() end) end
    do local row=mkRow(menuPage,34);mkLabel(row,"Carry Speed");carryBox=mkBox(row,CS,55,62,function(v) if v>0 and v<=500 then CS=v end;saveConfig() end) end
    mkKeyRow(menuPage,"Speed Key",KB.SpeedToggle)
    mkModeRow(menuPage)
    mkSect(menuPage,"Auto Speed")
    setAutoSwitchSpeedVisual=mkToggle(menuPage,"Auto Switch Speed",function(on) autoSwitchSpeedEnabled=on;if on or autoTurnOffSpeedEnabled or autoSwitchLaggerSpeedEnabled then startAutoSwitchSpeed() else stopAutoSwitchSpeed() end;saveConfig() end)
    setAutoSwitchLaggerSpeedVisual=mkToggle(menuPage,"Auto Switch Lagger Speed",function(on) autoSwitchLaggerSpeedEnabled=on;if on or autoSwitchSpeedEnabled or autoTurnOffSpeedEnabled then startAutoSwitchSpeed() else stopAutoSwitchSpeed() end;saveConfig() end)
    setAutoTurnOffSpeedVisual=mkToggle(menuPage,"Auto Turn Off Speed",function(on) autoTurnOffSpeedEnabled=on;if on or autoSwitchSpeedEnabled or autoSwitchLaggerSpeedEnabled then startAutoSwitchSpeed() else stopAutoSwitchSpeed() end;saveConfig() end)
    mkSect(menuPage,"Lagger Speed")
    do local row=mkRow(menuPage,34);mkLabel(row,"Lagger Normal Speed");laggerBox=mkBox(row,LAGGER_SPEED,55,62,function(v) if v>0 and v<=500 then LAGGER_SPEED=v end;saveConfig() end) end
    do local row=mkRow(menuPage,34);mkLabel(row,"Lagger Carry Speed");laggerCarryBox=mkBox(row,LAGGER_CARRY_SPEED,55,62,function(v) if v>0 and v<=500 then LAGGER_CARRY_SPEED=v end;saveConfig() end) end
    mkKeyRow(menuPage,"Lagger Key",KB.LaggerToggle)
    mkSect(menuPage,"Jump / Ragdoll / Sky")
    setInfJumpVisual=mkToggle(menuPage,"Infinite Jump",function(on) infJumpEnabled=on;saveConfig() end)
    setAntiRagVisual=mkToggle(menuPage,"Anti Ragdoll",function(on) antiRagdollEnabled=on;if on then startAntiRagdoll() else stopAntiRagdoll() end;saveConfig() end)
    setRagdollCountdownVisual=mkToggle(menuPage,"Ragdoll Countdown",function(on) setRagdollCountdown(on) end)
    skyThemeSelectorRow(menuPage, 25)

    -- LOCK PAGE
    mkSect(lockPage,"Steal Configuration")
    do local row=mkRow(lockPage,34);mkLabel(row,"Radius");radInput=mkBox(row,Steal.StealRadius,55,62,function(v) if v>=0.5 and v<=300 then Steal.StealRadius=v;if progressRadLbl then progressRadLbl.Text=string.format("RADIUS: %.2g",Steal.StealRadius) end end;saveConfig() end) end
    do local row=mkRow(lockPage,34);mkLabel(row,"Duration");durationBox=mkBox(row,Steal.StealDuration,55,62,function(v) if v>=0.05 and v<=10 then Steal.StealDuration=v;if progressDurLbl then progressDurLbl.Text=string.format("DURATION: %.2gs",Steal.StealDuration) end elseif durationBox then durationBox.Text=tostring(Steal.StealDuration) end;saveConfig() end) end
    setInstaGrab=mkToggle(lockPage,"Auto Steal",function(on) Steal.AutoStealEnabled=on;if on then if not pcall(startAutoSteal) then Steal.AutoStealEnabled=false;if setInstaGrab then setInstaGrab(false) end end else stopAutoSteal() end;saveConfig() end)
    mkSect(lockPage,"Counter")
    setMedusaVisual=mkToggle(lockPage,"Medusa Counter",function(on) medusaCounterEnabled=on;if on then setupMedusa(LP.Character) else stopMedusaCounter() end;saveConfig() end)
    setBatCounterVisual=mkToggle(lockPage,"Bat Counter",function(on) batCounterEnabled=on;if on then startBatCounter() else stopBatCounter() end;saveConfig() end)
    mkSect(lockPage,"Body Lock")
    setBodyLockVisual=mkToggle(lockPage,"Body Lock",function(on) setBodyLock(on) end)
    do local row=mkRow(lockPage,34);mkLabel(row,"Body Lock Radius");bodyLockRadiusBox=mkBox(row,bodyLockRadius,55,62,function(v) if v>=1 and v<=500 then bodyLockRadius=v else bodyLockRadiusBox.Text=tostring(bodyLockRadius) end;saveConfig() end) end

    -- AIMBOT PAGE
    mkSect(aimbotPage,"Bat Aimbot")
    do
        local row=mkRow(aimbotPage,34);mkLabel(row,"Bat Aimbot")
        local pill,dot=mkPill(row,42)
        local abOn=false
        local function svAutoBat(s) abOn=s;animPill(pill,dot,s) end
        autoBatSetVisual=svAutoBat
        local clk=Instance.new("TextButton",pill);clk.Size=UDim2.new(1,0,1,0);clk.BackgroundTransparency=1;clk.Text="";clk.ZIndex=5
        clk.Activated:Connect(function() if _anyKeyListening then return end;abOn=not abOn;svAutoBat(abOn);if abOn then queueAutoBatStart() else autoBatEnabled=false;disableAutoBat() end;saveConfig() end)
    end
    do local row=mkRow(aimbotPage,34);mkLabel(row,"Bat Aimbot Speed");autoBatSpeedBox=mkBox(row,AUTO_BAT_SPEED,55,62,function(v) if v and v>0 and v<=500 then AUTO_BAT_SPEED=v else autoBatSpeedBox.Text=tostring(AUTO_BAT_SPEED) end;saveConfig() end) end
    setAntiDesyncAimbotVisual=mkToggle(aimbotPage,"Anti Desync Aimbot",function(on) setAntiDesyncAimbot(on) end)
    setAutoSwingVisual=mkToggle(aimbotPage,"Auto Swing",function(on) autoSwingEnabled=on;saveConfig() end)
    if setAutoSwingVisual then setAutoSwingVisual(autoSwingEnabled) end
    mkSect(aimbotPage,"Auto Path")
    autoLeftSetVisual=mkToggle(aimbotPage,"Auto Left",function(on) autoLeftEnabled=on;if on then queueAutoLeftStart() else stopAutoLeft() end;saveConfig() end)
    autoRightSetVisual=mkToggle(aimbotPage,"Auto Right",function(on) autoRightEnabled=on;if on then queueAutoRightStart() else stopAutoRight() end;saveConfig() end)

    -- ESP PAGE
    mkSect(espPage,"Player ESP")
    setPlayerESPVisual=mkToggle(espPage,"Player Highlight",function(on) setPlayerESP(on) end)
    setBoxESPVisual=mkToggle(espPage,"Box ESP (2D)",function(on) setBoxESP(on) end)
    setTracerESPVisual=mkToggle(espPage,"Tracer ESP",function(on) setTracerESP(on) end)
    
    -- KEYBINDS PAGE
    mkSect(keysPage,"Move Keys")
    mkKeyRow(keysPage,"Speed Key",KB.SpeedToggle)
    mkKeyRow(keysPage,"Lagger Key",KB.LaggerToggle)
    mkKeyRow(keysPage,"Drop Brainrot Key",KB.DropBrainrot)
    mkKeyRow(keysPage,"TP Down Key",KB.TPFloor)
    mkSect(keysPage,"Combat")
    mkKeyRow(keysPage,"Bat Aimbot Key",KB.AutoBat)
    mkKeyRow(keysPage,"Anti Desync Aimbot Key",KB.AntiDesyncAimbot)
    mkKeyRow(keysPage,"Auto Right Key",KB.AutoRight)
    mkKeyRow(keysPage,"Auto Left Key",KB.AutoLeft)
    mkSect(keysPage,"Interface")
    mkKeyRow(keysPage,"UI Toggle Key",KB.GuiHide)

    -- CONFIG PAGE
    mkSect(configPage,"Visual")
    setAntiLagVisual=mkToggle(configPage,"Anti Lag",function(on) if on then enableAntiLag() else disableAntiLag() end;saveConfig() end)
    setFpsBoostVisual=mkToggle(configPage,"FPS Boost",function(on) fpsBoostEnabled=on;if on then applyFPSBoost() end;saveConfig() end)
    setStretchRezVisual=mkToggle(configPage,"Stretch Rez",function(on) if on then enableStretchRez() else disableStretchRez() end;saveConfig() end)

    mkSect(configPage,"Background Image")
    do
        local row=Instance.new("Frame",configPage)
        row.Size=UDim2.new(1,0,0,122);row.BackgroundColor3=CARD;row.BackgroundTransparency=0.22
        row.BorderSizePixel=0;row.LayoutOrder=LO(configPage);row.ZIndex=3
        Instance.new("UICorner",row).CornerRadius=UDim.new(0,10)
        local rowStroke=Instance.new("UIStroke",row);rowStroke.Color=STROKE;rowStroke.Thickness=1;rowStroke.Transparency=0.2

        local preview=Instance.new("ImageLabel",row)
        backgroundImagePreview=preview
        preview.Name="Preview";preview.Size=UDim2.new(0,112,0,82);preview.Position=UDim2.new(0,8,0,8)
        preview.BackgroundColor3=Color3.fromRGB(0,0,0);preview.BackgroundTransparency=0.15
        preview.BorderSizePixel=0;preview.Image=BACKGROUND_IMAGE_LIST[backgroundImageIndex]
        preview.ScaleType=Enum.ScaleType.Crop;preview.ZIndex=4
        Instance.new("UICorner",preview).CornerRadius=UDim.new(0,8)
        local previewStroke=Instance.new("UIStroke",preview);previewStroke.Color=STROKE;previewStroke.Thickness=1;previewStroke.Transparency=0.28

        local title=Instance.new("TextLabel",row)
        title.Size=UDim2.new(0,155,0,20);title.Position=UDim2.new(0,128,0,9)
        title.BackgroundTransparency=1;title.Text="BACKGROUND";title.TextColor3=WHITE
        title.Font=Enum.Font.GothamBlack;title.TextSize=11;title.TextXAlignment=Enum.TextXAlignment.Left;title.ZIndex=5

        local sub=Instance.new("TextLabel",row)
        sub.Size=UDim2.new(0,155,0,18);sub.Position=UDim2.new(0,128,0,29)
        sub.BackgroundTransparency=1;sub.Text="IMAGE SELECTOR";sub.TextColor3=DIM
        sub.Font=Enum.Font.GothamSemibold;sub.TextSize=9;sub.TextXAlignment=Enum.TextXAlignment.Left;sub.ZIndex=5

        local left=Instance.new("TextButton",row)
        left.Size=UDim2.new(0,34,0,30);left.Position=UDim2.new(0,128,1,-40)
        left.BackgroundColor3=INP;left.BorderSizePixel=0;left.Text="‹";left.TextColor3=WHITE
        left.Font=Enum.Font.GothamBlack;left.TextSize=20;left.ZIndex=5;left.AutoButtonColor=false
        Instance.new("UICorner",left).CornerRadius=UDim.new(0,8)
        local ls=Instance.new("UIStroke",left);ls.Color=STROKE;ls.Thickness=1;ls.Transparency=0.25

        backgroundImageValueLabel=Instance.new("TextLabel",row)
        backgroundImageValueLabel.Size=UDim2.new(0,72,0,30);backgroundImageValueLabel.Position=UDim2.new(0,166,1,-40)
        backgroundImageValueLabel.BackgroundColor3=Color3.fromRGB(5,5,8);backgroundImageValueLabel.BackgroundTransparency=0.12
        backgroundImageValueLabel.BorderSizePixel=0
        backgroundImageValueLabel.Text=string.format("%d / %d",backgroundImageIndex,#BACKGROUND_IMAGE_LIST)
        backgroundImageValueLabel.TextColor3=WHITE;backgroundImageValueLabel.Font=Enum.Font.GothamBlack
        backgroundImageValueLabel.TextSize=10;backgroundImageValueLabel.TextXAlignment=Enum.TextXAlignment.Center;backgroundImageValueLabel.ZIndex=5
        Instance.new("UICorner",backgroundImageValueLabel).CornerRadius=UDim.new(0,8)
        local vs=Instance.new("UIStroke",backgroundImageValueLabel);vs.Color=STROKE;vs.Thickness=1;vs.Transparency=0.3

        local right=Instance.new("TextButton",row)
        right.Size=UDim2.new(0,34,0,30);right.Position=UDim2.new(0,242,1,-40)
        right.BackgroundColor3=INP;right.BorderSizePixel=0;right.Text="›";right.TextColor3=WHITE
        right.Font=Enum.Font.GothamBlack;right.TextSize=20;right.ZIndex=5;right.AutoButtonColor=false
        Instance.new("UICorner",right).CornerRadius=UDim.new(0,8)
        local rs=Instance.new("UIStroke",right);rs.Color=STROKE;rs.Thickness=1;rs.Transparency=0.25

        local function hover(btn,on)
            TS:Create(btn,TweenInfo.new(0.1),{BackgroundColor3=on and Color3.fromRGB(30,30,40) or INP}):Play()
        end
        left.MouseEnter:Connect(function() hover(left,true) end)
        left.MouseLeave:Connect(function() hover(left,false) end)
        right.MouseEnter:Connect(function() hover(right,true) end)
        right.MouseLeave:Connect(function() hover(right,false) end)

        left.Activated:Connect(function()
            local n=backgroundImageIndex-1
            if n<1 then n=#BACKGROUND_IMAGE_LIST end
            setBackgroundImageIndex(n)
        end)
        right.Activated:Connect(function()
            local n=backgroundImageIndex+1
            if n>#BACKGROUND_IMAGE_LIST then n=1 end
            setBackgroundImageIndex(n)
        end)
        preview.InputBegan:Connect(function(input)
            if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
                local n=backgroundImageIndex+1
                if n>#BACKGROUND_IMAGE_LIST then n=1 end
                setBackgroundImageIndex(n)
            end
        end)
    end

    mkSect(configPage,"Camera")
    setFovVisual=mkToggle(configPage,"FOV Change",function(on) setFovEnabled(on);saveConfig() end)
    do local row=mkRow(configPage,34);mkLabel(row,"FOV Value");fovValueBox=mkBox(row,fovValue,55,62,function(v) if v>=30 and v<=120 then fovValue=v;if fovEnabled and workspace.CurrentCamera then workspace.CurrentCamera.FieldOfView=v end else fovValueBox.Text=tostring(fovValue) end;saveConfig() end) end
    mkActionButton(configPage,"Reset FOV","Reset",function() resetFovAndCamera();if setFovVisual then setFovVisual(false) end;saveConfig() end)
    mkSect(configPage,"Mobile Buttons")
    do
        local row=mkRow(configPage,34);mkLabel(row,"Move Buttons")
        local moveBtn=Instance.new("TextButton",row)
        moveBtn.Size=UDim2.new(0,96,0,24);moveBtn.Position=UDim2.new(1,-102,0.5,-12)
        moveBtn.BackgroundColor3=INP;moveBtn.BorderSizePixel=0;moveBtn.Text=mobileMovingMode and "LOCK BUTTONS" or "MOVE BUTTONS";moveBtn.TextColor3=WHITE
        moveBtn.Font=Enum.Font.GothamBlack;moveBtn.TextSize=9
        moveBtn.ZIndex=5
        Instance.new("UICorner",moveBtn).CornerRadius=UDim.new(0,6)
        local mvStroke=Instance.new("UIStroke",moveBtn);mvStroke.Color=STROKE;mvStroke.Thickness=1;mvStroke.Transparency=0.3
        moveBtn.Activated:Connect(function()
            mobileMovingMode=not mobileMovingMode
            moveBtn.Text=mobileMovingMode and "LOCK BUTTONS" or "MOVE BUTTONS"
            buildMobileButtons()
            saveConfig()
        end)
    end
    mkActionButton(configPage,"Reset Buttons","Reset",function() resetMobileButtonPositions() end)
    do
        local row=mkRow(configPage,34);mkLabel(row,"Btn Scale")
        local sizes={60,65,75,100,125,150}
        local bw=28
        local startX=-6-(#sizes*(bw+2))
        local refs={}
        local function refresh(sel)
            for _,r in ipairs(refs) do
                local a=r.sz==sel
                r.btn.BackgroundColor3=a and Color3.fromRGB(50,50,70) or INP
                r.btn.TextColor3=a and WHITE or W
            end
        end
        for i,sz in ipairs(sizes) do
            local sb=Instance.new("TextButton",row)
            sb.Size=UDim2.new(0,bw,0,20);sb.Position=UDim2.new(1,startX+(i-1)*(bw+2),0.5,-10)
            sb.BackgroundColor3=(mobileButtonsSize==sz) and Color3.fromRGB(50,50,70) or INP;sb.BorderSizePixel=0
            sb.Text=tostring(sz);sb.TextColor3=(mobileButtonsSize==sz) and WHITE or W;sb.Font=Enum.Font.GothamBlack;sb.TextSize=8;sb.ZIndex=5
            Instance.new("UICorner",sb).CornerRadius=UDim.new(0,5);local st=Instance.new("UIStroke",sb);st.Color=STROKE;st.Thickness=1;st.Transparency=0.3
            table.insert(refs,{btn=sb,sz=sz})
            sb.Activated:Connect(function() mobileButtonsSize=sz;refresh(sz);buildMobileButtons();pcall(saveConfig);saveMobileButtonsConfigOnly() end)
        end
    end
    setMobileDragSmallVisual=mkToggle(configPage,"Drag Small Menu",function(on) mobileDragSmall=on;pcall(saveConfig);saveMobileButtonsConfigOnly() end)
    if mobileDragSmall and setMobileDragSmallVisual then setMobileDragSmallVisual(true) end
    do
        mkSect(configPage,"Btn Shape")
        local shapes={{"circle","Circle"},{"box","Box"},{"straight","Straight"}}
        local row=mkRow(configPage,42)
        for i,sh in ipairs(shapes) do
            local btn=Instance.new("TextButton",row)
            btn.Size=UDim2.new(0,80,0,28);btn.Position=UDim2.new(0,8+(i-1)*88,0.5,-14)
            btn.BackgroundColor3=(mobileButtonShape==sh[1]) and Color3.fromRGB(50,50,70) or INP
            btn.BorderSizePixel=0;btn.Text=sh[2]:upper();btn.TextColor3=(mobileButtonShape==sh[1]) and WHITE or W;btn.Font=Enum.Font.GothamBlack;btn.TextSize=8;btn.ZIndex=5
            Instance.new("UICorner",btn).CornerRadius=sh[1]=="circle" and UDim.new(1,0) or (sh[1]=="straight" and UDim.new(0,0) or UDim.new(0,8))
            local st=Instance.new("UIStroke",btn);st.Color=STROKE;st.Thickness=1;st.Transparency=0.3
            btn.Activated:Connect(function()
                mobileButtonShape=sh[1]
                for _,sib in ipairs(row:GetChildren()) do
                    if sib:IsA("TextButton") then
                        local active=(sib==btn)
                        sib.BackgroundColor3=active and Color3.fromRGB(50,50,70) or INP
                        sib.TextColor3=active and WHITE or W
                    end
                end
                buildMobileButtons();pcall(saveConfig)
            end)
        end
    end
    mkSect(configPage,"Lagger Panel")
    mkActionButton(configPage,"Lagger Panel","Open",function() openExeLaggerPanel() end)
    mkSect(configPage,"Interface")
    setLockVisual=mkToggle(configPage,"Lock UI",function(on) uiLocked=on;saveConfig() end)
    do
        local row=mkRow(configPage,34);mkLabel(row,"UI Scale")
        local UI_SCALES={65}
        local uiBtnW=28
        local uiStartX=-6-(#UI_SCALES*(uiBtnW+2))
        local refs={}
        local function refreshBtns(selected)
            for _,ref in ipairs(refs) do
                local active=ref.sz==selected
                ref.btn.BackgroundColor3=active and Color3.fromRGB(50,50,70) or INP
                ref.btn.TextColor3=active and WHITE or W
            end
        end
        uiScale = 0.65
        if scaleObj then scaleObj.Scale = uiScale end
        local selected=65
        for i,sz in ipairs(UI_SCALES) do
            local sb=Instance.new("TextButton",row)
            sb.Size=UDim2.new(0,uiBtnW,0,20);sb.Position=UDim2.new(1,uiStartX+(i-1)*(uiBtnW+2),0.5,-10)
            sb.BackgroundColor3=(selected==sz) and Color3.fromRGB(50,50,70) or INP;sb.BorderSizePixel=0
            sb.Text=tostring(sz);sb.TextColor3=(selected==sz) and WHITE or W;sb.Font=Enum.Font.GothamBlack;sb.TextSize=8;sb.ZIndex=5
            Instance.new("UICorner",sb).CornerRadius=UDim.new(0,5)
            local bs=Instance.new("UIStroke",sb);bs.Color=STROKE;bs.Thickness=1;bs.Transparency=0.3
            table.insert(refs,{btn=sb,sz=sz})
            sb.Activated:Connect(function() 
                uiScale=0.65
                if scaleObj then scaleObj.Scale=uiScale end
                refreshBtns(65)
                saveConfig()
            end)
        end
    end
    
    animationPackRow(configPage, 99)

    -- KEYBINDS
    UIS.InputBegan:Connect(function(input,gpe)
        if _anyKeyListening then return end
        if input.UserInputType==Enum.UserInputType.Keyboard then
            if gpe or UIS:GetFocusedTextBox() then return end
        elseif not isGamepadInput(input) then return end
        if not isBindableInput(input) then return end
        local kc=input.KeyCode
        if kbMatch(KB.LaggerToggle,kc) then
            toggleLaggerMode();saveConfig()
        elseif kbMatch(KB.SpeedToggle,kc) then
            toggleCarryMode();saveConfig()
        elseif kbMatch(KB.DropBrainrot,kc) then runDropKeybindBurst()
        elseif kbMatch(KB.TPFloor,kc) then runTPFloor()
        elseif kbMatch(KB.AutoLeft,kc) then
            autoLeftEnabled=not autoLeftEnabled
            if autoLeftEnabled then queueAutoLeftStart() else stopAutoLeft() end
            if autoLeftSetVisual then autoLeftSetVisual(autoLeftEnabled) end
            saveConfig()
        elseif kbMatch(KB.AutoRight,kc) then
            autoRightEnabled=not autoRightEnabled
            if autoRightEnabled then queueAutoRightStart() else stopAutoRight() end
            if autoRightSetVisual then autoRightSetVisual(autoRightEnabled) end
            saveConfig()
        elseif kbMatch(KB.AutoBat,kc) then
            if autoBatEnabled then
                autoBatEnabled=false;disableAutoBat()
                if autoBatSetVisual then autoBatSetVisual(false) end
                if mobBtnRefs and mobBtnRefs.autoBat then mobBtnRefs.autoBat(false) end
            else
                queueAutoBatStart()
                if autoBatSetVisual then autoBatSetVisual(autoBatEnabled) end
                if mobBtnRefs and mobBtnRefs.autoBat then mobBtnRefs.autoBat(autoBatEnabled) end
            end
            saveConfig()
        elseif kbMatch(KB.GuiHide,kc) then if main.Visible then hideGui() else showGui() end
        end
    end)
    selectPage("menu")
end

local _savedCfg = nil
local function loadConfigKeys()
    if not(isfile and isfile("exeMobile.json")) then return end
    local ok,cfg=pcall(function() return HS:JSONDecode(readfile("exeMobile.json")) end)
    if not ok or not cfg then return end
    _savedCfg=cfg
    local function lk(e,d) if type(d)~="table" then return end;if d.kb and Enum.KeyCode[d.kb] then e.kb=Enum.KeyCode[d.kb] end end
    lk(KB.DropBrainrot,cfg.dropBrainrotKey);lk(KB.AutoLeft,cfg.autoLeftKey);lk(KB.AutoRight,cfg.autoRightKey)
    lk(KB.AutoBat,cfg.autoBatKey);lk(KB.LaggerToggle,cfg.laggerToggleKey)
    lk(KB.TPFloor,cfg.tpFloorKey);lk(KB.GuiHide,cfg.guiHideKey);lk(KB.SpeedToggle,cfg.speedToggleKey);lk(KB.AntiDesyncAimbot,cfg.antiDesyncAimbotKey)
    if cfg.laggerPanelKey and Enum.KeyCode[cfg.laggerPanelKey] then exeLaggerPanelKey=Enum.KeyCode[cfg.laggerPanelKey] end
    if cfg.normalSpeed then NS=cfg.normalSpeed end
    if cfg.carrySpeed then CS=cfg.carrySpeed end
    if cfg.grabRadius and type(cfg.grabRadius)=="number" then Steal.StealRadius=cfg.grabRadius else Steal.StealRadius=60 end
    if cfg.stealDuration and type(cfg.stealDuration)=="number" then Steal.StealDuration=cfg.stealDuration else Steal.StealDuration=1.4 end
    if cfg.laggerSpeed and type(cfg.laggerSpeed)=="number" then LAGGER_SPEED=cfg.laggerSpeed end
    if cfg.laggerCarrySpeed and type(cfg.laggerCarrySpeed)=="number" then LAGGER_CARRY_SPEED=cfg.laggerCarrySpeed end
    if cfg.autoSwing~=nil then autoSwingEnabled=cfg.autoSwing==true end
    if cfg.autoBatSpeed and type(cfg.autoBatSpeed)=="number" then AUTO_BAT_SPEED=math.clamp(cfg.autoBatSpeed,1,500) end
    if cfg.bodyLockRadius and type(cfg.bodyLockRadius)=="number" then bodyLockRadius=math.clamp(cfg.bodyLockRadius,1,500) end
    uiScale = 0.65
    if cfg.uiLocked~=nil then uiLocked=cfg.uiLocked==true end
    if cfg.fovValue and type(cfg.fovValue)=="number" then fovValue=math.clamp(cfg.fovValue,30,120) end
    if cfg.mobileButtonsSize and type(cfg.mobileButtonsSize)=="number" then mobileButtonsSize=cfg.mobileButtonsSize end
    if cfg.mobileButtonShape and type(cfg.mobileButtonShape)=="string" then mobileButtonShape=cfg.mobileButtonShape end
    if cfg.mobileDragSmall~=nil then mobileDragSmall=cfg.mobileDragSmall==true end
    if cfg.mobileMovingMode~=nil then mobileMovingMode=cfg.mobileMovingMode==true end
    if cfg.mobBtnSavedContainerPos and type(cfg.mobBtnSavedContainerPos)=="table" then mobBtnSavedContainerPos=cfg.mobBtnSavedContainerPos end
    if cfg.mobBtnSavedIndPos and type(cfg.mobBtnSavedIndPos)=="table" then mobBtnSavedIndPos=cfg.mobBtnSavedIndPos end
    if cfg.selectedAnimationPack and type(cfg.selectedAnimationPack)=="string" then
        selectedAnimationPack = cfg.selectedAnimationPack
    end
    if cfg.AnimationPackIndex and type(cfg.AnimationPackIndex)=="number" then
        AnimationPackIndex = cfg.AnimationPackIndex
    end
    if cfg.playerESP~=nil then
        if cfg.playerESP and not PlayerESP.enabled then setPlayerESP(true)
        elseif not cfg.playerESP and PlayerESP.enabled then setPlayerESP(false) end
    end
    if cfg.boxESP~=nil then
        BoxedESPOptions.box = cfg.boxESP
    end
    if cfg.tracerESP~=nil then
        BoxedESPOptions.tracer = cfg.tracerESP
    end
    if cfg.ragdollCountdown~=nil then
        ragdollCountdownEnabled = cfg.ragdollCountdown
    end
    if cfg.skyTheme and type(cfg.skyTheme)=="string" then
        skyTheme = cfg.skyTheme
        for i, name in ipairs(SKY_PRESETS_LIST) do
            if name == skyTheme then skyIndex = i; break end
        end
    end
    if cfg.backgroundImageIndex then
        backgroundImageIndex=math.clamp(tonumber(cfg.backgroundImageIndex) or 1,1,#BACKGROUND_IMAGE_LIST)
    end
end

local function loadConfigState()
    local cfg=_savedCfg;if not cfg then return end
    if normalBox then normalBox.Text=tostring(NS) end
    if carryBox then carryBox.Text=tostring(CS) end
    if radInput then radInput.Text=tostring(Steal.StealRadius) end
    if durationBox then durationBox.Text=tostring(Steal.StealDuration) end
    if progressRadLbl then progressRadLbl.Text=string.format("RADIUS: %.2g",Steal.StealRadius) end
    if progressDurLbl then progressDurLbl.Text=string.format("DURATION: %.2gs",Steal.StealDuration) end
    if laggerBox then laggerBox.Text=tostring(LAGGER_SPEED) end
    if laggerCarryBox then laggerCarryBox.Text=tostring(LAGGER_CARRY_SPEED) end
    if uiScaleBox then uiScaleBox.Text="65" end
    if fovValueBox then fovValueBox.Text=tostring(fovValue) end
    if bodyLockRadiusBox then bodyLockRadiusBox.Text=tostring(bodyLockRadius) end
    if autoBatSpeedBox then autoBatSpeedBox.Text=tostring(AUTO_BAT_SPEED) end
    applyBackgroundImage(backgroundImageIndex)
    if cfg.guiPos and exeMainFrame then exeMainFrame.Position=UDim2.new(cfg.guiPos.xs or 0.5,cfg.guiPos.xo or -160,cfg.guiPos.ys or 0.5,cfg.guiPos.yo or -255) end
    if cfg.miniPos and exeMiniButton then exeMiniButton.Position=UDim2.new(cfg.miniPos.xs or 0,cfg.miniPos.xo or 26,cfg.miniPos.ys or 0,cfg.miniPos.yo or 26) end
    if cfg.grabBarPos and exeGrabBar then exeGrabBar.Position=UDim2.new(cfg.grabBarPos.xs or 0.5,cfg.grabBarPos.xo or -110,cfg.grabBarPos.ys or 1,cfg.grabBarPos.yo or -50) end
    if setLockVisual then setLockVisual(uiLocked) end
    if setPlayerESPVisual then setPlayerESPVisual(PlayerESP.enabled) end
    if setBoxESPVisual then setBoxESPVisual(BoxedESPOptions.box) end
    if setTracerESPVisual then setTracerESPVisual(BoxedESPOptions.tracer) end
    if setRagdollCountdownVisual then setRagdollCountdownVisual(ragdollCountdownEnabled) end
    refreshBoxedESP()
    task.spawn(function()
        task.wait(0.15)
        if cfg.antiRagdoll then antiRagdollEnabled=true;if setAntiRagVisual then setAntiRagVisual(true) end;startAntiRagdoll() end
        if cfg.autoStealEnabled then Steal.AutoStealEnabled=true;if setInstaGrab then setInstaGrab(true) end;pcall(startAutoSteal) end
        if cfg.infiniteJump then infJumpEnabled=true;if setInfJumpVisual then setInfJumpVisual(true) end end
        if cfg.medusaCounter then medusaCounterEnabled=true;if setMedusaVisual then setMedusaVisual(true) end;setupMedusa(LP.Character) end
        if cfg.batCounter then batCounterEnabled=true;if setBatCounterVisual then setBatCounterVisual(true) end;startBatCounter() end
        if cfg.bodyLockEnabled then bodyLockEnabled=true;if setBodyLockVisual then setBodyLockVisual(true) end;startBodyLock() end
        if cfg.laggerMode then laggerToggled=true;speedMode=false;laggerPhase=cfg.laggerCarryMode and 2 or 1;refreshSpeedModeLabel()
        elseif cfg.carryMode then speedMode=false;toggleCarryMode() end
        if setAutoSwingVisual then setAutoSwingVisual(autoSwingEnabled) end
        if cfg.autoBat then autoBatEnabled=true;if autoBatSetVisual then autoBatSetVisual(true) end;queueAutoBatStart() end
        if cfg.antiDesyncAimbot then setAntiDesyncAimbot(true) end
        if cfg.autoSwitchSpeed then autoSwitchSpeedEnabled=true;if setAutoSwitchSpeedVisual then setAutoSwitchSpeedVisual(true) end;startAutoSwitchSpeed() end
        if cfg.autoTurnOffSpeed then autoTurnOffSpeedEnabled=true;if setAutoTurnOffSpeedVisual then setAutoTurnOffSpeedVisual(true) end;startAutoSwitchSpeed() end
        if cfg.autoSwitchLaggerSpeed then autoSwitchLaggerSpeedEnabled=true;if setAutoSwitchLaggerSpeedVisual then setAutoSwitchLaggerSpeedVisual(true) end;startAutoSwitchSpeed() end
        if cfg.fpsBoostEnabled then fpsBoostEnabled=true;if setFpsBoostVisual then setFpsBoostVisual(true) end;applyFPSBoost() end
        if cfg.fovEnabled then fovEnabled=true;if setFovVisual then setFovVisual(true) end;setFovEnabled(true) end
        if cfg.antiLag then enableAntiLag();if setAntiLagVisual then setAntiLagVisual(true) end end
        if cfg.stretchRez then enableStretchRez();if setStretchRezVisual then setStretchRezVisual(true) end end
        if cfg.ragdollCountdown then
            setRagdollCountdown(true)
        end
        if skyTheme and skyTheme ~= "Off" then
            task.wait(0.2)
            applyCustomSky(skyTheme)
        end
        if selectedAnimationPack and selectedAnimationPack ~= "OFF" then
            task.wait(0.3)
            applyAnimationPack(selectedAnimationPack)
        end
        if cfg.playerESP then startPlayerESP() end
    end)
end

loadConfigKeys()
buildGui()
loadConfigState()
buildMobileButtons()

UIS.InputBegan:Connect(function(input,gpe)
    if _anyKeyListening then return end
    if UIS:GetFocusedTextBox() then return end
    if input.KeyCode==Enum.KeyCode.Unknown then return end
    local kc=input.KeyCode
    local function matches(entry)
        return entry and (kc==entry.kb)
    end
    if matches(KB.AntiDesyncAimbot) then
        setAntiDesyncAimbot(not antiDesyncAimbotEnabled)
        pcall(saveConfig)
    end
end)

function openExeLaggerPanel()
    local cg=game:GetService("CoreGui")
    local old=cg:FindFirstChild("ExeLagger_UI") or cg:FindFirstChild("ExeLaggerPanel")
    if old then old:Destroy();return end
    local laggerScript=[===[
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local ConfigFile = "ExeMobileLaggerConfig.json"

local NIVELES = {
    Low     = { poder = 23 },
    Mid     = { poder = 32 },
    High    = { poder = 70 },
    Crazy   = { poder = 90 }
}

local keybind = Enum.KeyCode.M
local laggerActive = false
local lagThread = nil
local nivelActual = "Low"
local ventanaBloqueada = false

local UI_CONFIG = {
    White        = Color3.fromRGB(255, 255, 255),
    Black        = Color3.fromRGB(0, 0, 0),
    MainBg       = Color3.fromRGB(0, 0, 0),
    TitleColor   = Color3.fromRGB(255, 255, 255),
    TextColor    = Color3.fromRGB(255, 255, 255),
    ButtonInact  = Color3.fromRGB(0, 0, 0),
    ButtonLow    = Color3.fromRGB(255, 255, 255),
    ButtonMid    = Color3.fromRGB(255, 255, 255),
    ButtonHigh   = Color3.fromRGB(255, 255, 255),
    ButtonCrazy  = Color3.fromRGB(255, 255, 255),
    ToggleOff    = Color3.fromRGB(0, 0, 0),
    ToggleOn     = Color3.fromRGB(255, 255, 255),
    LockColor    = Color3.fromRGB(255, 255, 255),
    UnlockColor  = Color3.fromRGB(0, 0, 0),
    Font         = Enum.Font.GothamBlack,
    BorderColor  = Color3.fromRGB(255, 255, 255),
}

local function SaveConfig()
    local data = {
        Nivel = nivelActual,
        Bloqueado = ventanaBloqueada,
        Keybind = keybind and keybind.Name or "M"
    }
    pcall(function() writefile(ConfigFile, HttpService:JSONEncode(data)) end)
end

local function LoadConfig()
    if pcall(isfile, ConfigFile) and isfile(ConfigFile) then
        pcall(function()
            local data = HttpService:JSONDecode(readfile(ConfigFile))
            nivelActual = data.Nivel or "Low"
            if nivelActual == "Ultra" then nivelActual = "Crazy" end
            ventanaBloqueada = data.Bloqueado or false
            if data.Keybind then
                for _,k in ipairs(Enum.KeyCode:GetEnumItems()) do
                    if k.Name == data.Keybind then keybind = k break end
                end
            end
        end)
    end
end
LoadConfig()

local function bomb(poder)
    local main, spam = {}, {{}}
    local z = spam[1]
    for i = 1, 25 do local t = {} table.insert(z, t) z = t end
    local max = math.min(12000, poder * 50)
    for i = 1, max do table.insert(main, spam) end
    pcall(function() game:GetService("RobloxReplicatedStorage").SetPlayerBlockList:FireServer(main) end)
end

local toggleBall, toggleContainer, btnLow, btnMid, btnHigh, btnCrazy, lockButton
local titleLabel, textLagger, keybindTextBox, toggleClick

local function actualizarBotonesNivel()
    if btnLow then
        if nivelActual == "Low" then
            btnLow.BackgroundColor3 = UI_CONFIG.ButtonLow
            btnLow.TextColor3 = UI_CONFIG.Black
            btnLow.BorderSizePixel = 1
            btnLow.BorderColor3 = UI_CONFIG.BorderColor
        else
            btnLow.BackgroundColor3 = UI_CONFIG.ButtonInact
            btnLow.TextColor3 = UI_CONFIG.White
            btnLow.BorderSizePixel = 1
            btnLow.BorderColor3 = UI_CONFIG.BorderColor
        end
    end
    if btnMid then
        if nivelActual == "Mid" then
            btnMid.BackgroundColor3 = UI_CONFIG.ButtonMid
            btnMid.TextColor3 = UI_CONFIG.Black
            btnMid.BorderSizePixel = 1
            btnMid.BorderColor3 = UI_CONFIG.BorderColor
        else
            btnMid.BackgroundColor3 = UI_CONFIG.ButtonInact
            btnMid.TextColor3 = UI_CONFIG.White
            btnMid.BorderSizePixel = 1
            btnMid.BorderColor3 = UI_CONFIG.BorderColor
        end
    end
    if btnHigh then
        if nivelActual == "High" then
            btnHigh.BackgroundColor3 = UI_CONFIG.ButtonHigh
            btnHigh.TextColor3 = UI_CONFIG.Black
            btnHigh.BorderSizePixel = 1
            btnHigh.BorderColor3 = UI_CONFIG.BorderColor
        else
            btnHigh.BackgroundColor3 = UI_CONFIG.ButtonInact
            btnHigh.TextColor3 = UI_CONFIG.White
            btnHigh.BorderSizePixel = 1
            btnHigh.BorderColor3 = UI_CONFIG.BorderColor
        end
    end
    if btnCrazy then
        if nivelActual == "Crazy" then
            btnCrazy.BackgroundColor3 = UI_CONFIG.ButtonCrazy
            btnCrazy.TextColor3 = UI_CONFIG.Black
            btnCrazy.BorderSizePixel = 1
            btnCrazy.BorderColor3 = UI_CONFIG.BorderColor
        else
            btnCrazy.BackgroundColor3 = UI_CONFIG.ButtonInact
            btnCrazy.TextColor3 = UI_CONFIG.White
            btnCrazy.BorderSizePixel = 1
            btnCrazy.BorderColor3 = UI_CONFIG.BorderColor
        end
    end
end

local function actualizarSwitch()
    if toggleContainer then
        toggleContainer.BackgroundColor3 = laggerActive and UI_CONFIG.ToggleOn or UI_CONFIG.ToggleOff
    end
    if toggleBall then
        toggleBall.BackgroundColor3 = laggerActive and UI_CONFIG.Black or UI_CONFIG.White
        if laggerActive then
            toggleBall.Position = UDim2.new(1, -18, 0.5, -8)
        else
            toggleBall.Position = UDim2.new(0, 2, 0.5, -8)
        end
    end
    if toggleClick then
        toggleClick.Text = laggerActive and "ON" or "OFF"
        toggleClick.TextColor3 = laggerActive and UI_CONFIG.Black or UI_CONFIG.White
    end
end

local function actualizarCandado()
    if lockButton then
        lockButton.Text = ventanaBloqueada and "Locked" or "Unlocked"
        if ventanaBloqueada then
            lockButton.BackgroundColor3 = UI_CONFIG.LockColor
            lockButton.TextColor3 = UI_CONFIG.Black
        else
            lockButton.BackgroundColor3 = UI_CONFIG.UnlockColor
            lockButton.TextColor3 = UI_CONFIG.White
        end
    end
end

local function actualizarKeybindTextBox()
    if keybindTextBox then
        keybindTextBox.Text = keybind.Name
    end
end

local function toggleLagger()
    laggerActive = not laggerActive
    local targetPos = laggerActive and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
    if toggleBall then
        TweenService:Create(toggleBall, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = targetPos
        }):Play()
    end
    actualizarSwitch()
    if laggerActive then
        if lagThread then task.cancel(lagThread) end
        lagThread = task.spawn(function()
            while laggerActive do
                pcall(function() game:GetService("NetworkClient"):SetOutgoingKBPSLimit(80000) end)
                bomb(NIVELES[nivelActual].poder)
                task.wait(0.18)
            end
        end)
    else
        if lagThread then task.cancel(lagThread); lagThread = nil end
    end
end

if CoreGui:FindFirstChild("ExeLagger_UI") then CoreGui.ExeLagger_UI:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BLOCK_DUELS_UI"
screenGui.Parent = CoreGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.BackgroundColor3 = UI_CONFIG.MainBg
mainFrame.BackgroundTransparency = 0
mainFrame.BorderSizePixel = 0
mainFrame.Size = UDim2.new(0, 200, 0, 110)
mainFrame.Position = UDim2.new(0.15, 0, 0.5, -55)
mainFrame.Parent = screenGui
mainFrame.ClipsDescendants = true
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)

local mainFrameStroke = Instance.new("UIStroke", mainFrame)
mainFrameStroke.Color = Color3.fromRGB(255, 255, 255)
mainFrameStroke.Thickness = 1.2
mainFrameStroke.Transparency = 0.3

local bgOverlay = Instance.new("Frame")
bgOverlay.Name = "BgOverlay"
bgOverlay.Size = UDim2.new(1, 0, 1, 0)
bgOverlay.Position = UDim2.new(0, 0, 0, 0)
bgOverlay.BackgroundColor3 = UI_CONFIG.Black
bgOverlay.BackgroundTransparency = 0.82
bgOverlay.BorderSizePixel = 0
bgOverlay.ZIndex = 1
bgOverlay.Parent = mainFrame
Instance.new("UICorner", bgOverlay).CornerRadius = UDim.new(0, 8)

titleLabel = Instance.new("TextLabel", mainFrame)
titleLabel.BackgroundTransparency = 1
titleLabel.Position = UDim2.new(0, 8, 0, 4)
titleLabel.Size = UDim2.new(0, 140, 0, 25)
titleLabel.Font = UI_CONFIG.Font
titleLabel.Text = "BLOCK DUELS"
titleLabel.TextColor3 = UI_CONFIG.TitleColor
titleLabel.TextSize = 13
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.TextYAlignment = Enum.TextYAlignment.Center
titleLabel.ZIndex = 3

local closeBtn = Instance.new("TextButton", mainFrame)
closeBtn.Name = "CloseButton"
closeBtn.Size = UDim2.new(0, 22, 0, 22)
closeBtn.Position = UDim2.new(1, -26, 0, 4)
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 35, 55)
closeBtn.BorderSizePixel = 0
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = UI_CONFIG.Font
closeBtn.TextSize = 11
closeBtn.ZIndex = 4
closeBtn.AutoButtonColor = false
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(1, 0)
closeBtn.MouseEnter:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(255, 60, 80)}):Play()
end)
closeBtn.MouseLeave:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(220, 35, 55)}):Play()
end)
closeBtn.MouseButton1Click:Connect(function()
    laggerActive = false
    if lagThread then task.cancel(lagThread); lagThread = nil end
    pcall(function() screenGui:Destroy() end)
end)

lockButton = Instance.new("TextButton", mainFrame)
lockButton.BackgroundColor3 = UI_CONFIG.UnlockColor
lockButton.BackgroundTransparency = 0.55
lockButton.BorderSizePixel = 1
lockButton.BorderColor3 = UI_CONFIG.BorderColor
lockButton.Position = UDim2.new(1, -58, 0, 4)
lockButton.Size = UDim2.new(0, 28, 0, 16)
lockButton.Font = UI_CONFIG.Font
lockButton.TextSize = 8
lockButton.TextColor3 = UI_CONFIG.White
lockButton.AutoButtonColor = false
lockButton.ZIndex = 2
Instance.new("UICorner", lockButton).CornerRadius = UDim.new(0, 4)

lockButton.MouseButton1Click:Connect(function()
    ventanaBloqueada = not ventanaBloqueada
    actualizarCandado()
    SaveConfig()
end)
actualizarCandado()

textLagger = Instance.new("TextLabel", mainFrame)
textLagger.BackgroundTransparency = 1
textLagger.Position = UDim2.new(0, 6, 0, 34)
textLagger.Size = UDim2.new(0, 60, 0, 20)
textLagger.Font = UI_CONFIG.Font
textLagger.Text = "LAGGER"
textLagger.TextColor3 = UI_CONFIG.TextColor
textLagger.TextSize = 11
textLagger.TextXAlignment = Enum.TextXAlignment.Left
textLagger.TextYAlignment = Enum.TextYAlignment.Center
textLagger.ZIndex = 2

keybindTextBox = Instance.new("TextBox", mainFrame)
keybindTextBox.Name = "KeybindTextBox"
keybindTextBox.BackgroundColor3 = UI_CONFIG.Black
keybindTextBox.BackgroundTransparency = 0.55
keybindTextBox.BorderSizePixel = 1
keybindTextBox.BorderColor3 = UI_CONFIG.BorderColor
keybindTextBox.Position = UDim2.new(0, 70, 0, 34)
keybindTextBox.Size = UDim2.new(0, 45, 0, 20)
keybindTextBox.Font = UI_CONFIG.Font
keybindTextBox.Text = keybind.Name
keybindTextBox.TextColor3 = UI_CONFIG.White
keybindTextBox.TextSize = 10
keybindTextBox.ClearTextOnFocus = true
keybindTextBox.ZIndex = 2
Instance.new("UICorner", keybindTextBox).CornerRadius = UDim.new(0, 4)

local function actualizarKeybind()
    local text = keybindTextBox.Text
    local cleanText = text:gsub("%s+", ""):upper()
    local foundKey = nil
    for _, item in ipairs(Enum.KeyCode:GetEnumItems()) do
        if item.Name:upper() == cleanText then
            foundKey = item
            break
        end
    end
    if foundKey then
        keybind = foundKey
        SaveConfig()
    end
    keybindTextBox.Text = keybind.Name
end

keybindTextBox.FocusLost:Connect(function(enterPressed)
    actualizarKeybind()
end)

toggleContainer = Instance.new("Frame", mainFrame)
toggleContainer.BackgroundColor3 = UI_CONFIG.ToggleOff
toggleContainer.BackgroundTransparency = 0.55
toggleContainer.BorderSizePixel = 1
toggleContainer.BorderColor3 = UI_CONFIG.BorderColor
toggleContainer.Position = UDim2.new(1, -54, 0, 34)
toggleContainer.Size = UDim2.new(0, 48, 0, 20)
toggleContainer.ZIndex = 2
Instance.new("UICorner", toggleContainer).CornerRadius = UDim.new(1, 0)

toggleBall = Instance.new("Frame", toggleContainer)
toggleBall.BackgroundColor3 = UI_CONFIG.White
toggleBall.BackgroundTransparency = 0.55
toggleBall.BorderSizePixel = 0
toggleBall.Size = UDim2.new(0, 16, 0, 16)
toggleBall.Position = UDim2.new(0, 2, 0.5, -8)
toggleBall.ZIndex = 2
Instance.new("UICorner", toggleBall).CornerRadius = UDim.new(1, 0)

toggleClick = Instance.new("TextButton", toggleContainer)
toggleClick.BackgroundTransparency = 1
toggleClick.Size = UDim2.new(1, 0, 1, 0)
toggleClick.ZIndex = 3
toggleClick.Font = UI_CONFIG.Font
toggleClick.Text = "OFF"
toggleClick.TextSize = 8
toggleClick.TextColor3 = UI_CONFIG.White
toggleClick.TextXAlignment = Enum.TextXAlignment.Center
toggleClick.TextYAlignment = Enum.TextYAlignment.Center
toggleClick.MouseButton1Click:Connect(toggleLagger)
toggleClick.AutoButtonColor = false

local btnY = 75
local btnW = 44
local btnH = 22
local espaciado = 4
local margenIzq = 6

btnLow = Instance.new("TextButton", mainFrame)
btnLow.Size = UDim2.new(0, btnW, 0, btnH)
btnLow.Position = UDim2.new(0, margenIzq, 0, btnY)
btnLow.Font = UI_CONFIG.Font
btnLow.Text = "LOW"
btnLow.TextColor3 = UI_CONFIG.White
btnLow.TextSize = 9
btnLow.AutoButtonColor = false
btnLow.BackgroundColor3 = UI_CONFIG.ButtonInact
btnLow.BackgroundTransparency = 0.55
btnLow.BorderSizePixel = 1
btnLow.BorderColor3 = UI_CONFIG.BorderColor
btnLow.ZIndex = 2
Instance.new("UICorner", btnLow).CornerRadius = UDim.new(0, 6)
btnLow.MouseButton1Click:Connect(function()
    nivelActual = "Low"
    actualizarBotonesNivel()
    SaveConfig()
end)

btnMid = Instance.new("TextButton", mainFrame)
btnMid.Size = UDim2.new(0, btnW, 0, btnH)
btnMid.Position = UDim2.new(0, margenIzq + btnW + espaciado, 0, btnY)
btnMid.Font = UI_CONFIG.Font
btnMid.Text = "MID"
btnMid.TextColor3 = UI_CONFIG.White
btnMid.TextSize = 9
btnMid.AutoButtonColor = false
btnMid.BackgroundColor3 = UI_CONFIG.ButtonInact
btnMid.BackgroundTransparency = 0.55
btnMid.BorderSizePixel = 1
btnMid.BorderColor3 = UI_CONFIG.BorderColor
btnMid.ZIndex = 2
Instance.new("UICorner", btnMid).CornerRadius = UDim.new(0, 6)
btnMid.MouseButton1Click:Connect(function()
    nivelActual = "Mid"
    actualizarBotonesNivel()
    SaveConfig()
end)

btnHigh = Instance.new("TextButton", mainFrame)
btnHigh.Size = UDim2.new(0, btnW, 0, btnH)
btnHigh.Position = UDim2.new(0, margenIzq + (btnW + espaciado) * 2, 0, btnY)
btnHigh.Font = UI_CONFIG.Font
btnHigh.Text = "HIGH"
btnHigh.TextColor3 = UI_CONFIG.White
btnHigh.TextSize = 9
btnHigh.AutoButtonColor = false
btnHigh.BackgroundColor3 = UI_CONFIG.ButtonInact
btnHigh.BackgroundTransparency = 0.55
btnHigh.BorderSizePixel = 1
btnHigh.BorderColor3 = UI_CONFIG.BorderColor
btnHigh.ZIndex = 2
Instance.new("UICorner", btnHigh).CornerRadius = UDim.new(0, 6)
btnHigh.MouseButton1Click:Connect(function()
    nivelActual = "High"
    actualizarBotonesNivel()
    SaveConfig()
end)

btnCrazy = Instance.new("TextButton", mainFrame)
btnCrazy.Size = UDim2.new(0, btnW, 0, btnH)
btnCrazy.Position = UDim2.new(0, margenIzq + (btnW + espaciado) * 4, 0, btnY)
btnCrazy.Font = UI_CONFIG.Font
btnCrazy.Text = "CRAZY"
btnCrazy.TextColor3 = UI_CONFIG.White
btnCrazy.TextSize = 7
btnCrazy.AutoButtonColor = false
btnCrazy.BackgroundColor3 = UI_CONFIG.ButtonInact
btnCrazy.BackgroundTransparency = 0.55
btnCrazy.BorderSizePixel = 1
btnCrazy.BorderColor3 = UI_CONFIG.BorderColor
btnCrazy.ZIndex = 2
Instance.new("UICorner", btnCrazy).CornerRadius = UDim.new(0, 6)
btnCrazy.MouseButton1Click:Connect(function()
    nivelActual = "Crazy"
    actualizarBotonesNivel()
    SaveConfig()
end)

actualizarBotonesNivel()
actualizarSwitch()
actualizarCandado()
actualizarKeybindTextBox()

local isDragging, dragStart, startPos = false, nil, nil
mainFrame.InputBegan:Connect(function(input)
    if ventanaBloqueada then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if not isDragging or ventanaBloqueada then return end
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

mainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDragging = false
    end
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if not screenGui.Parent then return end
    if gp then return end
    if UserInputService:GetFocusedTextBox() then return end
    if input.KeyCode == keybind then
        toggleLagger()
    end
end)
]===]
    local ok,err=pcall(function() loadstring(laggerScript)() end)
    if not ok then warn(".EXE LAGGER ERROR",err) end
end

function setFovEnabled(on)
    fovEnabled=on
    if on then
        if fovConn then fovConn:Disconnect() end
        fovConn=RunService.RenderStepped:Connect(function()
            if not fovEnabled then if fovConn then fovConn:Disconnect();fovConn=nil end;return end
            if workspace.CurrentCamera then workspace.CurrentCamera.FieldOfView=fovValue end
        end)
    else
        if fovConn then fovConn:Disconnect();fovConn=nil end
        if workspace.CurrentCamera then workspace.CurrentCamera.FieldOfView=70 end
    end
end

function resetFovAndCamera()
    setFovEnabled(false)
    if stretchRezEnabled then disableStretchRez();if setStretchRezVisual then setStretchRezVisual(false) end end
    if workspace.CurrentCamera then workspace.CurrentCamera.FieldOfView=70 end
end

print("Block Duels LOADED - ALL FEATURES FIXED")