-- Services
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- Local player
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Configuration
local MenuName = "Ultimate Troll GUI"
local ToggleKey = Enum.KeyCode.RightControl
local PrimaryColor = Color3.fromRGB(30, 30, 35) -- Dark background
local SecondaryColor = Color3.fromRGB(40, 40, 45) -- Slightly lighter
local AccentColor = Color3.fromRGB(90, 120, 255) -- Vibrant blue accent
local TextColor = Color3.fromRGB(240, 240, 240) -- Bright text
local HighlightColor = Color3.fromRGB(255, 255, 255) -- White highlight
local ErrorColor = Color3.fromRGB(255, 80, 80) -- Red for errors/warnings
local SuccessColor = Color3.fromRGB(80, 255, 120) -- Green for success
local Font = Enum.Font.GothamSemibold
local SmallFont = Enum.Font.Gotham

-- GUI setup
local MainFrame = Instance.new("ScreenGui")
MainFrame.Name = "UltimateTrollGUI"
MainFrame.Parent = PlayerGui
MainFrame.DisplayOrder = 10
MainFrame.ResetOnSpawn = false
MainFrame.IgnoreGuiInset = true

-- Main container
local MainContainer = Instance.new("Frame")
MainContainer.Name = "MainContainer"
MainContainer.Size = UDim2.new(0, 800, 0, 500)
MainContainer.Position = UDim2.new(0.5, -400, 0.5, -250)
MainContainer.BackgroundColor3 = PrimaryColor
MainContainer.BorderSizePixel = 0
MainContainer.Parent = MainFrame
MainContainer.ClipsDescendants = true
MainContainer.Active = true
MainContainer.Draggable = true

-- Apply rounded corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainContainer

-- Create drop shadow
local DropShadow = Instance.new("ImageLabel")
DropShadow.Name = "DropShadow"
DropShadow.Size = UDim2.new(1, 30, 1, 30)
DropShadow.Position = UDim2.new(0, -15, 0, -15)
DropShadow.BackgroundTransparency = 1
DropShadow.Image = "rbxassetid://6014261993"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.5
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
DropShadow.ZIndex = 0
DropShadow.Parent = MainContainer

-- Top bar
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundColor3 = SecondaryColor
TopBar.BorderSizePixel = 0
TopBar.Parent = MainContainer

-- Apply rounded corners to top bar (only top corners)
local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 10)
TopBarCorner.Parent = TopBar

-- Add a frame to cover the bottom rounded corners of the top bar
local TopBarCover = Instance.new("Frame")
TopBarCover.Name = "TopBarCover"
TopBarCover.Size = UDim2.new(1, 0, 0, 10)
TopBarCover.Position = UDim2.new(0, 0, 1, -10)
TopBarCover.BackgroundColor3 = SecondaryColor
TopBarCover.BorderSizePixel = 0
TopBarCover.Parent = TopBar

-- Title with icon
local TitleIcon = Instance.new("ImageLabel")
TitleIcon.Name = "TitleIcon"
TitleIcon.Size = UDim2.new(0, 30, 0, 30)
TitleIcon.Position = UDim2.new(0, 15, 0, 10)
TitleIcon.BackgroundTransparency = 1
TitleIcon.Image = "rbxassetid://7733658504" -- Troll face icon
TitleIcon.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(0, 300, 0, 30)
TitleLabel.Position = UDim2.new(0, 55, 0, 10)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = MenuName
TitleLabel.TextColor3 = TextColor
TitleLabel.TextSize = 22
TitleLabel.Font = Font
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

-- Close button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -40, 0, 10)
CloseButton.BackgroundColor3 = ErrorColor
CloseButton.Text = "✕"
CloseButton.TextColor3 = TextColor
CloseButton.TextSize = 18
CloseButton.Font = Font
CloseButton.Parent = TopBar

-- Apply rounded corners to close button
local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.CornerRadius = UDim.new(0, 6)
CloseButtonCorner.Parent = CloseButton

-- Minimize button
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -80, 0, 10)
MinimizeButton.BackgroundColor3 = AccentColor
MinimizeButton.Text = "−"
MinimizeButton.TextColor3 = TextColor
MinimizeButton.TextSize = 18
MinimizeButton.Font = Font
MinimizeButton.Parent = TopBar

-- Apply rounded corners to minimize button
local MinimizeButtonCorner = Instance.new("UICorner")
MinimizeButtonCorner.CornerRadius = UDim.new(0, 6)
MinimizeButtonCorner.Parent = MinimizeButton

-- Main content area
local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, 0, 1, -50)
ContentArea.Position = UDim2.new(0, 0, 0, 50)
ContentArea.BackgroundColor3 = PrimaryColor
ContentArea.BorderSizePixel = 0
ContentArea.Parent = MainContainer

-- Sidebar
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 200, 1, 0)
Sidebar.BackgroundColor3 = SecondaryColor
Sidebar.BorderSizePixel = 0
Sidebar.Parent = ContentArea

-- Apply rounded corners to sidebar (only bottom-left corner)
local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 10)
SidebarCorner.Parent = Sidebar

-- Add a frame to cover the right and top rounded corners of the sidebar
local SidebarCoverRight = Instance.new("Frame")
SidebarCoverRight.Name = "SidebarCoverRight"
SidebarCoverRight.Size = UDim2.new(0, 10, 1, 0)
SidebarCoverRight.Position = UDim2.new(1, -10, 0, 0)
SidebarCoverRight.BackgroundColor3 = SecondaryColor
SidebarCoverRight.BorderSizePixel = 0
SidebarCoverRight.Parent = Sidebar

local SidebarCoverTop = Instance.new("Frame")
SidebarCoverTop.Name = "SidebarCoverTop"
SidebarCoverTop.Size = UDim2.new(1, 0, 0, 10)
SidebarCoverTop.Position = UDim2.new(0, 0, 0, 0)
SidebarCoverTop.BackgroundColor3 = SecondaryColor
SidebarCoverTop.BorderSizePixel = 0
SidebarCoverTop.Parent = Sidebar

-- Sidebar scroll frame
local SidebarScroll = Instance.new("ScrollingFrame")
SidebarScroll.Name = "SidebarScroll"
SidebarScroll.Size = UDim2.new(1, 0, 1, 0)
SidebarScroll.BackgroundTransparency = 1
SidebarScroll.BorderSizePixel = 0
SidebarScroll.ScrollBarThickness = 4
SidebarScroll.ScrollBarImageColor3 = AccentColor
SidebarScroll.Parent = Sidebar

-- Sidebar layout
local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 5)
SidebarLayout.Parent = SidebarScroll

-- Sidebar padding
local SidebarPadding = Instance.new("UIPadding")
SidebarPadding.PaddingTop = UDim.new(0, 10)
SidebarPadding.PaddingLeft = UDim.new(0, 10)
SidebarPadding.PaddingRight = UDim.new(0, 10)
SidebarPadding.PaddingBottom = UDim.new(0, 10)
SidebarPadding.Parent = SidebarScroll

-- Main content
local MainContent = Instance.new("Frame")
MainContent.Name = "MainContent"
MainContent.Size = UDim2.new(1, -200, 1, 0)
MainContent.Position = UDim2.new(0, 200, 0, 0)
MainContent.BackgroundColor3 = PrimaryColor
MainContent.BorderSizePixel = 0
MainContent.Parent = ContentArea

-- Player selection area
local PlayerSelectionArea = Instance.new("Frame")
PlayerSelectionArea.Name = "PlayerSelectionArea"
PlayerSelectionArea.Size = UDim2.new(1, -40, 0, 60)
PlayerSelectionArea.Position = UDim2.new(0, 20, 0, 20)
PlayerSelectionArea.BackgroundColor3 = SecondaryColor
PlayerSelectionArea.BorderSizePixel = 0
PlayerSelectionArea.Parent = MainContent

-- Apply rounded corners to player selection area
local PlayerSelectionCorner = Instance.new("UICorner")
PlayerSelectionCorner.CornerRadius = UDim.new(0, 8)
PlayerSelectionCorner.Parent = PlayerSelectionArea

-- Player selection label
local PlayerSelectionLabel = Instance.new("TextLabel")
PlayerSelectionLabel.Name = "PlayerSelectionLabel"
PlayerSelectionLabel.Size = UDim2.new(0, 120, 0, 30)
PlayerSelectionLabel.Position = UDim2.new(0, 15, 0, 15)
PlayerSelectionLabel.BackgroundTransparency = 1
PlayerSelectionLabel.Text = "Select Player:"
PlayerSelectionLabel.TextColor3 = TextColor
PlayerSelectionLabel.TextSize = 16
PlayerSelectionLabel.Font = Font
PlayerSelectionLabel.TextXAlignment = Enum.TextXAlignment.Left
PlayerSelectionLabel.Parent = PlayerSelectionArea

-- Player dropdown button
local PlayerDropdownButton = Instance.new("TextButton")
PlayerDropdownButton.Name = "PlayerDropdownButton"
PlayerDropdownButton.Size = UDim2.new(0.6, -30, 0, 30)
PlayerDropdownButton.Position = UDim2.new(0.4, 0, 0, 15)
PlayerDropdownButton.BackgroundColor3 = PrimaryColor
PlayerDropdownButton.Text = "Select a player..."
PlayerDropdownButton.TextColor3 = TextColor
PlayerDropdownButton.TextSize = 14
PlayerDropdownButton.Font = Font
PlayerDropdownButton.Parent = PlayerSelectionArea

-- Apply rounded corners to player dropdown button
local PlayerDropdownCorner = Instance.new("UICorner")
PlayerDropdownCorner.CornerRadius = UDim.new(0, 6)
PlayerDropdownCorner.Parent = PlayerDropdownButton

-- Dropdown arrow
local DropdownArrow = Instance.new("TextLabel")
DropdownArrow.Name = "DropdownArrow"
DropdownArrow.Size = UDim2.new(0, 30, 0, 30)
DropdownArrow.Position = UDim2.new(1, -30, 0, 0)
DropdownArrow.BackgroundTransparency = 1
DropdownArrow.Text = "▼"
DropdownArrow.TextColor3 = AccentColor
DropdownArrow.TextSize = 14
DropdownArrow.Font = Font
DropdownArrow.Parent = PlayerDropdownButton

-- Player dropdown container
local PlayerDropdownContainer = Instance.new("Frame")
PlayerDropdownContainer.Name = "PlayerDropdownContainer"
PlayerDropdownContainer.Size = UDim2.new(0.6, -30, 0, 200)
PlayerDropdownContainer.Position = UDim2.new(0.4, 0, 0, 50)
PlayerDropdownContainer.BackgroundColor3 = SecondaryColor
PlayerDropdownContainer.BorderSizePixel = 0
PlayerDropdownContainer.Visible = false
PlayerDropdownContainer.ZIndex = 10
PlayerDropdownContainer.Parent = PlayerSelectionArea

-- Apply rounded corners to player dropdown container
local PlayerDropdownContainerCorner = Instance.new("UICorner")
PlayerDropdownContainerCorner.CornerRadius = UDim.new(0, 6)
PlayerDropdownContainerCorner.Parent = PlayerDropdownContainer

-- Player list
local PlayerList = Instance.new("ScrollingFrame")
PlayerList.Name = "PlayerList"
PlayerList.Size = UDim2.new(1, -10, 1, -10)
PlayerList.Position = UDim2.new(0, 5, 0, 5)
PlayerList.BackgroundTransparency = 1
PlayerList.BorderSizePixel = 0
PlayerList.ScrollBarThickness = 4
PlayerList.ScrollBarImageColor3 = AccentColor
PlayerList.ZIndex = 10
PlayerList.Parent = PlayerDropdownContainer

-- Player list layout
local PlayerListLayout = Instance.new("UIListLayout")
PlayerListLayout.SortOrder = Enum.SortOrder.Name
PlayerListLayout.Padding = UDim.new(0, 5)
PlayerListLayout.Parent = PlayerList

-- Content container for troll features
local TrollContentContainer = Instance.new("ScrollingFrame")
TrollContentContainer.Name = "TrollContentContainer"
TrollContentContainer.Size = UDim2.new(1, -40, 1, -100)
TrollContentContainer.Position = UDim2.new(0, 20, 0, 100)
TrollContentContainer.BackgroundTransparency = 1
TrollContentContainer.BorderSizePixel = 0
TrollContentContainer.ScrollBarThickness = 4
TrollContentContainer.ScrollBarImageColor3 = AccentColor
TrollContentContainer.Parent = MainContent

-- Content layout
local ContentLayout = Instance.new("UIListLayout")
ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContentLayout.Padding = UDim.new(0, 10)
ContentLayout.Parent = TrollContentContainer

-- Status bar at the bottom
local StatusBar = Instance.new("Frame")
StatusBar.Name = "StatusBar"
StatusBar.Size = UDim2.new(1, 0, 0, 30)
StatusBar.Position = UDim2.new(0, 0, 1, -30)
StatusBar.BackgroundColor3 = SecondaryColor
StatusBar.BorderSizePixel = 0
StatusBar.Parent = MainContainer

-- Status text
local StatusText = Instance.new("TextLabel")
StatusText.Name = "StatusText"
StatusText.Size = UDim2.new(1, -20, 1, 0)
StatusText.Position = UDim2.new(0, 10, 0, 0)
StatusText.BackgroundTransparency = 1
StatusText.Text = "Ready"
StatusText.TextColor3 = SuccessColor
StatusText.TextSize = 14
StatusText.Font = SmallFont
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.Parent = StatusBar

-- Selected player variable
local SelectedPlayer = LocalPlayer

-- Trolling functions (client-side)
local function Trip(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        humanoid.WalkSpeed = 0
        wait(2)
        humanoid.WalkSpeed = 16
        StatusText.Text = "Tripped " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function Animate(targetPlayer, animID)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        local animation = Instance.new("Animation")
        animation.AnimationId = animID
        local animationTrack = humanoid:LoadAnimation(animation)
        animationTrack:Play()
        wait(5)
        animationTrack:Stop()
        animation:Destroy()
        StatusText.Text = "Animated " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function Launch(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        rootPart.Velocity = Vector3.new(0, 100, 0)
        StatusText.Text = "Launched " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function ChatSpam(targetPlayer, message, count)
    if targetPlayer then
        for i = 1, count do
            targetPlayer:Chat(message)
            wait(0.5)
        end
        StatusText.Text = "Chat spammed " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function ChangeSkybox(skyboxID)
    for i, object in pairs(Lighting:GetChildren()) do
        if object:IsA("Sky") then
            object:Destroy()
        end
    end
    local sky = Instance.new("Sky")
    sky.Parent = Lighting
    sky.SkyboxBk = skyboxID
    sky.SkyboxDn = skyboxID
    sky.SkyboxFt = skyboxID
    sky.SkyboxLf = skyboxID
    sky.SkyboxRt = skyboxID
    sky.SkyboxUp = skyboxID
    StatusText.Text = "Changed skybox"
    StatusText.TextColor3 = SuccessColor
end

local function ForceField(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        local forceField = Instance.new("ForceField")
        forceField.Parent = targetPlayer.Character
        forceField.Duration = 5
        StatusText.Text = "Added forcefield to " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function Small(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        humanoid.BodyTypeScale = 0.5
        StatusText.Text = "Made " .. targetPlayer.Name .. " small"
        StatusText.TextColor3 = SuccessColor
    end
end

local function Big(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        humanoid.BodyTypeScale = 2
        StatusText.Text = "Made " .. targetPlayer.Name .. " big"
        StatusText.TextColor3 = SuccessColor
    end
end

local function Invisible(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        for _, part in pairs(targetPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
        StatusText.Text = "Made " .. targetPlayer.Name .. " invisible"
        StatusText.TextColor3 = SuccessColor
    end
end

local function Normal(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        for _, part in pairs(targetPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 0
            end
        end
        StatusText.Text = "Restored " .. targetPlayer.Name .. " to normal"
        StatusText.TextColor3 = SuccessColor
    end
end

local function TeleportToMe(targetPlayer)
    if targetPlayer and targetPlayer.Character and LocalPlayer.Character then
        local targetRootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local myRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if targetRootPart and myRootPart then
            targetRootPart.CFrame = myRootPart.CFrame * CFrame.new(0, 5, 0)
            StatusText.Text = "Teleported " .. targetPlayer.Name .. " to you"
            StatusText.TextColor3 = SuccessColor
        end
    end
end

local function GodMode(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        humanoid.Health = math.huge
        StatusText.Text = "Gave " .. targetPlayer.Name .. " god mode"
        StatusText.TextColor3 = SuccessColor
    end
end

local function UnGodMode(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        humanoid.Health = 100
        StatusText.Text = "Removed god mode from " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function RemoveLimbs(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        for _, part in pairs(targetPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" and part.Name ~= "Head" and part.Name ~= "Torso" then
                part:Destroy()
            end
        end
        StatusText.Text = "Removed limbs from " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function Clone(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        local clone = targetPlayer.Character:Clone()
        clone.Parent = workspace
        clone:MoveTo(targetPlayer.Character.HumanoidRootPart.Position + Vector3.new(5,0,0))
        StatusText.Text = "Cloned " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function AddBalloon(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        local balloon = Instance.new("Part")
        balloon.Shape = Enum.PartType.Ball
        balloon.Size = Vector3.new(3, 3, 3)
        balloon.Anchored = true
        balloon.CanCollide = false
        balloon.Color = Color3.fromRGB(255, 0, 0)
        balloon.Parent = targetPlayer.Character
        balloon.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
        StatusText.Text = "Added balloon to " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function RemoveBalloon(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        for _, part in pairs(targetPlayer.Character:GetChildren()) do
            if part:IsA("Part") and part.Shape == Enum.PartType.Ball then
                part:Destroy()
            end
        end
        StatusText.Text = "Removed balloon from " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function AddHat(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        local hat = Instance.new("Part")
        hat.Shape = Enum.PartType.Block
        hat.Size = Vector3.new(1, 1, 1)
        hat.Anchored = true
        hat.CanCollide = false
        hat.Color = Color3.fromRGB(0, 255, 0)
        hat.Parent = targetPlayer.Character
        hat.CFrame = targetPlayer.Character.Head.CFrame * CFrame.new(0, 0.5, 0)
        StatusText.Text = "Added hat to " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function RemoveHat(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        for _, part in pairs(targetPlayer.Character:GetChildren()) do
            if part:IsA("Part") and part.Shape == Enum.PartType.Block then
                part:Destroy()
            end
        end
        StatusText.Text = "Removed hat from " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function PlaySound(soundID)
    local sound = Instance.new("Sound")
    sound.SoundId = soundID
    sound.Volume = 1
    sound.Parent = LocalPlayer.Character.HumanoidRootPart
    sound:Play()
    game:GetService("Debris"):AddItem(sound, 5)
    StatusText.Text = "Playing sound"
    StatusText.TextColor3 = SuccessColor
end

-- New Trolling Functions
local function ReverseControls(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
            if not gameProcessedEvent then
                if input.KeyCode == Enum.KeyCode.W then
                    humanoid:Move(Vector3.new(0,0,-1))
                elseif input.KeyCode == Enum.KeyCode.S then
                    humanoid:Move(Vector3.new(0,0,1))
                elseif input.KeyCode == Enum.KeyCode.A then
                    humanoid:Move(Vector3.new(1,0,0))
                elseif input.KeyCode == Enum.KeyCode.D then
                    humanoid:Move(Vector3.new(-1,0,0))
                end
            end
        end)
        StatusText.Text = "Reversed controls for " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function ContinuousJump(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        RunService.Heartbeat:Connect(function()
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end)
        StatusText.Text = targetPlayer.Name .. " is now continuously jumping"
        StatusText.TextColor3 = SuccessColor
    end
end

local function ChangeWalkSpeed(targetPlayer, speed)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        humanoid.WalkSpeed = speed
        StatusText.Text = "Changed " .. targetPlayer.Name .. "'s walk speed to " .. speed
        StatusText.TextColor3 = SuccessColor
    end
end

local function AddBillboard(targetPlayer, text)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Size = UDim2.new(0, 200, 0, 50)
        billboardGui.StudsOffset = Vector3.new(0, 2, 0)
        billboardGui.Parent = targetPlayer.Character.Head

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = text
        textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        textLabel.TextScaled = true
        textLabel.Parent = billboardGui
        StatusText.Text = "Added billboard to " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function RemoveBillboard(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
        for _, child in pairs(targetPlayer.Character.Head:GetChildren()) do
            if child:IsA("BillboardGui") then
                child:Destroy()
            end
        end
        StatusText.Text = "Removed billboard from " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

-- New Sound Trolls
local function EarRape(targetPlayer)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://224484334" -- Loud static sound
    sound.Volume = 10 -- Max volume
    sound.Looped = true
    sound.Parent = targetPlayer.Character.HumanoidRootPart
    sound:Play()
    game:GetService("Debris"):AddItem(sound, 5) -- Destroy after 5 seconds
    StatusText.Text = "Ear raped " .. targetPlayer.Name
    StatusText.TextColor3 = SuccessColor
end

local function PlayRandomSound(targetPlayer)
    local sounds = {
        "rbxassetid://182644950", -- Oof sound
        "rbxassetid://224484334", -- Static
        "rbxassetid://349674793"  -- Door slam
    }
    local soundID = sounds[math.random(1, #sounds)]
    local sound = Instance.new("Sound")
    sound.SoundId = soundID
    sound.Volume = 1
    sound.Parent = targetPlayer.Character.HumanoidRootPart
    sound:Play()
    game:GetService("Debris"):AddItem(sound, 5)
    StatusText.Text = "Played random sound on " .. targetPlayer.Name
    StatusText.TextColor3 = SuccessColor
end

-- New Character Trolls
local function ChangeHeadColor(targetPlayer, color)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
        targetPlayer.Character.Head.Color = color
        StatusText.Text = "Changed " .. targetPlayer.Name .. "'s head color"
        StatusText.TextColor3 = SuccessColor
    end
end

local function AddRandomAccessory(targetPlayer)
    local accessories = {
        "rbxassetid://136451347", -- Crown
        "rbxassetid://289349149"  -- Headphones
    }
    local accessoryID = accessories[math.random(1, #accessories)]
    local accessory = Instance.new("Accessory")
    accessory.AccessoryType = "Hat"
    accessory.Name = "TrollAccessory"

    local handle = Instance.new("Part")
    handle.Shape = Enum.PartType.Block
    handle.Size = Vector3.new(1, 1, 1)
    handle.Transparency = 1
    handle.CanCollide = false
    handle.Anchored = false
    handle.Parent = accessory
    handle.Name = "Handle"

    local mesh = Instance.new("SpecialMesh")
    mesh.MeshId = accessoryID
    mesh.Parent = handle

    accessory.Parent = targetPlayer.Character
    StatusText.Text = "Added random accessory to " .. targetPlayer.Name
    StatusText.TextColor3 = SuccessColor
end

-- Annoy Player Function
local function AnnoyPlayer(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        Trip(targetPlayer)
        AddBillboard(targetPlayer, "Annoyed!")
        PlayRandomSound(targetPlayer)
        ChangeHeadColor(targetPlayer, Color3.fromRGB(255, 0, 0))
        wait(5)
        RemoveBillboard(targetPlayer)
        StatusText.Text = "Annoyed " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

-- Destroy Script Function
local function DestroyScript()
    MainFrame:Destroy()
    script:Destroy()
    StatusText.Text = "Script destroyed"
    StatusText.TextColor3 = SuccessColor
end

-- New Trolling Functions
local function SpinPlayer(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local rotationSpeed = 5
        local spinConnection = RunService.Heartbeat:Connect(function()
            rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, math.rad(rotationSpeed), 0)
        end)
        
        -- Store the connection in a table to be able to disconnect it later
        if not _G.SpinConnections then
            _G.SpinConnections = {}
        end
        _G.SpinConnections[targetPlayer.Name] = spinConnection
        
        StatusText.Text = "Spinning " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function StopSpinningPlayer(targetPlayer)
    if _G.SpinConnections and _G.SpinConnections[targetPlayer.Name] then
        _G.SpinConnections[targetPlayer.Name]:Disconnect()
        _G.SpinConnections[targetPlayer.Name] = nil
        StatusText.Text = "Stopped spinning " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function MakePlayerDance(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        local danceAnimation = Instance.new("Animation")
        danceAnimation.AnimationId = "rbxassetid://206295941"
        local danceTrack = humanoid:LoadAnimation(danceAnimation)
        danceTrack:Play()
        
        -- Store the animation track to be able to stop it later
        if not _G.DanceTracks then
            _G.DanceTracks = {}
        end
        _G.DanceTracks[targetPlayer.Name] = danceTrack
        
        StatusText.Text = targetPlayer.Name .. " is now dancing"
        StatusText.TextColor3 = SuccessColor
    end
end

local function StopPlayerDancing(targetPlayer)
    if _G.DanceTracks and _G.DanceTracks[targetPlayer.Name] then
        _G.DanceTracks[targetPlayer.Name]:Stop()
        _G.DanceTracks[targetPlayer.Name] = nil
        StatusText.Text = "Stopped " .. targetPlayer.Name .. " from dancing"
        StatusText.TextColor3 = SuccessColor
    end
end

local function ChangePlayerSize(targetPlayer, scale)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        humanoid.BodyHeightScale.Value = scale
        humanoid.BodyWidthScale.Value = scale
        humanoid.BodyDepthScale.Value = scale
        humanoid.HeadScale.Value = scale
        StatusText.Text = "Changed " .. targetPlayer.Name .. "'s size"
        StatusText.TextColor3 = SuccessColor
    end
end

local function ResetPlayerSize(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        humanoid.BodyHeightScale.Value = 1
        humanoid.BodyWidthScale.Value = 1
        humanoid.BodyDepthScale.Value = 1
        humanoid.HeadScale.Value = 1
        StatusText.Text = "Reset " .. targetPlayer.Name .. "'s size"
        StatusText.TextColor3 = SuccessColor
    end
end

local function AddParticles(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local particleEmitter = Instance.new("ParticleEmitter")
        particleEmitter.Parent = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        particleEmitter.Texture = "rbxassetid://142605417"
        particleEmitter.Lifetime = NumberRange.new(1, 2)
        particleEmitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0)})
        particleEmitter.Rate = 20
        particleEmitter.Speed = NumberRange.new(5, 10)
        StatusText.Text = "Added particles to " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function RemoveParticles(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        for _, child in pairs(targetPlayer.Character:FindFirstChild("HumanoidRootPart"):GetChildren()) do
            if child:IsA("ParticleEmitter") then
                child:Destroy()
            end
        end
        StatusText.Text = "Removed particles from " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function FloatPlayer(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        
        local floatConnection = RunService.Heartbeat:Connect(function()
            rootPart.Velocity = Vector3.new(rootPart.Velocity.X, 5, rootPart.Velocity.Z)
        end)
        
        -- Store the connection to be able to disconnect it later
        if not _G.FloatConnections then
            _G.FloatConnections = {}
        end
        _G.FloatConnections[targetPlayer.Name] = floatConnection
        
        StatusText.Text = targetPlayer.Name .. " is now floating"
        StatusText.TextColor3 = SuccessColor
    end
end

local function StopFloatingPlayer(targetPlayer)
    if _G.FloatConnections and _G.FloatConnections[targetPlayer.Name] then
        _G.FloatConnections[targetPlayer.Name]:Disconnect()
        _G.FloatConnections[targetPlayer.Name] = nil
        StatusText.Text = "Stopped " .. targetPlayer.Name .. " from floating"
        StatusText.TextColor3 = SuccessColor
    end
end

local function PlayCustomSound(targetPlayer, soundId)
    local sound = Instance.new("Sound")
    sound.SoundId = soundId
    sound.Volume = 1
    sound.Parent = targetPlayer.Character.HumanoidRootPart
    sound:Play()
    game:GetService("Debris"):AddItem(sound, 5)
    StatusText.Text = "Played custom sound on " .. targetPlayer.Name
    StatusText.TextColor3 = SuccessColor
end

local function FlingPlayer(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        rootPart.Velocity = Vector3.new(math.random(-100, 100), math.random(50, 100), math.random(-100, 100))
        StatusText.Text = "Flung " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function FreezeParts(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        for _, part in pairs(targetPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Anchored = true
            end
        end
        StatusText.Text = "Froze " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function UnfreezeParts(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        for _, part in pairs(targetPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Anchored = false
            end
        end
        StatusText.Text = "Unfroze " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function GlitchPlayer(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        local glitchConnection = RunService.Heartbeat:Connect(function()
            for _, part in pairs(targetPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CFrame = part.CFrame * CFrame.new(math.random(-1, 1)/10, math.random(-1, 1)/10, math.random(-1, 1)/10)
                end
            end
        end)
        
        -- Store the connection to be able to disconnect it later
        if not _G.GlitchConnections then
            _G.GlitchConnections = {}
        end
        _G.GlitchConnections[targetPlayer.Name] = glitchConnection
        
        StatusText.Text = "Glitching " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

local function StopGlitchingPlayer(targetPlayer)
    if _G.GlitchConnections and _G.GlitchConnections[targetPlayer.Name] then
        _G.GlitchConnections[targetPlayer.Name]:Disconnect()
        _G.GlitchConnections[targetPlayer.Name] = nil
        StatusText.Text = "Stopped glitching " .. targetPlayer.Name
        StatusText.TextColor3 = SuccessColor
    end
end

-- Sidebar Sections
local Sections = {
    ["Basic"] = {
        {Name = "Trip", Function = function() Trip(SelectedPlayer) end},
        {Name = "Animate", Function = function() Animate(SelectedPlayer, "rbxassetid://507767999") end},
        {Name = "ForceField", Function = function() ForceField(SelectedPlayer) end},
        {Name = "Small", Function = function() Small(SelectedPlayer) end},
        {Name = "Big", Function = function() Big(SelectedPlayer) end},
        {Name = "Invisible", Function = function() Invisible(SelectedPlayer) end},
        {Name = "Normal", Function = function() Normal(SelectedPlayer) end},
        {Name = "Teleport To Me", Function = function() TeleportToMe(SelectedPlayer) end},
        {Name = "God Mode", Function = function() GodMode(SelectedPlayer) end},
        {Name = "UnGod Mode", Function = function() UnGodMode(SelectedPlayer) end}
    },
    ["Movement"] = {
        {Name = "Launch", Function = function() Launch(SelectedPlayer) end},
        {Name = "Reverse Controls", Function = function() ReverseControls(SelectedPlayer) end},
        {Name = "Continuous Jump", Function = function() ContinuousJump(SelectedPlayer) end},
        {Name = "Change WalkSpeed (Slow)", Function = function() ChangeWalkSpeed(SelectedPlayer, 8) end},
        {Name = "Change WalkSpeed (Fast)", Function = function() ChangeWalkSpeed(SelectedPlayer, 32) end},
        {Name = "Reset WalkSpeed", Function = function() ChangeWalkSpeed(SelectedPlayer, 16) end},
        {Name = "Spin Player", Function = function() SpinPlayer(SelectedPlayer) end},
        {Name = "Stop Spinning Player", Function = function() StopSpinningPlayer(SelectedPlayer) end},
        {Name = "Float Player", Function = function() FloatPlayer(SelectedPlayer) end},
        {Name = "Stop Floating Player", Function = function() StopFloatingPlayer(SelectedPlayer) end},
        {Name = "Fling Player", Function = function() FlingPlayer(SelectedPlayer) end},
        {Name = "Freeze Player", Function = function() FreezeParts(SelectedPlayer) end},
        {Name = "Unfreeze Player", Function = function() UnfreezeParts(SelectedPlayer) end}
    },
    ["Visual"] = {
        {Name = "Change Skybox", Function = function() ChangeSkybox("rbxassetid://942449493") end},
        {Name = "Remove Limbs", Function = function() RemoveLimbs(SelectedPlayer) end},
        {Name = "Clone", Function = function() Clone(SelectedPlayer) end},
        {Name = "Add Balloon", Function = function() AddBalloon(SelectedPlayer) end},
        {Name = "Remove Balloon", Function = function() RemoveBalloon(SelectedPlayer) end},
        {Name = "Add Hat", Function = function() AddHat(SelectedPlayer) end},
        {Name = "Remove Hat", Function = function() RemoveHat(SelectedPlayer) end},
        {Name = "Change Player Size (Small)", Function = function() ChangePlayerSize(SelectedPlayer, 0.5) end},
        {Name = "Change Player Size (Big)", Function = function() ChangePlayerSize(SelectedPlayer, 2) end},
        {Name = "Reset Player Size", Function = function() ResetPlayerSize(SelectedPlayer) end},
        {Name = "Add Particles", Function = function() AddParticles(SelectedPlayer) end},
        {Name = "Remove Particles", Function = function() RemoveParticles(SelectedPlayer) end},
        {Name = "Glitch Player", Function = function() GlitchPlayer(SelectedPlayer) end},
        {Name = "Stop Glitching Player", Function = function() StopGlitchingPlayer(SelectedPlayer) end}
    },
    ["Sound"] = {
        {Name = "Ear Rape", Function = function() EarRape(SelectedPlayer) end},
        {Name = "Play Random Sound", Function = function() PlayRandomSound(SelectedPlayer) end},
        {Name = "Play Oof Sound", Function = function() PlayCustomSound(SelectedPlayer, "rbxassetid://182644950") end},
        {Name = "Play Laugh Sound", Function = function() PlayCustomSound(SelectedPlayer, "rbxassetid://363808674") end},
        {Name = "Play Scream Sound", Function = function() PlayCustomSound(SelectedPlayer, "rbxassetid://271550300") end}
    },
    ["Character"] = {
        {Name = "Change Head Color (Red)", Function = function() ChangeHeadColor(SelectedPlayer, Color3.fromRGB(255, 0, 0)) end},
        {Name = "Change Head Color (Green)", Function = function() ChangeHeadColor(SelectedPlayer, Color3.fromRGB(0, 255, 0)) end},
        {Name = "Change Head Color (Blue)", Function = function() ChangeHeadColor(SelectedPlayer, Color3.fromRGB(0, 0, 255)) end},
        {Name = "Add Random Accessory", Function = function() AddRandomAccessory(SelectedPlayer) end},
        {Name = "Make Player Dance", Function = function() MakePlayerDance(SelectedPlayer) end},
        {Name = "Stop Player Dancing", Function = function() StopPlayerDancing(SelectedPlayer) end}
    },
    ["Annoy"] = {
        {Name = "Annoy Player", Function = function() AnnoyPlayer(SelectedPlayer) end},
        {Name = "Add Billboard (Noob)", Function = function() AddBillboard(SelectedPlayer, "NOOB!") end},
        {Name = "Add Billboard (Hacked)", Function = function() AddBillboard(SelectedPlayer, "HACKED!") end},
        {Name = "Add Billboard (Trolled)", Function = function() AddBillboard(SelectedPlayer, "TROLLED!") end},
        {Name = "Remove Billboard", Function = function() RemoveBillboard(SelectedPlayer) end}
    },
    ["Settings"] = {
        {Name = "Destroy Script", Function = DestroyScript}
    }
}

-- Function to create a section button in the sidebar
local function CreateSectionButton(sectionName, layoutOrder)
    local SectionButton = Instance.new("TextButton")
    SectionButton.Name = sectionName .. "Button"
    SectionButton.Size = UDim2.new(1, 0, 0, 40)
    SectionButton.BackgroundColor3 = SecondaryColor
    SectionButton.BorderSizePixel = 0
    SectionButton.Text = sectionName
    SectionButton.TextColor3 = TextColor
    SectionButton.TextSize = 16
    SectionButton.Font = Font
    SectionButton.LayoutOrder = layoutOrder
    SectionButton.Parent = SidebarScroll
    
    -- Apply rounded corners to section button
    local SectionButtonCorner = Instance.new("UICorner")
    SectionButtonCorner.CornerRadius = UDim.new(0, 6)
    SectionButtonCorner.Parent = SectionButton
    
    -- Add hover effect
    SectionButton.MouseEnter:Connect(function()
        TweenService:Create(SectionButton, TweenInfo.new(0.2), {BackgroundColor3 = AccentColor}):Play()
    end)
    
    SectionButton.MouseLeave:Connect(function()
        TweenService:Create(SectionButton, TweenInfo.new(0.2), {BackgroundColor3 = SecondaryColor}):Play()
    end)
    
    return SectionButton
end

-- Function to create a troll button in the content area
local function CreateTrollButton(trollName, trollFunction)
    local TrollButton = Instance.new("TextButton")
    TrollButton.Name = trollName .. "Button"
    TrollButton.Size = UDim2.new(1, -20, 0, 40)
    TrollButton.BackgroundColor3 = SecondaryColor
    TrollButton.BorderSizePixel = 0
    TrollButton.Text = trollName
    TrollButton.TextColor3 = TextColor
    TrollButton.TextSize = 14
    TrollButton.Font = Font
    TrollButton.Parent = TrollContentContainer
    
    -- Apply rounded corners to troll button
    local TrollButtonCorner = Instance.new("UICorner")
    TrollButtonCorner.CornerRadius = UDim.new(0, 6)
    TrollButtonCorner.Parent = TrollButton
    
    -- Add hover effect
    TrollButton.MouseEnter:Connect(function()
        TweenService:Create(TrollButton, TweenInfo.new(0.2), {BackgroundColor3 = AccentColor}):Play()
    end)
    
    TrollButton.MouseLeave:Connect(function()
        TweenService:Create(TrollButton, TweenInfo.new(0.2), {BackgroundColor3 = SecondaryColor}):Play()
    end)
    
    -- Add click effect
    TrollButton.MouseButton1Click:Connect(function()
        TweenService:Create(TrollButton, TweenInfo.new(0.1), {BackgroundColor3 = HighlightColor}):Play()
        wait(0.1)
        TweenService:Create(TrollButton, TweenInfo.new(0.1), {BackgroundColor3 = AccentColor}):Play()
        
        -- Execute the troll function
        trollFunction()
    end)
    
    return TrollButton
end

-- Function to update the player list
local function UpdatePlayerList()
    -- Clear existing buttons
    for _, child in pairs(PlayerList:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    -- Create buttons for each player
    for _, player in pairs(Players:GetPlayers()) do
        local PlayerButton = Instance.new("TextButton")
        PlayerButton.Name = player.Name .. "Button"
        PlayerButton.Size = UDim2.new(1, -10, 0, 30)
        PlayerButton.BackgroundColor3 = PrimaryColor
        PlayerButton.BorderSizePixel = 0
        PlayerButton.Text = player.Name
        PlayerButton.TextColor3 = TextColor
        PlayerButton.TextSize = 14
        PlayerButton.Font = Font
        PlayerButton.Parent = PlayerList
        PlayerButton.ZIndex = 10
        
        -- Apply rounded corners to player button
        local PlayerButtonCorner = Instance.new("UICorner")
        PlayerButtonCorner.CornerRadius = UDim.new(0, 4)
        PlayerButtonCorner.Parent = PlayerButton
        
        -- Add hover effect
        PlayerButton.MouseEnter:Connect(function()
            TweenService:Create(PlayerButton, TweenInfo.new(0.2), {BackgroundColor3 = AccentColor}):Play()
        end)
        
        PlayerButton.MouseLeave:Connect(function()
            TweenService:Create(PlayerButton, TweenInfo.new(0.2), {BackgroundColor3 = PrimaryColor}):Play()
        end)
        
        -- Add click effect
        PlayerButton.MouseButton1Click:Connect(function()
            SelectedPlayer = player
            PlayerDropdownButton.Text = player.Name
            PlayerDropdownContainer.Visible = false
            
            StatusText.Text = "Selected player: " .. player.Name
            StatusText.TextColor3 = SuccessColor
        end)
    end
    
    -- Update the canvas size
    PlayerList.CanvasSize = UDim2.new(0, 0, 0, #Players:GetPlayers() * 35)
end

-- Call UpdatePlayerList initially and whenever a player joins/leaves
UpdatePlayerList()
Players.PlayerAdded:Connect(UpdatePlayerList)
Players.PlayerRemoving:Connect(UpdatePlayerList)

-- Toggle player dropdown
PlayerDropdownButton.MouseButton1Click:Connect(function()
    PlayerDropdownContainer.Visible = not PlayerDropdownContainer.Visible
end)

-- Create section buttons and populate content
local CurrentSection = nil
local SectionButtons = {}

for i, sectionName in ipairs({"Basic", "Movement", "Visual", "Sound", "Character", "Annoy", "Settings"}) do
    local sectionButton = CreateSectionButton(sectionName, i)
    SectionButtons[sectionName] = sectionButton
    
    sectionButton.MouseButton1Click:Connect(function()
        -- Clear current content
        for _, child in pairs(TrollContentContainer:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        
        -- Reset all section button colors
        for _, button in pairs(SectionButtons) do
            TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = SecondaryColor}):Play()
        end
        
        -- Highlight selected section
        TweenService:Create(sectionButton, TweenInfo.new(0.2), {BackgroundColor3 = AccentColor}):Play()
        
        -- Populate with new content
        local layoutOrder = 1
        for _, troll in pairs(Sections[sectionName]) do
            local trollButton = CreateTrollButton(troll.Name, troll.Function)
            trollButton.LayoutOrder = layoutOrder
            layoutOrder = layoutOrder + 1
        end
        
        -- Update the canvas size
        TrollContentContainer.CanvasSize = UDim2.new(0, 0, 0, #Sections[sectionName] * 50)
        
        CurrentSection = sectionName
        StatusText.Text = "Selected section: " .. sectionName
        StatusText.TextColor3 = SuccessColor
    end)
end

-- Select the first section by default
SectionButtons["Basic"].MouseButton1Click:Fire()

-- Close button functionality
CloseButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainContainer, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -400, 1.5, 0)}):Play()
    wait(0.3)
    MainFrame.Enabled = false
end)

-- Minimize button functionality
local IsMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    IsMinimized = not IsMinimized
    
    if IsMinimized then
        TweenService:Create(MainContainer, TweenInfo.new(0.3), {Size = UDim2.new(0, 800, 0, 50)}):Play()
        ContentArea.Visible = false
        MinimizeButton.Text = "+"
    else
        TweenService:Create(MainContainer, TweenInfo.new(0.3), {Size = UDim2.new(0, 800, 0, 500)}):Play()
        ContentArea.Visible = true
        MinimizeButton.Text = "−"
    end
end)

-- Menu toggle with key
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == ToggleKey then
        MainFrame.Enabled = not MainFrame.Enabled
        
        if MainFrame.Enabled then
            MainContainer.Position = UDim2.new(0.5, -400, 1.5, 0)
            TweenService:Create(MainContainer, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -400, 0.5, -250)}):Play()
        else
            TweenService:Create(MainContainer, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -400, 1.5, 0)}):Play()
        end
    end
end)

-- Initial position (off-screen)
MainContainer.Position = UDim2.new(0.5, -400, 1.5, 0)

-- Show the GUI with a smooth animation
TweenService:Create(MainContainer, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -400, 0.5, -250)}):Play()

-- Set initial status
StatusText.Text = "Ultimate Troll GUI loaded successfully!"
StatusText.TextColor3 = SuccessColor
