local L_1_ = game:GetService("HttpService")
local L_2_ = game:GetService("TeleportService")
local L_3_ = Instance.new("BindableEvent")
local L_4_ = L_3_.Event:Connect(function()
end)
local L_5_ = game.ReplicatedStorage
local L_6_ = game:GetService("Players")
local L_7_ = game:GetService("RunService")
local L_8_ = game:GetService("Workspace").areaCircles
local L_9_, L_10_ = pcall(function() 
	workspace.raceMaps.Magma.Name = "Magma Race"
	workspace.raceMaps.Desert.Name = "Desert Race"
	workspace.raceMaps.Grassland.Name = "Grass Race"
end)  
local L_11_ = {
	{
		position = Vector3.new(-9684.84, 55.6854, 3093.3),
		name = "City"
	},
	{
		position = Vector3.new(-13097, 213.621, 5913.35),
		name = "Legends Highway"
	},
	{
		position = Vector3.new(-11053.1, 213.621, 4904.36),
		name = "Magma City"
	},
	{
		position = Vector3.new(-11040.2539, 55.6208916, 4068.81079),
		name = "Snow City"
	}
}
if L_8_ then
	for L_38_forvar1, L_39_forvar2 in ipairs(L_8_:GetDescendants()) do
		if L_39_forvar2.Name == "areaCircle" then
			local L_40_ = L_39_forvar2:FindFirstChild("circleOuter")
			if L_40_ then
				for L_41_forvar1, L_42_forvar2 in ipairs(L_11_) do
					local L_43_ = (L_40_.Position - L_42_forvar2.position).Magnitude
					if L_43_ <= 50 then
						L_40_.Parent.Name = L_42_forvar2.name
					end
				end
			end
		end
	end
end

local L_12_ = {}
do
	L_12_.Folder = "FLORENCE"
	L_12_.Ignore = {}
	L_12_.Parser = {
		Toggle = {
			Save = function(L_44_arg1, L_45_arg2) 
				return {
					type = "Toggle",
					idx = L_44_arg1,
					value = L_45_arg2.Value
				} 
			end,
			Load = function(L_46_arg1, L_47_arg2)
				if L_12_.Options[L_46_arg1] then 
					L_12_.Options[L_46_arg1]:SetValue(L_47_arg2.value)
				end
			end,
		},
		Slider = {
			Save = function(L_48_arg1, L_49_arg2)
				return {
					type = "Slider",
					idx = L_48_arg1,
					value = tostring(L_49_arg2.Value)
				}
			end,
			Load = function(L_50_arg1, L_51_arg2)
				if L_12_.Options[L_50_arg1] then 
					L_12_.Options[L_50_arg1]:SetValue(L_51_arg2.value)
				end
			end,
		},
		Dropdown = {
			Save = function(L_52_arg1, L_53_arg2)
				return {
					type = "Dropdown",
					idx = L_52_arg1,
					value = L_53_arg2.Value,
					mutli = L_53_arg2.Multi
				}
			end,
			Load = function(L_54_arg1, L_55_arg2)
				if L_12_.Options[L_54_arg1] then 
					L_12_.Options[L_54_arg1]:SetValue(L_55_arg2.value)
				end
			end,
		},
		Colorpicker = {
			Save = function(L_56_arg1, L_57_arg2)
				return {
					type = "Colorpicker",
					idx = L_56_arg1,
					value = L_57_arg2.Value:ToHex(),
					transparency = L_57_arg2.Transparency
				}
			end,
			Load = function(L_58_arg1, L_59_arg2)
				if L_12_.Options[L_58_arg1] then 
					L_12_.Options[L_58_arg1]:SetValueRGB(Color3.fromHex(L_59_arg2.value), L_59_arg2.transparency)
				end
			end,
		},
		Keybind = {
			Save = function(L_60_arg1, L_61_arg2)
				return {
					type = "Keybind",
					idx = L_60_arg1,
					mode = L_61_arg2.Mode,
					key = L_61_arg2.Value
				}
			end,
			Load = function(L_62_arg1, L_63_arg2)
				if L_12_.Options[L_62_arg1] then 
					L_12_.Options[L_62_arg1]:SetValue(L_63_arg2.key, L_63_arg2.mode)
				end
			end,
		},

		Input = {
			Save = function(L_64_arg1, L_65_arg2)
				return {
					type = "Input",
					idx = L_64_arg1,
					text = L_65_arg2.Value
				}
			end,
			Load = function(L_66_arg1, L_67_arg2)
				if L_12_.Options[L_66_arg1] and type(L_67_arg2.text) == "string" then
					L_12_.Options[L_66_arg1]:SetValue(L_67_arg2.text)
				end
			end,
		},
	}

	function L_12_:SetIgnoreIndexes(L_68_arg1)
		for L_69_forvar1, L_70_forvar2 in next, L_68_arg1 do
			self.Ignore[L_70_forvar2] = true
		end
	end

	function L_12_:SetFolder(L_71_arg1)
		self.Folder = L_71_arg1;
		self:BuildFolderTree()
	end

	function L_12_:Save(L_72_arg1)
		if (not L_72_arg1) then
			return false, "no config file is selected"
		end

		local L_73_ = self.Folder.."/settings/"..L_72_arg1..".json"

		local L_74_ = {
			objects = {}
		}

		for L_77_forvar1, L_78_forvar2 in next, L_12_.Options do
			if not self.Parser[L_78_forvar2.Type] then
				continue
			end
			if self.Ignore[L_77_forvar1] then
				continue
			end

			table.insert(L_74_.objects, self.Parser[L_78_forvar2.Type].Save(L_77_forvar1, L_78_forvar2))
		end	

		local L_75_, L_76_ = pcall(L_1_.JSONEncode, L_1_, L_74_)
		if not L_75_ then
			return false, "failed to encode data"
		end

		writefile(L_73_, L_76_)
		return true
	end

	function L_12_:Load(L_79_arg1)
		if (not L_79_arg1) then
			return false, "no config file is selected"
		end

		local L_80_ = self.Folder.."/settings/"..L_79_arg1..".json"
		if not isfile(L_80_) then
			return false, "invalid file"
		end

		local L_81_, L_82_ = pcall(L_1_.JSONDecode, L_1_, readfile(L_80_))
		if not L_81_ then
			return false, "decode error"
		end

		for L_83_forvar1, L_84_forvar2 in next, L_82_.objects do
			if self.Parser[L_84_forvar2.type] then
				task.spawn(function()
					self.Parser[L_84_forvar2.type].Load(L_84_forvar2.idx, L_84_forvar2)
				end)
			end
		end

		return true
	end

	function L_12_:IgnoreThemeSettings()
		self:SetIgnoreIndexes({ 
			"InterfaceTheme",
			"AcrylicToggle",
			"TransparentToggle",
			"MenuKeybind"
		})
	end

	function L_12_:BuildFolderTree()
		local L_85_ = {
			self.Folder,
			self.Folder.."/settings"
		}

		for L_86_forvar1 = 1, #L_85_ do
			local L_87_ = L_85_[L_86_forvar1]
			if not isfolder(L_87_) then
				makefolder(L_87_)
			end
		end
	end

	function L_12_:SetLibrary(L_88_arg1)
		self.Library = L_88_arg1
		self.Options = L_88_arg1.Options
	end

	L_12_:BuildFolderTree()
end

spawn(function()
	while wait() do
		if getgenv().Disconnect == true then
			wait(1)
			L_4_:Disconnect()
			getgenv().Disconnect = false
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			return
		else  
			L_3_:Fire()
		end
	end  
end)  

local function L_13_func()
	local L_89_ = "https://tryhardguides.com/legends-of-speed-codes"
	local L_90_ = game:HttpGet(L_89_)
	local L_91_ = {}

	for L_92_forvar1 in string.gmatch(L_90_, "<ul>(.-)</ul>") do
		for L_93_forvar1 in string.gmatch(L_92_forvar1, "<li>(.-)</li>") do
			for L_94_forvar1 in string.gmatch(L_93_forvar1, "<strong>([^<]+)</strong>") do
				table.insert(L_91_, L_94_forvar1)
			end
		end
	end

	for L_95_forvar1, L_96_forvar2 in ipairs(L_91_) do
		local L_97_ = {
			[1] = L_96_forvar2
		}
		game:GetService("ReplicatedStorage").rEvents.codeRemote:InvokeServer(unpack(L_97_))
	end 
end

local L_14_ = loadstring(game:HttpGet("https://github.com/13B8B/nexus/releases/download/nexus/nexus.txt"))()
local L_15_ = L_14_.Options
L_12_:SetLibrary(L_14_)

local L_16_ = L_14_:CreateWindow({
	Title = "nexus ",
	"",
	SubTitle = "",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = true,
	Theme = "Dark",
})

local L_17_ = {
	Main = L_16_:AddTab({
		Title = "Main",
		Icon = "rbxassetid://13075651575"
	}),
	-- Misc = Window:AddTab({
	--    Title = "Misc",
	--    Icon = "rbxassetid://10709818534"
	--}),
	Egg = L_16_:AddTab({
		Title = "Egg",
		Icon = "rbxassetid://10723345518"
	}),
	Server = L_16_:AddTab({
		Title = "Server",
		Icon = "rbxassetid://10734949856"
	}),
	Premium = premium == "premium" and L_16_:AddTab({
		Title = "Premium",
		Icon = "rbxassetid://10709819149"
	}),
	Settings = L_16_:AddTab({
		Title = "Settings",
		Icon = "rbxassetid://10734950020"
	}),
}
local function L_18_func(L_98_arg1, L_99_arg2, L_100_arg3)
	L_17_.Main:AddToggle(L_99_arg2, {
		Title = L_98_arg1,
		CurrentValue = false,
		Callback = function(L_101_arg1)
			if L_101_arg1 then 
				repeat
					task.wait()
					if L_15_[L_99_arg2].Value then
						local L_102_ = game:GetService("Players").LocalPlayer
						if L_102_.leaderstats.Rebirths.Value < L_100_arg3 then
							L_14_:Notify({
								Title = 'Notification',
								Content = "You need at least "..L_100_arg3.." rebirths to auto farm "..L_98_arg1,
								Duration = 5
							})
							repeat
								task.wait()
							until not L_15_[L_99_arg2].Value or L_102_.leaderstats.Rebirths.Value > L_100_arg3
						else
							if game:GetService("Players").LocalPlayer.currentMap.Value ~= L_99_arg2 then
								local L_103_ = game:GetService("Players").LocalPlayer.currentMap.Value
								if L_103_ ~= "Magma Race" and L_103_ ~= "Grass Race" and L_103_ ~= "Desert Race" then
									game:GetService("ReplicatedStorage").rEvents.areaTravelRemote:InvokeServer("travelToArea", workspace.areaCircles[L_99_arg2])
								end								
							end
							if L_15_.AutoGems.Value then
								spawn(function()
									for L_104_forvar1 = 1, 4 do
										task.wait()
										game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Gem", L_99_arg2)
										game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Red Orb", L_99_arg2)
									end 
								end)
							end  
							if not L_15_.AutoGems.Value then 
								spawn(function()
									for L_105_forvar1 = 1, 4 do
										task.wait()
										game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Red Orb", L_99_arg2)
									end
								end)               
							end  
						end
					end
				until not L_15_[L_99_arg2].Value or not L_4_.Connected
			end
		end,
	})
end

L_18_func("Auto Farm City", "City", 0)
L_18_func("Auto Farm Snow City", "Snow City", 0)
L_18_func("Auto Farm Magma City", "Magma City", 1)
L_18_func("Auto Farm Legends Highway", "Legends Highway", 10)

local L_19_ = L_17_.Main:AddToggle("AutoGems", {
	Title = "Auto Farm Gems",
	Default = false,
	Callback = function(L_106_arg1)
	end
})

local L_20_ = L_17_.Main:AddToggle("AutoRebirth", {
	Title = "Auto Rebirth",
	Default = false,
	Callback = function(L_107_arg1)
		if L_107_arg1 then
			repeat
				task.wait(0.1)
				local L_108_ = game:GetService("Players").LocalPlayer:FindFirstChildOfClass("PlayerGui")
				if L_108_ and L_108_:FindFirstChild("gameGui") and L_108_.gameGui.statsFrame.levelLabel.maxLabel.Visible then
					game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
				end
			until not L_15_.AutoRebirth.Value or not L_4_.Connected
		end
	end
})

local L_21_ = L_17_.Main:AddToggle("AutoHoop", {
	Title = "Auto Hoops",
	Default = false,
	Callback = function(L_109_arg1)
		if L_109_arg1 then 
			repeat
				wait(1)  
				for L_110_forvar1, L_111_forvar2 in pairs(game.Workspace.Hoops:GetChildren()) do
					if L_111_forvar2.Name == 'Hoop' then
						firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), L_111_forvar2, 0)
						firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), L_111_forvar2, 1)
					end
				end
			until not L_15_.AutoHoop.Value or not L_4_.Connected
		end  
	end
})

local L_22_ = L_17_.Main:AddToggle("AutoRace", {
	Title = "Auto Race",
	Default = false,
	Callback = function(L_112_arg1)
		if L_112_arg1 then 
			repeat
				task.wait(1)  
				local L_113_, L_114_ = pcall(function() 
					if game:GetService("Players").LocalPlayer.PlayerGui.gameGui.raceJoinLabel.Visible == true then 
						game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace")
						wait(.5)  
						local L_115_ = game:GetService("Players")
						local L_116_ = L_115_.LocalPlayer
						local L_117_ = L_116_.currentMap.Value
						repeat
							task.wait()
						until workspace.raceMaps[L_117_].boundaryParts.boundaryPart.CanCollide == false
						for L_118_forvar1, L_119_forvar2 in pairs(game:GetService("Workspace").raceMaps:GetDescendants()) do
							if L_119_forvar2:IsA("TouchTransmitter") and L_119_forvar2.Parent.Name == "finishPart" then
								L_116_.Character.HumanoidRootPart.CFrame = CFrame.new(L_119_forvar2.Parent.Position) * CFrame.new(-40, -30, 0) 
							end 
						end
					end  
				end)
			until not L_15_.AutoRace.Value or not L_4_.Connected
		end  
	end
})

local L_23_ = L_17_.Egg:AddToggle("AutoHatch", {
	Title = "Auto Hatch",
	Default = false,
	Callback = function(L_120_arg1)
		if L_120_arg1 then 
			repeat
				task.wait(.1)  
				game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer("openCrystal", L_15_.SelectCrystal.Value)
			until not L_15_.AutoHatch.Value or not L_4_.Connected
		end  
	end
})

local L_24_ = L_17_.Egg:AddDropdown("SelectCrystal", {
	Title = "Select Crystal",
	Values = {
		"Red Crystal",
		"Blue Crystal",
		"Purple Crystal",
		"Yellow Crystal",
		"Lightning Crystal",
		"Snow Crystal",
		"Inferno Crystal",
		"Lava Crystal",
		"Electro Legends Crystal"
	},
	Multi = false,
	Default = false,
	Callback = function(L_121_arg1)
	end
})

local L_25_ = L_17_.Egg:AddToggle("AutoEvolve", {
	Title = "Auto Evolve Pets",
	Default = false,
	Callback = function(L_122_arg1)
		if L_122_arg1 then 
			repeat
				task.wait(1)  
				for L_123_forvar1, L_124_forvar2 in ipairs(game:GetService("ReplicatedStorage").cPetShopFolder:GetChildren()) do
					game:GetService("ReplicatedStorage").rEvents.petEvolveEvent:FireServer("evolvePet", L_124_forvar2.Name)
				end   
			until not L_15_.AutoEvolve.Value or not L_4_.Connected
		end  
	end
})

local L_26_ = L_17_.Egg:AddToggle("AutoDelete", {
	Title = "Auto Delete Bad Pets",
	Default = false,
	Callback = function(L_125_arg1)
		if L_125_arg1 then 
			repeat
				task.wait(1)  
				local L_126_ = {
					game:GetService("Players").LocalPlayer.petsFolder.Advanced,
					game:GetService("Players").LocalPlayer.petsFolder.Rare,
					game:GetService("Players").LocalPlayer.petsFolder.Basic,
					game:GetService("Players").LocalPlayer.petsFolder.Epic,
					game:GetService("Players").LocalPlayer.petsFolder.Unique,
					game:GetService("Players").LocalPlayer.petsFolder.Omega
				}
				for L_127_forvar1, L_128_forvar2 in ipairs(L_126_) do
					if L_128_forvar2 ~= nil then
						for L_129_forvar1, L_130_forvar2 in ipairs(L_128_forvar2:GetChildren()) do
							if L_128_forvar2 ~= game:GetService("Players").LocalPlayer.petsFolder.Omega or L_130_forvar2.Name ~= "Ultimate Overdrive Bunny" then
								game:GetService("ReplicatedStorage").rEvents.sellPetEvent:FireServer("sellPet", L_130_forvar2)
							end
						end
					end
				end
			until not L_15_.AutoDelete.Value or not L_4_.Connected
		end  
	end
})

local L_27_ = L_17_.Egg:AddToggle("AutoDeleteTrails", {
	Title = "Auto Delete Bad Trails",
	Default = false,
	Callback = function(L_131_arg1)
		if L_131_arg1 then 
			repeat
				task.wait(1)  
				local L_132_ = game:GetService("Players").LocalPlayer.trailsFolder.Unique
				if L_132_ ~= nil then
					for L_134_forvar1, L_135_forvar2 in ipairs(L_132_:GetChildren()) do
						if L_135_forvar2.Name ~= "Rainbow Steps" then
							game:GetService("ReplicatedStorage").rEvents.sellTrailEvent:FireServer("sellTrail", L_135_forvar2)
						end
					end
				end
				local L_133_ = {
					game:GetService("Players").LocalPlayer.trailsFolder.Epic,
					game:GetService("Players").LocalPlayer.trailsFolder.Basic,
					game:GetService("Players").LocalPlayer.trailsFolder.Rare,
					game:GetService("Players").LocalPlayer.trailsFolder.Advanced
				}
				for L_136_forvar1, L_137_forvar2 in ipairs(L_133_) do
					if L_137_forvar2 ~= nil then
						for L_138_forvar1, L_139_forvar2 in ipairs(L_137_forvar2:GetChildren()) do
							game:GetService("ReplicatedStorage").rEvents.sellTrailEvent:FireServer("sellTrail", L_139_forvar2)
						end
					end
				end
			until not L_15_.AutoDeleteTrails.Value or not L_4_.Connected
		end  
	end
})

local L_28_ = L_17_.Settings:AddToggle("Settings", {
	Title = "Save Settings",
	Default = false,
	Callback = function(L_140_arg1)
		if L_140_arg1 then 
			repeat
				task.wait()  
				L_12_:Save(game.GameId)
			until not L_15_.Settings.Value or not L_4_.Connected
		end
	end
})

L_17_.Settings:AddButton({
	Title = "Delete Setting Config",
	Callback = function()
		delfile("FLORENCE/settings/"..game.GameId..".json")
	end  
})  

local L_29_ = L_17_.Server:AddToggle("AutoRejoin", {
	Title = "Auto Rejoin",
	Default = false,
	Callback = function(L_141_arg1)
		if L_141_arg1 then 
			L_14_:Notify({
				Title = 'Auto Rejoin',
				Content = 'You will rejoin if you are kicked or disconnected from the game',
				Duration = 5
			})
			repeat
				task.wait() 
				local L_142_, L_143_, L_144_ = game:GetService('Players').LocalPlayer, game.CoreGui.RobloxPromptGui.promptOverlay, game:GetService('TeleportService')
				L_143_.ChildAdded:connect(function(L_145_arg1)
					if L_145_arg1.Name == 'ErrorPrompt' then
						L_144_:Teleport(game.PlaceId)
						task.wait(2)
					end
				end)
			until L_15_.AutoRejoin.Value or not L_4_.Connected
		end
	end
})

local L_30_ = L_17_.Server:AddToggle("ReExecute", {
	Title = "Auto ReExecute",
	Default = false,
	Callback = function(L_146_arg1)
		if L_146_arg1 then 
			repeat
				task.wait()
				local L_147_ = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
				if L_147_ then
					L_147_('loadstring(game:HttpGet("https://raw.githubusercontent.com/13B8B/nexus/main/loadstring"))()')
				end  
			until not L_15_.ReExecute.Value or not L_4_.Connected
		end
	end 
})
L_17_.Server:AddButton({
	Title = "Redeem Codes",
	Callback = function()
		L_13_func()
	end
})
L_17_.Server:AddButton({
	Title = "Rejoin-Server",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
	end
})  
L_17_.Server:AddButton({
	Title = "Server-Hop", 
	Callback = function()
		local L_148_ = game:GetService("HttpService")
		local L_149_ = game:GetService("TeleportService")
		local L_150_ = "https://games.roblox.com/v1/games/"
		local L_151_, L_152_ = game.PlaceId, game.JobId
		local L_153_ = L_150_..L_151_.."/servers/Public?sortOrder=Desc&limit=100"
		local function L_154_func(L_156_arg1)
			local L_157_ = game:HttpGet(L_153_..((L_156_arg1 and "&cursor="..L_156_arg1) or ""))
			return L_148_:JSONDecode(L_157_)
		end
		local L_155_;
		repeat
			local L_158_ = L_154_func(L_155_)
			for L_159_forvar1, L_160_forvar2 in next, L_158_.data do
				if L_160_forvar2.playing < L_160_forvar2.maxPlayers and L_160_forvar2.id ~= L_152_ then
					local L_161_, L_162_ = pcall(L_149_.TeleportToPlaceInstance, L_149_, L_151_, L_160_forvar2.id, Player)
					if L_161_ then
						break
					end
				end
			end
			L_155_ = L_158_.nextPageCursor
		until not L_155_
	end
})

local L_31_ = game:GetService("HttpService")

local L_32_ = {}
do
	L_32_.Folder = "FLORENCE"
	L_32_.Settings = {
		Theme = "Dark",
		Acrylic = true,
		Transparency = true,
		MenuKeybind = "LeftControl"
	}

	function L_32_:SetFolder(L_163_arg1)
		self.Folder = L_163_arg1;
		self:BuildFolderTree()
	end

	function L_32_:SetLibrary(L_164_arg1)
		self.Library = L_164_arg1
	end

	function L_32_:BuildFolderTree()
		local L_165_ = {}

		local L_166_ = self.Folder:split("/")
		for L_167_forvar1 = 1, #L_166_ do
			L_165_[#L_165_ + 1] = table.concat(L_166_, "/", 1, L_167_forvar1)
		end

		table.insert(L_165_, self.Folder)
		table.insert(L_165_, self.Folder.."/settings")

		for L_168_forvar1 = 1, #L_165_ do
			local L_169_ = L_165_[L_168_forvar1]
			if not isfolder(L_169_) then
				makefolder(L_169_)
			end
		end
	end

	function L_32_:SaveSettings()
		writefile(self.Folder.."/options.json", L_31_:JSONEncode(L_32_.Settings))
	end

	function L_32_:LoadSettings()
		local L_170_ = self.Folder.."/options.json"
		if isfile(L_170_) then
			local L_171_ = readfile(L_170_)
			local L_172_, L_173_ = pcall(L_31_.JSONDecode, L_31_, L_171_)

			if L_172_ then
				for L_174_forvar1, L_175_forvar2 in next, L_173_ do
					L_32_.Settings[L_174_forvar1] = L_175_forvar2
				end
			end
		end
	end

	function L_32_:BuildInterfaceSection(L_176_arg1)
		assert(self.Library, "Must set InterfaceManager.Library")
		local L_177_ = self.Library
		local L_178_ = L_32_.Settings

		L_32_:LoadSettings()

		local L_179_ = L_176_arg1:AddSection("Interface")

		local L_180_ = L_179_:AddDropdown("InterfaceTheme", {
			Title = "Theme",
			Description = "Changes the interface theme.",
			Values = L_177_.Themes,
			Default = L_178_.Theme,
			Callback = function(L_182_arg1)
				L_177_:SetTheme(L_182_arg1)
				L_178_.Theme = L_182_arg1
				L_32_:SaveSettings()
			end
		})

		L_180_:SetValue(L_178_.Theme)

		if L_177_.UseAcrylic then
			L_179_:AddToggle("AcrylicToggle", {
				Title = "Acrylic",
				Description = "The blurred background requires graphic quality 8+",
				Default = L_178_.Acrylic,
				Callback = function(L_183_arg1)
					L_177_:ToggleAcrylic(L_183_arg1)
					L_178_.Acrylic = L_183_arg1
					L_32_:SaveSettings()
				end
			})
		end

		L_179_:AddToggle("TransparentToggle", {
			Title = "Transparency",
			Description = "Makes the interface transparent.",
			Default = L_178_.Transparency,
			Callback = function(L_184_arg1)
				L_177_:ToggleTransparency(L_184_arg1)
				L_178_.Transparency = L_184_arg1
				L_32_:SaveSettings()
			end
		})

		local L_181_ = L_179_:AddKeybind("MenuKeybind", {
			Title = "Minimize Bind",
			Default = L_178_.MenuKeybind
		})
		L_181_:OnChanged(function()
			L_178_.MenuKeybind = L_181_.Value
			L_32_:SaveSettings()
		end)
		L_177_.MinimizeKeybind = L_181_
	end
end

L_32_:SetLibrary(L_14_)
L_32_:SetFolder("FLORENCE")
L_32_:BuildInterfaceSection(L_17_.Settings)

L_12_:Load(game.GameId)

----------// PREMIUM \\----------
Tab = premium == "premium" and L_17_.Premium:AddButton({
	Title = "Kick",
	Callback = function()
		game.Players:Chat(".k "..getgenv().Selected)
	end 
})
Tab = premium == "premium" and L_17_.Premium:AddButton({
	Title = "Kill",
	Callback = function()
		game.Players:Chat(". "..getgenv().Selected)
	end
})
Tab = premium == "premium" and L_17_.Premium:AddButton({
	Title = "Teleport",
	Callback = function()
		game.Players:Chat(".b "..getgenv().Selected)
	end
})
Tab = premium == "premium" and L_17_.Premium:AddButton({
	Title = "Shut Game Down",
	Callback = function()
		game.Players:Chat(".s "..getgenv().Selected)
	end
})
Tab = premium == "premium" and L_17_.Premium:AddButton({
	Title = "Freeze",
	Callback = function()
		game.Players:Chat("- "..getgenv().Selected)
	end
})
Tab = premium == "premium" and L_17_.Premium:AddButton({
	Title = "Unfreeze",
	Callback = function()
		game.Players:Chat(".u "..getgenv().Selected)
	end
})

task.spawn(function()
	while task.wait() do 
		local L_185_ = game:GetService("Players")
		local L_186_ = game:GetService("TextChatService")
		local L_187_ = L_185_.LocalPlayer
		local L_188_ = L_187_.Name:gsub("_", "")

		for L_189_forvar1, L_190_forvar2 in ipairs(L_185_:GetPlayers()) do
			L_190_forvar2.Chatted:Connect(function(L_191_arg1)
				local L_192_, L_193_ = pcall(function()
					local L_194_ = L_191_arg1:gsub("_", "")
					if L_194_ == ".k "..L_188_ then
						game.Players.LocalPlayer:kick("nexus-premium user has kicked you")
					elseif L_194_ == ". "..L_188_ then
						game.Players.LocalPlayer.Character.Humanoid.Health = 0
					elseif L_194_ == ".b "..L_188_ then
						game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = game.Players[L_190_forvar2.Name].Character.HumanoidRootPart.CFrame
					elseif L_194_ == ".s "..L_188_ then
						game:Shutdown()
					elseif L_194_ == "- "..L_188_ then
						game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
					elseif L_194_ == ".u "..L_188_ then
						game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false    
					end  
				end)
			end) 
		end
	end 
end)

local L_33_ = {}
local L_34_ = {} 
local L_35_

local function L_36_func()
	if L_35_ then
		L_35_:SetValues(L_33_)
	end
end
local function L_37_func(L_195_arg1)
	for L_196_forvar1, L_197_forvar2 in ipairs(L_33_) do
		if L_197_forvar2 == L_195_arg1.Name then
			table.remove(L_33_, L_196_forvar1)
			L_34_[L_195_arg1] = nil
			L_36_func()
			break
		end
	end
end

game.Players.PlayerRemoving:Connect(function(L_198_arg1)
	L_37_func(L_198_arg1)
end)

task.spawn(function()
	while wait() do 
		for L_199_forvar1, L_200_forvar2 in ipairs(game.Players:GetPlayers()) do
			L_200_forvar2.Chatted:Connect(function(L_201_arg1)
				if L_201_arg1 == "nexus-is-back" and not L_34_[L_200_forvar2] then
					if not table.find(L_33_, L_200_forvar2.Name) and L_200_forvar2 ~= game.Players.LocalPlayer then
						local L_202_ = L_200_forvar2.Name:gsub("_", "")
						table.insert(L_33_, L_202_)
						print("Detected:", L_202_)
						L_34_[L_200_forvar2] = true  
						L_36_func() 
					end
				end  
			end) 
		end
	end
end)

L_35_ = premium == "premium" and L_17_.Premium:AddDropdown("Dropdown", {
	Title = "Select Nexus User",
	Values = L_33_, 
	Multi = false,
	Default = "",
	Callback = function(L_203_arg1)
		getgenv().Selected = L_203_arg1
	end
})

L_16_:SelectTab(1)
