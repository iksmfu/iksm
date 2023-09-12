local L_1_ = game:GetService("HttpService")
local L_2_ = game:GetService("TeleportService")
local L_3_ = game:GetService("Players")
local L_4_ = game:GetService("RunService")
local L_5_ = game:GetService("Workspace")
local L_6_ = game:GetService("VirtualUser")
local L_7_, L_8_ = L_3_.LocalPlayer, L_3_.LocalPlayer
local L_9_ = game.GameId
local L_10_ = "FLORENCE/SETTINGS/"..L_9_..'.txt'
local L_11_ = game:GetService("UserInputService")
local L_12_ = {} 

getgenv().settings = {}

if isfile("FLORENCE/SETTINGS/"..L_9_..'.txt') then
	local L_52_, L_53_ = pcall(function()
		getgenv().settings = game:GetService('HttpService'):JSONDecode(readfile("FLORENCE/SETTINGS/"..L_9_..'.txt'))
	end)
	if L_53_ ~= nil then
		forceServerHop()
		return
	end
end 
writefile("FLORENCE/SETTINGS/"..L_9_..'.txt', L_1_:JSONEncode(getgenv().settings))

function forceServerHop()
	local L_54_ = "https://games.roblox.com/v1/games/"
	local L_55_, L_56_ = game.PlaceId, game.JobId
	local L_57_ = L_54_..L_55_.."/servers/Public?sortOrder=Desc&limit=100"

	local function L_58_func(L_60_arg1)
		local L_61_ = game:HttpGet(L_57_..(L_60_arg1 and "&cursor="..L_60_arg1 or ""))
		return L_1_:JSONDecode(L_61_)
	end

	local L_59_
	repeat
		local L_62_ = L_58_func(L_59_)
		for L_63_forvar1, L_64_forvar2 in ipairs(L_62_.data) do
			if L_64_forvar2.playing < L_64_forvar2.maxPlayers and L_64_forvar2.id ~= L_56_ then
				local L_65_, L_66_ = pcall(L_2_.TeleportToPlaceInstance, L_2_, L_55_, L_64_forvar2.id, L_7_)
				if L_65_ then
					break
				end
			end
		end
		L_59_ = L_62_.nextPageCursor
	until not L_59_
end

local L_13_ = Instance.new("BindableEvent")
local L_14_ = L_13_.Event:Connect(function()
end)

local function L_15_func(L_67_arg1)
	return spawn(function()
		while task.wait() do
			if L_14_.Connected == true then
				local L_68_, L_69_ = pcall(function() 
					L_67_arg1()
				end)
			end
		end
	end)
end

L_15_func(function()
	for L_70_forvar1, L_71_forvar2 in pairs(getgenv().settings) do
		if L_14_.Connected == true and getgenv().settings.AutoSave == true then 
			getgenv().settings[L_70_forvar1] = L_71_forvar2
			writefile(L_10_, L_1_:JSONEncode(getgenv().settings))
		end
	end
end)

local L_16_ = loadstring(game:HttpGet("https://github.com/13B8B/nexus/releases/download/nexus/nexus.txt"))()
--[[
   premium = true
]]

local L_17_ = L_16_:CreateWindow({
	Title = "nexus ",
	"",
	SubTitle = "",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = true,
	Theme = "Dark",
})

local L_18_ = {
	Main = L_17_:AddTab({
		Title = "Main",
		Icon = "rbxassetid://10723424505"
	}),
	Misc = L_17_:AddTab({
		Title = "Misc",
		Icon = "rbxassetid://10709818534"
	}),
	Player = L_17_:AddTab({
		Title = "Player",
		Icon = "rbxassetid://10747373176"
	}),
	Emotes = L_17_:AddTab({
		Title = "Emotes",
		Icon = "rbxassetid://4335480896"
	}),
	Settings = L_17_:AddTab({
		Title = "Settings",
		Icon = "settings"
	}),
	Premium = premium == "premium" and L_17_:AddTab({
		Title = "Premium",
		Icon = "rbxassetid://10709819149"
	}),

}

local L_19_ = L_18_.Main:AddToggle("Toggle", {
	Title = "Auto Farm",
	Default = getgenv().settings.AutoFarm,
	Callback = function(L_72_arg1)
		getgenv().settings.AutoFarm = L_72_arg1
	end
})

local function L_20_func()
	for L_73_forvar1, L_74_forvar2 in pairs(workspace:GetChildren()) do
		if L_74_forvar2:FindFirstChild("CoinContainer") then
			return L_74_forvar2.CoinContainer
		elseif L_74_forvar2:FindFirstChild("Map") then
			if pcall(function()
				local L_75_ = L_74_forvar2.Map.CoinContainer
			end) then
				return L_74_forvar2.Map.CoinContainer
			end
		end
	end
	return nil
end

L_15_func(function()
	local L_76_ = L_20_func()

	if L_76_ and getgenv().settings.AutoFarm then
		local function L_77_func(L_78_arg1)
			local L_79_ = game.Players.LocalPlayer
			local L_80_ = L_79_.Character
			local L_81_ = L_80_ and L_80_:FindFirstChild("HumanoidRootPart")

			if L_81_ then

				local L_82_ = (L_81_.Position - L_78_arg1.p).Magnitude
				local L_83_ = TweenInfo.new(L_82_ / 70, Enum.EasingStyle.Linear, Enum.EasingDirection.In)

				local L_84_ = game:GetService("TweenService"):Create(L_81_, L_83_, {
					CFrame = L_78_arg1
				})
				L_84_:Play()
				L_84_.Completed:Wait()

			end
		end

		if L_76_ and game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Timer.Visible == true or game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.CashBag.Visible == true then 

			local L_85_ = math.huge
			local L_86_ = nil

			local L_87_ = game.Players.LocalPlayer
			local L_88_ = L_87_.Character
			local L_89_ = L_88_ and L_88_:FindFirstChild("HumanoidRootPart")

			local L_90_ = L_89_.Position

			for L_91_forvar1, L_92_forvar2 in pairs(L_76_:GetChildren()) do
				if L_92_forvar2.Name == 'Coin_Server' then
					local L_93_ = L_92_forvar2.Coin.Position
					local L_94_ = (L_90_ - L_93_).Magnitude

					if L_94_ < L_85_ then
						L_85_ = L_94_
						L_86_ = L_92_forvar2
					end
				end
			end

			if L_86_ then
				L_77_func(CFrame.new(L_86_.Coin.CFrame.p))

				for L_95_forvar1 = 0, 10, 1 do
					L_88_:SetPrimaryPartCFrame(L_88_.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(L_95_forvar1), 0))
					wait(0.02)
				end

				L_86_.Name = 'False_Coin'

				repeat
					wait()
				until L_86_.Name ~= 'Coin_Server'
				wait(1)
			end
		end
	end
end)

local L_21_ = L_18_.Main:AddToggle("Toggle", {
	Title = "X-RAY",
	Default = getgenv().settings.CoinChams,
	Callback = function(L_96_arg1)
		module:xray(L_96_arg1)
	end
})

local L_22_ = L_18_.Main:AddToggle("Toggle", {
	Title = "Coin Chams",
	Default = getgenv().settings.CoinChams,
	Callback = function(L_97_arg1)
		getgenv().settings.CoinChams = L_97_arg1
	end
})

L_15_func(function()
	local L_98_ = L_20_func()

	if L_98_ and getgenv().settings.CoinChams then
		for L_99_forvar1, L_100_forvar2 in pairs(L_98_:GetChildren()) do
			if L_100_forvar2.Name == 'Coin_Server' and not L_12_[L_100_forvar2] then
				local L_101_ = Instance.new("Highlight")
				L_101_.Name = "EspPareet"
				L_101_.FillTransparency = 0.5
				L_101_.FillColor = Color3.new(94 / 255, 1, 255 / 255)
				L_101_.OutlineColor = Color3.new(94 / 255, 1, 255 / 255)
				L_101_.OutlineTransparency = 0
				L_101_.Parent = L_100_forvar2.Parent
				L_12_[L_100_forvar2] = L_101_  
			end
		end
	else 
		function ClearHighlights()
			for L_102_forvar1, L_103_forvar2 in pairs(L_12_) do
				L_103_forvar2:Destroy()
			end
			L_12_ = {} 
		end  
		ClearHighlights()
	end
end)

local L_23_ = L_18_.Main:AddToggle("Toggle", {
	Title = "Player ESP",
	Default = getgenv().settings.ESP,
	Callback = function(L_104_arg1)
		getgenv().settings.ESP = L_104_arg1
	end
})

L_15_func(function()
	if not getgenv().settings.ESP then
		for L_105_forvar1, L_106_forvar2 in next, game:GetService('Players'):GetPlayers() do
			if L_106_forvar2.Name ~= game:GetService('Players').LocalPlayer.Name then
				pcall(function()
					L_106_forvar2.Character.Highlight:Destroy()
				end)
			end 
		end
	else
		local L_107_ = game:GetService("ReplicatedStorage")
		local L_108_ = L_107_:FindFirstChild("GetPlayerData", true):InvokeServer()

		function CreateHighlight()
			for L_109_forvar1, L_110_forvar2 in pairs(L_3_:GetChildren()) do
				if L_110_forvar2 ~= L_8_ and L_110_forvar2.Character and not L_110_forvar2.Character:FindFirstChild("Highlight") then
					Instance.new("Highlight", L_110_forvar2.Character)
				end
			end
		end

		function UpdateHighlights() 
			for L_111_forvar1, L_112_forvar2 in pairs(L_3_:GetChildren()) do
				local L_113_ = L_112_forvar2.Character and L_112_forvar2.Character:FindFirstChild("Highlight")
				if L_112_forvar2 ~= L_8_ and L_113_ then
					if IsAlive(L_112_forvar2) then
						if L_112_forvar2.Name == Sheriff then 		
							L_113_.FillColor = Color3.fromRGB(0, 0, 225)
						elseif L_112_forvar2.Name == Murder then 
							L_113_.FillColor = Color3.fromRGB(225, 0, 0) 
						elseif L_112_forvar2.Name == Hero and not IsAlive(L_3_:WaitForChild(Sheriff)) then
							L_113_.FillColor = Color3.fromRGB(0, 0, 225)
						else 
							L_113_.FillColor = Color3.fromRGB(76, 215, 134) 
						end
					else
						L_113_.FillColor = Color3.fromRGB(255, 255, 255)
					end
				end
			end
		end

		function IsAlive(L_114_arg1)
			local L_115_ = L_108_[L_114_arg1.Name]
			return L_115_ and not L_115_.Killed and not L_115_.Dead
		end  

		Sheriff, Murder, Hero = nil, nil, nil
		for L_116_forvar1, L_117_forvar2 in pairs(L_108_) do
			if L_117_forvar2.Role == "Murderer" then
				Murder = L_116_forvar1
			elseif L_117_forvar2.Role == 'Sheriff' then
				Sheriff = L_116_forvar1
			elseif L_117_forvar2.Role == 'Hero' then
				Hero = L_116_forvar1
			end
		end  
		if L_14_.Connected == true and getgenv().settings.ESP then 
			CreateHighlight()
			UpdateHighlights()
		end

	end
end)

local L_24_ = L_18_.Main:AddToggle("Toggle", {
	Title = "Automatically Grab Gun",
	Default = getgenv().settings.AutoGrab,
	Callback = function(L_118_arg1)
		getgenv().settings.AutoGrab = L_118_arg1
	end
})

L_15_func(function()
	local L_119_ = L_3_.LocalPlayer
	local L_120_ = L_119_.Character
	local L_121_ = L_120_:WaitForChild("HumanoidRootPart")


	local L_122_ = GetMurderer()
	local L_123_ = L_5_:FindFirstChild("GunDrop")
	local L_124_ = game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.CashBag.Visible == true

	if L_123_ and L_122_ and L_124_ and getgenv().settings.AutoGrab then
		local L_125_ = L_122_.Character
		local L_126_ = L_125_:WaitForChild("HumanoidRootPart")

		local L_127_ = L_123_.Position

		local L_128_ = (L_126_.Position - L_127_).Magnitude
		local L_129_ = game.Players.LocalPlayer

		if L_128_ > 10 then

			if game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.Timer.Visible == false then 
				local L_130_ = L_129_.Character.HumanoidRootPart.CFrame
				wait(.5)
				L_129_.Character.HumanoidRootPart.CFrame = L_123_.CFrame
				L_129_.Character.Humanoid.Jump = true
				wait(.3)
				L_129_.Character.HumanoidRootPart.CFrame = L_130_
			end  
		end
	end  
end)

local L_25_ = L_18_.Main:AddToggle("Toggle", {
	Title = "Gun Dropped Chams",
	Default = getgenv().settings.GunChams,
	Callback = function(L_131_arg1)
		getgenv().settings.GunChams = L_131_arg1
	end
})

L_15_func(function()
	local L_132_ = game:GetService("Workspace"):FindFirstChild("GunDrop")
	local L_133_ = L_132_:FindFirstChild("GunESP")

	if L_132_ and getgenv().settings.GunChams == false then
		L_133_:Destroy()  
	else 
		local L_134_ = game:GetService("Workspace"):FindFirstChild("GunDrop")

		if not L_133_ then
			L_133_ = Instance.new("Highlight")
			L_133_.Name = "GunESP"
			L_133_.FillTransparency = 0.5
			L_133_.FillColor = Color3.new(94, 1, 255)
			L_133_.OutlineColor = Color3.new(94, 1, 255)
			L_133_.OutlineTransparency = 0
			L_133_.Parent = L_134_
		end
	end
end)

local L_26_ = L_18_.Misc:AddToggle("Toggle", {
	Title = "Kill Aura",
	Default = false,
	Callback = function(L_135_arg1)
		getgenv().settings.KillAura = L_135_arg1
	end
})

L_15_func(function()
	local L_136_ = L_8_.Backpack:FindFirstChild("Knife") or L_8_.Character:FindFirstChild("Knife")
	for L_137_forvar1, L_138_forvar2 in ipairs(L_3_:GetPlayers()) do
		if L_138_forvar2 ~= L_8_ and L_138_forvar2.Character ~= nil and getgenv().settings.KillAura then
			local L_139_ = L_138_forvar2.Character.HumanoidRootPart
			local L_140_ = L_139_.Position
			local L_141_ = (L_140_ - L_8_.Character.HumanoidRootPart.Position).Magnitude
			if (L_141_ <= 25) then
				firetouchinterest(L_139_, L_136_.Handle, 1)
				firetouchinterest(L_139_, L_136_.Handle, 0)
			end
		end  
	end
end)

L_18_.Misc:AddButton({
	Title = "Kill All",
	Callback = function()
		local L_142_ = L_8_.Backpack:FindFirstChild("Knife") or L_8_.Character:FindFirstChild("Knife")
		if L_142_ and L_142_:IsA("Tool") then
			local L_143_ = L_8_.Character
			local L_144_ = L_143_:WaitForChild("Humanoid")
			L_144_:EquipTool(L_142_)

			for L_145_forvar1 = 1, 3 do
				for L_146_forvar1, L_147_forvar2 in ipairs(L_3_:GetPlayers()) do
					if L_147_forvar2 ~= L_8_ and L_147_forvar2.Character then
						local L_148_ = L_147_forvar2.Character:WaitForChild("HumanoidRootPart")
						local L_149_ = L_148_.Position

						L_6_:ClickButton1(Vector2.new())

						firetouchinterest(L_148_, L_142_.Handle, 1)
						wait(0.1)
						firetouchinterest(L_148_, L_142_.Handle, 0)
					end
				end
			end
		end
	end
})

local L_27_ = L_18_.Misc:AddToggle("Toggle", {
	Title = "Silent Aim",
	Default = false,
	Callback = function(L_150_arg1)
		getgenv().settings.SheriffAim = L_150_arg1
	end
})

local L_28_ = L_18_.Misc:AddSlider("Slider", {
	Title = "Accuracy",
	Default = getgenv().settings.GunAccuracy or 0,
	Min = 25,
	Max = 100,
	Rounding = 1,
	Callback = function(L_151_arg1)
		getgenv().settings.GunAccuracy = L_151_arg1
	end
})  

local L_29_ = L_18_.Player:AddToggle("Toggle", {
	Title = "Walkspeed",
	Default = getgenv().settings.Walkspeed or false,
	Callback = function(L_152_arg1)
		getgenv().settings.Walkspeed = L_152_arg1
	end
})

local L_30_ = L_18_.Player:AddSlider("Slider", {
	Title = "Walk Speed",
	Default = getgenv().settings.WS or 50,
	Min = 50,
	Max = 200,
	Rounding = 1,
	Callback = function(L_153_arg1)
		getgenv().settings.WS = L_153_arg1
	end
})

local function L_31_func(L_154_arg1)
	local L_155_ = L_7_.Character and L_7_.Character:FindFirstChild("Humanoid")
	if L_155_ then
		L_155_.WalkSpeed = L_154_arg1
	end
end

L_15_func(function()
	if getgenv().settings.Walkspeed then
		task.wait(.3)
		L_31_func(getgenv().settings.WS)  
	else
		L_31_func(16)
	end
end)  

local L_32_ = L_18_.Player:AddToggle("Toggle", {
	Title = "Jump Power",
	Default = getgenv().settings.JumpPower or false,
	Callback = function(L_156_arg1)
		getgenv().settings.JumpPower = L_156_arg1
	end
})

local L_33_ = L_18_.Player:AddSlider("Slider", {
	Title = "Jump Power",
	Default = getgenv().settings.JP or 50,
	Min = 50,
	Max = 200,
	Rounding = 1,
	Callback = function(L_157_arg1)
		getgenv().settings.JP = L_157_arg1
	end
})

local function L_34_func(L_158_arg1)
	local L_159_ = L_7_.Character and L_7_.Character:FindFirstChild("Humanoid")
	if L_159_ then
		L_159_.JumpPower = L_158_arg1
	end
end

L_15_func(function()
	if getgenv().settings.JumpPower then
		task.wait(.3)
		L_34_func(getgenv().settings.JP)  
	else
		L_34_func(50)
	end
end)  

local L_35_ = L_18_.Player:AddToggle("Toggle", {
	Title = "Infinite Jump",
	Default = getgenv().settings.InfiJump or false,
	Callback = function(L_160_arg1)
		getgenv().settings.InfiJump = L_160_arg1
	end
})

local L_36_
L_15_func(function()
	if getgenv().settings.InfiJump then
		wait()
		L_36_ = L_11_.JumpRequest:Connect(function()
			if L_14_.Connected then 
				L_8_.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
			end 
		end)
		repeat
			task.wait()
		until getgenv().settings.InfiJump == false or L_14_.Connected == false
	else 
		L_36_:Disconnect()
		repeat
			task.wait()
		until getgenv().settings.InfiJump == true or L_14_.Connected == false
	end
end)  

L_18_.Emotes:AddButton({
	Title = "Ninja",
	Callback = function()
		module:emote("ninja")
	end
})

L_18_.Emotes:AddButton({
	Title = "Dab",
	Callback = function()
		module:emote("dab")
	end
})

L_18_.Emotes:AddButton({
	Title = "Floss",
	Callback = function()
		module:emote("floss")
	end
})

L_18_.Emotes:AddButton({
	Title = "Headless",
	Callback = function()
		module:emote("headless")
	end
})

L_18_.Emotes:AddButton({
	Title = "Zen",
	Callback = function()
		module:emote("zen")
	end
})

L_18_.Emotes:AddButton({
	Title = "Zombie",
	Callback = function()
		module:emote("zombie")
	end
}) 

L_18_.Emotes:AddButton({
	Title = "Sit",
	Callback = function()
		module:emote("sit")
	end
})

local L_37_ = getgenv().settings.KeyBind or ""

local L_38_ = L_18_.Settings:AddKeybind("Keybind", {
	Title = "KeyBind",
	Mode = "Toggle",
	Default = L_37_,
	ChangedCallback = function(L_161_arg1)
		L_37_ = L_161_arg1.Name
		getgenv().settings.KeyBind = L_161_arg1.Name  
	end
})

game:GetService("UserInputService").InputBegan:Connect(function(L_162_arg1, L_163_arg2)
	local L_164_ = getgenv().settings.KeyBind

	if L_162_arg1.KeyCode == Enum.KeyCode.Home or L_164_ == L_162_arg1.KeyCode.Name then
		if game:GetService("Players").LocalPlayer.PlayerGui.nexus.Frame.Visible then
			L_16_:Notify({
				Title = 'Window Minimized',
				Content = 'Press '..L_164_..' to Open the UI',
				Duration = 5
			})
		end
		L_17_:Minimize() 
	end
end)

local L_39_ = L_18_.Settings:AddToggle("Toggle", {
	Title = "Auto Save Settings",
	Default = getgenv().settings.AutoSave,
	Callback = function(L_165_arg1)
		getgenv().settings.AutoSave = L_165_arg1
		writefile(L_10_, L_1_:JSONEncode(getgenv().settings))
	end
})

local L_40_ = L_18_.Settings:AddToggle("Toggle", {
	Title = "Auto Rejoin",
	Default = getgenv().settings.AutoRejoin,
	Callback = function(L_166_arg1)
		getgenv().settings.AutoRejoin = L_166_arg1
		if getgenv().settings.AutoRejoin then
			L_16_:Notify({
				Title = 'Auto Rejoin',
				Content = 'You will rejoin if you are kicked or disconnected from the game',
				Duration = 5
			})
			repeat
				task.wait()
			until game.CoreGui:FindFirstChild('RobloxPromptGui')
			local L_167_, L_168_, L_169_ = game:GetService('Players').LocalPlayer, game.CoreGui.RobloxPromptGui.promptOverlay, game:GetService('TeleportService')
			L_168_.ChildAdded:connect(function(L_170_arg1)
				if L_170_arg1.Name == 'ErrorPrompt' then
					while true do
						L_169_:Teleport(game.PlaceId)
						task.wait(2)
					end
				end
			end)
		end
	end
})

local L_41_ = L_18_.Settings:AddToggle("Toggle", {
	Title = "Auto ReExecute",
	Default = getgenv().settings.AutoExecute,
	Callback = function(L_171_arg1)
		getgenv().settings.AutoExecute = L_171_arg1
		if getgenv().settings.AutoExecute then
			local L_172_ = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
			if L_172_ then
				L_172_('loadstring(game:HttpGet("https://raw.githubusercontent.com/13B8B/NEXUS/main/loadstring"))()')
			end
		end
	end
})
L_18_.Settings:AddButton({
	Title = "Rejoin-Server",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
	end
})
L_18_.Settings:AddButton({
	Title = "Server-Hop", 
	Callback = function()
		local L_173_ = game:GetService("HttpService")
		local L_174_ = game:GetService("TeleportService")
		local L_175_ = "https://games.roblox.com/v1/games/"
		local L_176_, L_177_ = game.PlaceId, game.JobId
		local L_178_ = L_175_..L_176_.."/servers/Public?sortOrder=Desc&limit=100"
		local function L_179_func(L_181_arg1)
			local L_182_ = game:HttpGet(L_178_..((L_181_arg1 and "&cursor="..L_181_arg1) or ""))
			return L_173_:JSONDecode(L_182_)
		end
		local L_180_;
		repeat
			local L_183_ = L_179_func(L_180_)
			for L_184_forvar1, L_185_forvar2 in next, L_183_.data do
				if L_185_forvar2.playing < L_185_forvar2.maxPlayers and L_185_forvar2.id ~= L_177_ then
					local L_186_, L_187_ = pcall(L_174_.TeleportToPlaceInstance, L_174_, L_176_, L_185_forvar2.id, Player)
					if L_186_ then
						break
					end
				end
			end
			L_180_ = L_183_.nextPageCursor
		until not L_180_
	end
})

local L_42_, L_43_, L_44_ = nil, nil, false

function GetMurderer()
	for L_188_forvar1, L_189_forvar2 in pairs(L_3_:GetChildren()) do 
		if L_189_forvar2.Backpack:FindFirstChild("Knife") or L_189_forvar2.Character:FindFirstChild("Knife") then
			return L_189_forvar2.Name
		end
	end
	return nil
end

function GetSheriff()
	for L_190_forvar1, L_191_forvar2 in pairs(L_3_:GetChildren()) do 
		if L_191_forvar2.Backpack:FindFirstChild("Gun") or (L_191_forvar2.Character and L_191_forvar2.Character:FindFirstChild("Gun")) and L_191_forvar2.Name == "Tool" then
			return L_191_forvar2.Name
		end
	end
	return nil
end

coroutine.wrap(function()
	while true do
		task.wait(.5)
		local L_192_, L_193_ = pcall(function()
			L_42_ = GetMurderer()
			L_43_ = GetSheriff()
			if L_42_ then
			end
		end)
	end
end)()

task.spawn(function()
	while wait() do 
		if premium == "premium" then
			game.Players:Chat("nexus-premium")
			wait(10)
		else
			game.Players:Chat("nexus-is-back")
			wait(10)
		end
	end
end)

local L_45_
L_45_ = hookmetamethod(game, "__namecall", function(L_194_arg1, ...)
	local L_195_ = getnamecallmethod()
	local L_196_ = {
		...
	}
	if not checkcaller() then
		if typeof(L_194_arg1) == "Instance" then
			if L_194_arg1.Name == "ShootGun" and L_195_ == "InvokeServer" then
				if getgenv().settings.SheriffAim and getgenv().settings.GunAccuracy then 
					if L_42_ then
						local L_197_ = workspace[tostring(L_42_)].HumanoidRootPart;
						local L_198_ = L_197_.AssemblyLinearVelocity;
						local L_199_ = L_197_.Position 
						L_196_[2] = L_199_;
					end;
				else
					return L_45_(L_194_arg1, unpack(L_196_));
				end;
			end;
		end;
	end;
	return L_45_(L_194_arg1, unpack(L_196_));
end);

local L_46_
L_46_ = hookmetamethod(game, "__namecall", function(L_200_arg1, ...)
	local L_201_ = getnamecallmethod()
	local L_202_ = {
		...
	}
	if not checkcaller() then
		if tostring(L_201_) == "InvokeServer" and tostring(L_200_arg1) == "GetChance" then
			wait(13)
			local L_203_, L_204_ = pcall(function()
				L_42_ = GetMurderer()
				L_43_ = GetSheriff()
			end)
			if not L_203_ then
				warn("Error: "..L_204_)
			end
			L_44_ = true
		end
	end
	return L_46_(L_200_arg1, unpack(L_202_))
end)

spawn(function()
	while wait() do
		if getgenv().Disconnect == true then
			wait(1)
			L_14_:Disconnect()
			getgenv().Disconnect = false
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			for L_205_forvar1, L_206_forvar2 in next, game:GetService('Players'):GetPlayers() do
				if L_206_forvar2.Name ~= game:GetService('Players').LocalPlayer.Name then
					pcall(function()
						L_206_forvar2.Character.Highlight:Destroy()
					end)
				end 
			end
			return
		else  
			L_13_:Fire()
		end
	end
end)  

----------// PREMIUM \\----------
Tab = premium == "premium" and L_18_.Premium:AddButton({
	Title = "Kick",
	Callback = function()
		game.Players:Chat(".k "..getgenv().Selected)
	end 
})
Tab = premium == "premium" and L_18_.Premium:AddButton({
	Title = "Kill",
	Callback = function()
		game.Players:Chat(". "..getgenv().Selected)
	end
})
Tab = premium == "premium" and L_18_.Premium:AddButton({
	Title = "Teleport",
	Callback = function()
		game.Players:Chat(".b "..getgenv().Selected)
	end
})
Tab = premium == "premium" and L_18_.Premium:AddButton({
	Title = "Shut Game Down",
	Callback = function()
		game.Players:Chat(".s "..getgenv().Selected)
	end
})
Tab = premium == "premium" and L_18_.Premium:AddButton({
	Title = "Freeze",
	Callback = function()
		game.Players:Chat("- "..getgenv().Selected)
	end
})
Tab = premium == "premium" and L_18_.Premium:AddButton({
	Title = "Unfreeze",
	Callback = function()
		game.Players:Chat(".u "..getgenv().Selected)
	end
})

task.spawn(function()
	while task.wait() do 
		local L_207_ = game:GetService("Players")
		local L_208_ = game:GetService("TextChatService")
		local L_209_ = L_207_.LocalPlayer
		local L_210_ = L_209_.Name:gsub("_", "")

		for L_211_forvar1, L_212_forvar2 in ipairs(L_207_:GetPlayers()) do
			L_212_forvar2.Chatted:Connect(function(L_213_arg1)
				local L_214_, L_215_ = pcall(function()
					local L_216_ = L_213_arg1:gsub("_", "")
					if L_216_ == ".k "..L_210_ then
						game.Players.LocalPlayer:kick("nexus-premium user has kicked you")
					elseif L_216_ == ". "..L_210_ then
						game.Players.LocalPlayer.Character.Humanoid.Health = 0
					elseif L_216_ == ".b "..L_210_ then
						game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = game.Players[L_212_forvar2.Name].Character.HumanoidRootPart.CFrame
					elseif L_216_ == ".s "..L_210_ then
						game:Shutdown()
					elseif L_216_ == "- "..L_210_ then
						game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
					elseif L_216_ == ".u "..L_210_ then
						game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false    
					end  
				end)
			end) 
		end
	end 
end)

local L_47_ = {}
local L_48_ = {} 
local L_49_

local function L_50_func()
	if L_49_ then
		L_49_:SetValues(L_47_)
	end
end
local function L_51_func(L_217_arg1)
	for L_218_forvar1, L_219_forvar2 in ipairs(L_47_) do
		if L_219_forvar2 == L_217_arg1.Name then
			table.remove(L_47_, L_218_forvar1)
			L_48_[L_217_arg1] = nil
			L_50_func()
			break
		end
	end
end

game.Players.PlayerRemoving:Connect(function(L_220_arg1)
	L_51_func(L_220_arg1)
end)

task.spawn(function()
	while wait() do 
		for L_221_forvar1, L_222_forvar2 in ipairs(game.Players:GetPlayers()) do
			L_222_forvar2.Chatted:Connect(function(L_223_arg1)
				if L_223_arg1 == "nexus-is-back" and not L_48_[L_222_forvar2] then
					if not table.find(L_47_, L_222_forvar2.Name) and L_222_forvar2 ~= game.Players.LocalPlayer then
						local L_224_ = L_222_forvar2.Name:gsub("_", "")
						table.insert(L_47_, L_224_)
						print("Detected:", L_224_)
						L_48_[L_222_forvar2] = true  
						L_50_func() 
					end
				end  
			end) 
		end
	end
end)

L_49_ = premium == "premium" and L_18_.Premium:AddDropdown("Dropdown", {
	Title = "Select Nexus User",
	Values = L_47_, 
	Multi = false,
	Default = "",
	Callback = function(L_225_arg1)
		getgenv().Selected = L_225_arg1
	end
})

L_17_:SelectTab(1)
