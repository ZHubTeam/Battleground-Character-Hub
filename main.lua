if _G.ScriptHubLoaded then return end
_G.ScriptHubLoaded = true

-- Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "ZHub - Script Hub",
    LoadingTitle = "ZHub",
    LoadingSubtitle = "Initializing...",
    ConfigurationSaving = {
        Enabled = false -- Disabled to prevent config-related bugs
    }
})

-- Tabs
local MainTab = Window:CreateTab("Main")
local TeleportTab = Window:CreateTab("Teleport")
local InfoTab = Window:CreateTab("Info")

-- ESP Script
local function runESP()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    local function highlightCharacter(char)
        if not char:FindFirstChild("Highlight") then
            local highlight = Instance.new("Highlight")
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.Adornee = char
            highlight.Parent = char
        end
    end

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            highlightCharacter(player.Character)
        end
    end

    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function(char)
            wait(1)
            highlightCharacter(char)
        end)
    end)
end

-- Fly Script
local function runFly()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local LocalPlayer = Players.LocalPlayer

    local flying = false
    local bv, bg
    local speed = 50

    local function startFly()
        if flying then return end
        flying = true

        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        bv = Instance.new("BodyVelocity")
        bv.Velocity = Vector3.zero
        bv.MaxForce = Vector3.new(1, 1, 1) * 1e9
        bv.Parent = hrp

        bg = Instance.new("BodyGyro")
        bg.CFrame = hrp.CFrame
        bg.MaxTorque = Vector3.new(1, 1, 1) * 1e9
        bg.P = 10^5
        bg.Parent = hrp

        RunService.RenderStepped:Connect(function()
            if not flying then return end
            local cam = workspace.CurrentCamera
            local dir = Vector3.zero

            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += cam.CFrame.RightVector end

            bv.Velocity = dir.Magnitude > 0 and dir.Unit * speed or Vector3.zero
            bg.CFrame = cam.CFrame
        end)
    end

    local function stopFly()
        flying = false
        if bv then bv:Destroy() end
        if bg then bg:Destroy() end
    end

    UserInputService.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if input.KeyCode == Enum.KeyCode.E then
            if flying then stopFly() else startFly() end
        end
    end)
end

-- Teleport
local function teleportToLocation(vec)
    local lp = game:GetService("Players").LocalPlayer
    if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
        lp.Character.HumanoidRootPart.CFrame = CFrame.new(vec)
    end
end

local function teleportToPlayer(playerName)
    local Players = game:GetService("Players")
    local lp = Players.LocalPlayer
    local target = Players:FindFirstChild(playerName)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        lp.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
    end
end

-- Main Tab UI
MainTab:CreateButton({
    Name = "Enable ESP",
    Callback = runESP
})

MainTab:CreateButton({
    Name = "Enable Fly (Toggle with 'E')",
    Callback = runFly
})

-- Teleport Tab UI
TeleportTab:CreateInput({
    Name = "Teleport to Coordinates",
    PlaceholderText = "X, Y, Z",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        local x, y, z = text:match("([^,]+),%s*([^,]+),%s*([^,]+)")
        if x and y and z then
            teleportToLocation(Vector3.new(tonumber(x), tonumber(y), tonumber(z)))
        else
            Rayfield:Notify({
                Title = "Invalid Input",
                Content = "Enter coordinates like: 10, 20, 30",
                Duration = 5
            })
        end
    end
})

TeleportTab:CreateInput({
    Name = "Teleport to Player",
    PlaceholderText = "PlayerName",
    RemoveTextAfterFocusLost = false,
    Callback = teleportToPlayer
})

-- Info Tab
InfoTab:CreateParagraph({
    Title = "Install Instructions",
    Content = "1. Open your executor\n2. Paste this script\n3. Enjoy ZHub!"
})
