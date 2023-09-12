local L_1_ = game:GetService("HttpService")
local L_2_ = game:GetService("TeleportService")
local L_3_ = game:GetService("Players")
local L_4_ = game:GetService("RunService")
local L_5_ = game:GetService("Workspace")
local L_6_ = game:GetService("VirtualUser")
local L_7_, L_8_ = L_3_.LocalPlayer, L_3_.LocalPlayer
local L_9_ = "FLORENCE/SETTINGS/"..game.PlaceId..'.txt'
local L_10_ = game:GetService("UserInputService")
local L_11_ = {}
local L_12_ = {}
local L_13_ 
local L_14_

getgenv().settings = {}


if isfile("FLORENCE/SETTINGS/"..game.PlaceId..'.txt') then
	local L_70_, L_71_ = pcall(function()
		getgenv().settings = game:GetService('HttpService'):JSONDecode(readfile("FLORENCE/SETTINGS/"..game.PlaceId..'.txt'))
	end)
	if L_71_ ~= nil then
		forceServerHop()
		return 
	end
end 

writefile("FLORENCE/SETTINGS/"..game.PlaceId..'.txt', L_1_:JSONEncode(getgenv().settings))

function forceServerHop()
	local L_72_ = "https://games.roblox.com/v1/games/"
	local L_73_, L_74_ = game.PlaceId, game.JobId
	local L_75_ = L_72_..L_73_.."/servers/Public?sortOrder=Desc&limit=100"

	local function L_76_func(L_78_arg1)
		local L_79_ = game:HttpGet(L_75_..(L_78_arg1 and "&cursor="..L_78_arg1 or ""))
		return L_1_:JSONDecode(L_79_)
	end

	local L_77_
	repeat
		local L_80_ = L_76_func(L_77_)
		for L_81_forvar1, L_82_forvar2 in ipairs(L_80_.data) do
			if L_82_forvar2.playing < L_82_forvar2.maxPlayers and L_82_forvar2.id ~= L_74_ then
				local L_83_, L_84_ = pcall(L_2_.TeleportToPlaceInstance, L_2_, L_73_, L_82_forvar2.id, L_7_)
				if L_83_ then
					break
				end
			end
		end
		L_77_ = L_80_.nextPageCursor
	until not L_77_
end

local L_15_ = Instance.new("BindableEvent")
local L_16_ = L_15_.Event:Connect(function()
end)

local function L_17_func(L_85_arg1)
	return spawn(function()
		while task.wait() do
			if L_16_.Connected == true then
				local L_86_, L_87_ = pcall(function() 
					L_85_arg1()
				end)
			end
		end
	end)
end

L_17_func(function()
	for L_88_forvar1, L_89_forvar2 in pairs(getgenv().settings) do
		if L_16_.Connected == true and getgenv().settings.AutoSave == true then 
			getgenv().settings[L_88_forvar1] = L_89_forvar2
			writefile(L_9_, L_1_:JSONEncode(getgenv().settings))
		end
	end
end)

repeat
	wait()
until game:IsLoaded() and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

local L_18_, L_19_ = pcall(function() 
	while game:GetService("Players").LocalPlayer.PlayerGui.LoadingGui.Frame.Play or game:GetService("Players").LocalPlayer.PlayerGui.LoadingGui.Frame.Play.Visible do
		wait(1)
		local L_90_ = game:GetService("Players").LocalPlayer.PlayerGui.LoadingGui.Frame.Play
		game:GetService("VirtualInputManager"):SendMouseButtonEvent(L_90_.AbsolutePosition.X + L_90_.AbsoluteSize.X / 2, L_90_.AbsolutePosition.Y + 50, 0, true, L_90_, 1)
		game:GetService("VirtualInputManager"):SendMouseButtonEvent(L_90_.AbsolutePosition.X + L_90_.AbsoluteSize.X / 2, L_90_.AbsolutePosition.Y + 50, 0, false, L_90_, 1)
	end
end)

for L_91_forvar1, L_92_forvar2 in pairs(game:GetService("Workspace")["__GAME"]["__SpawnLocations"]:GetChildren()) do
	table.insert(L_11_, L_92_forvar2.Name)
end

for L_93_forvar1, L_94_forvar2 in pairs(game:GetService("Workspace")["__GAME"]["__Interactions"]:GetChildren()) do
	if not table.find(L_12_, L_94_forvar2.Name) then
		table.insert(L_12_, L_94_forvar2.Name)
	end
end

local L_20_ = loadstring(game:HttpGet("https://github.com/13B8B/nexus/releases/download/nexus/nexus.txt"))()
--[[
   premium = true
]]

local L_21_ = L_20_:CreateWindow({
	Title = "nexus ",
	"",
	SubTitle = "",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = true,
	Theme = "Dark",
})

local L_22_ = {
	Main = L_21_:AddTab({
		Title = "Main",
		Icon = "rbxassetid://10723424505"
	}),
	Misc = L_21_:AddTab({
		Title = "Misc",
		Icon = "rbxassetid://10709818534"
	}),
	Player = L_21_:AddTab({
		Title = "Player",
		Icon = "rbxassetid://10747373176"
	}),
	Weapon = L_21_:AddTab({ 
		Title = "Weapon",
		Icon = "rbxassetid://4335480896"
	}),
	Settings = L_21_:AddTab({
		Title = "Settings",
		Icon = "settings"
	}),
	Premium = premium == "premium" and L_21_:AddTab({
		Title = "Premium",
		Icon = "rbxassetid://10709819149"
	}),

}

local L_23_ = {
	["Starter Island"] = {
		options = {
			"Bandit",
			"Strong Bandit",
			"Bandit Leader"
		},
		mapping = CFrame.new(3388, 145, 1728),
		point = "Starter Island"
	},
	["Jungle Island"] = {
		options = {
			"Monkey",
			"Gorilla",
			"King Gorilla"
		},
		mapping = CFrame.new(1986, 140, 598),
		point = "JunglePoint"
	},
	["Clown Island"] = {
		options = {
			"Clown",
			"Killer Clown",
			"Clown King"
		},
		mapping = CFrame.new(3007, 150, -587),
		point = "BuggyPoint"
	},
	["Marine Island"] = {
		options = {
			"Marine",
			"Marine Official",
			"Lorgan"
		},
		mapping = CFrame.new(4941, 145, 56),
		point = "MarinePoint"
	},
	["Lier Island"] = {
		options = {
			"Cat Pirate",
			"Mansion Guard",
			"Buros"
		},
		mapping = CFrame.new(5557, 150, 2040),
		point = "UsoppPoint"
	},
	["Baratie"] = {
		options = {
			"Don Pirate",
			"Perolado",
			"Gimbo",
			"Don Zig"
		},
		mapping = CFrame.new(1363, 180, 2680),
		point = "BaratiePoint"
	},
	["AR Park"] = {
		options = {
			"Marine Soldier",
			"Captain Rat",
			"Fishman",
			"Chewing",
			"Kolobi"
		},
		mapping = CFrame.new(-672, 160, 631),
		point = "ArlongPoint"
	},
	["Lulue Town"] = {
		options = {
			"Logue Bandit",
			"Bashigs",
			"White",
			"Alvarida",
			"Logue Marine"
		},
		mapping = CFrame.new(5791, 140, -3231),
		point = "LoguePoint"
	}
}

local L_24_ = {
	getgenv().settings.SelectedEnemy
}

local function L_25_func(L_95_arg1, L_96_arg2)
	local L_97_ = L_3_.LocalPlayer
	local L_98_ = L_97_.Character

	if L_98_ and L_98_:FindFirstChild("HumanoidRootPart") then
		local L_99_ = L_98_.HumanoidRootPart

		local L_100_, L_101_ = pcall(function()
			local L_102_ = TweenInfo.new(L_96_arg2, Enum.EasingStyle.Quad)
			local L_103_ = game:GetService("TweenService"):Create(L_99_, L_102_, {
				CFrame = L_95_arg1
			})
			L_103_:Play()
			wait(L_96_arg2)
		end)
	end 
end

local L_26_ = L_22_.Main:AddToggle("Toggle", {
	Title = "Auto Farm",
	Default = getgenv().settings.AutoFarm,
	Callback = function(L_104_arg1)
		getgenv().settings.AutoFarm = L_104_arg1
	end
})

local L_27_ = L_22_.Main:AddDropdown("Dropdown", {
	Title = "Select Mob", 
	Values = {},
	Multi = false, 
	Default = getgenv().settings.SelectedEnemy, 
	Callback = function(L_105_arg1)
		getgenv().settings.SelectedEnemy = L_105_arg1
		if not table.find(L_24_, L_105_arg1) then
			table.insert(L_24_, L_105_arg1)
		end
	end
})
local L_28_ = L_22_.Main:AddDropdown("Dropdownnn", {
	Title = "Select World",
	Values = {
		"Starter Island",
		"Jungle Island",
		"Clown Island",
		"Marine Island",
		"Lier Island",
		"Baratie",
		"AR Park",
		"Lulue Town"
	},
	Multi = false,
	Default = getgenv().settings.selectedIsland,
	Callback = function(L_106_arg1)
		getgenv().settings.selectedIsland = L_106_arg1

		local L_107_ = L_23_[getgenv().settings.selectedIsland]

		local L_108_ = L_107_.point
		if L_108_ then
			local L_110_ = {
				[1] = {
					[1] = utf8.char(3),
					[2] = "ChangeSpawnPoint",
					[3] = L_108_
				}
			}
			game:GetService("ReplicatedStorage").RemoteEvent:FireServer(L_110_)
		end

		local L_109_ = L_107_.mapping
		if L_109_ then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = L_109_
		end

		L_27_:SetValues(L_107_.options)
	end
})
local L_29_ = L_23_[getgenv().settings.selectedIsland]

if L_29_ and L_29_.options then
	L_27_:SetValues(L_29_.options)
end

local L_30_ = game:GetService("Players")
local L_31_ = workspace["__GAME"]["__Mobs"]
local L_32_ = L_30_.LocalPlayer or L_30_:GetPropertyChangedSignal("LocalPlayer"):Wait() and L_30_.LocalPlayer
local function L_33_func(L_111_arg1, L_112_arg2)
	local L_113_ = L_7_.Character.HumanoidRootPart
	local L_114_ = TweenInfo.new(L_112_arg2, Enum.EasingStyle.Quad)
	local L_115_ = game:GetService("TweenService"):Create(L_113_, L_114_, {
		CFrame = CFrame.new(L_111_arg1)
	})
	L_115_:Play()
end

local function L_34_func(L_116_arg1)
	local L_117_, L_118_ = nil, 9e9
	for L_119_forvar1, L_120_forvar2 in pairs(L_31_:GetChildren()) do
		for L_121_forvar1, L_122_forvar2 in pairs(L_120_forvar2:GetChildren()) do
			if L_122_forvar2:FindFirstChild("NpcConfiguration") and L_122_forvar2.NpcConfiguration:GetAttribute("Health") > 0 then
				if L_122_forvar2.NpcConfiguration:GetAttribute("Name") == L_116_arg1 then
					local L_123_ = (L_122_forvar2.PrimaryPart.Position - L_32_.Character.PrimaryPart.Position).magnitude
					if L_123_ < L_118_ then
						L_118_ = L_123_
						L_117_ = L_122_forvar2
					end
				end
			end
		end
	end
	return L_117_
end
L_17_func(function()  
	if #L_24_ > 0 and not L_14_ and not L_13_ and getgenv().settings.AutoFarm then
		local L_124_ = L_32_.Backpack:FindFirstChild("Combat")
		L_32_.Character.Humanoid:EquipTool(L_124_)
		local L_125_ = L_34_func(getgenv().settings.SelectedEnemy)

		L_25_func(L_125_.PrimaryPart.CFrame, .03)

		local L_126_ = {
			[1] = {
				[1] = utf8.char(4),
				[2] = "Combat",
				[3] = 1,
				[4] = false,
				[5] = workspace.__GAME.__Players[L_32_.Name].Combat,
				[6] = "Melee"
			},
			[2] = {
				[1] = "	",
				[2] = L_125_,
				[3] = workspace.__GAME.__Players[L_32_.Name].Combat
			}
		}
		if L_126_ then
			game:GetService("ReplicatedStorage").RemoteEvent:FireServer(L_126_)

		end
	end
end)

local L_35_ = game.Workspace.__GAME.__Quests

local function L_36_func()
	local L_127_ = {}
	if L_35_ and L_35_:IsA("Folder") then
		for L_128_forvar1, L_129_forvar2 in ipairs(L_35_:GetChildren()) do
			if L_129_forvar2:IsA("Model") and L_129_forvar2:FindFirstChild("HumanoidRootPart") then
				local L_130_ = L_129_forvar2.Head.Icon.TextLabel.Text
				if L_130_ ~= "" then
					table.insert(L_127_, L_130_)
				end
			end
		end
	end 

	table.sort(L_127_, function(L_131_arg1, L_132_arg2)
		local L_133_ = tonumber(L_131_arg1:match("(%d+)"))
		local L_134_ = tonumber(L_132_arg2:match("(%d+)"))
		return L_133_ < L_134_
	end)

	return L_127_
end


local L_37_ = L_22_.Main:AddToggle("Toggle", {
	Title = "Auto Start Quest",
	Default = getgenv().settings.AutoQuest,
	Callback = function(L_135_arg1)
		getgenv().settings.AutoQuest = L_135_arg1
	end
})

local L_38_ = L_22_.Main:AddDropdown("Dropdown", {
	Title = "Select Quest",
	Values = L_36_func(), 
	Multi = false,
	Default = getgenv().settings.selectedQuest,
	Callback = function(L_136_arg1)
		getgenv().settings.selectedQuest = L_136_arg1 
	end
})

L_17_func(function()
	local L_137_ = getgenv().settings.selectedQuest or "nil"
	local L_138_ = L_137_:match("(%d+)")
	local L_139_ = tonumber(L_138_)
	local L_140_ = game:GetService("Players").LocalPlayer.PlayerGui.Quests.CurrentQuestContainer.AbsolutePosition  

	if L_140_ == Vector2.new(2880, 348.968) and getgenv().settings.AutoQuest and getgenv().settings.selectedQuest and not L_14_ then
		L_13_ = true 
		for L_141_forvar1, L_142_forvar2 in ipairs(L_35_:GetChildren()) do
			if L_142_forvar2:IsA("Model") and L_142_forvar2:FindFirstChild("HumanoidRootPart") then
				local L_143_ = L_142_forvar2.Name 
				local L_144_ = L_143_:match("(%d+)")  

				L_144_ = tostring(tonumber(L_144_)) or L_144_

				local L_145_ = L_142_forvar2.Head.Icon.TextLabel.Text
				if L_145_ == getgenv().settings.selectedQuest then
					L_25_func(L_142_forvar2.HumanoidRootPart.CFrame, 0.5)
					wait(1)
					game:GetService("ReplicatedStorage").RemoteEvent:FireServer({
						{
							utf8.char(3),
							"GetQuest",
							L_144_
						}
					})
					break
				end  
			end
		end
		L_13_ = false 
	end
end)


L_35_.ChildAdded:Connect(function()
	L_38_:SetValues(L_36_func())
end)

L_35_.ChildRemoved:Connect(function()
	L_38_:SetValues(L_36_func())
end)

local L_39_ = {} 

local L_40_ = L_22_.Weapon:AddDropdown("Dropdown", {
	Title = "Weapon",
	Values = {},  
	Multi = false,
	Default = "Select",
	Callback = function(L_146_arg1)
		getgenv().settings.SelectedWeapon = L_146_arg1
	end
})
local function L_41_func()
	local L_147_ = {}

	for L_149_forvar1, L_150_forvar2 in pairs(L_39_) do
		table.insert(L_147_, L_149_forvar1)
	end

	local L_148_ = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
	if L_148_ then
		table.insert(L_147_, L_148_.Name)
	end

	L_40_:SetValues(L_147_)
end

game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(L_151_arg1)
	if L_151_arg1:IsA("Tool") then
		L_39_[L_151_arg1.Name] = true
		L_41_func()
	end
end)

game.Players.LocalPlayer.Backpack.ChildRemoved:Connect(function(L_152_arg1)
	if L_152_arg1:IsA("Tool") then
		L_39_[L_152_arg1.Name] = nil
		L_41_func()
	end
end)

for L_153_forvar1, L_154_forvar2 in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
	if L_154_forvar2:IsA("Tool") then
		L_39_[L_154_forvar2.Name] = true
	end
end
L_41_func()
local L_42_ = L_22_.Weapon:AddToggle("Toggle", {
	Title = "Auto Lv Weapon",
	Default = getgenv().settings.AutoWeaponLv,
	Callback = function(L_155_arg1)
		getgenv().settings.AutoWeaponLv = L_155_arg1
	end
})
local function L_43_func()
	local L_156_ = getgenv().settings.SelectedWeapon
	local L_157_ = game:GetService("Players").LocalPlayer

	if L_157_.Character then
		local L_158_ = L_157_.Character:FindFirstChildOfClass("Tool")
		local L_159_ = L_157_.Backpack:FindFirstChild(L_156_)

		if L_159_ and (not L_158_ or L_158_.Name ~= L_156_) then
			L_158_ = L_158_ or L_157_.Character:FindFirstChildOfClass("Tool")

			if L_158_ then
				L_158_.Parent = L_157_.Backpack
			end

			L_159_.Parent = L_157_.Character
		end
	end
end

L_17_func(function()
	if getgenv().settings.AutoWeaponLv then
		task.wait()
		L_43_func()
		require(game:GetService("ReplicatedStorage").SharedModules.Controllers.ToolController).UseTool("Combat", Enum.UserInputState.Begin)
	end
end)

local L_44_ = L_22_.Weapon:AddToggle("Toggle", {
	Title = "Auto Lv All Weapons",
	Default = getgenv().settings.AutoLvWeapons,
	Callback = function(L_160_arg1)
		getgenv().settings.AutoLvWeapons = L_160_arg1
	end
})
L_17_func(function()
	if getgenv().settings.AutoLvWeapons then
		local L_161_ = game:GetService("Players").LocalPlayer
		L_161_.Character.Humanoid:UnequipTools()
		for L_162_forvar1, L_163_forvar2 in pairs(L_161_.Backpack:GetChildren()) do
			if L_163_forvar2:IsA("Tool") then
				L_163_forvar2.Parent = L_161_.Character
				require(game:GetService("ReplicatedStorage").SharedModules.Controllers.ToolController).UseTool("Combat", Enum.UserInputState.Begin)
				task.wait(.3)
				L_163_forvar2.Parent = L_161_.Backpack
			end
		end  
	end
end)
local L_45_ = L_22_.Weapon:AddToggle("Toggle", {
	Title = "Auto Skill",
	Default = getgenv().settings.AutoSkill,
	Callback = function(L_164_arg1)
		getgenv().settings.AutoSkill = L_164_arg1
	end
})
L_17_func(function()
	if getgenv().settings.AutoSkill then
		local L_165_ = game:GetService("VirtualInputManager")
		local L_166_ = game:GetService("Players").LocalPlayer

		for L_167_forvar1, L_168_forvar2 in pairs(L_166_.Character:GetChildren()) do
			if L_168_forvar2:IsA("Tool") and L_168_forvar2.Name ~= "Defence" then
				for L_169_forvar1, L_170_forvar2 in pairs({
					"Z",
					"X",
					"C",
					"V",
					"B"
				}) do
					if L_166_.Character:FindFirstChild("HumanoidRootPart") then
						L_165_:SendKeyEvent(true, L_170_forvar2, false, nil)
						L_165_:SendKeyEvent(false, L_170_forvar2, false, nil)
						task.wait(.1)
					end
				end
			end
		end  
	end
end)

local L_46_ = L_22_.Misc:AddToggle("Toggle", {
	Title = "Auto Chest [ Server - Hop ]",
	Default = getgenv().settings.AutoChest1,
	Callback = function(L_171_arg1)
		if L_171_arg1 == true then 
			L_20_:Notify({
				Title = 'Notification',
				Content = 'Down until Synapse X back',
				Duration = 5
			})
		end 
		-- getgenv().settings.AutoChest1 = value
	end
})

--[[local function interactWithChests1()
    if getgenv().settings.AutoChest1 then
        local SavedPosition
        for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v:FindFirstChild("ChestInteract") or v.Name == "GiftModel" then
                local character = Player.Character
                if character then
                    SavedPosition = character:WaitForChild("HumanoidRootPart").CFrame
                    ChestTeleporting = true

                    character:WaitForChild("HumanoidRootPart").CFrame = v.PrimaryPart.CFrame * CFrame.new(0, 3, 0)
                    wait(5)
                    fireproximityprompt(v.ChestInteract)
                    wait(0.5)
                    character:WaitForChild("HumanoidRootPart").CFrame = SavedPosition
                    wait(1)
                end
            else 
                forceServerHop()
            end
        end 

        if SavedPosition then
            Player.Character:WaitForChild("HumanoidRootPart").CFrame = SavedPosition
        end
        
        ChestTeleporting = false
    end
end

createLoop(interactWithChests1)]]


local L_47_ = L_22_.Misc:AddToggle("Toggle", {
	Title = "Auto Chest",
	Default = getgenv().settings.AutoChest,
	Callback = function(L_172_arg1)
		getgenv().settings.AutoChest = L_172_arg1
	end
})

local function L_48_func()
	if getgenv().settings.AutoChest then
		local L_173_
		for L_174_forvar1, L_175_forvar2 in pairs(game:GetService("Workspace"):GetChildren()) do
			if L_175_forvar2:FindFirstChild("ChestInteract") or L_175_forvar2.Name == "GiftModel" then
				local L_176_ = L_32_.Character
				if L_176_ then
					L_173_ = L_176_:WaitForChild("HumanoidRootPart").CFrame
					L_14_ = true

					L_176_:WaitForChild("HumanoidRootPart").CFrame = L_175_forvar2.PrimaryPart.CFrame * CFrame.new(0, 3, 0)
					wait(5)
					fireproximityprompt(L_175_forvar2.ChestInteract)
					wait(0.5)
					L_176_:WaitForChild("HumanoidRootPart").CFrame = L_173_
					wait(1)
				end
			end
		end

		if L_173_ then
			L_32_.Character:WaitForChild("HumanoidRootPart").CFrame = L_173_
		end

		L_14_ = false
	end
end

L_17_func(L_48_func)

local L_49_ = L_22_.Misc:AddDropdown("Dropdown", {
	Title = "Teleport to Interaction",
	Values = L_12_,
	Multi = false,
	Default = "",
	Callback = function(L_177_arg1)
		L_25_func(game:GetService("Workspace")["__GAME"]["__Interactions"]:FindFirstChild(L_177_arg1).PrimaryPart.CFrame, .1)
	end
})
local L_50_ = L_22_.Misc:AddDropdown("Dropdown", {
	Title = "Teleport to Island",
	Values = L_11_,
	Multi = false,
	Default = "",
	Callback = function(L_178_arg1)
		L_25_func(game:GetService("Workspace")["__GAME"]["__SpawnLocations"]:FindFirstChild(L_178_arg1).CFrame, .1)
	end  
})

local function L_51_func()
	local L_179_ = "https://tryhardguides.com/one-fruit-simulator-codes/"
	local L_180_ = game:HttpGet(L_179_)
	local L_181_ = {}

	for L_182_forvar1 in string.gmatch(L_180_, "<ul>(.-)</ul>") do
		for L_183_forvar1 in string.gmatch(L_182_forvar1, "<li>(.-)</li>") do
			for L_184_forvar1 in string.gmatch(L_183_forvar1, "<strong>([^<]+)</strong>") do
				table.insert(L_181_, L_184_forvar1)
			end
		end
	end


	for L_185_forvar1, L_186_forvar2 in ipairs(L_181_) do
		local L_187_ = {
			[1] = {
				[1] = {
					[1] = "\3",
					[2] = "UseCode",
					[3] = L_186_forvar2
				}
			}
		}
		game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(L_187_))

	end
end  

L_22_.Misc:AddButton({
	Title = "Redeem Codes",
	Callback = function()
		L_51_func()
	end 
})

local L_52_ = L_22_.Player:AddToggle("Toggle", {
	Title = "Walkspeed",
	Default = getgenv().settings.Walkspeed or false,
	Callback = function(L_188_arg1)
		getgenv().settings.Walkspeed = L_188_arg1
	end
})

local L_53_ = L_22_.Player:AddSlider("Slider", {
	Title = "Walk Speed",
	Default = getgenv().settings.WS or 50,
	Min = 50,
	Max = 200,
	Rounding = 1,
	Callback = function(L_189_arg1)
		getgenv().settings.WS = L_189_arg1
	end
})

local function L_54_func(L_190_arg1)

	local L_191_ = L_7_.Character and L_7_.Character:FindFirstChild("Humanoid")
	if L_191_ then
		L_191_.WalkSpeed = L_190_arg1
	end
end

L_17_func(function()
	if getgenv().settings.Walkspeed then
		task.wait(.1)
		L_54_func(getgenv().settings.WS)  
	else 
		L_54_func(16)  
		repeat
			task.wait()
		until getgenv().settings.Walkspeed 
	end
end)  

local L_55_ = L_22_.Player:AddToggle("Toggle", {
	Title = "Jump Power",
	Default = getgenv().settings.JumpPower or false,
	Callback = function(L_192_arg1)
		getgenv().settings.JumpPower = L_192_arg1
	end
})

local L_56_ = L_22_.Player:AddSlider("Slider", {
	Title = "Jump Power",
	Default = getgenv().settings.JP or 50,
	Min = 50,
	Max = 200,
	Rounding = 1,
	Callback = function(L_193_arg1)
		getgenv().settings.JP = L_193_arg1
	end
})

local function L_57_func(L_194_arg1)
	local L_195_ = L_7_.Character and L_7_.Character:FindFirstChild("Humanoid")
	if L_195_ then
		L_195_.JumpPower = L_194_arg1
	end

end

L_17_func(function()
	if getgenv().settings.JumpPower then
		task.wait(.3)
		L_57_func(getgenv().settings.JP)  
	else   
		L_57_func(50)  
		repeat
			task.wait()
		until getgenv().settings.JumpPower 
	end
end)   

local L_58_ = L_22_.Player:AddToggle("Toggle", {
	Title = "Infinite Jump",
	Default = getgenv().settings.InfiJump or false,
	Callback = function(L_196_arg1)
		getgenv().settings.InfiJump = L_196_arg1
	end
})

local L_59_
L_17_func(function()
	if getgenv().settings.InfiJump then
		wait()
		L_59_ = L_10_.JumpRequest:Connect(function()
			if L_16_.Connected then 
				L_8_.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
			end 
		end)
		repeat
			task.wait()
		until getgenv().settings.InfiJump == false or L_16_.Connected == false
	else 
		L_59_:Disconnect()
		repeat
			task.wait()
		until getgenv().settings.InfiJump == true or L_16_.Connected == false
	end
end)  

local L_60_ = getgenv().settings.KeyBind or ""

local L_61_ = L_22_.Settings:AddKeybind("Keybind", {
	Title = "KeyBind",
	Mode = "Toggle",
	Default = L_60_,
	ChangedCallback = function(L_197_arg1)
		L_60_ = L_197_arg1.Name
		getgenv().settings.KeyBind = L_197_arg1.Name  
	end
})

game:GetService("UserInputService").InputBegan:Connect(function(L_198_arg1, L_199_arg2)
	local L_200_ = getgenv().settings.KeyBind

	if L_198_arg1.KeyCode == Enum.KeyCode.Home or L_200_ == L_198_arg1.KeyCode.Name then
		if game:GetService("Players").LocalPlayer.PlayerGui.nexus.Frame.Visible then
			L_20_:Notify({
				Title = 'Window Minimized',
				Content = 'Press '..L_200_..' to Open the UI',
				Duration = 5
			})
		end
		L_21_:Minimize() 
	end
end)

local L_62_ = L_22_.Settings:AddToggle("Toggle", {
	Title = "Auto Save Settings",
	Default = getgenv().settings.AutoSave,
	Callback = function(L_201_arg1)
		getgenv().settings.AutoSave = L_201_arg1
		writefile(L_9_, L_1_:JSONEncode(getgenv().settings))
	end
})

local L_63_ = L_22_.Settings:AddToggle("Toggle", {
	Title = "Auto Rejoin",
	Default = getgenv().settings.AutoRejoin,
	Callback = function(L_202_arg1)
		getgenv().settings.AutoRejoin = L_202_arg1
		if getgenv().settings.AutoRejoin then
			L_20_:Notify({
				Title = 'Auto Rejoin',
				Content = 'You will rejoin if you are kicked or disconnected from the game',
				Duration = 5
			})
			repeat
				task.wait()
			until game.CoreGui:FindFirstChild('RobloxPromptGui')
			local L_203_, L_204_, L_205_ = game:GetService('Players').LocalPlayer, game.CoreGui.RobloxPromptGui.promptOverlay, game:GetService('TeleportService')
			L_204_.ChildAdded:connect(function(L_206_arg1)
				if L_206_arg1.Name == 'ErrorPrompt' then
					while true do
						L_205_:Teleport(game.PlaceId)
						task.wait(2)
					end
				end
			end)
		end
	end
})

local L_64_ = L_22_.Settings:AddToggle("Toggle", {
	Title = "Auto ReExecute",
	Default = getgenv().settings.AutoExecute,
	Callback = function(L_207_arg1)
		getgenv().settings.AutoExecute = L_207_arg1
		if getgenv().settings.AutoExecute then
			local L_208_ = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
			if L_208_ then
				L_208_('loadstring(game:HttpGet("https://raw.githubusercontent.com/13B8B/nexus/main/loadstring"))()')
			end
		end
	end
})
L_22_.Settings:AddButton({
	Title = "Rejoin-Server",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, L_32_)
	end
})
L_22_.Settings:AddButton({
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
					local L_222_, L_223_ = pcall(L_210_.TeleportToPlaceInstance, L_210_, L_212_, L_221_forvar2.id, L_32_)
					if L_222_ then
						break
					end
				end
			end
			L_216_ = L_219_.nextPageCursor
		until not L_216_
	end
})

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

spawn(function()
	while wait() do
		if getgenv().Disconnect == true then
			wait(1)
			L_16_:Disconnect()
			getgenv().Disconnect = false
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			for L_224_forvar1, L_225_forvar2 in next, game:GetService('Players'):GetPlayers() do
				if L_225_forvar2.Name ~= game:GetService('Players').LocalPlayer.Name then
					pcall(function()
						L_225_forvar2.Character.Highlight:Destroy()
					end)
				end 
			end
			return
		else  
			L_15_:Fire()
		end
	end
end)  

----------// PREMIUM \\----------
Tab = premium == "premium" and L_22_.Premium:AddButton({
	Title = "Kick",
	Callback = function()
		game.Players:Chat(".k "..getgenv().Selected)
	end 
})
Tab = premium == "premium" and L_22_.Premium:AddButton({
	Title = "Kill",
	Callback = function()
		game.Players:Chat(". "..getgenv().Selected)
	end
})
Tab = premium == "premium" and L_22_.Premium:AddButton({
	Title = "Teleport",
	Callback = function()
		game.Players:Chat(".b "..getgenv().Selected)
	end
})
Tab = premium == "premium" and L_22_.Premium:AddButton({
	Title = "Shut Game Down",
	Callback = function()
		game.Players:Chat(".s "..getgenv().Selected)
	end
})
Tab = premium == "premium" and L_22_.Premium:AddButton({
	Title = "Freeze",
	Callback = function()
		game.Players:Chat("- "..getgenv().Selected)
	end
})
Tab = premium == "premium" and L_22_.Premium:AddButton({
	Title = "Unfreeze",
	Callback = function()
		game.Players:Chat(".u "..getgenv().Selected)
	end
})

task.spawn(function()
	while task.wait() do 
		local L_226_ = game:GetService("Players")
		local L_227_ = game:GetService("TextChatService")
		local L_228_ = L_226_.LocalPlayer
		local L_229_ = L_228_.Name:gsub("_", "")

		for L_230_forvar1, L_231_forvar2 in ipairs(L_226_:GetPlayers()) do
			L_231_forvar2.Chatted:Connect(function(L_232_arg1)
				local L_233_, L_234_ = pcall(function()
					local L_235_ = L_232_arg1:gsub("_", "")
					if L_235_ == ".k "..L_229_ then
						game.Players.LocalPlayer:kick("nexus-premium user has kicked you")
					elseif L_235_ == ". "..L_229_ then
						game.Players.LocalPlayer.Character.Humanoid.Health = 0
					elseif L_235_ == ".b "..L_229_ then
						game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = game.Players[L_231_forvar2.Name].Character.HumanoidRootPart.CFrame
					elseif L_235_ == ".s "..L_229_ then
						game:Shutdown()
					elseif L_235_ == "- "..L_229_ then
						game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
					elseif L_235_ == ".u "..L_229_ then
						game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false    
					end  
				end)
			end) 
		end
	end 
end)

local L_65_ = {}
local L_66_ = {} 
local L_67_

local function L_68_func()
	if L_67_ then
		L_67_:SetValues(L_65_)
	end
end
local function L_69_func(L_236_arg1)
	for L_237_forvar1, L_238_forvar2 in ipairs(L_65_) do
		if L_238_forvar2 == L_236_arg1.Name then
			table.remove(L_65_, L_237_forvar1)
			L_66_[L_236_arg1] = nil
			L_68_func()
			break
		end
	end
end

game.Players.PlayerRemoving:Connect(function(L_239_arg1)
	L_69_func(L_239_arg1)
end)

task.spawn(function()
	while wait() do 
		for L_240_forvar1, L_241_forvar2 in ipairs(game.Players:GetPlayers()) do
			L_241_forvar2.Chatted:Connect(function(L_242_arg1)
				if L_242_arg1 == "nexus-is-back" and not L_66_[L_241_forvar2] then
					if not table.find(L_65_, L_241_forvar2.Name) and L_241_forvar2 ~= game.Players.LocalPlayer then
						local L_243_ = L_241_forvar2.Name:gsub("_", "")
						table.insert(L_65_, L_243_)
						print("Detected:", L_243_)
						L_66_[L_241_forvar2] = true  
						L_68_func() 
					end
				end  
			end) 
		end
	end
end)

L_67_ = premium == "premium" and L_22_.Premium:AddDropdown("Dropdown", {
	Title = "Select Nexus User",
	Values = L_65_, 
	Multi = false,
	Default = "",
	Callback = function(L_244_arg1)
		getgenv().Selected = L_244_arg1
	end
})


L_21_:SelectTab(1)
