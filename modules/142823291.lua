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
	for L_49_forvar1, L_50_forvar2 in pairs(workspace:GetChildren()) do
		if L_50_forvar2:FindFirstChild("CoinContainer") then
			return L_50_forvar2.CoinContainer
		elseif L_50_forvar2:FindFirstChild("Map") then
			if pcall(function()
				local L_51_ = L_50_forvar2.Map.CoinContainer
			end) then
				return L_50_forvar2.Map.CoinContainer
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
			getgenv().nexus = false
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
		Icon = "rbxassetid://10709770431"
	}),
	Trap = L_18_:AddTab({
		Title = "Trap",
		Icon = "rbxassetid://10723396107"
	}),
	Player = L_18_:AddTab({
		Title = "Player",
		Icon = "rbxassetid://10747373176"
	}),
	Emotes = L_18_:AddTab({
		Title = "Emotes",
		Icon = "rbxassetid://4335480896"
	}),
	Premium = premium == "premium" and L_18_:AddTab({
		Title = "Premium",
		Icon = "rbxassetid://10709819149"
	}),
	Server = L_18_:AddTab({
		Title = "Server",
		Icon = "rbxassetid://10734949856"
	}),
	Settings = L_18_:AddTab({
		Title = "Settings",
		Icon = "settings"
	}),
}

local L_20_ = L_19_.Main:AddToggle("AutoFarm", {
	Title = "Auto Farm",
	Default = false,
	Callback = function(L_52_arg1)
		if L_52_arg1 then 
			repeat
				local L_53_, L_54_ = pcall(function() 

					task.wait()
					local L_55_ = L_13_func()
					if L_55_ then

						local function L_56_func(L_57_arg1)
							local L_58_ = game.Players.LocalPlayer
							local L_59_ = L_58_.Character
							local L_60_ = L_59_ and L_59_:FindFirstChild("HumanoidRootPart")

							if L_60_ then

								local L_61_ = (L_60_.Position - L_57_arg1.p).Magnitude
								local L_62_ = TweenInfo.new(L_61_ / 70, Enum.EasingStyle.Linear, Enum.EasingDirection.In)

								local L_63_ = game:GetService("TweenService"):Create(L_60_, L_62_, {
									CFrame = L_57_arg1
								})
								L_63_:Play()
								L_63_.Completed:Wait()

							end
						end

						if L_55_ and game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Timer.Visible == true or game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.CashBag.Visible == true then 

							local L_64_ = math.huge
							local L_65_ = nil

							local L_66_ = game.Players.LocalPlayer
							local L_67_ = L_66_.Character
							local L_68_ = L_67_ and L_67_:FindFirstChild("HumanoidRootPart")

							local L_69_ = L_68_.Position

							for L_70_forvar1, L_71_forvar2 in pairs(L_55_:GetChildren()) do
								if L_71_forvar2.Name == 'Coin_Server' then
									local L_72_ = L_71_forvar2.Coin.Position
									local L_73_ = (L_69_ - L_72_).Magnitude

									if L_73_ < L_64_ then
										L_64_ = L_73_
										L_65_ = L_71_forvar2
									end
								end
							end

							if L_65_ then
								L_56_func(CFrame.new(L_65_.Coin.CFrame.p))

								for L_74_forvar1 = 0, 10, 1 do
									L_67_:SetPrimaryPartCFrame(L_67_.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(L_74_forvar1), 0))
									wait(0.02)
								end

								L_65_.Name = 'False_Coin'

								repeat
									wait()
								until L_65_.Name ~= 'Coin_Server'
								wait(1)
							end
						end
					end
				end)
			until not L_17_.AutoFarm.Value or not L_8_.Connected
		end
	end
})

local L_21_ = L_19_.Main:AddToggle("CoinChams", {
	Title = "Coin Chams",
	Default = false,
	Callback = function(L_75_arg1)
		if L_75_arg1 then 
			repeat
				task.wait()
				local L_76_ = L_13_func()
				if L_76_ then
					for L_77_forvar1, L_78_forvar2 in pairs(L_76_:GetChildren()) do
						if L_78_forvar2.Name == 'Coin_Server' and not L_12_[L_78_forvar2] then
							local L_79_ = Instance.new("Highlight")
							L_79_.Name = "EspPareet"
							L_79_.FillTransparency = 0.5
							L_79_.FillColor = Color3.new(94 / 255, 1, 255 / 255)
							L_79_.OutlineColor = Color3.new(94 / 255, 1, 255 / 255)
							L_79_.OutlineTransparency = 0
							L_79_.Parent = L_78_forvar2.Parent
							L_12_[L_78_forvar2] = L_79_  
						end
					end
				end 
			until not L_17_.CoinChams.Value or not L_8_.Connected
			for L_80_forvar1, L_81_forvar2 in pairs(L_12_) do
				L_81_forvar2:Destroy()
			end         
		end
	end
})

local L_22_ = L_19_.Main:AddToggle("PlayerESP", {
	Title = "Player Chams",
	Default = false,
	Callback = function(L_82_arg1)
	end
})  

spawn(function()
	while wait() do
		if not L_17_.PlayerESP.Value and L_8_.Connected then
			for L_83_forvar1, L_84_forvar2 in next, game:GetService('Players'):GetPlayers() do
				if L_84_forvar2.Name ~= game:GetService('Players').LocalPlayer.Name then
					pcall(function()
						L_84_forvar2.Character.Highlight:Destroy()
					end)
				end 
			end
		else
			local L_85_ = game:GetService("ReplicatedStorage")
			local L_86_ = L_85_:FindFirstChild("GetPlayerData", true):InvokeServer()

			function CreateHighlight()

				for L_87_forvar1, L_88_forvar2 in pairs(L_3_:GetChildren()) do
					pcall(function()
						if L_88_forvar2 ~= L_11_ and L_88_forvar2.Character and not L_88_forvar2.Character:FindFirstChild("Highlight") then
							Instance.new("Highlight", L_88_forvar2.Character)

						end
					end)
				end

			end

			function UpdateHighlights() 
				for L_89_forvar1, L_90_forvar2 in pairs(L_3_:GetChildren()) do
					local L_91_ = L_90_forvar2.Character and L_90_forvar2.Character:FindFirstChild("Highlight")
					if L_90_forvar2 ~= L_11_ and L_91_ then
						if IsAlive(L_90_forvar2) then
							if L_90_forvar2.Name == Sheriff then 		
								L_91_.FillColor = Color3.fromRGB(0, 0, 225)
							elseif L_90_forvar2.Name == Murder then 
								L_91_.FillColor = Color3.fromRGB(225, 0, 0) 
							elseif L_90_forvar2.Name == Hero and not IsAlive(L_3_:WaitForChild(Sheriff)) then
								L_91_.FillColor = Color3.fromRGB(0, 0, 225)
							else 
								L_91_.FillColor = Color3.fromRGB(76, 215, 134) 
							end
						else
							L_91_.FillColor = Color3.fromRGB(255, 255, 255)
						end
					end
				end
			end

			function IsAlive(L_92_arg1)
				local L_93_ = L_86_[L_92_arg1.Name]
				return L_93_ and not L_93_.Killed and not L_93_.Dead
			end  

			Sheriff, Murder, Hero = nil, nil, nil
			for L_94_forvar1, L_95_forvar2 in pairs(L_86_) do
				if L_95_forvar2.Role == "Murderer" then
					Murder = L_94_forvar1
				elseif L_95_forvar2.Role == 'Sheriff' then
					Sheriff = L_94_forvar1
				elseif L_95_forvar2.Role == 'Hero' then
					Hero = L_94_forvar1
				end
			end  
			if L_17_.PlayerESP.Value and L_8_.Connected then  
				CreateHighlight()
				UpdateHighlights()
			end
			if not L_8_.Connected then 
				for L_96_forvar1, L_97_forvar2 in next, game:GetService('Players'):GetPlayers() do
					if L_97_forvar2.Name ~= game:GetService('Players').LocalPlayer.Name then
						pcall(function()
							L_97_forvar2.Character.Highlight:Destroy()
						end)
					end 
				end
				return 
			end  
		end
	end
end)

local L_23_ = L_19_.Main:AddToggle("GrabGun", {
	Title = "Automatically Grab Gun",
	Default = false,
	Callback = function(L_98_arg1)
		if L_98_arg1 then 
			repeat
				task.wait()
				local L_99_, L_100_ = pcall(function() 

					local L_101_ = L_3_.LocalPlayer
					local L_102_ = L_101_.Character
					local L_103_ = L_102_:FindFirstChild("HumanoidRootPart")

					local L_104_ = GetMurderer()
					local L_105_ = game:GetService("Workspace"):FindFirstChild("GunDrop")
					local L_106_ = game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.CashBag.Visible == true

					if L_105_ and L_106_ then
						local L_107_ = workspace:FindFirstChild(L_104_)

						if L_107_ then
							local L_108_ = L_107_:WaitForChild("HumanoidRootPart")
							print(L_108_.Position)
							local L_109_ = L_105_.Position

							local L_110_ = (L_108_.Position - L_109_).Magnitude
							local L_111_ = game.Players.LocalPlayer

							if L_110_ > 25 then

								if game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Timer.Visible == false then 
									local L_112_ = L_111_.Character.HumanoidRootPart.CFrame
									wait(.5)
									L_111_.Character.HumanoidRootPart.CFrame = L_105_.CFrame
									L_111_.Character.Humanoid.Jump = true
									wait(.3)
									L_111_.Character.HumanoidRootPart.CFrame = L_112_
								end  
							end

						end
					end
				end)

				if not L_99_ then
					warn("An error occurred:", L_100_) -- Print the error message
				end

			until not L_17_.GrabGun.Value or not L_8_.Connected

		end
	end
})

local L_24_ = L_19_.Main:AddToggle("GunCham", {
	Title = "Gun Dropped Cham",
	Default = false,
	Callback = function(L_113_arg1)
		if L_113_arg1 then 
			local L_114_ = game:GetService("Workspace"):FindFirstChild("GunDrop")
			local L_115_

			repeat
				task.wait()
				local L_116_ = game:GetService("Workspace"):FindFirstChild("GunDrop")

				if L_116_ then
					L_115_ = L_116_:FindFirstChild("GunESP")
					if not L_115_ then
						L_115_ = Instance.new("Highlight")
						L_115_.Name = "GunESP"
						L_115_.FillTransparency = 0.5
						L_115_.FillColor = Color3.new(94, 1, 255)
						L_115_.OutlineColor = Color3.new(94, 1, 255)
						L_115_.OutlineTransparency = 0
						L_115_.Parent = L_116_
					end
				end
			until not L_17_.GunCham.Value or not L_8_.Connected

			if L_115_ then 
				L_115_:Destroy() 
			end
		end
	end
})

local L_25_ = L_19_.Misc:AddToggle("KillAll", {
	Title = "Kill Aura",
	Default = false,
	Callback = function(L_117_arg1)
		if L_117_arg1 then 
			repeat
				task.wait()
				local L_118_, L_119_ = pcall(function() 

					local L_120_ = L_11_.Backpack:FindFirstChild("Knife") or L_11_.Character:FindFirstChild("Knife")
					local L_121_ = tonumber(L_17_.Distance.Value)

					for L_122_forvar1, L_123_forvar2 in ipairs(L_3_:GetPlayers()) do
						if L_123_forvar2 ~= L_11_ and L_123_forvar2.Character ~= nil then
							local L_124_ = L_123_forvar2.Character.HumanoidRootPart
							local L_125_ = L_124_.Position
							local L_126_ = (L_125_ - L_11_.Character.HumanoidRootPart.Position).Magnitude
							if (L_126_ <= L_121_) then
								firetouchinterest(L_124_, L_120_.Handle, 1)
								firetouchinterest(L_124_, L_120_.Handle, 0)
							end
						end  
					end
				end)
			until not L_17_.KillAll.Value or not L_8_.Connected
		end
	end
})

local L_26_ = L_19_.Misc:AddSlider("Distance", {
	Title = "Aura Distance",
	Default = 5,
	Min = 5,
	Max = 50,
	Rounding = 0,
	Callback = function(L_127_arg1)
	end
})

local L_27_ = L_19_.Misc:AddToggle("SilentAim", {
	Title = "Silent Aim",
	Default = false,
	Callback = function(L_128_arg1)
	end
})

local L_28_ = L_19_.Misc:AddSlider("Slider", {
	Title = "Accuracy",
	Default = 5,
	Min = 25,
	Max = 100,
	Rounding = 0,
	Callback = function(L_129_arg1)
	end
})  

local L_29_ = L_19_.Misc:AddToggle("KillMurder", {
	Title = "Kill Murder",
	Default = false,
	Callback = function(L_130_arg1)
		if L_130_arg1 then
			repeat
				local L_131_, L_132_ = pcall(function() 
					task.wait()
					local L_133_ = GetMurderer()
					local L_134_ = game.Players.LocalPlayer
					local L_135_ = L_134_.Backpack:FindFirstChild("Gun") or L_134_.Character:FindFirstChild("Gun")
					if not L_135_ then 
						game:GetService('Players').LocalPlayer.CameraMode = Enum.CameraMode.Classic
					end
					if L_133_ ~= L_134_.Name and L_134_ then
						local L_136_ = L_134_.Backpack:FindFirstChild("Gun") or L_134_.Character:FindFirstChild("Gun")

						if L_136_ then 
							local L_137_ = L_11_.Character:WaitForChild("Humanoid")
							L_137_:EquipTool(L_136_)
							game:GetService('Players').LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson

						end

						if L_136_ and L_134_ and L_133_ then
							if workspace[L_134_.Name].Gun.Handle.Reload.IsPlaying then 
								local L_139_ = L_134_.Character:FindFirstChild("HumanoidRootPart")

								local L_140_ = Vector3.new(-110, 135, 38.946128845215)
								L_139_.CFrame = CFrame.new(L_140_)
								repeat
									task.wait()
								until not workspace[L_134_.Name].Gun.Handle.Reload.IsPlaying
							end


							local L_138_ = workspace:FindFirstChild(L_133_)
							if L_138_ and L_134_ then
								local L_141_ = L_138_:FindFirstChild("HumanoidRootPart")
								local L_142_ = L_134_.Character
								local L_143_ = L_142_:FindFirstChild("HumanoidRootPart")

								if L_141_ and L_143_ and L_134_ and L_133_ then
									-- Calculate the position behind the Murderer
									local L_144_ = Vector3.new(0, 0, 6)
									local L_145_ = L_141_.CFrame:PointToWorldSpace(L_144_)

									-- Teleport the player's character to the target position
									L_142_:SetPrimaryPartCFrame(CFrame.new(L_145_))

									-- Make the character face the Murderer
									if L_133_ then 
										L_142_:SetPrimaryPartCFrame(CFrame.new(L_145_, L_141_.Position))
										local L_146_ = workspace.CurrentCamera
										L_146_.CFrame = CFrame.new(L_146_.CFrame.Position, (L_141_.Position - Vector3.new(-0.5, 0, 1)))
									end  

									-- Simulate a click to attack the Murderer
									spawn(function()
										wait(0.3)

										local L_147_ = game:GetService("Workspace").CurrentCamera.ViewportSize.X
										local L_148_ = game:GetService("Workspace").CurrentCamera.ViewportSize.Y

										local L_149_ = L_147_ / 2
										local L_150_ = L_148_ / 2

										game:GetService("VirtualInputManager"):SendMouseButtonEvent(L_149_, L_150_, 0, true, game, 1)
										game:GetService("VirtualInputManager"):SendMouseButtonEvent(L_149_, L_150_, 0, false, game, 1)
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
		local L_151_ = L_11_.Backpack:FindFirstChild("Knife") or L_11_.Character:FindFirstChild("Knife")
		if L_151_ and L_151_:IsA("Tool") then
			local L_152_ = L_11_.Character
			local L_153_ = L_152_:WaitForChild("Humanoid")
			L_153_:EquipTool(L_151_)

			for L_154_forvar1 = 1, 3 do
				for L_155_forvar1, L_156_forvar2 in ipairs(L_3_:GetPlayers()) do
					if L_156_forvar2 ~= L_11_ and L_156_forvar2.Character then
						local L_157_ = L_156_forvar2.Character:WaitForChild("HumanoidRootPart")
						local L_158_ = L_157_.Position

						L_9_:ClickButton1(Vector2.new())

						firetouchinterest(L_157_, L_151_.Handle, 1)
						wait(0.1)
						firetouchinterest(L_157_, L_151_.Handle, 0)
					end
				end
			end
		end
	end
})

local L_30_ = L_19_.Trap:AddToggle("TrapTrail", {
	Title = "Trap Trail",
	Default = false,
	Callback = function(L_159_arg1)
		if L_159_arg1 then
			pcall(function()

				local L_160_ = game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Inventory.Main.Perks.Items.Container.Current.Container
				local L_161_ = true
				if L_160_ then
					for L_162_forvar1, L_163_forvar2 in pairs(L_160_:GetChildren()) do
						if L_163_forvar2:IsA("Frame") and L_163_forvar2.ItemName.Label.Text == "Trap" then
							print(L_163_forvar2.ItemName.Label.Text)
							L_161_ = false 
						end
					end
				end

				if L_161_ then 
					L_14_:Notify({
						Title = 'Missing Trap',
						Content = 'Must own trap \n400 diamonds or 3K coins',
						Duration = 5
					})
					L_161_ = true 
				end 
			end)   
			repeat
				task.wait()
				local L_164_, L_165_ = pcall(function()
					local L_166_ = game.Players.LocalPlayer
					if L_166_ then
						local L_167_ = L_166_.Character and L_166_.Character:FindFirstChild("HumanoidRootPart")
						if L_167_ then
							local L_168_ = CFrame.new(L_167_.Position)
							local L_169_ = game:GetService("ReplicatedStorage")
							local L_170_ = L_169_:FindFirstChild("TrapSystem")
							if L_170_ and L_170_:FindFirstChild("PlaceTrap") then
								L_170_.PlaceTrap:InvokeServer(L_168_)
							end
						end
					end
				end)
				if not L_164_ then
					warn("An error occurred:", L_165_) -- Print the error message
				end
			until not L_17_.TrapTrail.Value or not L_8_.Connected
		end
	end
})

local L_31_ = L_19_.Trap:AddToggle("AutoTrap", {
	Title = "Trap All",
	Default = false,
	Callback = function(L_171_arg1)
		if L_171_arg1 then
			pcall(function()

				local L_172_ = game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Inventory.Main.Perks.Items.Container.Current.Container
				local L_173_ = true
				if L_172_ then
					for L_174_forvar1, L_175_forvar2 in pairs(L_172_:GetChildren()) do
						if L_175_forvar2:IsA("Frame") and L_175_forvar2.ItemName.Label.Text == "Trap" then
							print(L_175_forvar2.ItemName.Label.Text)
							L_173_ = false 
						end
					end
				end
				if L_173_ then 
					L_14_:Notify({
						Title = 'Missing Trap',
						Content = 'Must own trap \n400 diamonds or 3K coins',
						Duration = 5
					})
					L_173_ = true 
				end 
			end) 
			repeat
				task.wait()
				local L_176_, L_177_ = pcall(function()
					local L_178_ = game:GetService("ReplicatedStorage")
					local L_179_ = L_178_:FindFirstChild("TrapSystem")

					if L_179_ and L_179_:FindFirstChild("PlaceTrap") then
						local L_180_ = game.Players.LocalPlayer
						local L_181_ = game.Players:GetPlayers()

						for L_182_forvar1, L_183_forvar2 in ipairs(L_181_) do
							if L_183_forvar2 ~= L_180_ then
								local L_184_ = L_183_forvar2.Character and L_183_forvar2.Character:FindFirstChild("HumanoidRootPart")
								if L_184_ then
									local L_185_ = CFrame.new(L_184_.Position)
									L_179_.PlaceTrap:InvokeServer(L_185_)
								end
							end
						end
					end
				end)
				if not L_176_ then
					warn("An error occurred:", L_177_) -- Print the error message
				end
			until not L_17_.AutoTrap.Value or not L_8_.Connected
		end
	end
})

local L_32_ = L_19_.Trap:AddToggle("AutoDestroy", {
	Title = "Auto Destroy Traps",
	Default = false,
	Callback = function(L_186_arg1)
		if L_186_arg1 then 
			L_14_:Notify({
				Title = 'Destroy Traps',
				Content = 'This will delete traps visually [less lag]',
				Duration = 5
			})

			repeat
				task.wait()
				local L_187_, L_188_ = pcall(function()
					local L_189_ = workspace:FindFirstChild(L_11_.Name)

					if L_189_ and L_189_:IsA("Model") then
						for L_190_forvar1, L_191_forvar2 in pairs(L_189_:GetDescendants()) do
							if L_191_forvar2.Name == "Trap" then
								L_191_forvar2:Destroy()
							end
						end
					end 
				end)
			until not L_17_.AutoDestroy.Value or not L_8_.Connected
		end
	end
})


local function L_33_func(L_192_arg1)
	local L_193_ = L_10_.Character and L_10_.Character:FindFirstChild("Humanoid")
	if L_193_ then
		L_193_.WalkSpeed = L_192_arg1
	end
end

local L_34_ = L_19_.Player:AddToggle("WalkSpeed", {
	Title = "Walkspeed",
	Default = false,
	Callback = function(L_194_arg1)
		if L_194_arg1 then 
			repeat
				task.wait()  
				L_33_func(L_17_.Walk.Value)  
			until not L_17_.WalkSpeed.Value or not L_8_.Connected
			L_33_func(16)
		end
	end
})

local L_35_ = L_19_.Player:AddSlider("Walk", {
	Title = "Walk Speed",
	Default = 16,
	Min = 16,
	Max = 200,
	Rounding = 0,
	Callback = function(L_195_arg1)
	end
})

local function L_36_func(L_196_arg1)
	local L_197_ = L_10_.Character and L_10_.Character:FindFirstChild("Humanoid")
	if L_197_ then
		L_197_.JumpPower = L_196_arg1
	end
end

local L_37_ = L_19_.Player:AddToggle("JumpPower", {
	Title = "Jump Power",
	Default = false,
	Callback = function(L_198_arg1)
		if L_198_arg1 then 
			repeat
				task.wait()  
				L_36_func(L_17_.Jump.Value)  
			until not L_17_.JumpPower.Value or not L_8_.Connected
			L_36_func(50)
		end
	end
})

local L_38_ = L_19_.Player:AddSlider("Jump", {
	Title = "Jump Power",
	Default = 50,
	Min = 50,
	Max = 200,
	Rounding = 1,
	Callback = function(L_199_arg1)
	end
})
local L_39_

local L_40_ = L_19_.Player:AddToggle("InfiniteJump", {
	Title = "Infinite Jump",
	Default = false,
	Callback = function(L_200_arg1)
		if L_200_arg1 then 
			L_39_ = L_6_.JumpRequest:Connect(function()
				L_11_.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)  
			end)
			repeat
				task.wait()
			until not L_17_.InfiniteJump.Value or not L_8_.Connected
			L_39_:Disconnect()
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

local L_41_ = L_19_.Settings:AddToggle("Settings", {
	Title = "Save Settings",
	Default = false,
	Callback = function(L_201_arg1)
		if L_201_arg1 then 
			repeat
				task.wait(.1)  
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

local L_42_ = L_19_.Server:AddToggle("AutoRejoin", {
	Title = "Auto Rejoin",
	Default = false,
	Callback = function(L_202_arg1)
		if L_202_arg1 then 
			L_14_:Notify({
				Title = 'Auto Rejoin',
				Content = 'You will rejoin if you are kicked or disconnected from the game',
				Duration = 5
			})
			repeat
				task.wait() 
				local L_203_, L_204_, L_205_ = game:GetService('Players').LocalPlayer, game.CoreGui.RobloxPromptGui.promptOverlay, game:GetService('TeleportService')
				L_204_.ChildAdded:connect(function(L_206_arg1)
					if L_206_arg1.Name == 'ErrorPrompt' then
						L_205_:Teleport(game.PlaceId)
						task.wait(2)
					end
				end)
			until L_17_.AutoRejoin.Value or not L_8_.Connected
		end
	end
})

local L_43_ = L_19_.Server:AddToggle("ReExecute", {
	Title = "Auto ReExecute",
	Default = false,
	Callback = function(L_207_arg1)
		if L_207_arg1 then 
			repeat
				task.wait()
				local L_208_ = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
				if L_208_ then
					L_208_('loadstring(game:HttpGet("https://raw.githubusercontent.com/13B8B/nexus/main/loadstring"))()')
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
		local L_209_ = game:GetService("HttpService")
		local L_210_ = game:GetService("TeleportService")
		local L_211_ = "https://games.roblox.com/v1/games/"
		local L_212_, L_213_ = game.PlaceId, game.JobId
		local L_214_ = L_211_..L_212_.."/servers/Public?sortOrder=Desc&limit=100"
		local function L_215_func(L_217_arg1)
			local L_218_ = game:HttpGet(L_214_..((L_217_arg1 and "&cursor="..L_217_arg1) or ""))
			return L_209_:JSONDecode(L_218_)
		end
		local L_216_;
		repeat
			local L_219_ = L_215_func(L_216_)
			for L_220_forvar1, L_221_forvar2 in next, L_219_.data do
				if L_221_forvar2.playing < L_221_forvar2.maxPlayers and L_221_forvar2.id ~= L_213_ then
					local L_222_, L_223_ = pcall(L_210_.TeleportToPlaceInstance, L_210_, L_212_, L_221_forvar2.id, Player)
					if L_222_ then
						break
					end
				end
			end
			L_216_ = L_219_.nextPageCursor
		until not L_216_
	end
})

local L_44_, L_45_, L_46_ = nil, nil, false

function GetMurderer()
	for L_224_forvar1, L_225_forvar2 in pairs(L_3_:GetChildren()) do 
		if L_225_forvar2.Backpack:FindFirstChild("Knife") or L_225_forvar2.Character:FindFirstChild("Knife") then
			return L_225_forvar2.Name
		end
	end
	return nil 
end

function GetSheriff()
	for L_226_forvar1, L_227_forvar2 in pairs(L_3_:GetChildren()) do 
		if L_227_forvar2.Backpack:FindFirstChild("Gun") or (L_227_forvar2.Character and L_227_forvar2.Character:FindFirstChild("Gun")) and L_227_forvar2.Name == "Tool" then
			return L_227_forvar2.Name
		end
	end
	return nil
end

coroutine.wrap(function()
	while true do
		task.wait(.5)
		local L_228_, L_229_ = pcall(function()
			L_44_ = GetMurderer()
			L_45_ = GetSheriff()
			if L_44_ then
			end
		end)
	end
end)()

local L_47_
L_47_ = hookmetamethod(game, "__namecall", function(L_230_arg1, ...)
	local L_231_ = getnamecallmethod()
	local L_232_ = {
		...
	}
	if not checkcaller() then
		if typeof(L_230_arg1) == "Instance" then
			if L_230_arg1.Name == "ShootGun" and L_231_ == "InvokeServer" then
				if L_17_.SilentAim.Value or L_17_.KillMurder.Value or L_17_.SilentAim.Value and L_17_.KillMurder.Value then 
					if L_44_ then
						local L_233_ = workspace[tostring(L_44_)].HumanoidRootPart;
						local L_234_ = L_233_.AssemblyLinearVelocity;
						local L_235_ = L_233_.Position 
						L_232_[2] = L_235_;
					end;
				else
					return L_47_(L_230_arg1, unpack(L_232_));
				end;
			end;
		end;
	end;
	return L_47_(L_230_arg1, unpack(L_232_));
end);

local L_48_
L_48_ = hookmetamethod(game, "__namecall", function(L_236_arg1, ...)
	local L_237_ = getnamecallmethod()
	local L_238_ = {
		...
	}
	if not checkcaller() then
		if tostring(L_237_) == "InvokeServer" and tostring(L_236_arg1) == "GetChance" then
			wait(13)
			local L_239_, L_240_ = pcall(function()
				L_44_ = GetMurderer()
				L_45_ = GetSheriff()
			end)
			if not L_239_ then
				warn("Error: "..L_240_)
			end
			L_46_ = true
		end
	end
	return L_48_(L_236_arg1, unpack(L_238_))
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
