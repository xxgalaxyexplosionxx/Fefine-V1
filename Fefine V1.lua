local startergui = game:GetService("StarterGui")

startergui:SetCore("SendNotification", {
	Title = "Injected Fefine!",
	Text = "Fefine has successfully been injected.",
})
voidjump = nil
bounceamount = 50

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Fefine V1", "Synapse")

local World = Window:NewTab("World")

local Instances = World:NewSection("Instances")

Instances:NewSlider("Bounce Amount", "How far you bounce when antivoid activates.", 500, 50, function(s)
    bounceamount = s
end)

Instances:NewToggle("AntiVoid", "Prevents you from falling into the void.", function(state)
	if state then
		voidjump = Instance.new("Part")
		voidjump.Parent = workspace
		voidjump.Name = "AntiVoid"
		voidjump.Position = Vector3.new(0, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y - 18, 0)
		voidjump.Size = Vector3.new(1000000000000000000000, 8, 10000000000000000000000)
		voidjump.Anchored = true
		voidjump.Color = Color3.fromRGB(64, 147, 255)
		voidjump.CanCollide = false
		game.Players.LocalPlayer.Character.HumanoidRootPart.Touched:Connect(function(part)
            		if part.Name == "AntiVoid" then
                		game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, bounceamount, 0)
            		end
		end)
        	voidjump.Transparency = 0.8
	else
		game.Workspace.AntiVoid:Destroy()
	end
end)

local Blatant = Window:NewTab("Blatant")

local HumanoidControl = Blatant:NewSection("Humanoid Control")

HumanoidControl:NewSlider("WalkSpeed", "Changes your walkspeed.", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

HumanoidControl:NewSlider("JumpPower", "Changes your jumppower.", 500, 50 , function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

HumanoidControl:NewButton("Jump", "Makes your character jump no matter where you are.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, game.Players.LocalPlayer.Character.Humanoid.JumpPower, 0)
end)

local Utility = Window:NewTab("Utility")

local Chat = Utility:NewSection("Chat")

Chat:NewButton("Toxic", "Sends a toxic message", function()
	local message = math.random(1, 2)
	if message == 1 then
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("EZ L TRASH KIDS | fefine on top", "All")
	elseif message == 2 then
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("L THIS GAME IS SO EZ | fefine on top", "All")
	end
end)

Chat:NewButton("Care", "Sends a message that indicates you dont care.", function()
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("I don't care about the fact that I'm hacking, I care about the fact how you died in a blocky game :skull: | fefine on top", "All")
end)

local Info = Window:NewTab("Info")

local XploitInformation = Info:NewSection("Exploit Information")

XploitInformation:NewLabel("Version - V1.0.3")
