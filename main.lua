-- ZHub Executor GUI
local ScreenGui = Instance.new("ScreenGui")
local Hub = Instance.new("Frame")
local Toggle = Instance.new("TextButton")
local UIListLayout = Instance.new("UIListLayout")

-- ScreenGui settings
ScreenGui.Name = "ZHubExecutorGUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Hub settings
Hub.Name = "Hub"
Hub.Parent = ScreenGui
Hub.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Hub.Position = UDim2.new(0.3, 0, 0.3, 0)
Hub.Size = UDim2.new(0, 350, 0, 300)
Hub.Active = true
Hub.Draggable = true

local UICorner = Instance.new("UICorner", Hub)
UICorner.CornerRadius = UDim.new(0, 10)

-- Title
local Title = Instance.new("TextLabel")
Title.Parent = Hub
Title.Text = "ZHub Executor"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20

-- Layout for buttons
UIListLayout.Parent = Hub
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Create Buttons Function
local function addButton(name, callback)
	local Button = Instance.new("TextButton")
	Button.Parent = Hub
	Button.Size = UDim2.new(0, 300, 0, 40)
	Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.Font = Enum.Font.Gotham
	Button.Text = name
	Button.TextSize = 16
	local corner = Instance.new("UICorner", Button)
	corner.CornerRadius = UDim.new(0, 8)
	Button.MouseButton1Click:Connect(callback)
end

-- Example Scripts
addButton("Infinite Jump", function()
	local Player = game:GetService("Players").LocalPlayer
	local UIS = game:GetService("UserInputService")
	UIS.JumpRequest:Connect(function()
		Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
	end)
end)

addButton("Fly Script", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/VXQm5Rja"))()
end)

addButton("ESP", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/Rx4Lcxj8"))()
end)

-- Toggle GUI Button
Toggle.Name = "Toggle"
Toggle.Parent = ScreenGui
Toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Toggle.Position = UDim2.new(0, 20, 0, 100)
Toggle.Size = UDim2.new(0, 120, 0, 40)
Toggle.Font = Enum.Font.Gotham
Toggle.Text = "Toggle ZHub"
Toggle.TextColor3 = Color3.new(1, 1, 1)
Toggle.TextSize = 14
local toggleCorner = Instance.new("UICorner", Toggle)
toggleCorner.CornerRadius = UDim.new(0, 8)

Toggle.MouseButton1Click:Connect(function()
	Hub.Visible = not Hub.Visible
end)
