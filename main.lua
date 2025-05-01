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
      Note = "Use the key ILOVEZHUB to get access.",
      FileName = "KeyConfig",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"ILOVEZHUB"}
   }
})

local MainTab = Window:CreateTab("Home", nil)

-- Use a variable outside the function to preserve state between presses
local AutoFarming = false

MainTab:CreateButton({
   Name = "Autofarm Boss",
   Callback = function()
      local Boss = workspace.FX:FindFirstChild("Heian Imaginary Demon")
      local Player = game.Players.LocalPlayer
      local Char = Player.Character or Player.CharacterAdded:Wait()

      if not Boss then
         warn("Boss not found in workspace.FX.")
         return
      end

      if not AutoFarming then
         AutoFarming = true
         warn("Boss found! Starting autofarm...")

         -- Looping movement (can be adjusted or stopped with a toggle)
         task.spawn(function()
            while AutoFarming and Boss.Parent do
               Char:MoveTo(Boss.Torso.Position)
               task.wait(0.00001)
            end
         end)
      else
         AutoFarming = false
         warn("Autofarm disabled.")
      end
   end,
})
