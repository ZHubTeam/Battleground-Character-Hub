-- LocalScript inside ScreenGui

-- Create UI elements
local player = game.Players.LocalPlayer
local screenGui = script.Parent

-- Main Hub Frame
local hub = Instance.new("Frame")
hub.Size = UDim2.new(0, 400, 0, 300)
hub.Position = UDim2.new(0.5, -200, 0.5, -150)
hub.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
hub.BorderSizePixel = 0
hub.Visible = false
hub.Active = true
hub.Draggable = true
hub.Parent = screenGui

-- Round Corners
local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(0, 10)
uicorner.Parent = hub

-- Title
local title = Instance.new("TextLabel")
title.Text = "ZHub | Universal Hub"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.TextSize = 20
title.Parent = hub

-- Toggle Button
local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(0, 120, 0, 40)
toggle.Position = UDim2.new(0, 20, 1, 10)
toggle.Text = "Toggle Hub"
toggle.Font = Enum.Font.Gotham
toggle.TextSize = 16
toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggle.Parent = screenGui

local toggleUICorner = Instance.new("UICorner", toggle)
toggleUICorner.CornerRadius = UDim.new(0, 10)

-- Buttons Layout
local layout = Instance.new("UIListLayout", hub)
layout.Padding = UDim.new(0, 10)
layout.FillDirection = Enum.FillDirection.Vertical
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.SortOrder = Enum.SortOrder.LayoutOrder

-- Function to make script buttons
local function createScriptButton(name, scriptFunc)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0, 300, 0, 40)
	button.Text = name
	button.Font = Enum.Font.Gotham
	button.TextSize = 16
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	button.Parent = hub
	
	local corner = Instance.new("UICorner", button)
	corner.CornerRadius = UDim.new(0, 8)

	button.MouseButton1Click:Connect(scriptFunc)
end

-- Example Scripts
createScriptButton("Infinite Jump", function()
	local Player = game:GetService("Players").LocalPlayer
	local UIS = game:GetService("UserInputService")
	
	UIS.JumpRequest:Connect(function()
		Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
	end)
end)

createScriptButton("Fly Script", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/VXQm5Rja"))()
end)

createScriptButton("ESP Script", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/Rx4Lcxj8"))()
end)

-- Toggle visibility
toggle.MouseButton1Click:Connect(function()
	hub.Visible = not hub.Visible
end)
