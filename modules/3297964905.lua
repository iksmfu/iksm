-- Services
local L_1_ = setmetatable({}, {
	__index = function(L_97_arg1, L_98_arg2)
		local L_99_ = game:GetService(L_98_arg2);
		if L_99_ then
			L_97_arg1[L_98_arg2] = L_99_; 
			return L_99_;
		end
	end,
})

-- Hook the __namecall metamethod
if hookmetamethod and typeof(hookmetamethod) == 'function' then
	local L_100_
	L_100_ = hookmetamethod(game, "__namecall", function(L_101_arg1, ...)
		if getnamecallmethod() == "Kick" then
			return
		end
		return L_100_(L_101_arg1, ...)
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
			getgenv().nexus = false
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
	Callback = function(L_102_arg1)
	end
})
local L_37_ = L_35_.Main:AddToggle("ShowFOV", {
	Title = "Show FOV",
	Default = false,
	Callback = function(L_103_arg1)
	end
})
local L_38_ = L_35_.Main:AddSlider("Radius", {
	Title = "Fov Radius",
	Default = 0,
	Min = 50,
	Max = 250,
	Rounding = 1,
	Callback = function(L_104_arg1)
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
	Callback = function(L_105_arg1)

	end
})
local L_40_ = L_35_.Misc:AddToggle("AutoReload", {
	Title = "Infinite Ammo",
	Default = false,
	Callback = function(L_106_arg1)
		if L_106_arg1 then 
			repeat
				task.wait(.1)  
				local L_107_ = L_3_.Character
				if L_107_ and L_107_:FindFirstChild("HumanoidRootPart") then
					for L_108_forvar1, L_109_forvar2 in pairs(L_107_:GetChildren()) do
						if L_109_forvar2:IsA("Tool") then
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
	Callback = function(L_110_arg1)
	end
})
local L_42_ = L_35_.Main:AddToggle("KillAll", {
	Title = "Kill All",
	Default = false,
	Callback = function(L_111_arg1)
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

local L_54_ = LPH_NO_VIRTUALIZE(function(L_112_arg1:Player)
	if L_112_arg1 and L_112_arg1.Character then
		if L_112_arg1.Character:FindFirstChild("Humanoid") and L_112_arg1.Character:FindFirstChild("HumanoidRootPart") and not L_112_arg1.Character:FindFirstChild("ForceField") then
			if (L_112_arg1.Character.Humanoid.Health >= 1) then
				return true
			end
		elseif game:GetService("ReplicatedStorage").Game.SecondaryStatus.Value == "Free For All" or game:GetService("ReplicatedStorage").Game.SecondaryStatus.Value == "Team Deathmatch" then 
			if L_3_ and L_3_.Character then
				local L_113_ = L_3_.Character
				if L_113_:FindFirstChild("ForceField") then
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
	local L_114_
	local L_115_ = math.huge

	for L_116_forvar1, L_117_forvar2 in next, L_43_:GetPlayers() do
		if (L_117_forvar2 ~= L_46_) and (L_117_forvar2.Team ~= L_46_.Team or L_117_forvar2.Team == nil) and (L_54_(L_117_forvar2) and L_54_(L_46_)) then
			local L_118_ = L_46_:DistanceFromCharacter(L_117_forvar2.Character.HumanoidRootPart.Position)

			if L_118_ < L_115_ then
				L_114_ = L_117_forvar2
				L_115_ = L_118_
			end
		end
	end

	return L_114_
end)

local L_56_ = LPH_JIT(function(L_119_arg1:Player)
	if L_54_(L_46_) and L_54_(L_119_arg1) then
		local L_120_ = L_119_arg1.HitboxVal.Value
		local L_121_ = L_46_.Character:FindFirstChildWhichIsA("Tool")
		local L_122_ = L_46_:DistanceFromCharacter(L_119_arg1.Character.HumanoidRootPart.Position)

		if ((os.time() - L_47_) < 0.1) then
			return
		end

		if L_121_ and L_120_ and L_121_.Name == "Knife" then
			local L_123_ = require(L_50_[L_121_.Name:lower()][L_121_.Name:lower()])

			L_52_:FireServer(1, { 
				["RunTimeValue"] = os.time(), 
				["IsFirstPerson"] = true, 
				["MeleeMode"] = 2, 
				["WeaponProfile"] = {
					["TriggerDisconnected"] = true,
					["WeaponStats"] = L_123_,
					["Reloading"] = false,
					["Extra"] = true,
					["WeaponName"] = L_121_.Name,
					["ToolInstance"] = L_121_,
					["CanShoot"] = true,
					["PauseDebounce"] = {},
					["BodyAttach"] = L_121_.BodyAttach
				},
				["InitialPos"] = L_121_.BodyAttach.Position,
				["ShotTick"] = os.time()
			})

			L_52_:FireServer(2, os.time(), {
				["RayDir"] = CFrame.new(L_121_.BodyAttach.Position, L_120_.HitboxMelee.Position).LookVector,
				["BulletTick"] = os.time()
			})

			L_51_:InvokeServer({
				["HitPlr"] = L_119_arg1,
				["isChar"] = true,
				["Distance"] = L_122_,
				["ShotTick"] = os.time(),
				["isHitbox"] = true,
				["HitObj"] = L_120_.HitboxMelee,
				["HitNorm"] = CFrame.new(L_121_.BodyAttach.Position, L_120_.HitboxMelee.Position).LookVector,
				["BulletTick"] = os.time(),
				["HitChar"] = L_119_arg1.Character,
				["HitPos"] = L_120_.HitboxMelee.Position
			})
		end
	end
end)

L_44_.RenderStepped:Connect(function()

	if ((os.time() - L_47_) < 0) then
		L_48_ = false
	end

	if (not L_48_) and L_33_.KillAll.Value and L_26_.Connected then
		local L_124_ = L_55_()

		if (L_124_ and L_54_(L_124_)) then
			L_48_ = true

			repeat
				task.wait()
				if L_54_(L_46_) then        
					L_46_.Character.HumanoidRootPart.CFrame = CFrame.new(L_124_.Character.HumanoidRootPart.Position - (Vector3.new(0, 0, 0)))
					workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, (L_124_.Character.HumanoidRootPart.Position - Vector3.new(-0.5, 0, 1)))
					L_56_(L_124_)
					local L_125_, L_126_ = pcall(function()
						local L_127_ = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Knife")
						game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(L_127_)
					end)
				end
			until L_124_.Character.Humanoid.Health <= 0 or (not L_54_(L_124_) or not L_54_(L_46_))

			L_48_ = false
		end  
	end
end)
local L_57_ = L_35_.Main:AddToggle("AntiKick", {
	Title = "Anti Vote-Kick",
	Default = false,
	Callback = function(L_128_arg1)
		if L_128_arg1 then
			repeat
				game:GetService("Players").LocalPlayer.PlayerGui.MainUI.VerticalInterface.Visible = false
				task.wait(.1)
				if #L_43_:GetPlayers() > 1 then
					local L_129_ = L_43_:GetPlayers()[2]
					L_53_:FireServer(L_129_)
				end
			until not L_33_.AntiKick.Value or not L_26_.Connected
			game:GetService("Players").LocalPlayer.PlayerGui.MainUI.VerticalInterface.Visible = true
		end
	end
})

local L_58_ = L_35_.Misc:AddToggle("Norecoil", {
	Title = "No Recoil",
	Default = false,
	Callback = function(L_130_arg1)
	end  
})
local function L_59_func()
	for L_131_forvar1 = #L_28_, 2, -1 do
		local L_132_ = math.random(1, L_131_forvar1)
		L_28_[L_131_forvar1], L_28_[L_132_] = L_28_[L_132_], L_28_[L_131_forvar1]
	end

	return L_28_[1]
end

local L_60_ = {}

local L_61_ = L_35_.Misc:AddToggle("AutoToxic", {
	Title = "Auto Toxic",
	Default = false,
	Callback = function(L_133_arg1)
		if L_133_arg1 then
			repeat
				task.wait()
				for L_134_forvar1, L_135_forvar2 in ipairs(game:GetService("Players").LocalPlayer.PlayerGui.MainUI.KillFeed:GetChildren()) do
					if L_135_forvar2:IsA("Frame") and L_135_forvar2.Eliminator.PlayerName.Text == L_4_ then
						local L_136_ = L_135_forvar2.Eliminated.PlayerName.Text
						if not table.find(L_60_, L_136_) then
							local L_137_ = L_59_func()
							if L_137_ ~= "steam is a furry" then
								L_137_ = L_136_..L_137_
							end
							print("You killed "..L_136_)
							game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(L_137_, "All")
							table.insert(L_60_, L_136_)
							spawn(function()
								wait(20)
								table.remove(L_60_, table.find(L_60_, L_136_))
							end)
						end
					end
				end
			until not L_33_.AutoToxic.Value or not L_26_.Connected
		end
	end
})

local L_62_ = L_35_.Misc:AddToggle("Detector", {
	Title = "Moderator Detector",
	Default = false,
	Callback = function(L_138_arg1)
		if L_138_arg1 then
			repeat
				task.wait()
				ModeratorChecker()
			until not L_33_.Detector.Value or not L_26_.Connected
		end
	end
})

local L_63_ = L_35_.Misc:AddDropdown("SelectedFunction", {
	Title = "Detection Function",
	Values = {
		"Notify",
		"Kick"
	},
	Multi = false,
	Default = false,
	Callback = function(L_139_arg1)
	end
})

local L_64_ = 3993539

local L_65_ = {} -- Dictionary to store the last notification time for each player

function getRoleInGroup(L_140_arg1, L_141_arg2)
	local L_142_, L_143_ = pcall(function()
		return L_140_arg1:GetRoleInGroup(L_141_arg2)
	end)
	return L_142_ and L_143_ or "Not in the group"
end

function sendRoleMessage(L_144_arg1, L_145_arg2)
	if L_145_arg2 == "Weaponry Moderators" or L_145_arg2 == "Known" or L_145_arg2 == "Stacky" then 
		local L_146_ = L_144_arg1.Name.." Has Joined Role: "..L_145_arg2
		local L_147_ = tick() -- Get the current time

		-- Check if enough time has passed since the last notification for this player
		if not L_65_[L_144_arg1] or (L_147_ - L_65_[L_144_arg1] >= 10) then
			if L_33_.SelectedFunction.Value == "Kick" then 
				game.Players.LocalPlayer:kick(L_146_) 
			elseif L_33_.SelectedFunction.Value == "Notify" then 
				L_30_:Notify({
					Title = 'Moderator',
					Content = L_146_,
					Duration = 10
				})
				L_65_[L_144_arg1] = L_147_ -- Update the last notification time
			end
		end
	end
end

function ModeratorChecker()
	for L_148_forvar1, L_149_forvar2 in ipairs(L_43_:GetPlayers()) do
		if L_149_forvar2 ~= L_3_ then
			local L_150_ = getRoleInGroup(L_149_forvar2, L_64_)
			sendRoleMessage(L_149_forvar2, L_150_)
		end
	end
end

local L_66_ = L_35_.Visual:AddToggle("EnemyChams", {
	Title = "Enemy Chams",
	Default = false,
	Callback = function(L_151_arg1)  
	end
})
local L_67_ = L_35_.Visual:AddToggle("TeamChams", {
	Title = "Team Chams",
	Default = false,
	Callback = function(L_152_arg1)
	end
})
local L_68_ = L_35_.Visual:AddToggle("Rainbow", {
	Title = "Rainbow Chams",
	Default = false,
	Callback = function(L_153_arg1)
	end
})

task.spawn(function()
	while task.wait() do 
		if not L_26_.Connected then 
			for L_154_forvar1, L_155_forvar2 in next, game:GetService('Players'):GetPlayers() do
				pcall(function()
					L_155_forvar2.Character.Highlight:Destroy()
				end)
			end 
			return
		end 
		if L_33_.EnemyChams.Value or L_33_.TeamChams.Value then
			local L_156_, L_157_ = pcall(function()
				local L_158_ = game:GetService("ReplicatedStorage")
				local L_159_ = game:GetService("Players")
				local L_160_ = L_159_.LocalPlayer

				local L_161_ = {}  

				local function L_162_func(L_163_arg1)
					if L_161_[L_163_arg1] ~= nil then
						return L_161_[L_163_arg1]  
					end

					local L_164_ = game:GetService("Players").LocalPlayer.Team
					if L_164_ then
						local L_165_ = L_163_arg1 ~= game:GetService("Players").LocalPlayer and L_163_arg1.Team ~= L_164_
						L_161_[L_163_arg1] = L_165_  
						return L_165_
					end
					return false
				end

				function CreateHighlight()
					for L_166_forvar1, L_167_forvar2 in pairs(L_159_:GetChildren()) do
						if L_167_forvar2 ~= L_160_ and L_167_forvar2.Character and not L_167_forvar2.Character:FindFirstChild("Highlight") then
							local L_168_ = Instance.new("Highlight", L_167_forvar2.Character)
							if L_162_func(L_167_forvar2) == true then
								L_167_forvar2.Character.Highlight.Enabled = false
							elseif L_162_func(L_167_forvar2) == false then
								L_167_forvar2.Character.Highlight.Enabled = false
							end
						end
					end
				end

				function UpdateHighlights()
					for L_169_forvar1, L_170_forvar2 in pairs(L_159_:GetChildren()) do
						if L_170_forvar2 ~= L_160_ and L_170_forvar2.Character and L_170_forvar2.Character:FindFirstChild("Highlight") then
							local L_171_ = L_170_forvar2.Character:FindFirstChild("Highlight")
							if game:GetService("ReplicatedStorage").Game.SecondaryStatus.Value == "Free For All" and (L_33_.TeamChams.Value or L_33_.EnemyChams.Value) then
								L_170_forvar2.Character.Highlight.Enabled = true
								L_171_.FillColor = Color3.fromRGB(255, 0, 0)
							elseif L_162_func(L_170_forvar2) == true and L_33_.EnemyChams.Value == true then
								L_170_forvar2.Character.Highlight.Enabled = true
								L_171_.FillColor = Color3.fromRGB(255, 0, 0)
							elseif L_162_func(L_170_forvar2) == true and L_33_.EnemyChams.Value == false then
								L_170_forvar2.Character.Highlight.Enabled = false 
							elseif L_162_func(L_170_forvar2) == false and L_33_.TeamChams.Value == true then
								L_170_forvar2.Character.Highlight.Enabled = true
								L_171_.FillColor = Color3.fromRGB(255, 255, 255)
							elseif L_162_func(L_170_forvar2) == false and L_33_.TeamChams.Value == false then
								L_170_forvar2.Character.Highlight.Enabled = false
							end
							if L_33_.Rainbow.Value then 
								L_171_.FillColor = Color3.fromHSV(tick() % 5 / 5, 1, 1)
							end
						end  
					end
				end  

				CreateHighlight()
				UpdateHighlights()
			end)
		else  
			for L_172_forvar1, L_173_forvar2 in next, game:GetService('Players'):GetPlayers() do
				if L_173_forvar2.Name ~= game:GetService('Players').LocalPlayer.Name and (L_33_.TeamChams.Value == false or L_173_forvar2.TeamColor ~= game:GetService('Players').LocalPlayer.TeamColor) then
					pcall(function()
						L_173_forvar2.Character.Highlight:Destroy()
					end)
				end
			end
			repeat
				wait()
			until L_33_.EnemyChams.Value == true or L_33_.TeamChams.Value == true 

		end 
	end
end)


local L_69_ = L_35_.Main:AddToggle("ExpandHitbox", {
	Title = "Expand Hitbox",
	Default = false,
	Callback = function(L_174_arg1)
		if L_174_arg1 then 
			repeat
				task.wait()  
				for L_175_forvar1, L_176_forvar2 in pairs (game:GetService("Workspace").Hitboxes:GetChildren()) do
					if L_176_forvar2.Name ~= tostring(game:GetService("Players").LocalPlayer.UserId) and L_176_forvar2:FindFirstChild("HitboxHead") then
						L_176_forvar2.HitboxHead.Size = Vector3.new(30, 30, 30)
					end
				end     
			until not L_33_.ExpandHitbox.Value or not L_26_.Connected
		end
	end
})

local L_70_ = L_35_.Visual:AddToggle("WeaponCham", {
	Title = "Weapon Chams",
	Default = false,
	Callback = function(L_177_arg1)
		if L_177_arg1 then 
			repeat
				task.wait()  
				local L_178_ = L_3_.Character
				if L_178_ and L_178_:FindFirstChild("HumanoidRootPart") then
					for L_179_forvar1, L_180_forvar2 in pairs(L_178_:GetChildren()) do
						if L_180_forvar2:IsA("Tool") then
							for L_181_forvar1, L_182_forvar2 in pairs(L_180_forvar2:GetDescendants()) do
								if L_182_forvar2:IsA("MeshPart") then
									L_182_forvar2.Material = Enum.Material.ForceField                            
								end
							end
						end  
					end
				end
			until not L_33_.WeaponCham.Value or not L_26_.Connected
			if L_22_ and L_22_:FindFirstChild("HumanoidRootPart") then  
				for L_183_forvar1, L_184_forvar2 in pairs(L_22_:GetChildren()) do
					if L_184_forvar2:IsA("Tool") then
						for L_185_forvar1, L_186_forvar2 in pairs(L_184_forvar2:GetDescendants()) do
							if L_186_forvar2:IsA("MeshPart") then
								L_186_forvar2.Material = Enum.Material.SmoothPlastic                        
							end
						end  
					end  
				end
			end
		end
	end
})

local L_71_ = L_35_.Visual:AddToggle("WeaponRainbow", {
	Title = "Rainbow Weapon",
	Default = false,
	Callback = function(L_187_arg1)
		if L_187_arg1 then 
			repeat
				task.wait()  
				local L_188_ = L_3_.Character
				if L_188_ and L_188_:FindFirstChild("HumanoidRootPart") then
					for L_189_forvar1, L_190_forvar2 in pairs(L_188_:GetChildren()) do
						if L_190_forvar2:IsA("Tool") then
							for L_191_forvar1, L_192_forvar2 in pairs(L_190_forvar2:GetDescendants()) do
								if L_192_forvar2:IsA("BasePart") and L_192_forvar2.Name ~= "Handle" then
									L_192_forvar2.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
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
function CreateVector2(L_193_arg1) 
	return Vector2.new(L_193_arg1.X, L_193_arg1.Y)
end;
function GetDirection(L_194_arg1, L_195_arg2)
	return (L_195_arg2 - L_194_arg1).Unit * 1000
end;
function GetHitPart(L_196_arg1) 
	if L_196_arg1 then
		local L_197_ = (L_33_.Hitpart.Value == "Random" and L_27_[math.random(1, 2)]) or (L_33_.Hitpart.Value or "Torso")
		local L_198_ = L_196_arg1:FindFirstChild(L_197_)

		if L_198_ then
			return L_198_
		end
	end
end;
function GetFramework()
	for L_199_forvar1, L_200_forvar2 in pairs(L_3_.PlayerScripts:GetChildren()) do
		local L_201_, L_202_ = pcall(function()
			return getsenv(L_200_forvar2)
		end)
		if L_201_ and L_202_.InspectWeapon then
			return L_202_
		end
	end;
	return nil
end;
function IsPartVisible(L_203_arg1, L_204_arg2) 
	L_204_arg2 = L_204_arg2 or {}
	local L_205_ = L_15_.GetPartsObscuringTarget(L_15_, {
		L_203_arg1.Position
	}, {
		L_15_,
		L_3_.Character,
		unpack(L_204_arg2)
	})
	return #L_205_ <= 10
end;
function GetClosestPlayer(L_206_arg1, L_207_arg2) 
	L_206_arg1 = L_206_arg1 or math.huge;    
	for L_208_forvar1, L_209_forvar2 in next, L_43_.GetPlayers(L_43_) do 
		if L_209_forvar2 == L_3_ then 
			continue
		end;
		if L_12_.Value == "Team Deathmatch" and workspace[L_209_forvar2.Name].Head.NameTag.Enabled == true then
			warn("Skipping team·mate")
			continue
		end;
		if not L_209_forvar2.Character then
			continue
		end;
		local L_210_ = L_209_forvar2.Character:FindFirstChild("HumanoidRootPart")

		if not L_210_ then
			continue
		end;
		local L_211_, L_212_ = L_15_.WorldToScreenPoint(L_15_, L_210_.Position) 
		if L_212_ then
			if not IsPartVisible(L_210_, L_207_arg2) then
				continue
			end;
			local L_213_, L_214_
			pcall(function()
				if workspace[L_209_forvar2.Name].Head.NameTag.Enabled == false then
					local L_215_ = (CreateVector2(L_5_) - CreateVector2(L_211_)).Magnitude;
					if L_215_ <= L_206_arg1 then
						L_206_arg1 = L_215_;
						closestPlayer = L_209_forvar2;
						closestPlayerChar = L_209_forvar2.Character       
					end
				end
			end)  
		end
	end;
	return closestPlayer, closestPlayerChar
end;

local L_72_ = GetFramework().CheckIsToolValid;
local L_73_ = {
	["Raycast"] = function(L_216_arg1, ...)
		local L_217_ = {
			...
		}
		if L_33_.SilentAim.Value and L_216_arg1 == L_216_arg1 and L_26_.Connected then
			local L_218_ = debug.traceback() 
			if string.find(L_218_, "FireWeapon") then
				local L_219_ = tonumber(L_33_.Radius.Value)
				local L_220_ = L_217_[3].FilterDescendantsInstances; 
				local L_221_, L_222_ = GetClosestPlayer(250, L_220_)
				if L_221_ and L_222_ then
					local L_223_ = GetHitPart(L_222_)
					if L_223_ then
						L_217_[2] = GetDirection(L_217_[1], L_223_.Position)
						local L_224_ = game:GetService("Players"):GetPlayers()
						local L_225_ = game.Players.LocalPlayer
						for L_226_forvar1, L_227_forvar2 in ipairs(L_224_) do
							return L_216_arg1.Raycast(L_216_arg1, unpack(L_217_))
						end
					end 
				end  
			end
		end;
		return L_216_arg1.Raycast(L_216_arg1, ...)
	end;		 
}
local L_74_;
L_74_ = hookmetamethod(game, "__namecall", function(L_228_arg1, ...)
	local L_229_ = getnamecallmethod()
	local L_230_ = checkcaller()
	local L_231_ = L_73_[L_229_]
	local L_232_;
	if L_231_ then
		if typeof(L_231_) == "function" then
			L_232_ = {
				checkcaller = false;
				callback = L_231_
			}
		else
			L_232_ = L_231_[L_228_arg1.Name]
		end
	end;
	if (L_232_ and L_232_.checkcaller == L_230_) then
		local L_233_, L_234_ = pcall(L_232_.callback, L_228_arg1, ...)
		if not L_233_ then
			warn("Error", L_234_)
		end;
		return L_234_
	end;
	return L_74_(L_228_arg1, ...)
end)

local L_75_ = L_14_.accelerate
L_14_.accelerate = function(...)
	if L_33_.Norecoil.Value then
		return nil
	end
	return L_75_(...)
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

local function L_76_func(L_235_arg1)
	local L_236_, L_237_ = L_15_:WorldToScreenPoint(L_235_arg1.Position)
	return L_237_, Vector2.new(L_236_.X, L_236_.Y)
end

local function L_77_func(L_238_arg1)
	local L_239_ = L_238_arg1.Character
	if not L_239_ or L_239_:FindFirstChildOfClass("ForceField") then
		return nil, nil
	end

	local L_240_ = game.workspace.Hitboxes:FindFirstChild(tostring(L_238_arg1.UserId))
	if not L_240_ or L_239_.Humanoid.Health <= 0 then
		return nil, nil
	end

	local L_241_ = {
		L_240_.HitboxHead,
		L_240_.HitboxBody,
		L_240_.HitboxLeg
	}
	local L_242_, L_243_ = nil, math.huge

	for L_244_forvar1, L_245_forvar2 in ipairs(L_241_) do
		local L_246_, L_247_ = L_76_func(L_245_forvar2)
		if L_246_ then
			local L_248_ = (L_247_ - Vector2.new(L_5_.X, L_5_.Y)).Magnitude
			if L_248_ < L_243_ then
				L_242_ = L_245_forvar2
				L_243_ = L_248_
			end
		end
	end

	return L_242_, L_243_
end

local function L_78_func()
	local L_249_, L_250_, L_251_ = nil, math.huge, nil

	for L_252_forvar1, L_253_forvar2 in ipairs(L_43_:GetPlayers()) do
		if L_253_forvar2 ~= L_3_ and L_253_forvar2.Character then
			local L_254_, L_255_ = L_77_func(L_253_forvar2)
			if L_254_ and L_255_ and L_255_ < L_250_ then
				L_249_ = L_254_
				L_250_ = L_255_
				L_251_ = L_253_forvar2
			end
		end
	end

	return L_249_, L_251_
end

local L_79_, L_80_

game:GetService("RunService").Stepped:Connect(function()
	L_79_, L_80_ = L_78_func()
end)

local L_81_
L_81_ = hookmetamethod(game, "__namecall", function(L_256_arg1, ...)
	local L_257_ = {
		...
	}
	local L_258_ = getnamecallmethod()

	if L_258_ == "InvokeServer" and L_256_arg1.Name == "HitHandler" and L_33_.SniperAim.Value and L_26_.Connected then
		if L_257_[1]["HitPos"] and L_79_ then
			L_257_[1]["HitPos"] = L_79_.Position
			L_257_[1]["HitObj"] = L_79_
		end
	elseif L_258_ == "FireServer" and L_256_arg1.Name == "WeaponHandler" and L_33_.SniperAim.Value and L_26_.Connected then
		if L_257_[3] and L_257_[3]["RayDir"] and L_79_ then
			L_257_[3]["RayDir"] = (L_79_.Position - L_3_.Character.Head.Position).Unit
		end
	end

	return L_81_(L_256_arg1, unpack(L_257_))
end)


local L_82_ = L_35_.Settings:AddToggle("Settings", {
	Title = "Save Settings",
	Default = false,
	Callback = function(L_259_arg1)
		if L_259_arg1 then 
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

local L_83_ = L_35_.Player:AddToggle("SpeedMulti", {
	Title = "Walk Speed",
	Default = false,
	Callback = function(L_260_arg1)
		if L_260_arg1 then 
			repeat
				task.wait()  
				rawset(L_19_, "SpeedMulti", L_33_.WalkSpeed.Value);
			until not L_33_.SpeedMulti.Value or not L_26_.Connected
			rawset(L_19_, "SpeedMulti", 1);
		end
	end
})
local L_84_ = L_35_.Player:AddSlider("WalkSpeed", {
	Title = "Walk Multi Speed",
	Default = 1,
	Min = 1,
	Max = 10,
	Rounding = 1,
	Callback = function(L_261_arg1)
	end
})
local L_85_ = L_35_.Player:AddToggle("Jump", {
	Title = "Jump Speed",
	Default = false,
	Callback = function(L_262_arg1)
		if L_262_arg1 then 
			repeat
				task.wait()  
				rawset(L_19_, "JumpMulti", L_33_.JumpPower.Value);
			until not L_33_.Jump.Value or not L_26_.Connected
			rawset(L_19_, "JumpMulti", 1);
		end
	end
})
local L_86_ = L_35_.Player:AddSlider("JumpPower", {
	Title = "Jump Multi",
	Default = 1,
	Min = 1,
	Max = 10,
	Rounding = 1,
	Callback = function(L_263_arg1)
	end
})

local L_87_ = L_35_.Player:AddToggle("AutoSprint", {
	Title = "Auto Sprint",
	Default = false,
	Callback = function(L_264_arg1)
		if L_264_arg1 then 
			repeat
				task.wait(.5)  
				rawset(L_18_, "SprintHolding", true);
			until not L_33_.AutoSprint.Value or not L_26_.Connected
		end
	end
})

local L_88_ = L_35_.Player:AddToggle("Fly", {
	Title = "Fly",
	Default = false,
	Callback = function(L_265_arg1)
	end
})

local L_89_ = 200
local L_90_ = false
local L_91_ = 100000000000000

local function L_92_func(L_266_arg1, L_267_arg2, L_268_arg3)
	local L_269_ = (L_267_arg2 - L_266_arg1)
	local L_270_ = L_269_.Magnitude
	return (L_269_ / L_270_) * L_268_arg3
end

local function L_93_func(L_271_arg1)
	local L_272_ = tostring(L_271_arg1):lower()
	local L_273_, L_274_ = L_272_:find("keycode.")
	return L_272_:sub(L_274_ + 1)
end

local L_94_ = {}

game.RunService.Heartbeat:connect(function()
	pcall(function()
		local L_275_ = L_3_.Character.Humanoid.RootPart
		local L_276_ = CFrame.new() + Vector3.new(0, 0, -L_91_)
		local L_277_ = CFrame.new() + Vector3.new(0, 0, L_91_)
		local L_278_ = CFrame.new() + Vector3.new(-L_91_, 0, 0)
		local L_279_ = CFrame.new() + Vector3.new(L_91_, 0, 0)
		local L_280_ = CFrame.new() + Vector3.new(0, L_91_, 0)
		local L_281_ = CFrame.new() + Vector3.new(0, -L_91_, 0)
		local L_282_ = Vector3.new()

		if L_33_.Fly.Value and L_26_.Connected then
			if L_94_.w_active then
				L_282_ = L_282_ + L_92_func(L_275_.Position, (L_275_.CFrame * L_276_).Position, L_89_)
			end
			if L_94_.s_active then
				L_282_ = L_282_ + L_92_func(L_275_.Position, (L_275_.CFrame * L_277_).Position, L_89_)
			end
			if L_94_.a_active then
				L_282_ = L_282_ + L_92_func(L_275_.Position, (L_275_.CFrame * L_278_).Position, L_89_)
			end
			if L_94_.d_active then
				L_282_ = L_282_ + L_92_func(L_275_.Position, (L_275_.CFrame * L_279_).Position, L_89_)
			end
			if L_94_.space_active then
				L_282_ = L_282_ + Vector3.new(0, L_89_, 0)
			end
			if L_94_.leftcontrol_active then
				L_282_ = L_282_ - Vector3.new(0, L_89_, 0)  -- Apply downward velocity
			end
			L_275_.Velocity = L_282_
			L_275_.CFrame = CFrame.new(L_275_.Position, (workspace.CurrentCamera.CFrame * (CFrame.new() + Vector3.new(0, 0, -L_91_))).Position)
		end
	end)
end)

L_17_.InputBegan:connect(function(L_283_arg1, L_284_arg2)
	if L_284_arg2 then
		return
	end
	L_94_[L_93_func(L_283_arg1.KeyCode).."_active"] = true
end)

L_17_.InputEnded:connect(function(L_285_arg1)
	L_94_[L_93_func(L_285_arg1.KeyCode).."_active"] = false
end)

local L_95_ = L_35_.Server:AddToggle("AutoRejoin", {
	Title = "Auto Rejoin",
	Default = false,
	Callback = function(L_286_arg1)
		if L_286_arg1 then 
			L_30_:Notify({
				Title = 'Auto Rejoin',
				Content = 'You will rejoin if you are kicked or disconnected from the game',
				Duration = 5
			})
			repeat
				task.wait() 
				local L_287_, L_288_, L_289_ = game:GetService('Players').LocalPlayer, game.CoreGui.RobloxPromptGui.promptOverlay, game:GetService('TeleportService')
				L_288_.ChildAdded:connect(function(L_290_arg1)
					if L_290_arg1.Name == 'ErrorPrompt' then
						L_289_:Teleport(game.PlaceId)
						task.wait(2)
					end
				end)  
			until L_33_.AutoRejoin.Value or not L_26_.Connected
		end
	end
})

local L_96_ = L_35_.Server:AddToggle("ReExecute", {
	Title = "Auto ReExecute",
	Default = false,
	Callback = function(L_291_arg1)
		if L_291_arg1 then 
			repeat
				task.wait()
				local L_292_ = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
				if L_292_ then
					L_292_('loadstring(game:HttpGet("https://raw.githubusercontent.com/13B8B/nexus/main/loadstring"))()')
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
		local L_293_ = game:GetService("HttpService")
		local L_294_ = game:GetService("TeleportService")
		local L_295_ = "https://games.roblox.com/v1/games/"
		local L_296_, L_297_ = game.PlaceId, game.JobId
		local L_298_ = L_295_..L_296_.."/servers/Public?sortOrder=Desc&limit=100"
		local function L_299_func(L_301_arg1)
			local L_302_ = game:HttpGet(L_298_..((L_301_arg1 and "&cursor="..L_301_arg1) or ""))
			return L_293_:JSONDecode(L_302_)
		end
		local L_300_;
		repeat
			local L_303_ = L_299_func(L_300_)
			for L_304_forvar1, L_305_forvar2 in next, L_303_.data do
				if L_305_forvar2.playing < L_305_forvar2.maxPlayers and L_305_forvar2.id ~= L_297_ then
					local L_306_, L_307_ = pcall(L_294_.TeleportToPlaceInstance, L_294_, L_296_, L_305_forvar2.id, Player)
					if L_306_ then
						break
					end
				end
			end
			L_300_ = L_303_.nextPageCursor
		until not L_300_
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
