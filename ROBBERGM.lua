local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "RobberGM", HidePremium = false, SaveConfig = true, ConfigFolder = "RobberGM"})

-- Main Tab
local MainTab = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

-- Variables
local walkSpeed = 16
local jumpPower = 50
local soundId = ""

-- Textbox for Walk Speed
MainTab:AddTextbox({
Name = "Walk Speed",
Default = "16",
TextDisappear = true,
Callback = function(value)
walkSpeed = tonumber(value)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkSpeed
end
})

-- Textbox for Jump Power
MainTab:AddTextbox({
Name = "Jump Power",
Default = "50",
TextDisappear = true,
Callback = function(value)
jumpPower = tonumber(value)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = jumpPower
end
})

-- Button to Reset Walk Speed and Jump Power
MainTab:AddButton({
Name = "Reset Speed and Jump",
Callback = function()
walkSpeed = 16
jumpPower = 50
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkSpeed
game.Players.LocalPlayer.Character.Humanoid.JumpPower = jumpPower
end
})

-- Toggle for Infinite Jump
MainTab:AddToggle({
Name = "Infinite Jump",
Default = false,
Callback = function(state)
if state then
game:GetService("UserInputService").JumpRequest:Connect(function()
game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
end)
end
end
})

-- Textbox for Music ID
MainTab:AddTextbox({
Name = "Music ID",
Default = "",
TextDisappear = true,
Callback = function(value)
soundId = value
end
})

-- Button to Play Music
MainTab:AddButton({
Name = "Play Music",
Callback = function()
local sound = Instance.new("Sound", game.Players.LocalPlayer.Character)
sound.SoundId = "rbxassetid://" .. soundId
sound:Play()
end
})

-- Initialize
OrionLib:Init()
