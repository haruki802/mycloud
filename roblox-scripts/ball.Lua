--fully made by me idc if you steal

player = game.Players.LocalPlayer.Character

player.Humanoid.PlatformStand = true
local ball = Instance.new("Part",player)
local pvector = player.HumanoidRootPart.Position
ball.Position = Vector3.new(pvector.X,pvector.Y-0.55,pvector.Z)
ball.Name = "ball"
ball.Shape = "Ball"
ball.Size = Vector3.new(6,6,6)
ball.Material = "SmoothPlastic"
ball.Transparency = 0.40
local force = Instance.new("BodyForce",ball)
local weld = Instance.new("WeldConstraint",player)
weld.Part0 = ball
weld.Part1 = player.HumanoidRootPart

while wait(0.01) do
    player.Humanoid.PlatformStand = true
	force.Force = player.Humanoid.MoveDirection * 1500
    if player.Humanoid.Health == 0 then
        break
    end
end
