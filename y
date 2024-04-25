
-- the camlock is completly broken and macro dont work cause mfs cant code
getgenv().LuaBot = {
    Options = {
        ["Notifications"] = true,
        ["Intro"] = true,
    },
    Silent = {
        ["Enabled"] = true,
        ["UseKeybind"] = true,
        ["Keybind"] = "Q",
        ["Predict"] = true,
        ["Prediction"] = 0.1267,
        ["Aimpart"] = "UpperTorso",
        ["NearestCursorAimpart"] = true,
    }, 
    Camlock = {
        ["Enabled"] = true,
        ["Keybind"] = "C",
        ["Predict"] = true,
        ["Prediction"] = 0.1267,
        ["SmoothnessValue"] = 0.0181,
        ["Shake"] = true,
        ["ShakeValue"] = 1,
        ["Aimpart"] = "HumanoidRootPart",
        ["NearestCursorAimpart"] = true,
    },
    Custom = {
        ["Shake"] = false, --dont enable
        ["Smoothness"] = false,
        ["AirShakeValue"] = 4,
        ["AirSmoothnessValue"] = 0.1155,
        ["GroundShakeValue"] = 10,
        ["GroundSmoothnessValue"] = 0.0576,
    },
    Fov = {
        Silent = {
            ["Visible"] = true,
            ["Filled"] = false,
            ["Size"] = 30,
            ["Thickness"] = 2.5,
            ["Transparency"] = 0.1,
            ["Sides"] = 100,
            ["Color"] = Color3.fromRGB(0, 0, 0),
        },
        Camlock = {
            ["Visible"] = false,
            ["Filled"] = false,
            ["Size"] = 60,
            ["Thickness"] = 3,
            ["Transparency"] = 0.25,
            ["Sides"] = 100,
            ["Color"] = Color3.fromRGB(0, 0, 0),
        },
    },
    Checks = {
        ["Wall"] = true,
        ["Knocked"] = true,
        ["DisableOnDeath"] = true,
        ["DisableOutsideFov"] = true,
        ["AntiGroundShots"] = true,
    },
    Resolver = {
        ["Enabled"] = true,
    },
    Macro = {
        ["Enabled"] = true,
        ["Keybind"] = "B", 
        ["Type"] = "Normal",
    },
    AutoPrediction = {
        ["Enabled"] = true,
        ["P20"] = 0.12588,
        ["P30"] = 0.11911,
        ["P40"] = 0.12471,
        ["P50"] = 0.12766,
        ["P60"] = 0.12731,
        ["P70"] = 0.12951,
        ["P80"] = 0.13181,
        ["P90"] = 0.13573,
        ["P100"] = 0.13334,
        ["P110"] = 0.14552,
        ["P120"] = 0.14376,
        ["P130"] = 0.15669,
        ["P140"] = 0.12234,
        ["P150"] = 0.15214,
        ["P160"] = 0.16262,
        ["P170"] = 0.19231,
        ["P180"] = 0.19284,
        ["P190"] = 0.16594,
        ["P200"] = 0.16942,
        ["P250"] = 0.16514,
        ["P300"] = 0.16782,
    },
    Range = {
        ["Enabled"] = true,
        ["Type"] = "Fov",
        ["CloseDetection"] = 25,
        ["MidDetection"] = 60,
        ["FarDetection"] = 115,
        ["VeryFarDetection"] = math.huge,
        ["CloseFov"] = 60,
        ["ClosePrediction"] = 0.121,
        ["MidFov"] = 45,
        ["MidPrediction"] = 0.127,
        ["FarFov"] = 35,
        ["FarPrediction"] = 0.131,
        ["VeryFarFov"] = 20,
        ["VeryFarPrediction"] = 0.134,
    },
    GunFov = {
        ["Enabled"] = true,
        ["DoubleBarrel"] = 22.5,
        ["Revolver"] = 27.5,
        ["Shotgun"] = 35,
        ["TacticalShotgun"] = 35,
        ["Smg"] = 25,
        ["Silencer"] = 32.5,
    },
}

local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;

if getgenv().LuaBotloaded == true then
    if getgenv().LuaBot.Options.Notifications == true then

Notify({
Description = "Settings From Script Updated.";
Title = "LuaBot";
Duration = 1.5;
});
        return
    end
    end
    getgenv().LuaBotloaded = true
    
    if getgenv().LuaBot.Options.Notifications == true then

Notify({
Description = "Checking Assets";
Title = "LuaBot";
Duration = 1.5;
});
wait(2)
Notify({
Description = "Checking User";
Title = "LuaBot";
Duration = 1.5;
});
wait(2)
Notify({
Description = "LuaBot Loaded Enjoy";
Title = "LuaBot";
Duration = 1.5;
});
end
wait(1)
local targ = nil
local Plr  = nil

local Players, Client, Mouse, RS, Camera =
    game:GetService("Players"),
    game:GetService("Players").LocalPlayer,
    game:GetService("Players").LocalPlayer:GetMouse(),
    game:GetService("RunService"),
    game:GetService("Workspace").CurrentCamera

local silentcircle = Drawing.new("Circle")

local tracercircle = Drawing.new("Circle")

silentcircle.Transparency = getgenv(). LuaBot.Fov.Silent.Transparency
silentcircle.Thickness = getgenv().LuaBot.Fov.Silent.Thickness
silentcircle.Color = getgenv().LuaBot.Fov.Silent.Color
silentcircle.Filled = getgenv().LuaBot.Fov.Silent.Filled

tracercircle.Transparency = getgenv().LuaBot.Fov.Camlock.Transparency
tracercircle.Thickness = getgenv().LuaBot.Fov.Camlock.Thickness
tracercircle.Color = getgenv().LuaBot.Fov.Camlock.Color
tracercircle.Filled = getgenv().LuaBot.Fov.Camlock.Filled

local UpdateFOV = function ()
    if (not silentcircle and not tracercircle) then
        return silentcircle and tracercircle
    end
    tracercircle.Visible  = getgenv().LuaBot.Fov.Camlock.Visible
    tracercircle.Radius   = getgenv().LuaBot.Fov.Camlock.Size * 2
    tracercircle.Filled = getgenv().LuaBot.Fov.Camlock.Filled
    tracercircle.Thickness = getgenv().LuaBot.Fov.Camlock.Thickness
    tracercircle.Transparency = getgenv().LuaBot.Fov.Camlock.Transparency
    tracercircle.Position = Vector2.new(Mouse.X, Mouse.Y + (game:GetService("GuiService"):GetGuiInset().Y))
    tracercircle.Color = getgenv().LuaBot.Fov.Camlock.Color
    tracercircle.NumSides = getgenv().LuaBot.Fov.Camlock.Sides
    
    silentcircle.Visible  = getgenv().LuaBot.Fov.Silent.Visible
    silentcircle.Radius   = getgenv().LuaBot.Fov.Silent.Size * 2
    silentcircle.Filled = getgenv().LuaBot.Fov.Silent.Filled
    silentcircle.Thickness = getgenv().LuaBot.Fov.Silent.Thickness
    silentcircle.Transparency = getgenv().LuaBot.Fov.Silent.Transparency
    silentcircle.Position = Vector2.new(Mouse.X, Mouse.Y + (game:GetService("GuiService"):GetGuiInset().Y))
    silentcircle.Color = getgenv().LuaBot.Fov.Silent.Color
    silentcircle.NumSides = getgenv().LuaBot.Fov.Silent.Sides
    return silentcircle and tracercircle
end

RS.Heartbeat:Connect(UpdateFOV)

local WallCheck = function(destination, ignore)
    local Origin    = Camera.CFrame.p
    local CheckRay  = Ray.new(Origin, destination - Origin)
    local Hit       = game.workspace:FindPartOnRayWithIgnoreList(CheckRay, ignore)
    return Hit      == nil
end


local WTS = function (Object)
    local ObjectVector = Camera:WorldToScreenPoint(Object.Position)
    return Vector2.new(ObjectVector.X, ObjectVector.Y)
end

local IsOnScreen = function (Object)
    local IsOnScreen = Camera:WorldToScreenPoint(Object.Position)
    return IsOnScreen
end

local FilterObjs = function (Object)
    if string.find(Object.Name, "Gun") then
        return
    end
    if table.find({"Part", "MeshPart", "BasePart"}, Object.ClassName) then
        return true
    end
end

local ClosestPlrFromMouse = function()
    local Target, Closest = nil, 1/0
    
    for _ ,v in pairs(Players:GetPlayers()) do
    	if getgenv().LuaBot.Checks.Wall then
    		if (v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart")) then
    			local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
    			local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
    
    			if (silentcircle.Radius * 1.27 > Distance and Distance < Closest and OnScreen) and WallCheck(v.Character.HumanoidRootPart.Position, {Client, v.Character}) then
    				Closest = Distance
    				Target = v
    	

    			end
    		end
    	else
    		if (v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart")) then
    			local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
    			local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
    
    			if (silentcircle.Radius * 1.27 > Distance and Distance < Closest and OnScreen) then
    				Closest = Distance
    				Target = v
    			end
    		end
    	end
    end
    return Target
end

local ClosestPlrFromMouse2 = function()
    local Target, Closest = nil, tracercircle.Radius * 1.27
    
    for _ ,v in pairs(Players:GetPlayers()) do
    	if (v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart")) then
        	if getgenv().LuaBot.Checks.Wall then
        		local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
        		local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
        
        		if (Distance < Closest and OnScreen) and WallCheck(v.Character.HumanoidRootPart.Position, {Client, v.Character}) then
        			Closest = Distance
        			Target = v
        		end
        	    else
        			local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
        			local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
        
        			if (Distance < Closest and OnScreen) then
        				Closest = Distance
        				Target = v
        			end
        		end
            end
        end
    return Target
end

local GetClosestBodyPart = function (character)
    local ClosestDistance = 1/0
    local BodyPart = nil
    
    if (character and character:GetChildren()) then
        for _,  x in next, character:GetChildren() do
            if FilterObjs(x) and IsOnScreen(x) then
                local Distance = (WTS(x) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if (silentcircle.Radius * 1.27 > Distance and Distance < ClosestDistance) then
                    ClosestDistance = Distance
                    BodyPart = x
                end
            end
        end
    end
    return BodyPart
end

local GetClosestBodyPartV2 = function (character)
    local ClosestDistance = 1/0
    local BodyPart = nil
    
    if (character and character:GetChildren()) then
        for _,  x in next, character:GetChildren() do
            if FilterObjs(x) and IsOnScreen(x) then
                local Distance = (WTS(x) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if (Distance < ClosestDistance) then
                    ClosestDistance = Distance
                    BodyPart = x
                end
            end
        end
    end
    return BodyPart
end

Mouse.KeyDown:Connect(function(Key)
    local Keybind = getgenv().LuaBot.Camlock.Keybind:lower()
    if (Key == Keybind) then
        if getgenv().LuaBot.Camlock.Enabled == true then
            IsTargetting = not IsTargetting
            if IsTargetting then
                Plr = ClosestPlrFromMouse2()
            else
                if Plr ~= nil then
                    Plr = nil
                    IsTargetting = false
                end
            end
        end
    end
end)

Mouse.KeyDown:Connect(function(Key)
    local Keybind = getgenv().LuaBot.Silent.Keybind:lower()
    if (Key == Keybind) and getgenv().LuaBot.Silent.UseKeybind == true then
            if getgenv().LuaBot.Silent.Enabled == true then
				getgenv().LuaBot.Silent.Enabled = false
				if getgenv().LuaBot.Options.Notifications == true then
				    
local Notify = AkaliNotif.Notify;
				Notify({
Description = "Silent Disabled";
Title = "LuaBot";
Duration = 1.5;
});
end 
                
            else
				getgenv().LuaBot.Silent.Enabled = true
				if getgenv().LuaBot.Options.Notifications == true then
				    
local Notify = AkaliNotif.Notify;
				Notify({
Description = "Silent Enabled";
Title = "LuaBot";
Duration = 1.5;
});
end
                
            end
        end
    end
)






                            



local grmt = getrawmetatable(game)
local backupindex = grmt.__index
setreadonly(grmt, false)

grmt.__index = newcclosure(function(self, v)
    if (getgenv().LuaBot.Silent.Enabled and Mouse and tostring(v) == "Hit") then
        if targ and targ.Character then
    		if getgenv().LuaBot.Silent.Predict then
    			local endpoint = game.Players[tostring(targ)].Character[getgenv().LuaBot.Silent.Aimpart].CFrame + (
    				game.Players[tostring(targ)].Character[getgenv().LuaBot.Silent.Aimpart].Velocity * getgenv().LuaBot.Silent.Prediction
    			)
    			return (tostring(v) == "Hit" and endpoint)
    		else
    			local endpoint = game.Players[tostring(targ)].Character[getgenv().LuaBot.Silent.Aimpart].CFrame
    			return (tostring(v) == "Hit" and endpoint)
    		end
        end
    end
    return backupindex(self, v)
end)



RS.Heartbeat:Connect(function()
	if getgenv().LuaBot.Silent.Enabled then
	    if targ and targ.Character and targ.Character:WaitForChild(getgenv().LuaBot.Silent.Aimpart) then
            if getgenv().LuaBot.Resolver.Enabled == true and targ.Character:WaitForChild("HumanoidRootPart").Velocity.magnitude > 70 then            
                pcall(function()
                    local TargetVel = targ.Character[getgenv().LuaBot.Silent.Aimpart]
                    TargetVel.Velocity = Vector3.new(0, 0, 0)
                    TargetVel.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            
                end)
            end
            if getgenv().LuaBot.Checks.AntiGroundShots == true and targ.Character:FindFirstChild("Humanoid") == Enum.HumanoidStateType.Freefall then
                pcall(function()
                    local TargetVelv5 = targ.Character[getgenv().LuaBot.Silent.Aimpart]
                    TargetVelv5.Velocity = Vector3.new(TargetVelv5.Velocity.X, (TargetVelv5.Velocity.Y * 5), TargetVelv5.Velocity.Z)
                    TargetVelv5.AssemblyLinearVelocity = Vector3.new(TargetVelv5.Velocity.X, (TargetVelv5.Velocity.Y * 5), TargetVelv5.Velocity.Z)
                end)
            end
            
            if getgenv().LuaBot.Resolver.Enabled == true then            
                pcall(function()
                    local TargetVelv2 = targ.Character[getgenv().LuaBot.Silent.Aimpart]
                    TargetVelv2.Velocity = Vector3.new(TargetVelv2.Velocity.X, 0, TargetVelv2.Velocity.Z)
                    TargetVelv2.AssemblyLinearVelocity = Vector3.new(TargetVelv2.Velocity.X, 0, TargetVelv2.Velocity.Z)
                end)
            end
	    end
	end
	



if getgenv().LuaBot.Custom.Shake == true then
       if Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
       
           getgenv().LuaBot.Camlock.ShakeValue = getgenv().LuaBot.Custom.AirShakeValue
       else
        getgenv().LuaBot.Camlock.ShakeValue  = getgenv().LuaBot.Custom.GroundShakeValue

  end
end

if getgenv().LuaBot.Custom.Smoothness == true then
       if Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
       
           getgenv().LuaBot.Camlock.SmoothnessValue = getgenv().LuaBot.Custom.AirSmoothnessValue
       else
        getgenv().LuaBot.Camlock.SmoothnessValue = getgenv().LuaBot.Custom.GroundSmoothnessValue
  end
end




    if getgenv().LuaBot.Camlock.Enabled == true then
        if getgenv().LuaBot.Resolver.Enabled == true and Plr and Plr.Character and Plr.Character:WaitForChild(getgenv().LuaBot.Camlock.Aimpart) and Plr.Character:WaitForChild("HumanoidRootPart").Velocity.magnitude > 70 then
            pcall(function()
                local TargetVelv3 = Plr.Character[getgenv().LuaBot.Camlock.Aimpart]
                TargetVelv3.Velocity = Vector3.new(0, 0, 0)
                TargetVelv3.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            end)
        end
        if getgenv().LuaBot.Checks.AntiGroundShots == true and Plr.Character:FindFirstChild("Humanoid") == Enum.HumanoidStateType.Freefall then
                pcall(function()
                    local TargetVelv5 = Plr.Character[getgenv().LuaBot.Camlock.Aimpart]
                    TargetVelv5.Velocity = Vector3.new(TargetVelv5.Velocity.X, (TargetVelv5.Velocity.Y * 5), TargetVelv5.Velocity.Z)
                    TargetVelv5.AssemblyLinearVelocity = Vector3.new(TargetVelv5.Velocity.X, (TargetVelv5.Velocity.Y * 5), TargetVelv5.Velocity.Z)
                end)
        end
    
        if getgenv().LuaBot.Resolver.Enabled == true and Plr and Plr.Character and Plr.Character:WaitForChild(getgenv().LuaBot.Camlock.Aimpart) then
            pcall(function()
                local TargetVelv4 = Plr.Character[getgenv().LuaBot.Camlock.Aimpart]
                TargetVelv4.Velocity = Vector3.new(TargetVelv4.Velocity.X, 0, TargetVelv4.Velocity.Z)
                TargetVelv4.AssemblyLinearVelocity = Vector3.new(TargetVelv4.Velocity.X, 0, TargetVelv4.Velocity.Z)
            end)
        end
    end
end)

RS.RenderStepped:Connect(function()
	if getgenv().LuaBot.Silent.Enabled then
        if getgenv().LuaBot.Checks.Knocked == true and targ and targ.Character then 
            local KOd = targ.Character:WaitForChild("BodyEffects")["K.O"].Value
            local Grabbed = targ.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
            if KOd or Grabbed then
                targ = nil
            end
        end
	end
    if getgenv().LuaBot.Camlock.Enabled == true then
        if getgenv().LuaBot.Checks.Knocked == true and Plr and Plr.Character then 
            local KOd = Plr.Character:WaitForChild("BodyEffects")["K.O"].Value
            local Grabbed = Plr.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
            if KOd or Grabbed then
                Plr = nil
                IsTargetting = false
            end
        end
        
		if getgenv().LuaBot.Checks.DisableOnDeath == true and Plr and Plr.Character:FindFirstChild("Humanoid") then
			if Plr.Character.Humanoid.health < 2 then
				Plr = nil
				IsTargetting = false
			end
		end
		if getgenv().LuaBot.Checks.DisableOnDeath == true and Plr and Plr.Character:FindFirstChild("Humanoid") then
			if Client.Character.Humanoid.health < 2 then
				Plr = nil
				IsTargetting = false
			end
		end
        if getgenv().LuaBot.Checks.DisableOutsideFov == true and Plr and Plr.Character and Plr.Character:WaitForChild("HumanoidRootPart") then
            if
            Camlock.Radius <
                (Vector2.new(
                    Camera:WorldToScreenPoint(Plr.Character.HumanoidRootPart.Position).X,
                    Camera:WorldToScreenPoint(Plr.Character.HumanoidRootPart.Position).Y
                ) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
             then
                Plr = nil
                IsTargetting = false
            end
        end
		if getgenv().LuaBot.Camlock.Predict and Plr and Plr.Character and Plr.Character:FindFirstChild(getgenv().LuaBot.Camlock.Aimpart) then
			if getgenv().LuaBot.Camlock.Shake then
				local Main = CFrame.new(Camera.CFrame.p,Plr.Character[getgenv().LuaBot.Camlock.Aimpart].Position + Plr.Character[getgenv().LuaBot.Camlock.Aimpart].Velocity * getgenv().LuaBot.Camlock.Prediction+
				Vector3.new(
					math.random(-getgenv().LuaBot.Camlock.ShakeValue, getgenv().LuaBot.Camlock.ShakeValue),
					math.random(-getgenv().LuaBot.Camlock.ShakeValue, getgenv().LuaBot.Camlock.ShakeValue),
					math.random(-getgenv().LuaBot.Camlock.ShakeValue, getgenv().LuaBot.Camlock.ShakeValue)
				) * 0.1)
				Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().LuaBot.Camlock.SmoothnessValue / 2, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
			else
    			local Main = CFrame.new(Camera.CFrame.p,Plr.Character[getgenv().LuaBot.Camlock.Aimpart].Position + Plr.Character[getgenv().LuaBot.Camlock.Aimpart].Velocity * getgenv().LuaBot.Camlock.Prediction)
    			Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().LuaBot.Camlock.SmoothnessValue / 2, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
			end
		elseif getgenv().LuaBot.Camlock.Predict == false and Plr and Plr.Character and Plr.Character:FindFirstChild(getgenv().LuaBot.Camlock.Aimpart) then
			if getgenv().LuaBot.Camlock.Shake then
				local Main = CFrame.new(Camera.CFrame.p,Plr.Character[getgenv().LuaBot.Camlock.Aimpart].Position +
				Vector3.new(
					math.random(-getgenv().LuaBot.Camlock.ShakeValue, getgenv().LuaBot.Camlock.ShakeValue),
					math.random(-getgenv().LuaBot.Camlock.ShakeValue, getgenv().LuaBot.Camlock.ShakeValue),
					math.random(-getgenv().LuaBot.Camlock.ShakeValue, getgenv().LuaBot.Camlock.ShakeValue)
				) * 0.1)
				Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().LuaBot.Camlock.SmoothnessValue / 2, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
		    else
    			local Main = CFrame.new(Camera.CFrame.p,Plr.Character[getgenv().LuaBot.Camlock.Aimpart].Position)
    			Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().LuaBot.Camlock.SmoothnessValue / 2, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
		    end
		end
	end
end)

task.spawn(function ()
    while task.wait() do
    	if getgenv().LuaBot.Silent.Enabled then
            targ = ClosestPlrFromMouse()
    	end
        if Plr then
            if getgenv().LuaBot.Camlock.Enabled and (Plr.Character) and getgenv().LuaBot.Camlock.NearestCursorAimpart then
                getgenv().LuaBot.Camlock.Aimpart = tostring(GetClosestBodyPartV2(Plr.Character))
            end
        end
        if targ then
            if getgenv().LuaBot.Silent.Enabled and (targ.Character) and getgenv().LuaBot.Silent.NearestCursorAimpart then
                getgenv().LuaBot.Silent.Aimpart = tostring(GetClosestBodyPart(targ.Character))
            end
        end
    end
end)

getgenv().uhpoop = {
    ["Enabled"] = (getgenv().LuaBot.GunFov.Enabled),
    ["Double-Barrel SG"] = {["FOV"] = (getgenv().LuaBot.GunFov.DoubleBarrel)}, --// Db
    ["DoubleBarrel"] = {["FOV"] = (getgenv().LuaBot.GunFov.DoubleBarrel)}, --// Db
    ["Revolver"] = {["FOV"] = (getgenv().LuaBot.GunFov.Revolver)}, --// Rev
    ["SMG"] = {["FOV"] = (getgenv().LuaBot.GunFov.Smg)}, --// Uzi/Smg
    ["Shotgun"] = {["FOV"] = (getgenv().LuaBot.GunFov.Shotgun)}, --// Sg
    ["TacticalShotgun"] = {["FOV"] = (getgenv().LuaBot.GunFov.TacticalShotgun)}, --// Tac
    ["Silencer"] = {["FOV"] = (getgenv().LuaBot.GunFov.Silencer)}, -- smg
    
}                 

local Script = {Functions = {}}
    Script.Functions.getToolName = function(name)
        local split = string.split(string.split(name, "[")[2], "]")[1]
        return split
    end
    Script.Functions.getEquippedWeaponName = function()
        if (Client.Character) and Client.Character:FindFirstChildWhichIsA("Tool") then
           local Tool =  Client.Character:FindFirstChildWhichIsA("Tool")
           if string.find(Tool.Name, "%[") and string.find(Tool.Name, "%]") and not string.find(Tool.Name, "Wallet") and not string.find(Tool.Name, "Phone") then
              return Script.Functions.getToolName(Tool.Name)
           end
        end
        return nil
    end
    RS.RenderStepped:Connect(function()
    if Script.Functions.getEquippedWeaponName() ~= nil then
        local WeaponSettings = getgenv().uhpoop[Script.Functions.getEquippedWeaponName()]
        if WeaponSettings ~= nil and getgenv().LuaBot.GunFov.Enabled == true then
            getgenv().LuaBot.Fov.Silent.Size = WeaponSettings.FOV
        else
            getgenv().LuaBot.Fov.Silent.Size = getgenv().LuaBot.Fov.Silent.Size
        end
    end
end)

local Aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/GravesFr/opensourceskidded/main/s"))()
Aiming.TeamCheck(false)



local Workspace = game:GetService("Workspace")

local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")



local LocalPlayer = Players.LocalPlayer

local Mouse = LocalPlayer:GetMouse()

local CurrentCamera = Workspace.CurrentCamera


Aiming.FOV = 50
--------------------------------------------------
--------------------------------------------------- -fov 5.5-6.6 is legit

function Aiming.Check()
    if not (Aiming.Enabled == true and Aiming.Selected ~= LocalPlayer and Aiming.SelectedPart ~= nil) then
        return false
    end
end


game:GetService("RunService").Heartbeat:Connect(
                                function()
                                    if
                                        getgenv().LuaBot.Range.Enabled == true and getgenv().LuaBot.Range.Type == "Fov" and Aiming.Selected ~= nil and (Aiming.Selected.Character) and targ and targ.Character then
                                        if
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().LuaBot.Range.CloseDetection
                                         then
                                            getgenv().LuaBot.Fov.Silent.Size = getgenv().LuaBot.Range.CloseFov
                                            
                                        elseif
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().LuaBot.Range.MidDetection
                                         then
                                            getgenv().LuaBot.Fov.Silent.Size = getgenv().LuaBot.Range.MidFov
                                        elseif
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().LuaBot.Range.FarDetection
                                         then
                                            getgenv().LuaBot.Fov.Silent.Size = getgenv().LuaBot.Range.FarFov
                                        elseif
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().LuaBot.Range.VeryFarDetection
                                         then
                                            getgenv().LuaBot.Fov.Silent.Size = getgenv().LuaBot.Range.VeryFarFov
                                        end
                                    end
                                end
                            )
                            
                            game:GetService("RunService").Heartbeat:Connect(
                                function()
                                    if
                                        getgenv().LuaBot.Range.Enabled == true and getgenv().LuaBot.Range.Type == "Prediction" and Aiming.Selected ~= nil and (Aiming.Selected.Character) and targ and Plr.Character then
                                        if
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().LuaBot.Range.CloseDetection
                                         then
                                            getgenv().LuaBot.Silent.Prediction= getgenv().LuaBot.Range.ClosePrediction
                                            
                                        elseif
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().LuaBot.Range.MidDetection
                                         then
                                            getgenv().LuaBot.Silent.Prediction= getgenv().LuaBot.Range.MidPrediction
                                        elseif
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().LuaBot.Range.FarDetection
                                         then
                                            getgenv().LuaBot.Silent.Prediction= getgenv().LuaBot.Range.FarPrediction
                                        elseif
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().LuaBot.Range.VeryFarDetection
                                         then
                                            getgenv().LuaBot.Silent.Prediction= getgenv().LuaBot.Range.VeryFarPrediction
                                        end
                                    end
                                end
                            )
                            
                            game:GetService("RunService").Heartbeat:Connect(
                                function()
                                    if
                                        getgenv().LuaBot.Range.Enabled == true and getgenv().LuaBot.Range.Type == "Both" and Aiming.Selected ~= nil and (Aiming.Selected.Character) and targ and Plr.Character then
                                        if
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().LuaBot.Range.CloseDetection
                                         then
                                            getgenv().LuaBot.Fov.Silent.Size = getgenv().LuaBot.Range.CloseFov
                                            getgenv().LuaBot.Silent.Prediction= getgenv().LuaBot.Range.ClosePrediction
                                            
                                        elseif
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().LuaBot.Range.MidDetection
                                         then
                                            getgenv().LuaBot.Fov.Silent.Size = getgenv().LuaBot.Range.MidFov
                                            getgenv().LuaBot.Silent.Prediction= getgenv().LuaBot.Range.MidPrediction
                                        elseif
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().LuaBot.Range.FarDetection
                                         then
                                            getgenv().LuaBot.Fov.Silent.Size = getgenv().LuaBot.Range.FarFov
                                            getgenv().LuaBot.Silent.Prediction= getgenv().LuaBot.Range.FarPrediction
                                        elseif
                                            (game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                getgenv().LuaBot.Range.VeryFarDetection
                                         then
                                            getgenv().LuaBot.Fov.Silent.Size = getgenv().LuaBot.Range.VeryFarFov
                                            getgenv().LuaBot.Silent.Prediction= getgenv().LuaBot.Range.VeryFarPrediction
                                        end
                                    end
                                end
                            )



local Player = game:GetService("Players").LocalPlayer
            local Mouse = Player:GetMouse()
            local SpeedGlitch = false
            Mouse.KeyDown:Connect(function(Key)
                if getgenv().LuaBot.Macro.Type == "Normal" and getgenv().LuaBot.Macro.Enabled == true and Key == getgenv().LuaBot.Macro.Keybind then
                    SpeedGlitch = not SpeedGlitch
                    if SpeedGlitch == true then
                        repeat game:GetService("RunService").Heartbeat:wait()
                            keypress(0x49)
                            game:GetService("RunService").Heartbeat:wait()

                            keypress(0x4F)
                            game:GetService("RunService").Heartbeat:wait()

                            keyrelease(0x49)
                            game:GetService("RunService").Heartbeat:wait()

                            keyrelease(0x4F)
                            game:GetService("RunService").Heartbeat:wait()

                        until SpeedGlitch == false
                    end
                end
            end)
            
            
            
            local Player = game:GetService("Players").LocalPlayer
            local Mouse = Player:GetMouse()
            local SpeedGlitch = false
            Mouse.KeyDown:Connect(function(Key)
                if getgenv().LuaBot.Macro.Type == "Shift" and getgenv().LuaBot.Macro.Enabled == true and Key == getgenv().LuaBot.Macro.Keybind then
                    SpeedGlitch = not SpeedGlitch
                    if SpeedGlitch == true then
                        repeat game:GetService("RunService").Heartbeat:wait()

                            keypress(0xA0)
                            game:GetService("RunService").Heartbeat:wait()

                            keypress(0xA0)
                            game:GetService("RunService").Heartbeat:wait()

                            keyrelease(0xA0)
                            game:GetService("RunService").Heartbeat:wait()

                            keyrelease(0xA0)
                            game:GetService("RunService").Heartbeat:wait()

                        until SpeedGlitch == false
                    end
                end
            end)
            
      if getgenv().LuaBot.Resolver.Enabled == true then 
          local hrp
local resolver = game:GetService("RunService")

demiseuwu.Heartbeat:Connect(function()
    pcall(function()
        for i,v in pairs(game.Players:GetChildren()) do
            if v ~= game.Players.LocalPlayer  then
                hrp = v.Character.HumanoidRootPart
                hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
            end
        end
    end)
end)
end
            
            

    while getgenv().LuaBot.AutoPrediction.Enabled == true do
    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    local pingValue = string.split(ping, " ")[1]
    local pingNumber = tonumber(pingValue)
end   
   
    if pingNumber < 30 then
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P20)
        LuaBot.Silent.Prediction = (getgenv().LuaBot.AutoPrediction.P20)
    elseif pingNumber < 40 then
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P30)
        LuaBot.Silent.Prediction= (getgenv().LuaBot.AutoPrediction.P30)
    elseif pingNumber < 50 then
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P40)
        LuaBot.Silent.Prediction= (getgenv().LuaBot.AutoPrediction.P40)
    elseif pingNumber < 60 then
end
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P50)
        LuaBot.Silent.Prediction= (getgenv().LuaBot.AutoPrediction.P50)
    if pingNumber < 70 then
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P60)
        LuaBot.Silent.Prediction= (getgenv().LuaBot.AutoPrediction.P60)
    elseif pingNumber < 80 then
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P70)
        LuaBot.Silent.Prediction = (getgenv().LuaBot.AutoPrediction.P70)
    elseif pingNumber < 90 then
end
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P80)
        LuaBot.Silent.Prediction = (getgenv().LuaBot.AutoPrediction.P80)
  if pingNumber < 100 then
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P90)
        LuaBot.Silent.Prediction = (getgenv().LuaBot.AutoPrediction.P90)
    elseif pingNumber < 110 then
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P100)
        LuaBot.Silent.Prediction = (getgenv().LuaBot.AutoPrediction.P100)
         elseif pingNumber < 120 then
end
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P110)
        LuaBot.Silent.Prediction = (getgenv().LuaBot.AutoPrediction.P110)
         if pingNumber < 130 then
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P120)
        LuaBot.Silent.Prediction = (getgenv().LuaBot.AutoPrediction.P120)
         elseif pingNumber < 140 then
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P130)
        LuaBot.Silent.Prediction = (getgenv().LuaBot.AutoPrediction.P130)
         elseif pingNumber < 150 then
end
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P140)
        LuaBot.Silent.Prediction = (getgenv().LuaBot.AutoPrediction.P140)
         if pingNumber < 160 then
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P150)
        LuaBot.Silent.Prediction = (getgenv().LuaBot.AutoPrediction.P150)
        elseif pingNumber < 170 then
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P160)
        LuaBot.Silent.Prediction = (getgenv().LuaBot.AutoPrediction.P160)
        elseif pingNumber < 180 then
end
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P170)
        LuaBot.Silent.Prediction = (getgenv().LuaBot.AutoPrediction.P170)
        if pingNumber < 190 then
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P180)
        LuaBot.Silent.Prediction = (getgenv().LuaBot.AutoPrediction.P180)
        elseif pingNumber < 200 then
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P190)
        LuaBot.Silent.Prediction = (getgenv().LuaBot.AutoPrediction.P190)
        elseif pingNumber < 210 then
end
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P200)
        LuaBot.Silent.Prediction = (getgenv().LuaBot.AutoPrediction.P200)
        if pingNumber < 260 then
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P250)
        LuaBot.Silent.Prediction = (getgenv().LuaBot.AutoPrediction.P250)
        elseif pingNumber < 310 then
        LuaBot.Camlock.Prediction = (getgenv().LuaBot.AutoPrediction.P300)
        LuaBot.Silent.Prediction = (getgenv().LuaBot.AutoPrediction.P300)
	end
 
    wait(0.5)
