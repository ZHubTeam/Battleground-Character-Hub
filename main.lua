local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "BTG Hub",
   Icon = 0,
   LoadingTitle = "BTG Hub",
   LoadingSubtitle = "by the ZHub Team",
   Theme = "Default",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "BattlegroundCharacterHub"
   },

   Discord = {
      Enabled = true,
      Invite = "g6xXRNX3GY",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Team ZHub | BTG Character Hub",
      Subtitle = "Key Check",
      Note = "Use the key BTGxZHUB to get access.",
      FileName = "KeyConfig",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"BTGxZHUB"}
   }
})

local MainTab = Window:CreateTab("Home", "house")

local AutoFarming = false
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

-- Update character on death/respawn
Player.CharacterAdded:Connect(function(char)
   Character = char
end)

MainTab:CreateButton({
   Name = "Autofarm Boss",
   Callback = function()
      local Boss = workspace.FX:FindFirstChild("Heian Imaginary Demon")

      if not Boss then
         warn("Boss not found in workspace.FX.")
         return
      end

      if not AutoFarming then
         AutoFarming = true
         warn("Boss found! Starting autofarm...")

         task.spawn(function()
            while AutoFarming and Boss.Parent do
               if Character and Character:FindFirstChild("HumanoidRootPart") then
                  Character:MoveTo(Boss.Torso.Position)
               end
               task.wait(1)
            end
         end)
      else
         AutoFarming = false
         warn("Autofarm disabled.")
      end
   end,
})
