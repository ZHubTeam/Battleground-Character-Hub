local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "BTG Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "BTG Hub",
   LoadingSubtitle = "by the ZHub Team",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "BattlegroundCharacterHub"
   },

   Discord = {
      Enabled = true,
      Invite = "g6xXRNX3GY", -- Just the invite code
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

local MainTab = Window:CreateTab("Home", "house")
local Button = Tab:CreateButton({
   Name = "Autofarm Boss",
   Callback = function()
         local Boss = workspace["Heian Imaginary Demon"]
         local Player = game.Players.LocalPlayer
         local Char = Player.Character
         local AutoFarming = false

         if Boss and AutoFarming == false then
               AutoFarming = true
         end

         if Boss and AutoFarming == true then
            Character:MoveTo(Boss.Torso.Position)
         end
   end,
})
