voidjump = nil

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Fefine V1", "Synapse")

local World = Window:NewTab("World")

local Section = World:NewSection("Instances")

Section:NewToggle("AntiVoid", "Prevents you from falling into the void (In bedwars, Abusing may cause lagbacks.)", function(state)
	if state then
		voidjump = Instance.new("Part")
		voidjump.Parent = workspace
		voidjump.Name = "AntiVoid"
		voidjump.Position = Vector3.new(0, -15, 52)
		voidjump.Size = Vector3.new(512, 8, 512)
		voidjump.Anchored = true
		voidjump.Color = Color3.fromRGB(56, 255, 249)
        voidjump.CanCollide = false
		game.Players.LocalPlayer.Character.HumanoidRootPart.Touched:Connect(function(part)
            if part.Name == "AntiVoid" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 50, 0)
            end
		end)
        voidjump.Transparency = 0.5
	else
		game.Workspace.AntiVoid:Destroy()
	end
end)

local Blantant = Window:NewTab("Blantant")

local HumanoidControl = Blantant:NewSection("Humanoid Control")

HumanoidControl:NewSlider("WalkSpeed", "Changes your walkspeed.", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

HumanoidControl:NewSlider("JumpPower", "Changes your jumppower.", 500, 50 , function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)
