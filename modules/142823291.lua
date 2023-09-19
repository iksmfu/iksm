-- Services
local L_1_ = game:GetService("HttpService")
local L_2_ = game:GetService("TeleportService")
local L_3_ = game:GetService("Players")
local L_4_ = game:GetService("RunService")
local L_5_ = game:GetService("Workspace")
local L_6_ = game:GetService("UserInputService")

-- Create a BindableEvent
local L_7_ = Instance.new("BindableEvent")
local L_8_ = L_7_.Event:Connect(function()
end)

-- Variables
local L_9_ = game:GetService("VirtualUser")
local L_10_ = L_3_.LocalPlayer
local L_11_ = L_3_.LocalPlayer
local L_12_ = {}

local function L_13_func()
	for L_47_forvar1, L_48_forvar2 in pairs(workspace:GetChildren()) do
		if L_48_forvar2:FindFirstChild("CoinContainer") then
			return L_48_forvar2.CoinContainer
		elseif L_48_forvar2:FindFirstChild("Map") then
			if pcall(function()
				local L_49_ = L_48_forvar2.Map.CoinContainer
			end) then
				return L_48_forvar2.Map.CoinContainer
			end
		end
	end
	return nil
end

spawn(function()
	while wait() do
		if getgenv().Disconnect == true then
			wait(1)
			L_8_:Disconnect()
			getgenv().Disconnect = false
			--game.Players.LocalPlayer.Character.Humanoid.Health = 0
			return
		else  
			L_7_:Fire()  
		end
	end
end)  

local L_14_ = loadstring(game:HttpGet("https://github.com/s-o-a-b/nexus/releases/download/nexus/nexus.txt"))()
local L_15_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/assets/SaveManager"))()
local L_16_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/assets/InterfaceManager"))()

local L_17_ = L_14_.Options
L_15_:SetLibrary(L_14_)

--[[
   premium = true
]]

local L_18_ = L_14_:CreateWindow({
	Title = "nexus ",
	"",
	SubTitle = "",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = true,
	Theme = "Dark",
})

local L_19_ = {
	Main = L_18_:AddTab({
		Title = "Main",
		Icon = "rbxassetid://10723424505"
	}),
	Misc = L_18_:AddTab({
		Title = "Misc",
		Icon = "rbxassetid://10709818534"
	}),
	Player = L_18_:AddTab({
		Title = "Player",
		Icon = "rbxassetid://10747373176"
	}),
	Emotes = L_18_:AddTab({
		Title = "Emotes",
		Icon = "rbxassetid://4335480896"
	}),
	Server = L_18_:AddTab({
		Title = "Server",
		Icon = "rbxassetid://10734949856"
	}),
	Settings = L_18_:AddTab({
		Title = "Settings",
		Icon = "settings"
	}),
	Premium = premium == "premium" and L_18_:AddTab({
		Title = "Premium",
		Icon = "rbxassetid://10709819149"
	}),

}

local L_20_ = L_19_.Main:AddToggle("AutoFarm", {
	Title = "Auto Farm",
	Default = false,
	Callback = function(L_50_arg1)
		if L_50_arg1 then 
			repeat
				local L_51_, L_52_ = pcall(function() 

					task.wait()
					local L_53_ = L_13_func()
					if L_53_ then

						local function L_54_func(L_55_arg1)
							local L_56_ = game.Players.LocalPlayer
							local L_57_ = L_56_.Character
							local L_58_ = L_57_ and L_57_:FindFirstChild("HumanoidRootPart")

							if L_58_ then

								local L_59_ = (L_58_.Position - L_55_arg1.p).Magnitude
								local L_60_ = TweenInfo.new(L_59_ / 70, Enum.EasingStyle.Linear, Enum.EasingDirection.In)

								local L_61_ = game:GetService("TweenService"):Create(L_58_, L_60_, {
									CFrame = L_55_arg1
								})
								L_61_:Play()
								L_61_.Completed:Wait()

							end
						end

						if L_53_ and game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Timer.Visible == true or game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.CashBag.Visible == true then 

							local L_62_ = math.huge
							local L_63_ = nil

							local L_64_ = game.Players.LocalPlayer
							local L_65_ = L_64_.Character
							local L_66_ = L_65_ and L_65_:FindFirstChild("HumanoidRootPart")

							local L_67_ = L_66_.Position

							for L_68_forvar1, L_69_forvar2 in pairs(L_53_:GetChildren()) do
								if L_69_forvar2.Name == 'Coin_Server' then
									local L_70_ = L_69_forvar2.Coin.Position
									local L_71_ = (L_67_ - L_70_).Magnitude

									if L_71_ < L_62_ then
										L_62_ = L_71_
										L_63_ = L_69_forvar2
									end
								end
							end

							if L_63_ then
								L_54_func(CFrame.new(L_63_.Coin.CFrame.p))

								for L_72_forvar1 = 0, 10, 1 do
									L_65_:SetPrimaryPartCFrame(L_65_.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(L_72_forvar1), 0))
									wait(0.02)
								end

								L_63_.Name = 'False_Coin'

								repeat
									wait()
								until L_63_.Name ~= 'Coin_Server'
								wait(1)
							end
						end
					end
				end)
			until not L_17_.AutoFarm.Value or not L_8_.Connected
		end
	end
})

local L_21_ = L_19_.Main:AddToggle("XRay", {
	Title = "X-RAY",
	Default = false,
	Callback = function(L_73_arg1)
		module:xray(L_73_arg1)
	end
})

local L_22_ = L_19_.Main:AddToggle("CoinChams", {
	Title = "Coin Chams",
	Default = false,
	Callback = function(L_74_arg1)
		if L_74_arg1 then 
			repeat
				task.wait()
				local L_75_ = L_13_func()
				if L_75_ then
					for L_76_forvar1, L_77_forvar2 in pairs(L_75_:GetChildren()) do
						if L_77_forvar2.Name == 'Coin_Server' and not L_12_[L_77_forvar2] then
							local L_78_ = Instance.new("Highlight")
							L_78_.Name = "EspPareet"
							L_78_.FillTransparency = 0.5
							L_78_.FillColor = Color3.new(94 / 255, 1, 255 / 255)
							L_78_.OutlineColor = Color3.new(94 / 255, 1, 255 / 255)
							L_78_.OutlineTransparency = 0
							L_78_.Parent = L_77_forvar2.Parent
							L_12_[L_77_forvar2] = L_78_  
						end
					end
				end 
			until not L_17_.CoinChams.Value or not L_8_.Connected
			for L_79_forvar1, L_80_forvar2 in pairs(L_12_) do
				L_80_forvar2:Destroy()
			end         
		end
	end
})

local L_23_ = L_19_.Main:AddToggle("PlayerESP", {
	Title = "Player Chams",
	Default = false,
	Callback = function(L_81_arg1)

	end
})  

spawn(function()
	while wait() do
		if not L_17_.PlayerESP.Value then
			for L_82_forvar1, L_83_forvar2 in next, game:GetService('Players'):GetPlayers() do
				if L_83_forvar2.Name ~= game:GetService('Players').LocalPlayer.Name then
					pcall(function()
						L_83_forvar2.Character.Highlight:Destroy()
					end)
				end 
			end
		else
			local L_84_ = game:GetService("ReplicatedStorage")
			local L_85_ = L_84_:FindFirstChild("GetPlayerData", true):InvokeServer()

			function CreateHighlight()
				for L_86_forvar1, L_87_forvar2 in pairs(L_3_:GetChildren()) do
					if L_87_forvar2 ~= L_11_ and L_87_forvar2.Character and not L_87_forvar2.Character:FindFirstChild("Highlight") then
						Instance.new("Highlight", L_87_forvar2.Character)
					end
				end
			end

			function UpdateHighlights() 
				for L_88_forvar1, L_89_forvar2 in pairs(L_3_:GetChildren()) do
					local L_90_ = L_89_forvar2.Character and L_89_forvar2.Character:FindFirstChild("Highlight")
					if L_89_forvar2 ~= L_11_ and L_90_ then
						if IsAlive(L_89_forvar2) then
							if L_89_forvar2.Name == Sheriff then 		
								L_90_.FillColor = Color3.fromRGB(0, 0, 225)
							elseif L_89_forvar2.Name == Murder then 
								L_90_.FillColor = Color3.fromRGB(225, 0, 0) 
							elseif L_89_forvar2.Name == Hero and not IsAlive(L_3_:WaitForChild(Sheriff)) then
								L_90_.FillColor = Color3.fromRGB(0, 0, 225)
							else 
								L_90_.FillColor = Color3.fromRGB(76, 215, 134) 
							end
						else
							L_90_.FillColor = Color3.fromRGB(255, 255, 255)
						end
					end
				end
			end

			function IsAlive(L_91_arg1)
				local L_92_ = L_85_[L_91_arg1.Name]
				return L_92_ and not L_92_.Killed and not L_92_.Dead
			end  

			Sheriff, Murder, Hero = nil, nil, nil
			for L_93_forvar1, L_94_forvar2 in pairs(L_85_) do
				if L_94_forvar2.Role == "Murderer" then
					Murder = L_93_forvar1
				elseif L_94_forvar2.Role == 'Sheriff' then
					Sheriff = L_93_forvar1
				elseif L_94_forvar2.Role == 'Hero' then
					Hero = L_93_forvar1
				end
			end  
			if L_17_.PlayerESP.Value then 
				CreateHighlight()
				UpdateHighlights()
			end
			if not L_8_.Connected then 
				for L_95_forvar1, L_96_forvar2 in next, game:GetService('Players'):GetPlayers() do
					if L_96_forvar2.Name ~= game:GetService('Players').LocalPlayer.Name then
						pcall(function()
							L_96_forvar2.Character.Highlight:Destroy()
						end)
					end 
				end
				return 
			end  
		end
	end
end)

local L_24_ = L_19_.Main:AddToggle("GrabGun", {
	Title = "Automatically Grab Gun",
	Default = false,
	Callback = function(L_97_arg1)
		if L_97_arg1 then 
			repeat
				task.wait()
				local L_98_, L_99_ = pcall(function() 

					local L_100_ = L_3_.LocalPlayer
					local L_101_ = L_100_.Character
					local L_102_ = L_101_:FindFirstChild("HumanoidRootPart")

					local L_103_ = GetMurderer()
					local L_104_ = game:GetService("Workspace"):FindFirstChild("GunDrop")
					local L_105_ = game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.CashBag.Visible == true

					if L_104_ and L_105_ then

						local L_106_ = workspace:FindFirstChild(L_103_)

						if L_106_ then
							local L_107_ = L_106_:WaitForChild("HumanoidRootPart")
							print(L_107_.Position)
							local L_108_ = L_104_.Position

							local L_109_ = (L_107_.Position - L_108_).Magnitude
							local L_110_ = game.Players.LocalPlayer

							if L_109_ > 25 then

								if game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Timer.Visible == false then 
									local L_111_ = L_110_.Character.HumanoidRootPart.CFrame
									wait(.5)
									L_110_.Character.HumanoidRootPart.CFrame = L_104_.CFrame
									L_110_.Character.Humanoid.Jump = true
									wait(.3)
									L_110_.Character.HumanoidRootPart.CFrame = L_111_
								end  
							end

						end
					end
				end)

				if not L_98_ then
					warn("An error occurred:", L_99_) -- Print the error message
				end

			until not L_17_.GrabGun.Value or not L_8_.Connected

		end
	end
})

local L_25_ = L_19_.Main:AddToggle("GunCham", {
	Title = "Gun Dropped Cham",
	Default = false,
	Callback = function(L_112_arg1)
		if L_112_arg1 then 
			local L_113_ = game:GetService("Workspace"):FindFirstChild("GunDrop")
			local L_114_

			repeat
				task.wait()
				local L_115_ = game:GetService("Workspace"):FindFirstChild("GunDrop")

				if L_115_ then
					L_114_ = L_115_:FindFirstChild("GunESP")
					if not L_114_ then
						L_114_ = Instance.new("Highlight")
						L_114_.Name = "GunESP"
						L_114_.FillTransparency = 0.5
						L_114_.FillColor = Color3.new(94, 1, 255)
						L_114_.OutlineColor = Color3.new(94, 1, 255)
						L_114_.OutlineTransparency = 0
						L_114_.Parent = L_115_
					end
				end
			until not L_17_.GunCham.Value or not L_8_.Connected

			if L_114_ then 
				L_114_:Destroy() 
			end
		end
	end
})

local L_26_ = L_19_.Misc:AddToggle("KillAll", {
	Title = "Kill Aura",
	Default = false,
	Callback = function(L_116_arg1)
		if L_116_arg1 then 
			repeat
				task.wait()
				local L_117_, L_118_ = pcall(function() 

					local L_119_ = L_11_.Backpack:FindFirstChild("Knife") or L_11_.Character:FindFirstChild("Knife")
					local L_120_ = tonumber(L_17_.Distance.Value)

					for L_121_forvar1, L_122_forvar2 in ipairs(L_3_:GetPlayers()) do
						if L_122_forvar2 ~= L_11_ and L_122_forvar2.Character ~= nil then
							local L_123_ = L_122_forvar2.Character.HumanoidRootPart
							local L_124_ = L_123_.Position
							local L_125_ = (L_124_ - L_11_.Character.HumanoidRootPart.Position).Magnitude
							if (L_125_ <= L_120_) then
								firetouchinterest(L_123_, L_119_.Handle, 1)
								firetouchinterest(L_123_, L_119_.Handle, 0)
							end
						end  
					end
				end)
			until not L_17_.KillAll.Value or not L_8_.Connected
		end
	end
})

local L_27_ = L_19_.Misc:AddSlider("Distance", {
	Title = "Aura Distance",
	Default = 5,
	Min = 5,
	Max = 50,
	Rounding = 0,
	Callback = function(L_126_arg1)
	end
})

local L_28_ = L_19_.Misc:AddToggle("SilentAim", {
	Title = "Silent Aim",
	Default = false,
	Callback = function(L_127_arg1)
	end
})

local L_29_ = L_19_.Misc:AddSlider("Slider", {
	Title = "Accuracy",
	Default = 5,
	Min = 25,
	Max = 100,
	Rounding = 0,
	Callback = function(L_128_arg1)
	end
})  

local L_30_ = L_19_.Misc:AddToggle("KillMurder", {
	Title = "Kill Murder",
	Default = false,
	Callback = function(L_129_arg1)
		if L_129_arg1 then
			repeat
				local L_130_, L_131_ = pcall(function() 
					task.wait()
					local L_132_ = GetMurderer()
					local L_133_ = game.Players.LocalPlayer
					local L_134_ = L_133_.Backpack:FindFirstChild("Gun") or L_133_.Character:FindFirstChild("Gun")
					if not L_134_ then 
						game:GetService('Players').LocalPlayer.CameraMode = Enum.CameraMode.Classic
					end
					if L_132_ ~= L_133_.Name and L_133_ then
						local L_135_ = L_133_.Backpack:FindFirstChild("Gun") or L_133_.Character:FindFirstChild("Gun")

						if L_135_ then 
							local L_136_ = L_11_.Character:WaitForChild("Humanoid")
							L_136_:EquipTool(L_135_)
							game:GetService('Players').LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson

						end

						if L_135_ and L_133_ and L_132_ then
							if workspace[L_133_.Name].Gun.Handle.Reload.IsPlaying then 
								local L_138_ = L_133_.Character:FindFirstChild("HumanoidRootPart")

								local L_139_ = Vector3.new(-110, 135, 38.946128845215)
								L_138_.CFrame = CFrame.new(L_139_)
								repeat
									task.wait()
								until not workspace[L_133_.Name].Gun.Handle.Reload.IsPlaying
							end


							local L_137_ = workspace:FindFirstChild(L_132_)
							if L_137_ and L_133_ then
								local L_140_ = L_137_:FindFirstChild("HumanoidRootPart")
								local L_141_ = L_133_.Character
								local L_142_ = L_141_:FindFirstChild("HumanoidRootPart")

								if L_140_ and L_142_ and L_133_ and L_132_ then
									-- Calculate the position behind the Murderer
									local L_143_ = Vector3.new(0, 0, 6)
									local L_144_ = L_140_.CFrame:PointToWorldSpace(L_143_)

									-- Teleport the player's character to the target position
									L_141_:SetPrimaryPartCFrame(CFrame.new(L_144_))

									-- Make the character face the Murderer
									if L_132_ then 
										L_141_:SetPrimaryPartCFrame(CFrame.new(L_144_, L_140_.Position))
										local L_145_ = workspace.CurrentCamera
										L_145_.CFrame = CFrame.new(L_145_.CFrame.Position, (L_140_.Position - Vector3.new(-0.5, 0, 1)))
									end  

									-- Simulate a click to attack the Murderer
									spawn(function()
										wait(0.3)

										local L_146_ = game:GetService("Workspace").CurrentCamera.ViewportSize.X
										local L_147_ = game:GetService("Workspace").CurrentCamera.ViewportSize.Y

										local L_148_ = L_146_ / 2
										local L_149_ = L_147_ / 2

										game:GetService("VirtualInputManager"):SendMouseButtonEvent(L_148_, L_149_, 0, true, game, 1)
										game:GetService("VirtualInputManager"):SendMouseButtonEvent(L_148_, L_149_, 0, false, game, 1)
									end)  
								end
							end
						end
					end
				end)
			until not L_17_.KillMurder.Value or not L_8_.Connected
		end
	end
})

L_19_.Misc:AddButton({
	Title = "Kill All",
	Callback = function()
		local L_150_ = L_11_.Backpack:FindFirstChild("Knife") or L_11_.Character:FindFirstChild("Knife")
		if L_150_ and L_150_:IsA("Tool") then
			local L_151_ = L_11_.Character
			local L_152_ = L_151_:WaitForChild("Humanoid")
			L_152_:EquipTool(L_150_)

			for L_153_forvar1 = 1, 3 do
				for L_154_forvar1, L_155_forvar2 in ipairs(L_3_:GetPlayers()) do
					if L_155_forvar2 ~= L_11_ and L_155_forvar2.Character then
						local L_156_ = L_155_forvar2.Character:WaitForChild("HumanoidRootPart")
						local L_157_ = L_156_.Position

						L_9_:ClickButton1(Vector2.new())

						firetouchinterest(L_156_, L_150_.Handle, 1)
						wait(0.1)
						firetouchinterest(L_156_, L_150_.Handle, 0)
					end
				end
			end
		end
	end
})

local function L_31_func(L_158_arg1)
	local L_159_ = L_10_.Character and L_10_.Character:FindFirstChild("Humanoid")
	if L_159_ then
		L_159_.WalkSpeed = L_158_arg1
	end
end

local L_32_ = L_19_.Player:AddToggle("WalkSpeed", {
	Title = "Walkspeed",
	Default = false,
	Callback = function(L_160_arg1)
		if L_160_arg1 then 
			repeat
				task.wait()  
				L_31_func(L_17_.Walk.Value)  
			until not L_17_.WalkSpeed.Value or not L_8_.Connected
			L_31_func(16)
		end
	end
})

local L_33_ = L_19_.Player:AddSlider("Walk", {
	Title = "Walk Speed",
	Default = 16,
	Min = 16,
	Max = 200,
	Rounding = 0,
	Callback = function(L_161_arg1)
	end
})

local function L_34_func(L_162_arg1)
	local L_163_ = L_10_.Character and L_10_.Character:FindFirstChild("Humanoid")
	if L_163_ then
		L_163_.JumpPower = L_162_arg1
	end
end

local L_35_ = L_19_.Player:AddToggle("JumpPower", {
	Title = "Jump Power",
	Default = false,
	Callback = function(L_164_arg1)
		if L_164_arg1 then 
			repeat
				task.wait()  
				L_34_func(L_17_.Jump.Value)  
			until not L_17_.JumpPower.Value or not L_8_.Connected
			L_34_func(50)
		end
	end
})

local L_36_ = L_19_.Player:AddSlider("Jump", {
	Title = "Jump Power",
	Default = 50,
	Min = 50,
	Max = 200,
	Rounding = 1,
	Callback = function(L_165_arg1)
	end
})
local L_37_

local L_38_ = L_19_.Player:AddToggle("InfiniteJump", {
	Title = "Infinite Jump",
	Default = false,
	Callback = function(L_166_arg1)
		if L_166_arg1 then 
			L_37_ = L_6_.JumpRequest:Connect(function()
				L_11_.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)  
			end)
			repeat
				task.wait()
			until not L_17_.InfiniteJump.Value or not L_8_.Connected
			L_37_:Disconnect()
		end
	end 
})

L_19_.Emotes:AddButton({
	Title = "Ninja",
	Callback = function()
		module:emote("ninja")
	end
})

L_19_.Emotes:AddButton({
	Title = "Dab",
	Callback = function()
		module:emote("dab")
	end
})

L_19_.Emotes:AddButton({
	Title = "Floss",
	Callback = function()
		module:emote("floss")
	end
})

L_19_.Emotes:AddButton({
	Title = "Headless",
	Callback = function()
		module:emote("headless")
	end
})

L_19_.Emotes:AddButton({
	Title = "Zen",
	Callback = function()
		module:emote("zen")
	end
})

L_19_.Emotes:AddButton({
	Title = "Zombie",
	Callback = function()
		module:emote("zombie")
	end
}) 

L_19_.Emotes:AddButton({
	Title = "Sit",
	Callback = function()
		module:emote("sit")
	end
})

local L_39_ = L_19_.Settings:AddToggle("Settings", {
	Title = "Save Settings",
	Default = false,
	Callback = function(L_167_arg1)
		if L_167_arg1 then 
			repeat
				task.wait(.5)  
				L_15_:Save(game.PlaceId)
			until not L_17_.Settings.Value or not L_8_.Connected
		end
	end
})

L_19_.Settings:AddButton({
	Title = "Delete Setting Config",
	Callback = function()
		delfile("FLORENCE/settings/"..game.PlaceId..".json")
	end  
})  

local L_40_ = L_19_.Server:AddToggle("AutoRejoin", {
	Title = "Auto Rejoin",
	Default = false,
	Callback = function(L_168_arg1)
		if L_168_arg1 then 
			L_14_:Notify({
				Title = 'Auto Rejoin',
				Content = 'You will rejoin if you are kicked or disconnected from the game',
				Duration = 5
			})
			repeat
				task.wait() 
				local L_169_, L_170_, L_171_ = game:GetService('Players').LocalPlayer, game.CoreGui.RobloxPromptGui.promptOverlay, game:GetService('TeleportService')
				L_170_.ChildAdded:connect(function(L_172_arg1)
					if L_172_arg1.Name == 'ErrorPrompt' then
						L_171_:Teleport(game.PlaceId)
						task.wait(2)
					end
				end)
			until L_17_.AutoRejoin.Value or not L_8_.Connected
		end
	end
})

local L_41_ = L_19_.Server:AddToggle("ReExecute", {
	Title = "Auto ReExecute",
	Default = false,
	Callback = function(L_173_arg1)
		if L_173_arg1 then 
			repeat
				task.wait()
				local L_174_ = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
				if L_174_ then
					L_174_('loadstring(game:HttpGet("https://raw.githubusercontent.com/13B8B/nexus/main/loadstring"))()')
				end  
			until not L_17_.ReExecute.Value or not L_8_.Connected
		end
	end 
})
L_19_.Server:AddButton({
	Title = "Rejoin-Server",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
	end
})  
L_19_.Server:AddButton({
	Title = "Server-Hop", 
	Callback = function()
		local L_175_ = game:GetService("HttpService")
		local L_176_ = game:GetService("TeleportService")
		local L_177_ = "https://games.roblox.com/v1/games/"
		local L_178_, L_179_ = game.PlaceId, game.JobId
		local L_180_ = L_177_..L_178_.."/servers/Public?sortOrder=Desc&limit=100"
		local function L_181_func(L_183_arg1)
			local L_184_ = game:HttpGet(L_180_..((L_183_arg1 and "&cursor="..L_183_arg1) or ""))
			return L_175_:JSONDecode(L_184_)
		end
		local L_182_;
		repeat
			local L_185_ = L_181_func(L_182_)
			for L_186_forvar1, L_187_forvar2 in next, L_185_.data do
				if L_187_forvar2.playing < L_187_forvar2.maxPlayers and L_187_forvar2.id ~= L_179_ then
					local L_188_, L_189_ = pcall(L_176_.TeleportToPlaceInstance, L_176_, L_178_, L_187_forvar2.id, Player)
					if L_188_ then
						break
					end
				end
			end
			L_182_ = L_185_.nextPageCursor
		until not L_182_
	end
})

local L_42_, L_43_, L_44_ = nil, nil, false

function GetMurderer()
	for L_190_forvar1, L_191_forvar2 in pairs(L_3_:GetChildren()) do 
		if L_191_forvar2.Backpack:FindFirstChild("Knife") or L_191_forvar2.Character:FindFirstChild("Knife") then
			return L_191_forvar2.Name
		end
	end
	return nil 
end

function GetSheriff()
	for L_192_forvar1, L_193_forvar2 in pairs(L_3_:GetChildren()) do 
		if L_193_forvar2.Backpack:FindFirstChild("Gun") or (L_193_forvar2.Character and L_193_forvar2.Character:FindFirstChild("Gun")) and L_193_forvar2.Name == "Tool" then
			return L_193_forvar2.Name
		end
	end
	return nil
end

coroutine.wrap(function()
	while true do
		task.wait(.5)
		local L_194_, L_195_ = pcall(function()
			L_42_ = GetMurderer()
			L_43_ = GetSheriff()
			if L_42_ then
			end
		end)
	end
end)()

local L_45_
L_45_ = hookmetamethod(game, "__namecall", function(L_196_arg1, ...)
	local L_197_ = getnamecallmethod()
	local L_198_ = {
		...
	}
	if not checkcaller() then
		if typeof(L_196_arg1) == "Instance" then
			if L_196_arg1.Name == "ShootGun" and L_197_ == "InvokeServer" then
				if L_17_.SilentAim.Value or L_17_.KillMurder.Value or L_17_.SilentAim.Value and L_17_.KillMurder.Value then 
					if L_42_ then
						local L_199_ = workspace[tostring(L_42_)].HumanoidRootPart;
						local L_200_ = L_199_.AssemblyLinearVelocity;
						local L_201_ = L_199_.Position 
						L_198_[2] = L_201_;
					end;
				else
					return L_45_(L_196_arg1, unpack(L_198_));
				end;
			end;
		end;
	end;
	return L_45_(L_196_arg1, unpack(L_198_));
end);

local L_46_
L_46_ = hookmetamethod(game, "__namecall", function(L_202_arg1, ...)
	local L_203_ = getnamecallmethod()
	local L_204_ = {
		...
	}
	if not checkcaller() then
		if tostring(L_203_) == "InvokeServer" and tostring(L_202_arg1) == "GetChance" then
			wait(13)
			local L_205_, L_206_ = pcall(function()
				L_42_ = GetMurderer()
				L_43_ = GetSheriff()
			end)
			if not L_205_ then
				warn("Error: "..L_206_)
			end
			L_44_ = true
		end
	end
	return L_46_(L_202_arg1, unpack(L_204_))
end)

-- Set libraries and folders
L_15_:SetLibrary(L_14_)
L_16_:SetLibrary(L_14_)
L_15_:SetIgnoreIndexes({})
L_15_:IgnoreThemeSettings()
L_16_:SetFolder("FLORENCE")
L_15_:SetFolder("FLORENCE")

-- Build interface section and load the game
L_16_:BuildInterfaceSection(L_19_.Settings, L_19_.Premium)
L_15_:Load(game.PlaceId)

-- Select the first tab in the window
L_18_:SelectTab(1)
