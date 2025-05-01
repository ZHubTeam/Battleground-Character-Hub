local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "BTG Hub",
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

-- Autofarm state variable moved outside callback to persist toggle state
local AutoFarming = false

MainTab:CreateButton({
   Name = "Autofarm Boss",
   Callback = function()
      local Player = game.Players.LocalPlayer
      local Character = Player.Character or Player.CharacterAdded:Wait()

      -- Update character on respawn
      Player.CharacterAdded:Connect(function(char)
         Character = char
      end)

      AutoFarming = not AutoFarming

      if AutoFarming then
         warn("Autofarm enabled. Waiting for boss...")

         task.spawn(function()
            while AutoFarming do
               -- Safety check in case character dies
               if not Character or not Character:FindFirstChild("HumanoidRootPart") then
                  task.wait(1)
                  continue
               end

               local Boss = workspace:FindFirstChild("FX") and workspace.FX:FindFirstChild("Heian Imaginary Demon")

               if Boss and Boss:FindFirstChild("Torso") then
                  Character:MoveTo(Boss.Torso.Position + Vector3.new(0, 3, 0)) -- Move slightly above to avoid collision
               end

               task.wait(1)
            end
         end)
      else
         warn("Autofarm disabled.")
      end
   end,
})

