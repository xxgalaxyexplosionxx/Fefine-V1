voidjump = nil
bounceamount = 50

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Fefine V1", "Synapse")

local World = Window:NewTab("World")

local Instances = World:NewSection("Instances")

Instances:NewSlider("Bounce Amount", "How far you bounce when antivoid activates.", 500, 50, function(s)
    bounceamount = s
end)

Instances:NewToggle("AntiVoid", "Prevents you from falling into the void (In bedwars, Abusing may cause lagbacks.)", function(state)
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
                		game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, bounceamount, 0)
            		end
		end)
        	voidjump.Transparency = 0.8
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

local More = Blantant:NewSection("More")

More:NewToggle("Noclip", "Clips you through walls.", function(state)
    if state then
        game.Players.LocalPlayer.Character.Torso.CanCollide = false
	game.Players.LocalPlayer.Character.Head.CanCollide = false
    else
        game.Players.LocalPlayer.Character.Torso.CanCollide = true
	game.Players.LocalPlayer.Character.Head.CanCollide = true
    end
end)
