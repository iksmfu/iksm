-- Services
local L_1_ = setmetatable({}, {
	__index = function(L_93_arg1, L_94_arg2)
		local L_95_ = game:GetService(L_94_arg2);
		if L_95_ then
			L_93_arg1[L_94_arg2] = L_95_; 
			return L_95_;
		end
	end,
})

-- Hook the __namecall metamethod
if hookmetamethod and typeof(hookmetamethod) == 'function' then
	local L_96_
	L_96_ = hookmetamethod(game, "__namecall", function(L_97_arg1, ...)
		if getnamecallmethod() == "Kick" then
			return
		end
		return L_96_(L_97_arg1, ...)
	end)
end

-- Player-related variables
local L_2_ = L_1_.Players
local L_3_ = L_2_.LocalPlayer
local L_4_ = L_3_.Name
local L_5_ = L_3_:GetMouse()
local L_6_ = L_3_.PlayerScripts
local L_7_ = L_6_.WeaponryFramework

-- Import required modules
local L_8_ = L_1_.Workspace
local L_9_ = L_1_.ReplicatedStorage
local L_10_ = L_1_.RunService
local L_11_ = L_1_.UserInputService
local L_12_ = L_9_.Game.GameState
local L_13_ = L_9_.ClientModules
local L_14_ = require(L_13_.CameraAccelerator)
local L_15_ = L_8_.CurrentCamera
local L_16_ = game:GetService('VirtualInputManager')
local L_17_ = game:GetService("UserInputService")
local L_18_ = require(L_13_.InputConfigs)
local L_19_ = require(L_13_.CharacterStateConfigs)
local L_20_ = game:GetService("HttpService")
local L_21_ = game:GetService("RunService")
local L_22_ = L_3_.Character
local L_23_ = game:GetService("TeleportService")

-- Drawing-related variables
local L_24_ = Drawing.new("Circle")

-- Event-related variables
local L_25_ = Instance.new("BindableEvent")
local L_26_ = L_25_.Event:Connect(function()
end)

-- Additional variables
local L_27_ = {
	"Torso",
	"Head",
	"Random"
}
local L_28_ = {
	" | nexus takeover",
	" | nexus gaming chair",
	" | domshoe is a W",
	" | domshoe supports nexus",
	" | Domshoe uses Nexus's script",
	"steam is a furry"
}
local L_29_ = {}

repeat
	wait()
until game:IsLoaded() and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

spawn(function()
	while wait() do
		if getgenv().Disconnect == true then
			wait(1)
			L_26_:Disconnect()
			getgenv().Disconnect = false
			return
		else  
			L_25_:Fire()
		end
	end  
end)  

local L_30_ = loadstring(game:HttpGet("https://github.com/s-o-a-b/nexus/releases/download/nexus/nexus.txt"))()
local L_31_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/assets/SaveManager"))()
local L_32_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/assets/InterfaceManager"))()

local L_33_ = L_30_.Options
L_31_:SetLibrary(L_30_)

--[[
   premium = true
]]

local L_34_ = L_30_:CreateWindow({
	Title = "nexus ",
	"",
	SubTitle = "",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = true,
	Theme = "Dark",
})

local L_35_ = {
	Main = L_34_:AddTab({
		Title = "Main",
		Icon = "rbxassetid://10723424505"
	}),
	Misc = L_34_:AddTab({
		Title = "Misc",
		Icon = "rbxassetid://10709818534"
	}),
	Visual = L_34_:AddTab({
		Title = "Visual",
		Icon = "rbxassetid://10723346959"
	}),
	Player = L_34_:AddTab({
		Title = "Player",
		Icon = "rbxassetid://10747373176"
	}),
	Premium = premium == "premium" and L_34_:AddTab({
		Title = "Premium",
		Icon = "rbxassetid://10709819149"
	}),
	Server = L_34_:AddTab({
		Title = "Server",
		Icon = "rbxassetid://10734949856"
	}),
	Settings = L_34_:AddTab({
		Title = "Settings",
		Icon = "rbxassetid://10734950020"
	}),

}

local L_36_ = L_35_.Main:AddToggle("SilentAim", {
	Title = "Silent Aim",
	Default = false,
	Callback = function(L_98_arg1)
	end
})
local L_37_ = L_35_.Main:AddToggle("ShowFOV", {
	Title = "Show FOV",
	Default = false,
	Callback = function(L_99_arg1)
	end
})
local L_38_ = L_35_.Main:AddSlider("Radius", {
	Title = "Fov Radius",
	Default = 0,
	Min = 50,
	Max = 250,
	Rounding = 1,
	Callback = function(L_100_arg1)
	end
})  
local L_39_ = L_35_.Main:AddDropdown("Hitpart", {
	Title = "Hitpart",
	Values = {
		"Head",
		"Torso",
		"Random"
	}, 
	Multi = false,
	Default = "",
	Callback = function(L_101_arg1)

	end
})
local L_40_ = L_35_.Misc:AddToggle("AutoReload", {
	Title = "Infinite Ammo",
	Default = false,
	Callback = function(L_102_arg1)
		if L_102_arg1 then 
			repeat
				task.wait(.1)  
				local L_103_ = L_3_.Character
				if L_103_ and L_103_:FindFirstChild("HumanoidRootPart") then
					for L_104_forvar1, L_105_forvar2 in pairs(L_103_:GetChildren()) do
						if L_105_forvar2:IsA("Tool") then
							module:reloadWeapon()
						end
					end
				end
			until not L_33_.AutoReload.Value or not L_26_.Connected
		end
	end
})

local L_41_ = L_35_.Main:AddToggle("SniperAim", {
	Title = "Sniper Wallbang + [ Silent Aim ]",
	Default = false,
	Callback = function(L_106_arg1)
	end
})
local L_42_ = L_35_.Main:AddToggle("KillAll", {
	Title = "Kill All",
	Default = false,
	Callback = function(L_107_arg1)
	end
})

local L_43_ = game:GetService("Players")
local L_44_ = game:GetService("RunService")
local L_45_ = game:GetService("ReplicatedStorage")

-- lph macro
if not LPH_OBFUSCATED then
	LPH_JIT = function(...)
		return ...
	end

	LPH_CRASH = function(...)
		return ...
	end

	LPH_NO_VIRTUALIZE = function(...)
		return ...
	end
end

-- variables
local L_46_ = L_43_.LocalPlayer

local L_47_ = os.time()
local L_48_ = false

local L_49_ = L_45_.Remotes
local L_50_ = L_45_.Weapons

local L_51_ = L_49_.HitHandler
local L_52_ = L_49_.WeaponHandler
local L_53_ = L_49_.VotekickPlayerInit

local L_54_ = LPH_NO_VIRTUALIZE(function(L_108_arg1:Player)
	if L_108_arg1 and L_108_arg1.Character then
		if L_108_arg1.Character:FindFirstChild("Humanoid") and L_108_arg1.Character:FindFirstChild("HumanoidRootPart") and not L_108_arg1.Character:FindFirstChild("ForceField") then
			if (L_108_arg1.Character.Humanoid.Health >= 1) then
				return true
			end
		elseif game:GetService("ReplicatedStorage").Game.SecondaryStatus.Value == "Free For All" or game:GetService("ReplicatedStorage").Game.SecondaryStatus.Value == "Team Deathmatch" then 
			if L_3_ and L_3_.Character then
				local L_109_ = L_3_.Character
				if L_109_:FindFirstChild("ForceField") then
					print("Forcefield exists in your character!")
					L_16_:SendKeyEvent(true, "W", false, game)
					task.wait(0.003)
					L_16_:SendKeyEvent(false, "W", false, game)
				end
			end
		end
	end  
	return false
end)

local L_55_ = LPH_NO_VIRTUALIZE(function()
	local L_110_
	local L_111_ = math.huge

	for L_112_forvar1, L_113_forvar2 in next, L_43_:GetPlayers() do
		if (L_113_forvar2 ~= L_46_) and (L_113_forvar2.Team ~= L_46_.Team or L_113_forvar2.Team == nil) and (L_54_(L_113_forvar2) and L_54_(L_46_)) then
			local L_114_ = L_46_:DistanceFromCharacter(L_113_forvar2.Character.HumanoidRootPart.Position)

			if L_114_ < L_111_ then
				L_110_ = L_113_forvar2
				L_111_ = L_114_
			end
		end
	end

	return L_110_
end)

local L_56_ = LPH_JIT(function(L_115_arg1:Player)
	if L_54_(L_46_) and L_54_(L_115_arg1) then
		local L_116_ = L_115_arg1.HitboxVal.Value
		local L_117_ = L_46_.Character:FindFirstChildWhichIsA("Tool")
		local L_118_ = L_46_:DistanceFromCharacter(L_115_arg1.Character.HumanoidRootPart.Position)

		if ((os.time() - L_47_) < 0.1) then
			return
		end

		if L_117_ and L_116_ and L_117_.Name == "Knife" then
			local L_119_ = require(L_50_[L_117_.Name:lower()][L_117_.Name:lower()])

			L_52_:FireServer(1, { 
				["RunTimeValue"] = os.time(), 
				["IsFirstPerson"] = true, 
				["MeleeMode"] = 2, 
				["WeaponProfile"] = {
					["TriggerDisconnected"] = true,
					["WeaponStats"] = L_119_,
					["Reloading"] = false,
					["Extra"] = true,
					["WeaponName"] = L_117_.Name,
					["ToolInstance"] = L_117_,
					["CanShoot"] = true,
					["PauseDebounce"] = {},
					["BodyAttach"] = L_117_.BodyAttach
				},
				["InitialPos"] = L_117_.BodyAttach.Position,
				["ShotTick"] = os.time()
			})

			L_52_:FireServer(2, os.time(), {
				["RayDir"] = CFrame.new(L_117_.BodyAttach.Position, L_116_.HitboxMelee.Position).LookVector,
				["BulletTick"] = os.time()
			})

			L_51_:InvokeServer({
				["HitPlr"] = L_115_arg1,
				["isChar"] = true,
				["Distance"] = L_118_,
				["ShotTick"] = os.time(),
				["isHitbox"] = true,
				["HitObj"] = L_116_.HitboxMelee,
				["HitNorm"] = CFrame.new(L_117_.BodyAttach.Position, L_116_.HitboxMelee.Position).LookVector,
				["BulletTick"] = os.time(),
				["HitChar"] = L_115_arg1.Character,
				["HitPos"] = L_116_.HitboxMelee.Position
			})
		end
	end
end)

L_44_.RenderStepped:Connect(function()

	if ((os.time() - L_47_) < 0) then
		L_48_ = false
	end

	if (not L_48_) and L_33_.KillAll.Value and L_26_.Connected then
		local L_120_ = L_55_()

		if (L_120_ and L_54_(L_120_)) then
			L_48_ = true

			repeat
				task.wait()
				if L_54_(L_46_) then        
					L_46_.Character.HumanoidRootPart.CFrame = CFrame.new(L_120_.Character.HumanoidRootPart.Position - (Vector3.new(0, 0, 0)))
					workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, (L_120_.Character.HumanoidRootPart.Position - Vector3.new(-0.5, 0, 1)))
					L_56_(L_120_)
					local L_121_, L_122_ = pcall(function()
						local L_123_ = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Knife")
						game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(L_123_)
					end)
				end
			until L_120_.Character.Humanoid.Health <= 0 or (not L_54_(L_120_) or not L_54_(L_46_))

			L_48_ = false
		end  
	end
end)
local L_57_ = L_35_.Main:AddToggle("AntiKick", {
	Title = "Anti Vote-Kick",
	Default = false,
	Callback = function(L_124_arg1)
		if L_124_arg1 then
			repeat
				game:GetService("Players").LocalPlayer.PlayerGui.MainUI.VerticalInterface.Visible = false
				task.wait(.1)
				if #L_43_:GetPlayers() > 1 then
					local L_125_ = L_43_:GetPlayers()[2]
					L_53_:FireServer(L_125_)
				end
			until not L_33_.AntiKick.Value or not L_26_.Connected
			game:GetService("Players").LocalPlayer.PlayerGui.MainUI.VerticalInterface.Visible = true
		end
	end
})

local L_58_ = L_35_.Misc:AddToggle("Norecoil", {
	Title = "No Recoil",
	Default = false,
	Callback = function(L_126_arg1)
	end  
})
local function L_59_func()
	for L_127_forvar1 = #L_28_, 2, -1 do
		local L_128_ = math.random(1, L_127_forvar1)
		L_28_[L_127_forvar1], L_28_[L_128_] = L_28_[L_128_], L_28_[L_127_forvar1]
	end

	return L_28_[1]
end

local L_60_ = {}

local L_61_ = L_35_.Misc:AddToggle("AutoToxic", {
	Title = "Auto Toxic",
	Default = false,
	Callback = function(L_129_arg1)
		if L_129_arg1 then
			repeat
				task.wait()
				for L_130_forvar1, L_131_forvar2 in ipairs(game:GetService("Players").LocalPlayer.PlayerGui.MainUI.KillFeed:GetChildren()) do
					if L_131_forvar2:IsA("Frame") and L_131_forvar2.Eliminator.PlayerName.Text == L_4_ then
						local L_132_ = L_131_forvar2.Eliminated.PlayerName.Text
						if not table.find(L_60_, L_132_) then
							local L_133_ = L_59_func()
							if L_133_ ~= "steam is a furry" then
								L_133_ = L_132_..L_133_
							end
							print("You killed "..L_132_)
							game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(L_133_, "All")
							table.insert(L_60_, L_132_)
							spawn(function()
								wait(20)
								table.remove(L_60_, table.find(L_60_, L_132_))
							end)
						end
					end
				end
			until not L_33_.AutoToxic.Value or not L_26_.Connected
		end
	end
})
local L_62_ = L_35_.Visual:AddToggle("EnemyChams", {
	Title = "Enemy Chams",
	Default = false,
	Callback = function(L_134_arg1)  
	end
})

local L_63_ = L_35_.Visual:AddToggle("TeamChams", {
	Title = "Team Chams",
	Default = false,
	Callback = function(L_135_arg1)
	end
})

local L_64_ = L_35_.Visual:AddToggle("Rainbow", {
	Title = "Rainbow Chams",
	Default = false,
	Callback = function(L_136_arg1)
	end
})

task.spawn(function()
	while task.wait() do 
		if not L_26_.Connected then 
			for L_137_forvar1, L_138_forvar2 in next, game:GetService('Players'):GetPlayers() do
				pcall(function()
					L_138_forvar2.Character.Highlight:Destroy()
				end)
			end 
			return
		end 
		if L_33_.EnemyChams.Value or L_33_.TeamChams.Value then
			local L_139_, L_140_ = pcall(function()
				local L_141_ = game:GetService("ReplicatedStorage")
				local L_142_ = game:GetService("Players")
				local L_143_ = L_142_.LocalPlayer

				local L_144_ = {}  

				local function L_145_func(L_146_arg1)
					if L_144_[L_146_arg1] ~= nil then
						return L_144_[L_146_arg1]  
					end

					local L_147_ = game:GetService("Players").LocalPlayer.Team
					if L_147_ then
						local L_148_ = L_146_arg1 ~= game:GetService("Players").LocalPlayer and L_146_arg1.Team ~= L_147_
						L_144_[L_146_arg1] = L_148_  
						return L_148_
					end
					return false
				end

				function CreateHighlight()
					for L_149_forvar1, L_150_forvar2 in pairs(L_142_:GetChildren()) do
						if L_150_forvar2 ~= L_143_ and L_150_forvar2.Character and not L_150_forvar2.Character:FindFirstChild("Highlight") then
							local L_151_ = Instance.new("Highlight", L_150_forvar2.Character)
							if L_145_func(L_150_forvar2) == true then
								L_150_forvar2.Character.Highlight.Enabled = false
							elseif L_145_func(L_150_forvar2) == false then
								L_150_forvar2.Character.Highlight.Enabled = false
							end
						end
					end
				end

				function UpdateHighlights()
					for L_152_forvar1, L_153_forvar2 in pairs(L_142_:GetChildren()) do
						if L_153_forvar2 ~= L_143_ and L_153_forvar2.Character and L_153_forvar2.Character:FindFirstChild("Highlight") then
							local L_154_ = L_153_forvar2.Character:FindFirstChild("Highlight")
							if game:GetService("ReplicatedStorage").Game.SecondaryStatus.Value == "Free For All" and (L_33_.TeamChams.Value or L_33_.EnemyChams.Value) then
								L_153_forvar2.Character.Highlight.Enabled = true
								L_154_.FillColor = Color3.fromRGB(255, 0, 0)
							elseif L_145_func(L_153_forvar2) == true and L_33_.EnemyChams.Value == true then
								L_153_forvar2.Character.Highlight.Enabled = true
								L_154_.FillColor = Color3.fromRGB(255, 0, 0)
							elseif L_145_func(L_153_forvar2) == true and L_33_.EnemyChams.Value == false then
								L_153_forvar2.Character.Highlight.Enabled = false 
							elseif L_145_func(L_153_forvar2) == false and L_33_.TeamChams.Value == true then
								L_153_forvar2.Character.Highlight.Enabled = true
								L_154_.FillColor = Color3.fromRGB(255, 255, 255)
							elseif L_145_func(L_153_forvar2) == false and L_33_.TeamChams.Value == false then
								L_153_forvar2.Character.Highlight.Enabled = false
							end
							if L_33_.Rainbow.Value then 
								L_154_.FillColor = Color3.fromHSV(tick() % 5 / 5, 1, 1)
							end
						end  
					end
				end  

				CreateHighlight()
				UpdateHighlights()
			end)
		else  
			for L_155_forvar1, L_156_forvar2 in next, game:GetService('Players'):GetPlayers() do
				if L_156_forvar2.Name ~= game:GetService('Players').LocalPlayer.Name and (L_33_.TeamChams.Value == false or L_156_forvar2.TeamColor ~= game:GetService('Players').LocalPlayer.TeamColor) then
					pcall(function()
						L_156_forvar2.Character.Highlight:Destroy()
					end)
				end
			end
			repeat
				wait()
			until L_33_.EnemyChams.Value == true or L_33_.TeamChams.Value == true 

		end 
	end
end)


local L_65_ = L_35_.Main:AddToggle("ExpandHitbox", {
	Title = "Expand Hitbox",
	Default = false,
	Callback = function(L_157_arg1)
		if L_157_arg1 then 
			repeat
				task.wait()  
				for L_158_forvar1, L_159_forvar2 in pairs (game:GetService("Workspace").Hitboxes:GetChildren()) do
					if L_159_forvar2.Name ~= tostring(game:GetService("Players").LocalPlayer.UserId) and L_159_forvar2:FindFirstChild("HitboxHead") then
						L_159_forvar2.HitboxHead.Size = Vector3.new(30, 30, 30)
					end
				end     
			until not L_33_.ExpandHitbox.Value or not L_26_.Connected
		end
	end
})

local L_66_ = L_35_.Visual:AddToggle("WeaponCham", {
	Title = "Weapon Chams",
	Default = false,
	Callback = function(L_160_arg1)
		if L_160_arg1 then 
			repeat
				task.wait()  
				local L_161_ = L_3_.Character
				if L_161_ and L_161_:FindFirstChild("HumanoidRootPart") then
					for L_162_forvar1, L_163_forvar2 in pairs(L_161_:GetChildren()) do
						if L_163_forvar2:IsA("Tool") then
							for L_164_forvar1, L_165_forvar2 in pairs(L_163_forvar2:GetDescendants()) do
								if L_165_forvar2:IsA("MeshPart") then
									L_165_forvar2.Material = Enum.Material.ForceField                            
								end
							end
						end  
					end
				end
			until not L_33_.WeaponCham.Value or not L_26_.Connected
			if L_22_ and L_22_:FindFirstChild("HumanoidRootPart") then  
				for L_166_forvar1, L_167_forvar2 in pairs(L_22_:GetChildren()) do
					if L_167_forvar2:IsA("Tool") then
						for L_168_forvar1, L_169_forvar2 in pairs(L_167_forvar2:GetDescendants()) do
							if L_169_forvar2:IsA("MeshPart") then
								L_169_forvar2.Material = Enum.Material.SmoothPlastic                        
							end
						end  
					end  
				end
			end
		end
	end
})

local L_67_ = L_35_.Visual:AddToggle("WeaponRainbow", {
	Title = "Rainbow Weapon",
	Default = false,
	Callback = function(L_170_arg1)
		if L_170_arg1 then 
			repeat
				task.wait()  
				local L_171_ = L_3_.Character
				if L_171_ and L_171_:FindFirstChild("HumanoidRootPart") then
					for L_172_forvar1, L_173_forvar2 in pairs(L_171_:GetChildren()) do
						if L_173_forvar2:IsA("Tool") then
							for L_174_forvar1, L_175_forvar2 in pairs(L_173_forvar2:GetDescendants()) do
								if L_175_forvar2:IsA("BasePart") and L_175_forvar2.Name ~= "Handle" then
									L_175_forvar2.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
								end
							end
						end
					end
				end
			until not L_33_.WeaponRainbow.Value or not L_26_.Connected  
		end
	end
})

do 
	if L_26_.Connected then 
		L_24_.Thickness = 1
		L_24_.Filled = false
		L_24_.Transparency = 1
		L_24_.Color = Color3.new(207, 95, 64)
		L_24_.Visible = L_33_.ShowFOV.Value;
		L_24_.Radius = L_33_.Radius.Value
	else 
		L_24_.Visible = false; 
		return  
	end
end;
function CreateVector2(L_176_arg1) 
	return Vector2.new(L_176_arg1.X, L_176_arg1.Y)
end;
function GetDirection(L_177_arg1, L_178_arg2)
	return (L_178_arg2 - L_177_arg1).Unit * 1000
end;
function GetHitPart(L_179_arg1) 
	if L_179_arg1 then
		local L_180_ = (L_33_.Hitpart.Value == "Random" and L_27_[math.random(1, 2)]) or (L_33_.Hitpart.Value or "Torso")
		local L_181_ = L_179_arg1:FindFirstChild(L_180_)

		if L_181_ then
			return L_181_
		end
	end
end;
function GetFramework()
	for L_182_forvar1, L_183_forvar2 in pairs(L_3_.PlayerScripts:GetChildren()) do
		local L_184_, L_185_ = pcall(function()
			return getsenv(L_183_forvar2)
		end)
		if L_184_ and L_185_.InspectWeapon then
			return L_185_
		end
	end;
	return nil
end;
function IsPartVisible(L_186_arg1, L_187_arg2) 
	L_187_arg2 = L_187_arg2 or {}
	local L_188_ = L_15_.GetPartsObscuringTarget(L_15_, {
		L_186_arg1.Position
	}, {
		L_15_,
		L_3_.Character,
		unpack(L_187_arg2)
	})
	return #L_188_ <= 10
end;
function GetClosestPlayer(L_189_arg1, L_190_arg2) 
	L_189_arg1 = L_189_arg1 or math.huge;    
	for L_191_forvar1, L_192_forvar2 in next, L_43_.GetPlayers(L_43_) do 
		if L_192_forvar2 == L_3_ then 
			continue
		end;
		if L_12_.Value == "Team Deathmatch" and workspace[L_192_forvar2.Name].Head.NameTag.Enabled == true then
			warn("Skipping team·mate")
			continue
		end;
		if not L_192_forvar2.Character then
			continue
		end;
		local L_193_ = L_192_forvar2.Character:FindFirstChild("HumanoidRootPart")

		if not L_193_ then
			continue
		end;
		local L_194_, L_195_ = L_15_.WorldToScreenPoint(L_15_, L_193_.Position) 
		if L_195_ then
			if not IsPartVisible(L_193_, L_190_arg2) then
				continue
			end;
			local L_196_, L_197_
			pcall(function()
				if workspace[L_192_forvar2.Name].Head.NameTag.Enabled == false then
					local L_198_ = (CreateVector2(L_5_) - CreateVector2(L_194_)).Magnitude;
					if L_198_ <= L_189_arg1 then
						L_189_arg1 = L_198_;
						closestPlayer = L_192_forvar2;
						closestPlayerChar = L_192_forvar2.Character       
					end
				end
			end)  
		end
	end;
	return closestPlayer, closestPlayerChar
end;

local L_68_ = GetFramework().CheckIsToolValid;
local L_69_ = {
	["Raycast"] = function(L_199_arg1, ...)
		local L_200_ = {
			...
		}
		if L_33_.SilentAim.Value and L_199_arg1 == L_199_arg1 and L_26_.Connected then
			local L_201_ = debug.traceback() 
			if string.find(L_201_, "FireWeapon") then
				local L_202_ = tonumber(L_33_.Radius.Value)
				local L_203_ = L_200_[3].FilterDescendantsInstances; 
				local L_204_, L_205_ = GetClosestPlayer(250, L_203_)
				if L_204_ and L_205_ then
					local L_206_ = GetHitPart(L_205_)
					if L_206_ then
						L_200_[2] = GetDirection(L_200_[1], L_206_.Position)
						local L_207_ = game:GetService("Players"):GetPlayers()
						local L_208_ = game.Players.LocalPlayer
						for L_209_forvar1, L_210_forvar2 in ipairs(L_207_) do
							return L_199_arg1.Raycast(L_199_arg1, unpack(L_200_))
						end
					end 
				end  
			end
		end;
		return L_199_arg1.Raycast(L_199_arg1, ...)
	end;		 
}
local L_70_;
L_70_ = hookmetamethod(game, "__namecall", function(L_211_arg1, ...)
	local L_212_ = getnamecallmethod()
	local L_213_ = checkcaller()
	local L_214_ = L_69_[L_212_]
	local L_215_;
	if L_214_ then
		if typeof(L_214_) == "function" then
			L_215_ = {
				checkcaller = false;
				callback = L_214_
			}
		else
			L_215_ = L_214_[L_211_arg1.Name]
		end
	end;
	if (L_215_ and L_215_.checkcaller == L_213_) then
		local L_216_, L_217_ = pcall(L_215_.callback, L_211_arg1, ...)
		if not L_216_ then
			warn("Error", L_217_)
		end;
		return L_217_
	end;
	return L_70_(L_211_arg1, ...)
end)

local L_71_ = L_14_.accelerate
L_14_.accelerate = function(...)
	if L_33_.Norecoil.Value then
		return nil
	end
	return L_71_(...)
end

game.Loaded.Connect(L_44_.RenderStepped, function()
	if L_26_.Connected then 
		L_24_.Radius = L_33_.Radius.Value;
		L_24_.Visible = L_33_.ShowFOV.Value;
		L_24_.Position = L_17_.GetMouseLocation(L_17_)
	else 
		L_24_.Visible = false;  
	end
end)

local function L_72_func(L_218_arg1)
	local L_219_, L_220_ = L_15_:WorldToScreenPoint(L_218_arg1.Position)
	return L_220_, Vector2.new(L_219_.X, L_219_.Y)
end

local function L_73_func(L_221_arg1)
	local L_222_ = L_221_arg1.Character
	if not L_222_ or L_222_:FindFirstChildOfClass("ForceField") then
		return nil, nil
	end

	local L_223_ = game.workspace.Hitboxes:FindFirstChild(tostring(L_221_arg1.UserId))
	if not L_223_ or L_222_.Humanoid.Health <= 0 then
		return nil, nil
	end

	local L_224_ = {
		L_223_.HitboxHead,
		L_223_.HitboxBody,
		L_223_.HitboxLeg
	}
	local L_225_, L_226_ = nil, math.huge

	for L_227_forvar1, L_228_forvar2 in ipairs(L_224_) do
		local L_229_, L_230_ = L_72_func(L_228_forvar2)
		if L_229_ then
			local L_231_ = (L_230_ - Vector2.new(L_5_.X, L_5_.Y)).Magnitude
			if L_231_ < L_226_ then
				L_225_ = L_228_forvar2
				L_226_ = L_231_
			end
		end
	end

	return L_225_, L_226_
end

local function L_74_func()
	local L_232_, L_233_, L_234_ = nil, math.huge, nil

	for L_235_forvar1, L_236_forvar2 in ipairs(L_43_:GetPlayers()) do
		if L_236_forvar2 ~= L_3_ and L_236_forvar2.Character then
			local L_237_, L_238_ = L_73_func(L_236_forvar2)
			if L_237_ and L_238_ and L_238_ < L_233_ then
				L_232_ = L_237_
				L_233_ = L_238_
				L_234_ = L_236_forvar2
			end
		end
	end

	return L_232_, L_234_
end

local L_75_, L_76_

game:GetService("RunService").Stepped:Connect(function()
	L_75_, L_76_ = L_74_func()
end)

local L_77_
L_77_ = hookmetamethod(game, "__namecall", function(L_239_arg1, ...)
	local L_240_ = {
		...
	}
	local L_241_ = getnamecallmethod()

	if L_241_ == "InvokeServer" and L_239_arg1.Name == "HitHandler" and L_33_.SniperAim.Value and L_26_.Connected then
		if L_240_[1]["HitPos"] and L_75_ then
			L_240_[1]["HitPos"] = L_75_.Position
			L_240_[1]["HitObj"] = L_75_
		end
	elseif L_241_ == "FireServer" and L_239_arg1.Name == "WeaponHandler" and L_33_.SniperAim.Value and L_26_.Connected then
		if L_240_[3] and L_240_[3]["RayDir"] and L_75_ then
			L_240_[3]["RayDir"] = (L_75_.Position - L_3_.Character.Head.Position).Unit
		end
	end

	return L_77_(L_239_arg1, unpack(L_240_))
end)


local L_78_ = L_35_.Settings:AddToggle("Settings", {
	Title = "Save Settings",
	Default = false,
	Callback = function(L_242_arg1)
		if L_242_arg1 then 
			repeat
				task.wait(.1)  
				L_31_:Save(game.PlaceId)
			until not L_33_.Settings.Value or not L_26_.Connected
		end
	end
})

L_35_.Settings:AddButton({
	Title = "Delete Setting Config",
	Callback = function()
		delfile("FLORENCE/settings/"..game.PlaceId..".json")
	end  
})  

local L_79_ = L_35_.Player:AddToggle("SpeedMulti", {
	Title = "Walk Speed",
	Default = false,
	Callback = function(L_243_arg1)
		if L_243_arg1 then 
			repeat
				task.wait()  
				rawset(L_19_, "SpeedMulti", L_33_.WalkSpeed.Value);
			until not L_33_.SpeedMulti.Value or not L_26_.Connected
			rawset(L_19_, "SpeedMulti", 1);
		end
	end
})
local L_80_ = L_35_.Player:AddSlider("WalkSpeed", {
	Title = "Walk Multi Speed",
	Default = 1,
	Min = 1,
	Max = 10,
	Rounding = 1,
	Callback = function(L_244_arg1)
	end
})
local L_81_ = L_35_.Player:AddToggle("Jump", {
	Title = "Jump Speed",
	Default = false,
	Callback = function(L_245_arg1)
		if L_245_arg1 then 
			repeat
				task.wait()  
				rawset(L_19_, "JumpMulti", L_33_.JumpPower.Value);
			until not L_33_.Jump.Value or not L_26_.Connected
			rawset(L_19_, "JumpMulti", 1);
		end
	end
})
local L_82_ = L_35_.Player:AddSlider("JumpPower", {
	Title = "Jump Multi",
	Default = 1,
	Min = 1,
	Max = 10,
	Rounding = 1,
	Callback = function(L_246_arg1)
	end
})

local L_83_ = L_35_.Player:AddToggle("AutoSprint", {
	Title = "Auto Sprint",
	Default = false,
	Callback = function(L_247_arg1)
		if L_247_arg1 then 
			repeat
				task.wait(.5)  
				rawset(L_18_, "SprintHolding", true);
			until not L_33_.AutoSprint.Value or not L_26_.Connected
		end
	end
})

local L_84_ = L_35_.Player:AddToggle("Fly", {
	Title = "Fly",
	Default = false,
	Callback = function(L_248_arg1)
	end
})

local L_85_ = 200
local L_86_ = false
local L_87_ = 100000000000000

local function L_88_func(L_249_arg1, L_250_arg2, L_251_arg3)
	local L_252_ = (L_250_arg2 - L_249_arg1)
	local L_253_ = L_252_.Magnitude
	return (L_252_ / L_253_) * L_251_arg3
end

local function L_89_func(L_254_arg1)
	local L_255_ = tostring(L_254_arg1):lower()
	local L_256_, L_257_ = L_255_:find("keycode.")
	return L_255_:sub(L_257_ + 1)
end

local L_90_ = {}

game.RunService.Heartbeat:connect(function()
	pcall(function()
		local L_258_ = L_3_.Character.Humanoid.RootPart
		local L_259_ = CFrame.new() + Vector3.new(0, 0, -L_87_)
		local L_260_ = CFrame.new() + Vector3.new(0, 0, L_87_)
		local L_261_ = CFrame.new() + Vector3.new(-L_87_, 0, 0)
		local L_262_ = CFrame.new() + Vector3.new(L_87_, 0, 0)
		local L_263_ = CFrame.new() + Vector3.new(0, L_87_, 0)
		local L_264_ = CFrame.new() + Vector3.new(0, -L_87_, 0)
		local L_265_ = Vector3.new()

		if L_33_.Fly.Value and L_26_.Connected then
			if L_90_.w_active then
				L_265_ = L_265_ + L_88_func(L_258_.Position, (L_258_.CFrame * L_259_).Position, L_85_)
			end
			if L_90_.s_active then
				L_265_ = L_265_ + L_88_func(L_258_.Position, (L_258_.CFrame * L_260_).Position, L_85_)
			end
			if L_90_.a_active then
				L_265_ = L_265_ + L_88_func(L_258_.Position, (L_258_.CFrame * L_261_).Position, L_85_)
			end
			if L_90_.d_active then
				L_265_ = L_265_ + L_88_func(L_258_.Position, (L_258_.CFrame * L_262_).Position, L_85_)
			end
			if L_90_.space_active then
				L_265_ = L_265_ + Vector3.new(0, L_85_, 0)
			end
			if L_90_.leftcontrol_active then
				L_265_ = L_265_ - Vector3.new(0, L_85_, 0)  -- Apply downward velocity
			end
			L_258_.Velocity = L_265_
			L_258_.CFrame = CFrame.new(L_258_.Position, (workspace.CurrentCamera.CFrame * (CFrame.new() + Vector3.new(0, 0, -L_87_))).Position)
		end
	end)
end)

L_17_.InputBegan:connect(function(L_266_arg1, L_267_arg2)
	if L_267_arg2 then
		return
	end
	L_90_[L_89_func(L_266_arg1.KeyCode).."_active"] = true
end)

L_17_.InputEnded:connect(function(L_268_arg1)
	L_90_[L_89_func(L_268_arg1.KeyCode).."_active"] = false
end)

local L_91_ = L_35_.Server:AddToggle("AutoRejoin", {
	Title = "Auto Rejoin",
	Default = false,
	Callback = function(L_269_arg1)
		if L_269_arg1 then 
			L_30_:Notify({
				Title = 'Auto Rejoin',
				Content = 'You will rejoin if you are kicked or disconnected from the game',
				Duration = 5
			})
			repeat
				task.wait() 
				local L_270_, L_271_, L_272_ = game:GetService('Players').LocalPlayer, game.CoreGui.RobloxPromptGui.promptOverlay, game:GetService('TeleportService')
				L_271_.ChildAdded:connect(function(L_273_arg1)
					if L_273_arg1.Name == 'ErrorPrompt' then
						L_272_:Teleport(game.PlaceId)
						task.wait(2)
					end
				end)  
			until L_33_.AutoRejoin.Value or not L_26_.Connected
		end
	end
})

local L_92_ = L_35_.Server:AddToggle("ReExecute", {
	Title = "Auto ReExecute",
	Default = false,
	Callback = function(L_274_arg1)
		if L_274_arg1 then 
			repeat
				task.wait()
				local L_275_ = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
				if L_275_ then
					L_275_('loadstring(game:HttpGet("https://raw.githubusercontent.com/13B8B/nexus/main/loadstring"))()')
				end  
			until not L_33_.ReExecute.Value or not L_26_.Connected
		end
	end 
})
L_35_.Server:AddButton({
	Title = "Rejoin-Server",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
	end
})  

L_35_.Server:AddButton({
	Title = "Server-Hop", 
	Callback = function()
		local L_276_ = game:GetService("HttpService")
		local L_277_ = game:GetService("TeleportService")
		local L_278_ = "https://games.roblox.com/v1/games/"
		local L_279_, L_280_ = game.PlaceId, game.JobId
		local L_281_ = L_278_..L_279_.."/servers/Public?sortOrder=Desc&limit=100"
		local function L_282_func(L_284_arg1)
			local L_285_ = game:HttpGet(L_281_..((L_284_arg1 and "&cursor="..L_284_arg1) or ""))
			return L_276_:JSONDecode(L_285_)
		end
		local L_283_;
		repeat
			local L_286_ = L_282_func(L_283_)
			for L_287_forvar1, L_288_forvar2 in next, L_286_.data do
				if L_288_forvar2.playing < L_288_forvar2.maxPlayers and L_288_forvar2.id ~= L_280_ then
					local L_289_, L_290_ = pcall(L_277_.TeleportToPlaceInstance, L_277_, L_279_, L_288_forvar2.id, Player)
					if L_289_ then
						break
					end
				end
			end
			L_283_ = L_286_.nextPageCursor
		until not L_283_
	end
})

-- Set libraries and folders
L_31_:SetLibrary(L_30_)
L_32_:SetLibrary(L_30_)
L_31_:SetIgnoreIndexes({})
L_31_:IgnoreThemeSettings()
L_32_:SetFolder("FLORENCE")
L_31_:SetFolder("FLORENCE")

-- Build interface section and load the game
L_32_:BuildInterfaceSection(L_35_.Settings, L_35_.Premium)
L_31_:Load(game.PlaceId)

-- Select the first tab in the window
L_34_:SelectTab(1)
