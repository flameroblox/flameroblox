wait(2)

local uis = game:GetService("UserInputService")
local tween = game:GetService("TweenService")
local players = game:GetService("Players")

local Main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TitleBar = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local ExecuteButton = Instance.new("TextButton")
local ClearButton = Instance.new("TextButton")
local DestroyButton = Instance.new("TextButton")

Main.Name = "Main"
Main.Parent = players.LocalPlayer:WaitForChild("PlayerGui")
Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Main.ResetOnSpawn = false
Main.DisplayOrder = 9999

Frame.Name = "Frame"
Frame.Parent = Main
Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Frame.Position = UDim2.new(0.25, 0, 0.25, 0)
Frame.Size = UDim2.new(0.5, 0, 0.5, 0)

TitleBar.Name = "TitleBar"
TitleBar.Parent = Frame
TitleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TitleBar.Size = UDim2.new(1, 0, 0.1, 0)
TitleBar.Font = Enum.Font.SourceSans
TitleBar.Text = "incognito v1.0.0b - public"
TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleBar.TextScaled = true
TitleBar.TextSize = 14
TitleBar.TextWrapped = true

TextBox.Name = "TextBox"
TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
TextBox.Position = UDim2.new(0, 0, 0.1, 0)
TextBox.Size = UDim2.new(1, 0, 0.7, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.MultiLine = true
TextBox.Text = "print('Incognito Is The Best Executor')"
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14

ExecuteButton.Name = "ExecuteButton"
ExecuteButton.Parent = Frame
ExecuteButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ExecuteButton.Position = UDim2.new(0, 0, 0.8, 0)
ExecuteButton.Size = UDim2.new(0.3, 0, 0.2, 0)
ExecuteButton.Font = Enum.Font.SourceSans
ExecuteButton.Text = "Execute"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.TextScaled = true
ExecuteButton.TextSize = 14
ExecuteButton.TextWrapped = true

ClearButton.Name = "ClearButton"
ClearButton.Parent = Frame
ClearButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ClearButton.Position = UDim2.new(0.35, 0, 0.8, 0)
ClearButton.Size = UDim2.new(0.3, 0, 0.2, 0)
ClearButton.Font = Enum.Font.SourceSans
ClearButton.Text = "Clear"
ClearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearButton.TextScaled = true
ClearButton.TextSize = 14
ClearButton.TextWrapped = true

DestroyButton.Name = "DestroyButton"
DestroyButton.Parent = Frame
DestroyButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
DestroyButton.Position = UDim2.new(0.7, 0, 0.8, 0)
DestroyButton.Size = UDim2.new(0.3, 0, 0.2, 0)
DestroyButton.Font = Enum.Font.SourceSans
DestroyButton.Text = "Destroy"
DestroyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DestroyButton.TextScaled = true
DestroyButton.TextSize = 14
DestroyButton.TextWrapped = true

ExecuteButton.MouseButton1Click:Connect(function()
    local scriptSource = TextBox.Text
    local success, errorMessage = pcall(function()
        loadstring(scriptSource)()
    end)
    if not success then
        warn("Error executing script: " .. errorMessage)
    end
end)

ClearButton.MouseButton1Click:Connect(function()
    TextBox.Text = ""
end)

DestroyButton.MouseButton1Click:Connect(function()
    Main:Destroy()
end)
