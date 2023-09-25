-- Create a BindableEvent
local BindableEvent = Instance.new("BindableEvent")
local connection = BindableEvent.Event:Connect(function() end)

-- HTTP and Teleport Services
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

-- Player-related Services and Variables
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local LocalHumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

local function moveToPosition(position, duration)
    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character

    if Character and Character:FindFirstChild("HumanoidRootPart") then
        local LocalHumanoidRootPart = Character.HumanoidRootPart

        local success, error = pcall(function()
            local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad)
            local tween = game:GetService("TweenService"):Create(LocalHumanoidRootPart, tweenInfo, {CFrame = CFrame.new(position)})
            tween:Play()
            wait(duration)
        end)
    end
end

local function RedeemCodes()
    local Url = "https://tryhardguides.com/blade-ball-codes/"
    local Response = game:HttpGet(Url)
    local Codes = {}

    for ul in string.gmatch(Response, "<ul>(.-)</ul>") do
        for li in string.gmatch(ul, "<li>(.-)</li>") do
            for Code in string.gmatch(li, "<strong>([^<]+)</strong>") do
                table.insert(Codes, Code)
            end
        end
    end

    for _, Code in ipairs(Codes) do

		local args = {
			[1] = Code,
		}  

		game:GetService("ReplicatedStorage").Remotes.SubmitCodeRequest:InvokeServer(unpack(args))
    end
end

spawn(function()
    while wait() do
       if getgenv().Disconnect == true then
           connection:Disconnect()
		    getgenv().Disconnect = false
            getgenv().nexus = false
			return
		else  
			BindableEvent:Fire()
		end
	end  
end)  

local Fluent = loadstring(game:HttpGet("https://github.com/s-o-a-b/nexus/releases/download/nexus/nexus.txt"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/assets/SaveManager"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/assets/InterfaceManager"))()

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
    Player = Window:AddTab({
        Title = "Player",
        Icon = "rbxassetid://10747373176"
    }),
    Premium = premium == "premium" and Window:AddTab({
        Title = "Premium",
        Icon = "rbxassetid://10709819149"
    }),
    Server = Window:AddTab({
        Title = "Server",
        Icon = "rbxassetid://10734949856"
    }),
    Settings = Window:AddTab({
        Title = "Settings",
        Icon = "rbxassetid://10734950020"
    }),
}

local function isBall(child)
    return child:IsA("Part") and string.find(child.BrickColor.Name:lower(), "red")
end

local function checkBalls()
    for _, child in ipairs(game:GetService("Workspace").Balls:GetChildren()) do
        if isBall(child) then task.wait()
			local distance = LocalPlayer:DistanceFromCharacter(child.Position)
			if distance <= 47 then
				game:GetService("ReplicatedStorage").Remotes.ParryButtonPress:Fire()
			end    
        end
    end
end

local Toggle = Tabs.Main:AddToggle("AutoFarm", {
    Title = "Auto Farm",
	Default = false,
    Callback = function(value)
		if value then 
			repeat task.wait()  
                for _,_ in next,workspace.Balls:GetChildren()do if _ then if game:GetService("\x50\x6C\x61\x79\x65\x72\x73").LocalPlayer.Character and game:GetService("\x50\x6C\x61\x79\x65\x72\x73").LocalPlayer.Character:FindFirstChild("\x48\x75\x6D\x61\x6E\x6F\x69\x64\x52\x6F\x6F\x74\x50\x61\x72\x74")then if game:GetService("\x50\x6C\x61\x79\x65\x72\x73").LocalPlayer.Character:FindFirstChild("\x48\x69\x67\x68\x6C\x69\x67\x68\x74")then game:GetService("\x50\x6C\x61\x79\x65\x72\x73").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(game:GetService("\x50\x6C\x61\x79\x65\x72\x73").LocalPlayer.Character.HumanoidRootPart.Position,_.Position) game:GetService("\x50\x6C\x61\x79\x65\x72\x73").LocalPlayer.Character.HumanoidRootPart.CFrame=_.CFrame*CFrame.new(0,0,(_.Velocity).Magnitude*-0.5) game:GetService("\x52\x65\x70\x6C\x69\x63\x61\x74\x65\x64\x53\x74\x6F\x72\x61\x67\x65").Remotes.ParryButtonPress:Fire()end end end end
			until not Options.AutoFarm.Value or not connection.Connected
		end
	end
})

local Toggle = Tabs.Main:AddToggle("AutoParry", {
    Title = "Auto Parry",
	Default = false,
    Callback = function(value)
		if value then 
			repeat task.wait()  
				checkBalls()  
			until not Options.AutoParry.Value or not connection.Connected
		end
	end
})

local Toggle = Tabs.Main:AddToggle("AutoUse", {
    Title = "Auto Ability",
	Default = false,
    Callback = function(value)
		if value then 
            repeat task.wait()  
                local success, result = pcall(function() 
                    if not game:GetService("Players").LocalPlayer.PlayerGui.Packs.HUD.UltimateBlade.Visible then 
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Q", false, nil)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "Q", false, nil)
                    end  
                end)
            until not Options.AutoUse.Value or not connection.Connected
		end  
	end
})

local Toggle = Tabs.Main:AddToggle("AutoOpen", {
    Title = "Auto Open",
	Default = false,
    Callback = function(value)
		if value then 
			repeat task.wait()  
                local success, result = pcall(function() 
                    if game:GetService("Players").LocalPlayer.PlayerGui.UI.Money.Value.Value > 80 then
                        if Options.Selected.Value == "Sword" then 
                            game:GetService("ReplicatedStorage").Remotes.Store.RequestOpenSwordBox:InvokeServer()
                        elseif Options.Selected.Value == "Explosion" then
                            game:GetService("ReplicatedStorage").Remotes.Store.RequestOpenExplosionBox:InvokeServer()
                        end
                    end   
                end)
			until not Options.AutoOpen.Value or not connection.Connected
		end
	end
})

local Dropdownnn = Tabs.Main:AddDropdown("Selected", {
    Title = "Select Crate",
    Values = {"Sword", "Explosion"},
    Multi = false,
    Default = false,
    Callback = function(value)
    end
})

Tabs.Main:AddButton({
	Title = "Redeem Codes",
	Callback = function()
		RedeemCodes()
	end
})  

local function setWalkSpeed(walkSpeed)
    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = walkSpeed
    end
end
 
local Toggle = Tabs.Player:AddToggle("WalkSpeed", {
    Title = "Walkspeed",
    Default = false,
    Callback = function(value)
        if value then 
            repeat task.wait()  
                setWalkSpeed(Options.Walk.Value)  
            until not Options.WalkSpeed.Value or not connection.Connected
            setWalkSpeed(36)
        end
    end
})

local Slider = Tabs.Player:AddSlider("Walk", {
    Title = "Walk Speed",
    Default = 36,
    Min = 36,
    Max = 200,
    Rounding = 0,
    Callback = function(Value)
    end
})

local function setJumpPower(jumpPower)
    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.JumpHeight = jumpPower
    end
end
 
local Toggle = Tabs.Player:AddToggle("JumpPower", {
   Title = "Jump Power",
   Default = false,
   Callback = function(value)
    if value then 
        repeat task.wait()  
            setJumpPower(Options.Jump.Value)  
        until not Options.JumpPower.Value or not connection.Connected
        setJumpPower(10)
    end
   end
})

local Slider = Tabs.Player:AddSlider("Jump", {
    Title = "Jump Power",
    Default = 10,
    Min = 10,
    Max = 100,
    Rounding = 0,
    Callback = function(Value)
    end
})

Tabs.Settings:AddButton({
	Title = "Delete Setting Config",
	Callback = function()
		delfile("FLORENCE/settings/".. game.PlaceId ..".json")
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
