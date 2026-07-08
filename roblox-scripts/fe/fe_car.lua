carspeed = 3000

--made by 1+1=2(roblox)/rouxhaver(github)
--only works with r6
--required hats
--https://www.roblox.com/catalog/9661543986
--https://www.roblox.com/catalog/4246228452
--https://www.roblox.com/catalog/3409612660
--https://www.roblox.com/catalog/4094878701
--https://www.roblox.com/catalog/4381707497
--https://www.roblox.com/catalog/3940375351
--https://www.roblox.com/catalog/3033910400
--https://www.roblox.com/catalog/4047554959
--https://www.roblox.com/catalog/3992084515
--https://www.roblox.com/catalog/4489239608

--!NOTE! this version is buggy and needs to be fixed

local LocalPlayer = game:GetService("Players").LocalPlayer
local Heartbeat = game:GetService("RunService").Heartbeat

Heartbeat:Connect(function()
    LocalPlayer.MaximumSimulationRadius = math.huge
    sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
end)

wait(0.2)

for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
    if v:IsA("BasePart") and v.Name ~="HumanoidRootPart" then 
    game:GetService("RunService").Heartbeat:connect(function()
    v.Velocity = Vector3.new(0,30,0)
    end)
    end
    end
    
wait(0.2)


local character = game.Players.LocalPlayer.Character
local tools = {}
for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") 
        then v.Parent = character
        table.insert(tools,v)
    end
end
wait()
for i, v in pairs(tools) do
    v.Parent = game.Players.LocalPlayer.Backpack
end   
 wait(0.1)
 
 
    game:GetService("StarterGui"):SetCore("SendNotification", { 
        Title = "Notification";
        Text = "Netless Ran";
        Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
    Duration = 16;
    
wait(3)
player = game:GetService("Players").LocalPlayer.Character

currentcar = Instance.new("Folder",workspace)
currentcar.Name = tostring(math.random(100000,999999))

local function newpart(name,pos,size,shape)
	local part = Instance.new("Part",workspace)
	part.Parent = currentcar
	part.Name = name
	part.Position = pos
	part.Size = size
	part.Shape = shape
    part.Transparency = 1
end

local function newatt(name,parent,pos)
	local att = Instance.new("Attachment",parent)
	att.Name = name
	att.Position = pos
end

local function newjoin(parent,Attachment1,Attachment2,friction)
	local join = Instance.new("BallSocketConstraint",parent)
	join.Attachment0 = Attachment1
	join.Attachment1 = Attachment2
	join.MaxFrictionTorque = friction
end

local function newweld(parent,Attachment1,Attachment2,pos)
	local join = Instance.new("Weld",parent)
	join.Part0 = Attachment1
	join.Part1 = Attachment2
	join.C0 = pos
end


newpart("carbody",player.HumanoidRootPart.Position,Vector3.new(4.701, 2.644, 2.054),"Block")
newatt("wheel1",currentcar.carbody,Vector3.new(1.414, -1.306, 1.027))
newatt("wheel2",currentcar.carbody,Vector3.new(-1.344,-1.306,1.027))
newatt("wheel3",currentcar.carbody,Vector3.new(-1.35, 1.322, 1.027))
newatt("wheel4",currentcar.carbody,Vector3.new(1.4, 1.322, 1.027))

newpart("wheel1",player.HumanoidRootPart.Position,Vector3.new(1,1,1),"Ball")
newatt("wheel1",currentcar.wheel1,Vector3.new(0,0,0))
newjoin(currentcar.wheel1.wheel1,currentcar.carbody.wheel1,currentcar.wheel1.wheel1,10)

newpart("wheel2",player.HumanoidRootPart.Position,Vector3.new(1,1,1),"Ball")
newatt("wheel2",currentcar.wheel2,Vector3.new(0,0,0))
newjoin(currentcar.wheel2.wheel2,currentcar.carbody.wheel2,currentcar.wheel2.wheel2,10)

newpart("wheel3",player.HumanoidRootPart.Position,Vector3.new(1,1,1),"Ball")
newatt("wheel3",currentcar.wheel3,Vector3.new(0,0,0))
newjoin(currentcar.wheel3.wheel3,currentcar.carbody.wheel3,currentcar.wheel3.wheel3,10)

newpart("wheel4",player.HumanoidRootPart.Position,Vector3.new(1,1,1),"Ball")
newatt("wheel4",currentcar.wheel4,Vector3.new(0,0,0))
newjoin(currentcar.wheel4.wheel4,currentcar.carbody.wheel4,currentcar.wheel4.wheel4,10)

newpart("seat1",player.HumanoidRootPart.Position,Vector3.new(1,1,1),"Block")
newweld(currentcar.carbody,currentcar.carbody,currentcar.seat1,CFrame.new(1.101, 0.5, -1.527))

newpart("seat2",player.HumanoidRootPart.Position,Vector3.new(1,1,1),"Block")
newweld(currentcar.carbody,currentcar.carbody,currentcar.seat2,CFrame.new(1.101, -0.5, -1.527))

newpart("seat3",player.HumanoidRootPart.Position,Vector3.new(1,1,1),"Block")
newweld(currentcar.carbody,currentcar.carbody,currentcar.seat3,CFrame.new(1.101, -0.5, -2.527))

newpart("seat4",player.HumanoidRootPart.Position,Vector3.new(1,1,1),"Block")
newweld(currentcar.carbody,currentcar.carbody,currentcar.seat4,CFrame.new(1.101, 0.5, -2.527))

newpart("seat5",player.HumanoidRootPart.Position,Vector3.new(1,1,1),"Block")
newweld(currentcar.carbody,currentcar.carbody,currentcar.seat5,CFrame.new(1.101, 0, -3.527))

newpart("theseat",player.HumanoidRootPart.Position,Vector3.new(2, 0.5, 1),"Block")
newweld(currentcar.carbody,currentcar.carbody,currentcar.theseat,CFrame.new(0.101, 0, -1.277) * CFrame.Angles(0,math.rad(90),math.rad(-90)))


currentcar.carbody.CFrame = currentcar.carbody.CFrame * CFrame.Angles(90,0,0)

flip = 0
flip2 = 0
currentcar.carbody.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") and flip == 0 then
		flip = 1
		flip2 = 1
		hit.Parent:FindFirstChild("Humanoid").Sit = true
		local weld = Instance.new("Weld",workspace)
		weld.Part0 = currentcar.theseat
		weld.Part1 = hit.Parent.HumanoidRootPart
		weld.C0 = CFrame.new(0, 1, 0)
		weld.Name = "funny"
	end
end)

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

att = Instance.new("Attachment",currentcar.carbody)

thrust = Instance.new("VectorForce",currentcar.carbody)
thrust.Force = Vector3.new(0,0,0)
thrust.Attachment0 = att
thrust.ApplyAtCenterOfMass = true

att = Instance.new("Attachment",currentcar.carbody)
att.CFrame = CFrame.new(-3,0,0)

turn = Instance.new("VectorForce",currentcar.carbody)
turn.Force = Vector3.new(0,0,0)
turn.Attachment0 = att
turn.ApplyAtCenterOfMass = false

mouse.KeyDown:connect(function(key)
	if key == "w" and flip2 == 1 then
		thrust.Force = Vector3.new(carspeed*-1,0,0)
	end
end)

mouse.KeyUp:connect(function(key)
	if key == "w" and flip2 == 1 then
		thrust.Force = Vector3.new(0,0,0)
	end
end)

mouse.KeyDown:connect(function(key)
	if key == "s" and flip2 == 1 then
		thrust.Force = Vector3.new(carspeed,0,0)
	end
end)

mouse.KeyUp:connect(function(key)
	if key == "s" and flip2 == 1 then
		thrust.Force = Vector3.new(0,0,0)
	end
end)

mouse.KeyDown:connect(function(key)
	if key == "a" and flip2 == 1 then
		turn.Force = Vector3.new(0,350,0)
	end
end)

mouse.KeyUp:connect(function(key)
	if key == "a" and flip2 == 1 then
		turn.Force = Vector3.new(0,0,0)
	end
end)

mouse.KeyDown:connect(function(key)
	if key == "d" and flip2 == 1 then
		turn.Force = Vector3.new(0,-350,0)
	end
end)

mouse.KeyUp:connect(function(key)
	if key == "d" and flip2 == 1 then
		turn.Force = Vector3.new(0,0,0)
	end
end)

loadstring(game:HttpGet("https://pastebin.com/raw/vFvGu2yB",true))()

local hat = game.Players.LocalPlayer.Character["Nike Shoebox Costume"]
makemovers(hat.Handle,CFrame.new(0,0,0),currentcar.carbody,false,false)

local wheelv1 = game.Players.LocalPlayer.Character["MeshPartAccessory"]
makemovers(wheelv1.Handle,CFrame.new(1.5,1.5,-1),currentcar.carbody,false,false)

local wheelv2 = game.Players.LocalPlayer.Character["MeshPartAccessory"]
makemovers(wheelv2.Handle,CFrame.new(-1.5,1.5,-1),currentcar.carbody,false,false)

local wheelv3 = game.Players.LocalPlayer.Character["MeshPartAccessory"]
makemovers(wheelv3.Handle,CFrame.new(1.5,-1.5,-1),currentcar.carbody,false,false)

local wheelv4 = game.Players.LocalPlayer.Character["MeshPartAccessory"]
makemovers(wheelv4.Handle,CFrame.new(-1.5,-1.5,-1),currentcar.carbody,false,false)

local hat = game.Players.LocalPlayer.Character["International Fedora"]
makemovers(hat.Handle,CFrame.new(0,0,0),currentcar.seat1,false,false)

local hat = game.Players.LocalPlayer.Character["International Fedora"]
makemovers(hat.Handle,CFrame.new(0,0,0),currentcar.seat2,false,false)

local hat = game.Players.LocalPlayer.Character["InternationalFedora"]
makemovers(hat.Handle,CFrame.new(0,0,0),currentcar.seat3,false,false)

local hat = game.Players.LocalPlayer.Character["InternationalFedora"]
makemovers(hat.Handle,CFrame.new(0,0,0),currentcar.seat4,false,false)

local hat = game.Players.LocalPlayer.Character["InternationalFedora"]
makemovers(hat.Handle,CFrame.new(0,0,0),currentcar.seat5,false,false)

while wait(0.001) do
    wheelv1.Handle.Attachment.Orientation = currentcar.wheel1.Rotation
    wheelv2.Handle.Attachment.Orientation = currentcar.wheel2.Rotation
    wheelv3.Handle.Attachment.Orientation = currentcar.wheel3.Rotation
    wheelv4.Handle.Attachment.Orientation = currentcar.wheel4.Rotation
	if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Jump == true and flip == 1 then
		workspace:FindFirstChild("funny"):Destroy()
		flip2 = 0
		wait(2)
		flip = 0
	end
    if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health == 0 then
        currentcar:Destroy()
    end
end
