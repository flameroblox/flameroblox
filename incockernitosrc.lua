-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SynapseUI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 300)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Parent = screenGui

-- Create title label
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Text = "SYNAPSE v3.20b"
titleLabel.Font = Enum.Font.SourceSans
titleLabel.TextSize = 20
titleLabel.Parent = mainFrame

-- Create text box
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(1, -150, 1, -40)
textBox.Position = UDim2.new(0, 0, 0, 30)
textBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
textBox.TextColor3 = Color3.fromRGB(0, 255, 0)
textBox.ClearTextOnFocus = false
textBox.TextXAlignment = Enum.TextXAlignment.Left
textBox.TextYAlignment = Enum.TextYAlignment.Top
textBox.TextWrapped = true
textBox.Text = "-- What I think the Synapse UI Should Look Like."
textBox.Font = Enum.Font.Code
textBox.TextSize = 14
textBox.Parent = mainFrame

-- Create scrolling frame
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(0, 150, 1, -40)
scrollingFrame.Position = UDim2.new(1, -150, 0, 30)
scrollingFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
scrollingFrame.ScrollBarThickness = 6
scrollingFrame.Parent = mainFrame

-- Create example script button in scrolling frame
local scriptButton = Instance.new("TextButton")
scriptButton.Size = UDim2.new(1, 0, 0, 30)
scriptButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
scriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptButton.Text = "RemoteSpy.lua"
scriptButton.Font = Enum.Font.SourceSans
scriptButton.TextSize = 14
scriptButton.Parent = scrollingFrame

-- Create buttons
local buttonNames = {"Execute", "Clear", "Destroy"}
for i, name in ipairs(buttonNames) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 100, 0, 30)
    button.Position = UDim2.new((i-1) * 0.2, 0, 1, -30)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = name
    button.Font = Enum.Font.SourceSans
    button.TextSize = 14
    button.Parent = mainFrame

    -- Add functionality to buttons
    if name == "Execute" then
        button.MouseButton1Click:Connect(function()
            local scriptSource = textBox.Text
            local success, errorMessage = pcall(function()
                loadstring(scriptSource)()
            end)
            if not success then
                warn("Error executing script: " .. errorMessage)
            end
        end)
    elseif name == "Clear" then
        button.MouseButton1Click:Connect(function()
            textBox.Text = ""
        end)
    elseif name == "Destroy" then
        button.MouseButton1Click:Connect(function()
            screenGui:Destroy()
        end)
    end
end
