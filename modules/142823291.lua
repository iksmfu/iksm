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
local L_13_

local function L_14_func()
	for L_50_forvar1, L_51_forvar2 in pairs(workspace:GetChildren()) do
		if L_51_forvar2:FindFirstChild("CoinContainer") then
			return L_51_forvar2.CoinContainer
		elseif L_51_forvar2:FindFirstChild("Map") then
			if pcall(function()
				local L_52_ = L_51_forvar2.Map.CoinContainer
			end) then
				return L_51_forvar2.Map.CoinContainer
			end
		end
	end
	return nil
end

spawn(function()
	while wait() do
		if not getgenv().Disconnect then 
			L_7_:Fire()  
		else
			wait(1)
			L_8_:Disconnect()
			getgenv().Disconnect = false
			getgenv().nexus = false
			return
		end
	end
end)  


local L_15_ = loadstring(game:HttpGet("https://github.com/s-o-a-b/nexus/releases/download/nexus/nexus.txt"))()
local L_16_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/assets/SaveManager"))()
local L_17_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/assets/InterfaceManager"))()

local L_18_ = L_15_.Options
L_16_:SetLibrary(L_15_)

--[[
   premium = true
]]

local L_19_ = L_15_:CreateWindow({
	Title = "nexus ",
	"",
	SubTitle = "",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = true,
	Theme = "Dark",
})

local L_20_ = {
	Main = L_19_:AddTab({
		Title = "Main",
		Icon = "rbxassetid://10723424505"
	}),
	Misc = L_19_:AddTab({
		Title = "Misc",
		Icon = "rbxassetid://10709770431"
	}),
	Trap = L_19_:AddTab({
		Title = "Trap",
		Icon = "rbxassetid://10723396107"
	}),
	Player = L_19_:AddTab({
		Title = "Player",
		Icon = "rbxassetid://10747373176"
	}),
	Emotes = L_19_:AddTab({
		Title = "Emotes",
		Icon = "rbxassetid://4335480896"
	}),
	Premium = premium == "premium" and L_19_:AddTab({
		Title = "Premium",
		Icon = "rbxassetid://10709819149"
	}),
	Server = L_19_:AddTab({
		Title = "Server",
		Icon = "rbxassetid://10734949856"
	}),
	Settings = L_19_:AddTab({
		Title = "Settings",
		Icon = "settings"
	}),
}

local L_21_ = L_20_.Main:AddToggle("AutoFarm", {
	Title = "Auto Farm",
	Default = false,
	Callback = function(L_53_arg1)
		if L_53_arg1 then 
			repeat
				local L_54_, L_55_ = pcall(function() 

					task.wait()
					local L_56_ = L_14_func()
					if L_56_ then

						local function L_57_func(L_58_arg1)
							local L_59_ = game.Players.LocalPlayer
							local L_60_ = L_59_.Character
							local L_61_ = L_60_ and L_60_:FindFirstChild("HumanoidRootPart")

							if L_61_ then

								local L_62_ = (L_61_.Position - L_58_arg1.p).Magnitude
								local L_63_ = TweenInfo.new(L_62_ / 70, Enum.EasingStyle.Linear, Enum.EasingDirection.In)

								local L_64_ = game:GetService("TweenService"):Create(L_61_, L_63_, {
									CFrame = L_58_arg1
								})
								L_64_:Play()
								L_64_.Completed:Wait()

							end
						end

						if L_56_ and game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Timer.Visible == true or game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.CashBag.Visible == true then 

							local L_65_ = math.huge
							local L_66_ = nil

							local L_67_ = game.Players.LocalPlayer
							local L_68_ = L_67_.Character
							local L_69_ = L_68_ and L_68_:FindFirstChild("HumanoidRootPart")

							local L_70_ = L_69_.Position

							for L_71_forvar1, L_72_forvar2 in pairs(L_56_:GetChildren()) do
								if L_72_forvar2.Name == 'Coin_Server' then
									local L_73_ = L_72_forvar2.Coin.Position
									local L_74_ = (L_70_ - L_73_).Magnitude

									if L_74_ < L_65_ then
										L_65_ = L_74_
										L_66_ = L_72_forvar2
									end
								end
							end

							if L_66_ and not L_13_ then
								L_57_func(CFrame.new(L_66_.Coin.CFrame.p))

								for L_75_forvar1 = 0, 10, 1 do
									L_68_:SetPrimaryPartCFrame(L_68_.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(L_75_forvar1), 0))
									wait(0.02)
								end

								L_66_.Name = 'False_Coin'

								repeat
									wait()
								until L_66_.Name ~= 'Coin_Server'
								wait(1)
							end
						end
					end
				end)
			until not L_18_.AutoFarm.Value or not L_8_.Connected
		end
	end
})

local L_22_ = L_20_.Main:AddToggle("CoinChams", {
	Title = "Coin Chams",
	Default = false,
	Callback = function(L_76_arg1)
		if L_76_arg1 then 
			repeat
				task.wait()
				local L_77_ = L_14_func()
				if L_77_ then
					for L_78_forvar1, L_79_forvar2 in pairs(L_77_:GetChildren()) do
						if L_79_forvar2.Name == 'Coin_Server' and not L_12_[L_79_forvar2] then
							local L_80_ = Instance.new("Highlight")
							L_80_.Name = "EspPareet"
							L_80_.FillTransparency = 0.5
							L_80_.FillColor = Color3.new(94 / 255, 1, 255 / 255)
							L_80_.OutlineColor = Color3.new(94 / 255, 1, 255 / 255)
							L_80_.OutlineTransparency = 0
							L_80_.Parent = L_79_forvar2.Parent
							L_12_[L_79_forvar2] = L_80_  
						end
					end
				end 
			until not L_18_.CoinChams.Value or not L_8_.Connected
			for L_81_forvar1, L_82_forvar2 in pairs(L_12_) do
				L_82_forvar2:Destroy()
			end         
		end
	end
})

local L_23_ = L_20_.Main:AddToggle("PlayerESP", {
	Title = "Player Chams",
	Default = false,
	Callback = function(L_83_arg1)
	end
})  
--WaitForChild
spawn(function()
	while wait() do
		if not L_8_.Connected then 
			for L_84_forvar1, L_85_forvar2 in next, game:GetService('Players'):GetPlayers() do
				if L_85_forvar2.Name ~= game:GetService('Players').LocalPlayer.Name then
					pcall(function()
						L_85_forvar2.Character.Highlight:Destroy()
					end)
				end 
			end 
			return 
		end  
		if not L_18_.PlayerESP.Value then
			for L_86_forvar1, L_87_forvar2 in next, game:GetService('Players'):GetPlayers() do
				if L_87_forvar2.Name ~= game:GetService('Players').LocalPlayer.Name then
					pcall(function()
						L_87_forvar2.Character.Highlight:Destroy()
					end)
				end 
			end
		else
			local L_88_ = game:GetService("ReplicatedStorage")
			local L_89_ = L_88_:FindFirstChild("GetPlayerData", true):InvokeServer()

			function CreateHighlight()

				for L_90_forvar1, L_91_forvar2 in pairs(game:GetService("Players"):GetChildren()) do
					pcall(function()
						if L_91_forvar2 ~= L_11_ and L_91_forvar2.Character and not L_91_forvar2.Character:FindFirstChild("Highlight") then
							Instance.new("Highlight", L_91_forvar2.Character)

						end
					end)
				end

			end

			function UpdateHighlights()
				for L_92_forvar1, L_93_forvar2 in pairs(game:GetService("Players"):GetChildren()) do
					local L_94_ = L_93_forvar2.Character and L_93_forvar2.Character:FindFirstChild("Highlight")
					if L_93_forvar2 ~= L_11_ and L_94_ then
						if IsAlive(L_93_forvar2) then
							local L_95_ = L_89_[L_93_forvar2.Name]
							if L_95_ then
								if L_95_.Role == "Murderer" then
									L_94_.FillColor = Color3.fromRGB(225, 0, 0)
								elseif L_95_.Role == 'Sheriff' then
									L_94_.FillColor = Color3.fromRGB(0, 0, 225)
								elseif L_95_.Role == 'Hero' then
									L_94_.FillColor = Color3.fromRGB(0, 0, 225)
								else
									L_94_.FillColor = Color3.fromRGB(76, 215, 134)
								end
							else
								L_94_.FillColor = Color3.fromRGB(76, 215, 134)
							end
						else
							L_94_.FillColor = Color3.fromRGB(255, 255, 255)
						end
					end
				end
			end

			function IsAlive(L_96_arg1)
				local L_97_ = L_89_[L_96_arg1.Name]
				return L_97_ and not L_97_.Killed and not L_97_.Dead
			end  

			Sheriff, Murder, Hero = nil, nil, nil
			for L_98_forvar1, L_99_forvar2 in pairs(L_89_) do
				if L_99_forvar2.Role == "Murderer" then
					Murder = L_98_forvar1
				elseif L_99_forvar2.Role == 'Sheriff' then
					Sheriff = L_98_forvar1
				elseif L_99_forvar2.Role == 'Hero' then
					Hero = L_98_forvar1
				end
			end  
			if L_18_.PlayerESP.Value and L_8_.Connected then  
				CreateHighlight()
				UpdateHighlights()
			end
		end
	end
end)  

local L_24_ = L_20_.Main:AddToggle("GrabGun", {
	Title = "Automatically Grab Gun",
	Default = false,
	Callback = function(L_100_arg1)
		if L_100_arg1 then 
			repeat
				task.wait()
				local L_101_, L_102_ = pcall(function() 

					local L_103_ = L_3_.LocalPlayer
					local L_104_ = L_103_.Character
					local L_105_ = L_104_:FindFirstChild("HumanoidRootPart")

					local L_106_ = GetMurderer()
					local L_107_ = game:GetService("Workspace"):FindFirstChild("GunDrop")
					local L_108_ = game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.CashBag.Visible == true

					if L_107_ and L_108_ then
						local L_109_ = workspace:FindFirstChild(L_106_)

						if L_109_ then
							local L_110_ = L_109_:WaitForChild("HumanoidRootPart")
							print(L_110_.Position)
							local L_111_ = L_107_.Position

							local L_112_ = (L_110_.Position - L_111_).Magnitude
							local L_113_ = game.Players.LocalPlayer

							if L_112_ > 25 then

								if game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Timer.Visible == false then 
									local L_114_ = L_113_.Character.HumanoidRootPart.CFrame
									wait(.5)
									L_113_.Character.HumanoidRootPart.CFrame = L_107_.CFrame
									L_113_.Character.Humanoid.Jump = true
									wait(.3)
									L_113_.Character.HumanoidRootPart.CFrame = L_114_
								end  
							end

						end
					end
				end)

				if not L_101_ then
					warn("An error occurred:", L_102_) -- Print the error message
				end

			until not L_18_.GrabGun.Value or not L_8_.Connected

		end
	end
})

local L_25_ = L_20_.Main:AddToggle("GunCham", {
	Title = "Gun Dropped Cham",
	Default = false,
	Callback = function(L_115_arg1)
		if L_115_arg1 then 
			local L_116_ = game:GetService("Workspace"):FindFirstChild("GunDrop")
			local L_117_

			repeat
				task.wait()
				local L_118_ = game:GetService("Workspace"):FindFirstChild("GunDrop")

				if L_118_ then
					L_117_ = L_118_:FindFirstChild("GunESP")
					if not L_117_ then
						L_117_ = Instance.new("Highlight")
						L_117_.Name = "GunESP"
						L_117_.FillTransparency = 0.5
						L_117_.FillColor = Color3.new(94, 1, 255)
						L_117_.OutlineColor = Color3.new(94, 1, 255)
						L_117_.OutlineTransparency = 0
						L_117_.Parent = L_118_
					end
				end
			until not L_18_.GunCham.Value or not L_8_.Connected

			if L_117_ then 
				L_117_:Destroy() 
			end
		end
	end
})

local L_26_ = L_20_.Misc:AddToggle("KillAll", {
	Title = "Kill Aura",
	Default = false,
	Callback = function(L_119_arg1)
		if L_119_arg1 then 
			repeat
				task.wait()
				local L_120_, L_121_ = pcall(function() 

					local L_122_ = L_11_.Backpack:FindFirstChild("Knife") or L_11_.Character:FindFirstChild("Knife")
					local L_123_ = tonumber(L_18_.Distance.Value)

					for L_124_forvar1, L_125_forvar2 in ipairs(L_3_:GetPlayers()) do
						if L_125_forvar2 ~= L_11_ and L_125_forvar2.Character ~= nil then
							local L_126_ = L_125_forvar2.Character.HumanoidRootPart
							local L_127_ = L_126_.Position
							local L_128_ = (L_127_ - L_11_.Character.HumanoidRootPart.Position).Magnitude
							if (L_128_ <= L_123_) then
								firetouchinterest(L_126_, L_122_.Handle, 1)
								firetouchinterest(L_126_, L_122_.Handle, 0)
							end
						end  
					end
				end)
			until not L_18_.KillAll.Value or not L_8_.Connected
		end
	end
})

local L_27_ = L_20_.Misc:AddSlider("Distance", {
	Title = "Aura Distance",
	Default = 5,
	Min = 5,
	Max = 50,
	Rounding = 0,
	Callback = function(L_129_arg1)
	end
})

local L_28_ = L_20_.Misc:AddToggle("SilentAim", {
	Title = "Silent Aim",
	Default = false,
	Callback = function(L_130_arg1)
	end
})

local L_29_ = L_20_.Misc:AddSlider("Slider", {
	Title = "Accuracy",
	Default = 5,
	Min = 25,
	Max = 100,
	Rounding = 0,
	Callback = function(L_131_arg1)
	end
})  

local L_30_ = L_20_.Misc:AddToggle("KillMurder", {
	Title = "Kill Murder",
	Default = false,
	Callback = function(L_132_arg1)
		if L_132_arg1 then
			repeat
				local L_133_, L_134_ = pcall(function() 
					task.wait()
					local L_135_ = GetMurderer()
					local L_136_ = game.Players.LocalPlayer
					local L_137_ = L_136_.Backpack:FindFirstChild("Gun") or L_136_.Character:FindFirstChild("Gun")
					if not L_137_ then 
						game:GetService('Players').LocalPlayer.CameraMode = Enum.CameraMode.Classic
						L_13_ = false
					end
					if L_135_ ~= L_136_.Name and L_136_ then
						local L_138_ = L_136_.Backpack:FindFirstChild("Gun") or L_136_.Character:FindFirstChild("Gun")

						if L_138_ then 
							L_13_ = true
							local L_139_ = L_11_.Character:WaitForChild("Humanoid")
							L_139_:EquipTool(L_138_)
							game:GetService('Players').LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson

						end

						if L_138_ and L_136_ and L_135_ then
							if workspace[L_136_.Name].Gun.Handle.Reload.IsPlaying then 
								local L_141_ = L_136_.Character:FindFirstChild("HumanoidRootPart")

								local L_142_ = Vector3.new(-110, 135, 38.946128845215)
								L_141_.CFrame = CFrame.new(L_142_)
								repeat
									task.wait()
								until not workspace[L_136_.Name].Gun.Handle.Reload.IsPlaying
							end


							local L_140_ = workspace:FindFirstChild(L_135_)
							if L_140_ and L_136_ then
								local L_143_ = L_140_:FindFirstChild("HumanoidRootPart")
								local L_144_ = L_136_.Character
								local L_145_ = L_144_:FindFirstChild("HumanoidRootPart")

								if L_143_ and L_145_ and L_136_ and L_135_ then
									-- Calculate the position behind the Murderer
									local L_146_ = Vector3.new(0, 0, 10)
									local L_147_ = L_143_.CFrame:PointToWorldSpace(L_146_)

									-- Teleport the player's character to the target position
									L_144_:SetPrimaryPartCFrame(CFrame.new(L_147_))

									-- Make the character face the Murderer
									if L_135_ then 
										L_144_:SetPrimaryPartCFrame(CFrame.new(L_147_, L_143_.Position))
										local L_148_ = workspace.CurrentCamera
										L_148_.CFrame = CFrame.new(L_148_.CFrame.Position, (L_143_.Position - Vector3.new(-0.5, 0, 1)))
									end  

									-- Simulate a click to attack the Murderer
									spawn(function()
										wait(0.5)

										local L_149_ = game:GetService("Workspace").CurrentCamera.ViewportSize.X
										local L_150_ = game:GetService("Workspace").CurrentCamera.ViewportSize.Y

										local L_151_ = L_149_ / 2
										local L_152_ = L_150_ / 2

										game:GetService("VirtualInputManager"):SendMouseButtonEvent(L_151_, L_152_, 0, true, game, 1)
										game:GetService("VirtualInputManager"):SendMouseButtonEvent(L_151_, L_152_, 0, false, game, 1)
									end)  
								end
							end
						end
					end
				end)
			until not L_18_.KillMurder.Value or not L_8_.Connected
			L_13_ = false
		end
	end
})

L_20_.Misc:AddButton({
	Title = "Kill All",
	Callback = function()
		local L_153_ = L_11_.Backpack:FindFirstChild("Knife") or L_11_.Character:FindFirstChild("Knife")
		if L_153_ and L_153_:IsA("Tool") then
			local L_154_ = L_11_.Character
			local L_155_ = L_154_:WaitForChild("Humanoid")
			L_155_:EquipTool(L_153_)

			for L_156_forvar1 = 1, 3 do
				for L_157_forvar1, L_158_forvar2 in ipairs(L_3_:GetPlayers()) do
					if L_158_forvar2 ~= L_11_ and L_158_forvar2.Character then
						local L_159_ = L_158_forvar2.Character:WaitForChild("HumanoidRootPart")
						local L_160_ = L_159_.Position

						L_9_:ClickButton1(Vector2.new())

						firetouchinterest(L_159_, L_153_.Handle, 1)
						wait(0.1)
						firetouchinterest(L_159_, L_153_.Handle, 0)
					end
				end
			end
		end
	end
})

local L_31_ = L_20_.Trap:AddToggle("TrapTrail", {
	Title = "Trap Trail",
	Default = false,
	Callback = function(L_161_arg1)
		if L_161_arg1 then
			pcall(function()

				local L_162_ = game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Inventory.Main.Perks.Items.Container.Current.Container
				local L_163_ = true
				if L_162_ then
					for L_164_forvar1, L_165_forvar2 in pairs(L_162_:GetChildren()) do
						if L_165_forvar2:IsA("Frame") and L_165_forvar2.ItemName.Label.Text == "Trap" then
							print(L_165_forvar2.ItemName.Label.Text)
							L_163_ = false 
						end
					end
				end

				if L_163_ then 
					L_15_:Notify({
						Title = 'Missing Trap',
						Content = 'Must own trap \n400 diamonds or 3K coins',
						Duration = 5
					})
					L_163_ = true 
				end 
			end)   
			repeat
				task.wait()
				local L_166_, L_167_ = pcall(function()
					local L_168_ = game.Players.LocalPlayer
					if L_168_ then
						local L_169_ = L_168_.Character and L_168_.Character:FindFirstChild("HumanoidRootPart")
						if L_169_ then
							local L_170_ = CFrame.new(L_169_.Position)
							local L_171_ = game:GetService("ReplicatedStorage")
							local L_172_ = L_171_:FindFirstChild("TrapSystem")
							if L_172_ and L_172_:FindFirstChild("PlaceTrap") then
								L_172_.PlaceTrap:InvokeServer(L_170_)
							end
						end
					end
				end)
				if not L_166_ then
					warn("An error occurred:", L_167_) -- Print the error message
				end
			until not L_18_.TrapTrail.Value or not L_8_.Connected
		end
	end
})

local L_32_ = L_20_.Trap:AddToggle("AutoTrap", {
	Title = "Trap All",
	Default = false,
	Callback = function(L_173_arg1)
		if L_173_arg1 then
			pcall(function()

				local L_174_ = game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Inventory.Main.Perks.Items.Container.Current.Container
				local L_175_ = true
				if L_174_ then
					for L_176_forvar1, L_177_forvar2 in pairs(L_174_:GetChildren()) do
						if L_177_forvar2:IsA("Frame") and L_177_forvar2.ItemName.Label.Text == "Trap" then
							print(L_177_forvar2.ItemName.Label.Text)
							L_175_ = false 
						end
					end
				end
				if L_175_ then 
					L_15_:Notify({
						Title = 'Missing Trap',
						Content = 'Must own trap \n400 diamonds or 3K coins',
						Duration = 5
					})
					L_175_ = true 
				end 
			end) 
			repeat
				task.wait()
				local L_178_, L_179_ = pcall(function()
					local L_180_ = game:GetService("ReplicatedStorage")
					local L_181_ = L_180_:FindFirstChild("TrapSystem")

					if L_181_ and L_181_:FindFirstChild("PlaceTrap") then
						local L_182_ = game.Players.LocalPlayer
						local L_183_ = game.Players:GetPlayers()

						for L_184_forvar1, L_185_forvar2 in ipairs(L_183_) do
							if L_185_forvar2 ~= L_182_ then
								local L_186_ = L_185_forvar2.Character and L_185_forvar2.Character:FindFirstChild("HumanoidRootPart")
								if L_186_ then
									local L_187_ = CFrame.new(L_186_.Position)
									L_181_.PlaceTrap:InvokeServer(L_187_)
								end
							end
						end
					end
				end)
				if not L_178_ then
					warn("An error occurred:", L_179_) -- Print the error message
				end
			until not L_18_.AutoTrap.Value or not L_8_.Connected
		end
	end
})

local L_33_ = L_20_.Trap:AddToggle("AutoDestroy", {
	Title = "Auto Destroy Traps",
	Default = false,
	Callback = function(L_188_arg1)
		if L_188_arg1 then 
			L_15_:Notify({
				Title = 'Destroy Traps',
				Content = 'This will delete traps visually [less lag]',
				Duration = 5
			})

			repeat
				task.wait()
				local L_189_, L_190_ = pcall(function()
					local L_191_ = workspace:FindFirstChild(L_11_.Name)

					if L_191_ and L_191_:IsA("Model") then
						for L_192_forvar1, L_193_forvar2 in pairs(L_191_:GetDescendants()) do
							if L_193_forvar2.Name == "Trap" then
								L_193_forvar2:Destroy()
							end
						end
					end 
				end)
			until not L_18_.AutoDestroy.Value or not L_8_.Connected
		end
	end
})


local function L_34_func(L_194_arg1)
	local L_195_ = L_10_.Character and L_10_.Character:FindFirstChild("Humanoid")
	if L_195_ then
		L_195_.WalkSpeed = L_194_arg1
	end
end

local L_35_ = L_20_.Player:AddToggle("WalkSpeed", {
	Title = "Walkspeed",
	Default = false,
	Callback = function(L_196_arg1)
		if L_196_arg1 then 
			repeat
				task.wait()  
				L_34_func(L_18_.Walk.Value)  
			until not L_18_.WalkSpeed.Value or not L_8_.Connected
			L_34_func(16)
		end
	end
})

local L_36_ = L_20_.Player:AddSlider("Walk", {
	Title = "Walk Speed",
	Default = 16,
	Min = 16,
	Max = 200,
	Rounding = 0,
	Callback = function(L_197_arg1)
	end
})

local function L_37_func(L_198_arg1)
	local L_199_ = L_10_.Character and L_10_.Character:FindFirstChild("Humanoid")
	if L_199_ then
		L_199_.JumpPower = L_198_arg1
	end
end

local L_38_ = L_20_.Player:AddToggle("JumpPower", {
	Title = "Jump Power",
	Default = false,
	Callback = function(L_200_arg1)
		if L_200_arg1 then 
			repeat
				task.wait()  
				L_37_func(L_18_.Jump.Value)  
			until not L_18_.JumpPower.Value or not L_8_.Connected
			L_37_func(50)
		end
	end
})

local L_39_ = L_20_.Player:AddSlider("Jump", {
	Title = "Jump Power",
	Default = 50,
	Min = 50,
	Max = 200,
	Rounding = 1,
	Callback = function(L_201_arg1)
	end
})
local L_40_

local L_41_ = L_20_.Player:AddToggle("InfiniteJump", {
	Title = "Infinite Jump",
	Default = false,
	Callback = function(L_202_arg1)
		if L_202_arg1 then 
			L_40_ = L_6_.JumpRequest:Connect(function()
				L_11_.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)  
			end)
			repeat
				task.wait()
			until not L_18_.InfiniteJump.Value or not L_8_.Connected
			L_40_:Disconnect()
		end
	end 
})

L_20_.Emotes:AddButton({
	Title = "Ninja",
	Callback = function()
		module:emote("ninja")
	end
})

L_20_.Emotes:AddButton({
	Title = "Dab",
	Callback = function()
		module:emote("dab")
	end
})

L_20_.Emotes:AddButton({
	Title = "Floss",
	Callback = function()
		module:emote("floss")
	end
})

L_20_.Emotes:AddButton({
	Title = "Headless",
	Callback = function()
		module:emote("headless")
	end
})

L_20_.Emotes:AddButton({
	Title = "Zen",
	Callback = function()
		module:emote("zen")
	end
})

L_20_.Emotes:AddButton({
	Title = "Zombie",
	Callback = function()
		module:emote("zombie")
	end
}) 

L_20_.Emotes:AddButton({
	Title = "Sit",
	Callback = function()
		module:emote("sit")
	end
})

local L_42_ = L_20_.Settings:AddToggle("Settings", {
	Title = "Save Settings",
	Default = false,
	Callback = function(L_203_arg1)
		if L_203_arg1 then 
			repeat
				task.wait(.1)  
				L_16_:Save(game.PlaceId)
			until not L_18_.Settings.Value or not L_8_.Connected
		end
	end
})

L_20_.Settings:AddButton({
	Title = "Delete Setting Config",
	Callback = function()
		delfile("FLORENCE/settings/"..game.PlaceId..".json")
	end  
})  

local L_43_ = L_20_.Server:AddToggle("AutoRejoin", {
	Title = "Auto Rejoin",
	Default = false,
	Callback = function(L_204_arg1)
		if L_204_arg1 then 
			L_15_:Notify({
				Title = 'Auto Rejoin',
				Content = 'You will rejoin if you are kicked or disconnected from the game',
				Duration = 5
			})
			repeat
				task.wait() 
				local L_205_, L_206_, L_207_ = game:GetService('Players').LocalPlayer, game.CoreGui.RobloxPromptGui.promptOverlay, game:GetService('TeleportService')
				L_206_.ChildAdded:connect(function(L_208_arg1)
					if L_208_arg1.Name == 'ErrorPrompt' then
						L_207_:Teleport(game.PlaceId)
						task.wait(2)
					end
				end)
			until L_18_.AutoRejoin.Value or not L_8_.Connected
		end
	end
})

local L_44_ = L_20_.Server:AddToggle("ReExecute", {
	Title = "Auto ReExecute",
	Default = false,
	Callback = function(L_209_arg1)
		if L_209_arg1 then 
			repeat
				task.wait()
				local L_210_ = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
				if L_210_ then
					L_210_('loadstring(game:HttpGet("https://raw.githubusercontent.com/13B8B/nexus/main/loadstring"))()')
				end  
			until not L_18_.ReExecute.Value or not L_8_.Connected
		end
	end 
})
L_20_.Server:AddButton({
	Title = "Rejoin-Server",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
	end
})  
L_20_.Server:AddButton({
	Title = "Server-Hop", 
	Callback = function()
		local L_211_ = game:GetService("HttpService")
		local L_212_ = game:GetService("TeleportService")
		local L_213_ = "https://games.roblox.com/v1/games/"
		local L_214_, L_215_ = game.PlaceId, game.JobId
		local L_216_ = L_213_..L_214_.."/servers/Public?sortOrder=Desc&limit=100"
		local function L_217_func(L_219_arg1)
			local L_220_ = game:HttpGet(L_216_..((L_219_arg1 and "&cursor="..L_219_arg1) or ""))
			return L_211_:JSONDecode(L_220_)
		end
		local L_218_;
		repeat
			local L_221_ = L_217_func(L_218_)
			for L_222_forvar1, L_223_forvar2 in next, L_221_.data do
				if L_223_forvar2.playing < L_223_forvar2.maxPlayers and L_223_forvar2.id ~= L_215_ then
					local L_224_, L_225_ = pcall(L_212_.TeleportToPlaceInstance, L_212_, L_214_, L_223_forvar2.id, Player)
					if L_224_ then
						break
					end
				end
			end
			L_218_ = L_221_.nextPageCursor
		until not L_218_
	end
})

local L_45_, L_46_, L_47_ = nil, nil, false

function GetMurderer()
	for L_226_forvar1, L_227_forvar2 in pairs(L_3_:GetChildren()) do 
		if L_227_forvar2.Backpack:FindFirstChild("Knife") or L_227_forvar2.Character:FindFirstChild("Knife") then
			return L_227_forvar2.Name
		end
	end   
	return nil 
end

function GetSheriff()
	for L_228_forvar1, L_229_forvar2 in pairs(L_3_:GetChildren()) do 
		if L_229_forvar2.Backpack:FindFirstChild("Gun") or (L_229_forvar2.Character and L_229_forvar2.Character:FindFirstChild("Gun")) and L_229_forvar2.Name == "Tool" then
			return L_229_forvar2.Name
		end
	end
	return nil
end

coroutine.wrap(function()
	while true do
		task.wait(.5)
		local L_230_, L_231_ = pcall(function()
			L_45_ = GetMurderer()
			L_46_ = GetSheriff()
			if L_45_ then
			end
		end)
	end
end)()

local L_48_
L_48_ = hookmetamethod(game, "__namecall", function(L_232_arg1, ...)
	local L_233_ = getnamecallmethod()
	local L_234_ = {
		...
	}
	if not checkcaller() then
		if typeof(L_232_arg1) == "Instance" then
			if L_232_arg1.Name == "ShootGun" and L_233_ == "InvokeServer" then
				if L_18_.SilentAim.Value or L_18_.KillMurder.Value or L_18_.SilentAim.Value and L_18_.KillMurder.Value then 
					if L_45_ then
						local L_235_ = workspace[tostring(L_45_)].HumanoidRootPart;
						local L_236_ = L_235_.AssemblyLinearVelocity;
						local L_237_ = L_235_.Position 
						L_234_[2] = L_237_;
					end;
				else
					return L_48_(L_232_arg1, unpack(L_234_));
				end;
			end;
		end;
	end;
	return L_48_(L_232_arg1, unpack(L_234_));
end);

local L_49_
L_49_ = hookmetamethod(game, "__namecall", function(L_238_arg1, ...)
	local L_239_ = getnamecallmethod()
	local L_240_ = {
		...
	}
	if not checkcaller() then
		if tostring(L_239_) == "InvokeServer" and tostring(L_238_arg1) == "GetChance" then
			wait(13)
			local L_241_, L_242_ = pcall(function()
				L_45_ = GetMurderer()
				L_46_ = GetSheriff()
			end)
			if not L_241_ then
				warn("Error: "..L_242_)
			end
			L_47_ = true
		end
	end
	return L_49_(L_238_arg1, unpack(L_240_))
end)

-- Set libraries and folders
L_16_:SetLibrary(L_15_)
L_17_:SetLibrary(L_15_)
L_16_:SetIgnoreIndexes({})
L_16_:IgnoreThemeSettings()
L_17_:SetFolder("FLORENCE")
L_16_:SetFolder("FLORENCE")

-- Build interface section and load the game
L_17_:BuildInterfaceSection(L_20_.Settings, L_20_.Premium)
L_16_:Load(game.PlaceId)

-- Select the first tab in the window
L_19_:SelectTab(1)
