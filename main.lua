-- MADE USING RayfieldUI LIB
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

Rayfield:Notify({
   Title = "Success",
   Content = "Hub Launched Successfully!",
   Duration = 6.5,
   Image = "laptop-minimal-check",
})

local Window = Rayfield:CreateWindow({
   Name = "BTG Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "BTG Hub",
   LoadingSubtitle = "by the ZHub Team",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "BattlegroundCharacterHub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "https://discord.com/invite/g6xXRNX3GY", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Team ZHub | BTG Character Hub",
      Subtitle = "Key Check",
      Note = "Use the key ILOVEZHUB to get access.", 
      FileName = "KeyConfig",
      SaveKey = true,
      GrabKeyFromSite = false, 
      Key = {"ILOVEZHUB"}
   }

    local MainTab = Window:CreateTab("Home", "house")
})
