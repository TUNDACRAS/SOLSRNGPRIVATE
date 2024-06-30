local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundTransparency = 1  -- Make the frame invisible
frame.Parent = gui

local addCheckpointButton = Instance.new("TextButton")
addCheckpointButton.Size = UDim2.new(0, 100, 0, 50)
addCheckpointButton.Position = UDim2.new(0, 0, 0, 0)
addCheckpointButton.Text = "Add Checkpoint"
addCheckpointButton.Parent = frame
addCheckpointButton.AutoButtonColor = false  -- Disable automatic button color changes

local playButton = Instance.new("TextButton")
playButton.Size = UDim2.new(0, 100, 0, 50)
playButton.Position = UDim2.new(0, 0, 0.5, 0)
playButton.Text = "Play"
playButton.Parent = frame
playButton.AutoButtonColor = false  -- Disable automatic button color changes

local function addCheckpoint()
    local checkpointPart = Instance.new("Part")
    checkpointPart.Size = Vector3.new(5, 5, 5)  -- Set the size of the part
    checkpointPart.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
    checkpointPart.Anchored = true
    checkpointPart.CanCollide = false
    checkpointPart.Transparency = 0.5  -- Make the part transparent
    checkpointPart.BrickColor = BrickColor.new("Bright green")  -- Set the color of the part
    checkpointPart.TopSurface = Enum.SurfaceType.Smooth  -- Make the top surface smooth
    checkpointPart.Parent = game.Workspace

    local beam = Instance.new("Beam")
    beam.FaceCamera = true
    beam.LightEmission = 1
    beam.Width0 = 0.2
    beam.Width1 = 0.2
    beam.Color = ColorSequence.new(Color3.fromHSV(math.random(), math.random(0.3, 0.7), math.random(0.3, 0.7)))  -- Random color
    beam.Transparency = NumberSequence.new(0, 0.5)
    beam.Attachment0 = checkpointPart.Attachment

    local attachment = Instance.new("Attachment")
    attachment.Position = Vector3.new(0, checkpointPart.Size.Y / 2, 0)
    attachment.Parent = checkpointPart

    beam.Attachment1 = attachment
    beam.Parent = checkpointPart
end

local function play()
    local checkpointPart = game.Workspace:FindFirstChild("Checkpoint")
    if checkpointPart then
        player.Character.Humanoid:MoveTo(checkpointPart.Position)
        for i = 1, 5 do
            wait(0.5)
            game:GetService("UserInputService"):SendKeysToCharacter("f")
            wait(0.5)
            game:GetService("UserInputService"):SendKeysToCharacter("e")
        end
    end
end

addCheckpointButton.MouseButton1Click:Connect(addCheckpoint)
playButton.MouseButton1Click:Connect(play)

-- Apply UI corner to the buttons
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 4)
uiCorner.Parent = addCheckpointButton

local uiCorner2 = Instance.new("UICorner")
uiCorner2.CornerRadius = UDim.new(0, 4)
uiCorner2.Parent = playButton
