-- Services
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create a BindableEvent
local BindableEvent = Instance.new("BindableEvent")
local connection = BindableEvent.Event:Connect(function() end)

-- Renaming race maps in the workspace
local success, result = pcall(function() 
    Workspace.raceMaps.Magma.Name = "Magma Race"
    Workspace.raceMaps.Desert.Name = "Desert Race"
    Workspace.raceMaps.Grassland.Name = "Grass Race"
end)

-- Define teleport targets
local targets = {
    {position = Vector3.new(-9684.84, 55.6854, 3093.3), name = "City"},
    {position = Vector3.new(-13097, 213.621, 5913.35), name = "Legends Highway"},
    {position = Vector3.new(-11053.1, 213.621, 4904.36), name = "Magma City"},
}

-- Check for areaCirclesFolder and update names
local areaCirclesFolder = Workspace:FindFirstChild("areaCircles")
if areaCirclesFolder then
    for _, areaCircle in ipairs(areaCirclesFolder:GetDescendants()) do
        if areaCircle.Name == "areaCircle" then
            local TeleportPart = areaCircle:FindFirstChild("circleOuter")
            if TeleportPart then
                for _, target in ipairs(targets) do
                    local distance = (TeleportPart.Position - target.position).Magnitude
                    if distance <= 50 then
                        TeleportPart.Parent.Name = target.name
                    end
                end
            end
        end
    end
end

spawn(function()
    while wait() do
       if getgenv().Disconnect == true then wait(1)
           connection:Disconnect()
		    getgenv().Disconnect = false
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
            return
		else  
			BindableEvent:Fire()  
		end
	end
end)  

local Fluent = loadstring(game:HttpGet("https://github.com/s-o-a-b/nexus/releases/download/nexus/nexus.txt"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/assets/SaveManager"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/assets/InterfaceManager"))()

--[[
	premium = true
]]

local Options = Fluent.Options
SaveManager:SetLibrary(Fluent)


local Window = Fluent:CreateWindow({
    Title = "nexus ", "",
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
})

local Tabs = {
    Main = Window:AddTab({
        Title = "Main",
        Icon = "rbxassetid://13075651575"
    }),
    Egg = Window:AddTab({
        Title = "Egg",
        Icon = "rbxassetid://10723345518"
    }),
    Server = Window:AddTab({
        Title = "Server",
        Icon = "rbxassetid://10734949856"
    }),
    Settings = Window:AddTab({
        Title = "Settings",
        Icon = "rbxassetid://10734950020"
    }),
    Premium = premium == "premium" and Window:AddTab({
        Title = "Premium",
        Icon = "rbxassetid://10709819149"
    }),
}
local function createAutoFarmToggle(name, area, levelReq)
	Tabs.Main:AddToggle(area, {
		Title = name,
		CurrentValue = false,
		Callback = function(Value)
			if Value then 
				repeat
					task.wait()
					if Options[area].Value then
						local player = game:GetService("Players").LocalPlayer
						if player.leaderstats.Rebirths.Value < levelReq then
							Fluent:Notify({ Title = 'Notification', Content = "You need at least " .. levelReq .. " rebirths to auto farm " .. name, Duration = 5 })
							repeat task.wait() until not Options[area].Value or player.leaderstats.Rebirths.Value > levelReq
						else
							if game:GetService("Players").LocalPlayer.currentMap.Value ~= area then
								local currentMap = game:GetService("Players").LocalPlayer.currentMap.Value
								if currentMap ~= "Magma Race" and currentMap ~= "Grass Race" and currentMap ~= "Desert Race" then
									game:GetService("ReplicatedStorage").rEvents.areaTravelRemote:InvokeServer("travelToArea", workspace.areaCircles[area])
								end								
							end
							if Options.AutoGems.Value then
								spawn(function()
									for i = 1,4 do task.wait()
										game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Gem", area)
										game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Red Orb", area)
									end 
								end)
							end  
							if not Options.AutoGems.Value then 
								spawn(function()
									for i = 1,4 do task.wait()
										game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer("collectOrb", "Red Orb", area)
									end
								end)               
							end  
						end
					end
				until not Options[area].Value or not connection.Connected
			end
		end,
	})
end
  
createAutoFarmToggle("Auto Farm City", "City", 0)
createAutoFarmToggle("Auto Farm Magma City", "Magma City", 1)
createAutoFarmToggle("Auto Farm Legends Highway", "Legends Highway", 10)

local Toggle = Tabs.Main:AddToggle("AutoGems", {
    Title = "Auto Farm Gems",
	Default = false,
    Callback = function(value)
	end
})

local Toggle = Tabs.Main:AddToggle("AutoRebirth", {
    Title = "Auto Rebirth",
    Default = false,
    Callback = function(value)
        if value then
            repeat task.wait(0.1)
                local playerGui = game:GetService("Players").LocalPlayer:FindFirstChildOfClass("PlayerGui")
                if playerGui and playerGui:FindFirstChild("gameGui") and playerGui.gameGui.statsFrame.levelLabel.maxLabel.Visible then
                    game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
                end
            until not Options.AutoRebirth.Value or not connection.Connected
        end
    end
})

local Toggle = Tabs.Main:AddToggle("AutoHoop", {
    Title = "Auto Hoops",
	Default = false,
    Callback = function(value)
		if value then 
			repeat wait(1)  
				for i,v in pairs(game.Workspace.Hoops:GetChildren()) do
					if v.Name == 'Hoop' then
						firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v, 0)
						firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v, 1)
					end
				end
			until not Options.AutoHoop.Value or not connection.Connected
		end  
	end
})

local Toggle = Tabs.Main:AddToggle("AutoRace", {
    Title = "Auto Race",
	Default = false,
    Callback = function(value)
		if value then 
			repeat task.wait(1)  
				local success, result = pcall(function() 
					if game:GetService("Players").LocalPlayer.PlayerGui.gameGui.raceJoinLabel.Visible == true then 
						game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace") wait(.5)  
						local Players = game:GetService("Players")
						local player = Players.LocalPlayer
						local currentMap = player.currentMap.Value
						repeat task.wait() until workspace.raceMaps[currentMap].boundaryParts.boundaryPart.CanCollide == false
						for _,v in pairs(game:GetService("Workspace").raceMaps:GetDescendants()) do
							if v:IsA("TouchTransmitter") and v.Parent.Name == "finishPart" then
								player.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.Position)  * CFrame.new(-40, -30, 0) 
							end 
						end
					end  
				end)
			until not Options.AutoRace.Value or not connection.Connected
		end  
	end
})

local Toggle = Tabs.Egg:AddToggle("AutoHatch", {
    Title = "Auto Hatch",
	Default = false,
    Callback = function(value)
		if value then 
			repeat task.wait(.1)  
		        game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer("openCrystal", Options.SelectCrystal.Value)
			until not Options.AutoHatch.Value or not connection.Connected
		end  
	end
})

local Dropdownnn = Tabs.Egg:AddDropdown("SelectCrystal", {
    Title = "Select Crystal",
    Values = {"Red Crystal","Blue Crystal","Purple Crystal","Yellow Crystal","Lightning Crystal","Snow Crystal","Inferno Crystal","Lava Crystal","Electro Legends Crystal"},
    Multi = false,
    Default = false,
    Callback = function(value)
    end
})

local Toggle = Tabs.Egg:AddToggle("AutoEvolve", {
    Title = "Auto Evolve Pets",
	Default = false,
    Callback = function(value)
		if value then 
			repeat task.wait(1)  
				for _, child in ipairs(game:GetService("ReplicatedStorage").cPetShopFolder:GetChildren()) do
					game:GetService("ReplicatedStorage").rEvents.petEvolveEvent:FireServer("evolvePet", child.Name)
				end   
			until not Options.AutoEvolve.Value or not connection.Connected
		end  
	end
})

local Toggle = Tabs.Egg:AddToggle("AutoDelete", {
    Title = "Auto Delete Bad Pets",
	Default = false,
    Callback = function(value)
		if value then 
			repeat task.wait(1)  
				local foldersToDelete = {
					game:GetService("Players").LocalPlayer.petsFolder.Advanced,
					game:GetService("Players").LocalPlayer.petsFolder.Rare,
					game:GetService("Players").LocalPlayer.petsFolder.Basic,
					game:GetService("Players").LocalPlayer.petsFolder.Epic,
					game:GetService("Players").LocalPlayer.petsFolder.Unique,
					game:GetService("Players").LocalPlayer.petsFolder.Omega
				}
				for _, folder in ipairs(foldersToDelete) do
					if folder ~= nil then
						for _, pet in ipairs(folder:GetChildren()) do
							if folder ~= game:GetService("Players").LocalPlayer.petsFolder.Omega or pet.Name ~= "Ultimate Overdrive Bunny" then
								game:GetService("ReplicatedStorage").rEvents.sellPetEvent:FireServer("sellPet", pet)
							end
						end
					end
				end
			until not Options.AutoDelete.Value or not connection.Connected
		end  
	end
})

local Toggle = Tabs.Egg:AddToggle("AutoDeleteTrails", {
    Title = "Auto Delete Bad Trails",
	Default = false,
    Callback = function(value)
		if value then 
			repeat task.wait(1)  
				local uniqueFolder = game:GetService("Players").LocalPlayer.trailsFolder.Unique
				if uniqueFolder ~= nil then
					for _, child in ipairs(uniqueFolder:GetChildren()) do
						if child.Name ~= "Rainbow Steps" then
							game:GetService("ReplicatedStorage").rEvents.sellTrailEvent:FireServer("sellTrail", child)
						end
					end
				end
				local otherFolders = {
					game:GetService("Players").LocalPlayer.trailsFolder.Epic,
					game:GetService("Players").LocalPlayer.trailsFolder.Basic,
					game:GetService("Players").LocalPlayer.trailsFolder.Rare,
					game:GetService("Players").LocalPlayer.trailsFolder.Advanced
				}
				for _, folder in ipairs(otherFolders) do
					if folder ~= nil then
						for _, child in ipairs(folder:GetChildren()) do
							game:GetService("ReplicatedStorage").rEvents.sellTrailEvent:FireServer("sellTrail", child)
						end
					end
				end
			until not Options.AutoDeleteTrails.Value or not connection.Connected
		end  
	end
})

local Toggle = Tabs.Settings:AddToggle("Settings", {
    Title = "Save Settings",
	Default = false,
    Callback = function(value)
		if value then 
			repeat task.wait()  
				SaveManager:Save(game.GameId)
			until not Options.Settings.Value or not connection.Connected
		end
	end
})

Tabs.Settings:AddButton({
	Title = "Delete Setting Config",
	Callback = function()
		delfile("FLORENCE/settings/".. game.GameId ..".json")
	end  
})  

local Toggle = Tabs.Server:AddToggle("AutoRejoin", {
	Title = "Auto Rejoin",
	Default = false,
	Callback = function(value)
		if value then 
        Fluent:Notify({Title = 'Auto Rejoin', Content = 'You will rejoin if you are kicked or disconnected from the game', Duration = 5 })
          repeat task.wait() 
          local lp,po,ts = game:GetService('Players').LocalPlayer,game.CoreGui.RobloxPromptGui.promptOverlay,game:GetService('TeleportService')
          po.ChildAdded:connect(function(a)
              if a.Name == 'ErrorPrompt' then
                      ts:Teleport(game.PlaceId)
                      task.wait(2)
              end
          end)
          until Options.AutoRejoin.Value or not connection.Connected
		end
	end
})
 
local Toggle = Tabs.Server:AddToggle("ReExecute", {
	Title = "Auto ReExecute",
	Default = false,
	Callback = function(value)
		if value then 
			repeat task.wait()
		local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
		if queueteleport then
			queueteleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/13B8B/nexus/main/loadstring"))()')
		end  
	until not Options.ReExecute.Value or not connection.Connected
end
	end 
})
Tabs.Server:AddButton({
    Title = "Redeem Codes",
    Callback = function()
        RedeemCodes()
	end
})
Tabs.Server:AddButton({
	Title = "Rejoin-Server",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
	end
})  
Tabs.Server:AddButton({
	Title = "Server-Hop", 
	Callback = function()
	   local Http = game:GetService("HttpService")
		local TPS = game:GetService("TeleportService")
		local Api = "https://games.roblox.com/v1/games/"
		local _place,_id = game.PlaceId, game.JobId
		local _servers = Api.._place.."/servers/Public?sortOrder=Desc&limit=100"
		local function ListServers(cursor)
			local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
			return Http:JSONDecode(Raw)
		end
		local Next; repeat
			local Servers = ListServers(Next)
			for i,v in next, Servers.data do
				if v.playing < v.maxPlayers and v.id ~= _id then
					local s,r = pcall(TPS.TeleportToPlaceInstance,TPS,_place,v.id,Player)
					if s then break end
				end
			end
			Next = Servers.nextPageCursor
		until not Next
	end
})


-- Set libraries and folders
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:SetIgnoreIndexes({})
SaveManager:IgnoreThemeSettings()
InterfaceManager:SetFolder("FLORENCE")
SaveManager:SetFolder("FLORENCE")

-- Build interface section and load the game
InterfaceManager:BuildInterfaceSection(Tabs.Settings, Tabs.Premium)
SaveManager:Load(game.PlaceId)

-- Select the first tab in the window
Window:SelectTab(1)
