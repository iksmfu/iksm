local e=Instance.new("\x42\x69\x6E\x64\x61\x62\x6C\x65\x45\x76\x65\x6E\x74") local k=e.Event:Connect(function()end) local _=game:GetService("\x48\x74\x74\x70\x53\x65\x72\x76\x69\x63\x65") local _=game:GetService("\x54\x65\x6C\x65\x70\x6F\x72\x74\x53\x65\x72\x76\x69\x63\x65") local _=game:GetService("\x55\x73\x65\x72\x49\x6E\x70\x75\x74\x53\x65\x72\x76\x69\x63\x65") local c=game:GetService("\x52\x65\x70\x6C\x69\x63\x61\x74\x65\x64\x53\x74\x6F\x72\x61\x67\x65") local b=game:GetService("\x57\x6F\x72\x6B\x73\x70\x61\x63\x65").Balls local a=game:GetService("\x50\x6C\x61\x79\x65\x72\x73") local j=a.LocalPlayer local d=game.Stats local f local _=j.Character:FindFirstChild("\x48\x75\x6D\x61\x6E\x6F\x69\x64\x52\x6F\x6F\x74\x50\x61\x72\x74") local function _(b,c)local _=a.LocalPlayer local _=_.Character if _ and _:FindFirstChild("\x48\x75\x6D\x61\x6E\x6F\x69\x64\x52\x6F\x6F\x74\x50\x61\x72\x74")then local a=_.HumanoidRootPart local _,_=pcall(function()local _=TweenInfo.new(c,Enum.EasingStyle.Quad) local _=game:GetService("\x54\x77\x65\x65\x6E\x53\x65\x72\x76\x69\x63\x65"):Create(a,_,{CFrame=CFrame.new(b)}) _:Play() wait(c)end)end end local function a()local _="\x68\x74\x74\x70\x73\x3A\x2F\x2F\x74\x72\x79\x68\x61\x72\x64\x67\x75\x69\x64\x65\x73\x2E\x63\x6F\x6D\x2F\x62\x6C\x61\x64\x65\x2D\x62\x61\x6C\x6C\x2D\x63\x6F\x64\x65\x73\x2F" local _=game:HttpGet(_) local a={} for _ in string.gmatch(_,"\x3C\x75\x6C\x3E\x28\x2E\x2D\x29\x3C\x2F\x75\x6C\x3E")do for _ in string.gmatch(_,"\x3C\x6C\x69\x3E\x28\x2E\x2D\x29\x3C\x2F\x6C\x69\x3E")do for _ in string.gmatch(_,"\x3C\x73\x74\x72\x6F\x6E\x67\x3E\x28\x5B\x5E\x3C\x5D\x2B\x29\x3C\x2F\x73\x74\x72\x6F\x6E\x67\x3E")do table.insert(a,_)end end end for _,_ in ipairs(a)do local _={[1]=_} game:GetService("\x52\x65\x70\x6C\x69\x63\x61\x74\x65\x64\x53\x74\x6F\x72\x61\x67\x65").Remotes.SubmitCodeRequest:InvokeServer(unpack(_))end end spawn(function()while wait()do if getgenv().Disconnect==true then k:Disconnect() getgenv().Disconnect=false getgenv().nexus=false return else e:Fire()end end end) local i=loadstring(game:HttpGet("\x68\x74\x74\x70\x73\x3A\x2F\x2F\x67\x69\x74\x68\x75\x62\x2E\x63\x6F\x6D\x2F\x73\x2D\x6F\x2D\x61\x2D\x62\x2F\x6E\x65\x78\x75\x73\x2F\x72\x65\x6C\x65\x61\x73\x65\x73\x2F\x64\x6F\x77\x6E\x6C\x6F\x61\x64\x2F\x6E\x65\x78\x75\x73\x2F\x6E\x65\x78\x75\x73\x2E\x74\x78\x74"))() local h=loadstring(game:HttpGet("\x68\x74\x74\x70\x73\x3A\x2F\x2F\x72\x61\x77\x2E\x67\x69\x74\x68\x75\x62\x75\x73\x65\x72\x63\x6F\x6E\x74\x65\x6E\x74\x2E\x63\x6F\x6D\x2F\x73\x2D\x6F\x2D\x61\x2D\x62\x2F\x6E\x65\x78\x75\x73\x2F\x6D\x61\x69\x6E\x2F\x61\x73\x73\x65\x74\x73\x2F\x53\x61\x76\x65\x4D\x61\x6E\x61\x67\x65\x72"))() local e=loadstring(game:HttpGet("\x68\x74\x74\x70\x73\x3A\x2F\x2F\x72\x61\x77\x2E\x67\x69\x74\x68\x75\x62\x75\x73\x65\x72\x63\x6F\x6E\x74\x65\x6E\x74\x2E\x63\x6F\x6D\x2F\x73\x2D\x6F\x2D\x61\x2D\x62\x2F\x6E\x65\x78\x75\x73\x2F\x6D\x61\x69\x6E\x2F\x61\x73\x73\x65\x74\x73\x2F\x49\x6E\x74\x65\x72\x66\x61\x63\x65\x4D\x61\x6E\x61\x67\x65\x72"))() local l=i.Options h:SetLibrary(i) local g=i:CreateWindow({Title="\x6E\x65\x78\x75\x73\x20","",SubTitle="",TabWidth=160,Size=UDim2.fromOffset(580,460),Acrylic=true,Theme="\x44\x61\x72\x6B"}) local m={Main=g:AddTab({Title="\x4D\x61\x69\x6E",Icon="\x72\x62\x78\x61\x73\x73\x65\x74\x69\x64\x3A\x2F\x2F\x31\x33\x30\x37\x35\x36\x35\x31\x35\x37\x35"}),Player=g:AddTab({Title="\x50\x6C\x61\x79\x65\x72",Icon="\x72\x62\x78\x61\x73\x73\x65\x74\x69\x64\x3A\x2F\x2F\x31\x30\x37\x34\x37\x33\x37\x33\x31\x37\x36"}),Premium=premium=="\x70\x72\x65\x6D\x69\x75\x6D"and g:AddTab({Title="\x50\x72\x65\x6D\x69\x75\x6D",Icon="\x72\x62\x78\x61\x73\x73\x65\x74\x69\x64\x3A\x2F\x2F\x31\x30\x37\x30\x39\x38\x31\x39\x31\x34\x39"}),Server=g:AddTab({Title="\x53\x65\x72\x76\x65\x72",Icon="\x72\x62\x78\x61\x73\x73\x65\x74\x69\x64\x3A\x2F\x2F\x31\x30\x37\x33\x34\x39\x34\x39\x38\x35\x36"}),Settings=g:AddTab({Title="\x53\x65\x74\x74\x69\x6E\x67\x73",Icon="\x72\x62\x78\x61\x73\x73\x65\x74\x69\x64\x3A\x2F\x2F\x31\x30\x37\x33\x34\x39\x35\x30\x30\x32\x30"})} local _=m.Main:AddToggle("\x41\x75\x74\x6F\x46\x61\x72\x6D",{Title="\x41\x75\x74\x6F\x20\x46\x61\x72\x6D",Default=false,Callback=function(_)if _ then repeat task.wait() local _,_=pcall(function()for _,_ in next,workspace.Balls:GetChildren()do if _ then if game:GetService("\x50\x6C\x61\x79\x65\x72\x73").LocalPlayer.Character:FindFirstChild("\x48\x69\x67\x68\x6C\x69\x67\x68\x74")and not game:GetService("\x50\x6C\x61\x79\x65\x72\x73").LocalPlayer.PlayerGui.Packs.HUD.UltimateBlade.Visible then game:GetService("\x50\x6C\x61\x79\x65\x72\x73").LocalPlayer.Character.HumanoidRootPart.CFrame=_.CFrame+Vector3.new(0,-9,0) game:GetService("\x52\x65\x70\x6C\x69\x63\x61\x74\x65\x64\x53\x74\x6F\x72\x61\x67\x65").Remotes.ParryButtonPress:Fire() game:GetService("\x56\x69\x72\x74\x75\x61\x6C\x49\x6E\x70\x75\x74\x4D\x61\x6E\x61\x67\x65\x72"):SendKeyEvent(true,"\x46",false,nil) game:GetService("\x56\x69\x72\x74\x75\x61\x6C\x49\x6E\x70\x75\x74\x4D\x61\x6E\x61\x67\x65\x72"):SendKeyEvent(false,"\x46",false,nil)elseif game:GetService("\x50\x6C\x61\x79\x65\x72\x73").LocalPlayer.Character and game:GetService("\x50\x6C\x61\x79\x65\x72\x73").LocalPlayer.Character:FindFirstChild("\x48\x75\x6D\x61\x6E\x6F\x69\x64\x52\x6F\x6F\x74\x50\x61\x72\x74")and not game:GetService("\x50\x6C\x61\x79\x65\x72\x73").LocalPlayer.PlayerGui.Packs.HUD.UltimateBlade.Visible then game:GetService("\x50\x6C\x61\x79\x65\x72\x73").LocalPlayer.Character.HumanoidRootPart.CFrame=_.CFrame+Vector3.new(0,-11,0)end end end end)until not l.AutoFarm.Value or not k.Connected end end}) local _=m.Main:AddToggle("\x41\x75\x74\x6F\x4C\x6F\x6F\x6B",{Title="\x41\x75\x74\x6F\x20\x4C\x6F\x6F\x6B\x20\x41\x74\x20\x42\x61\x6C\x6C",Default=false,Callback=function(_)if _ then repeat task.wait() local _,_=pcall(function()for _,_ in next,workspace.Balls:GetChildren()do if _ then game:GetService("\x50\x6C\x61\x79\x65\x72\x73").LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(game:GetService("\x50\x6C\x61\x79\x65\x72\x73").LocalPlayer.Character.HumanoidRootPart.Position,_.Position)end end end)until not l.AutoLook.Value or not k.Connected end end}) function FindBall()local a for _,_ in pairs(b:GetChildren())do if _:GetAttribute("\x72\x65\x61\x6C\x42\x61\x6C\x6C")==true then a=_ break end end return a end function IsTarget()local _=FindBall() if _ and _:GetAttribute("\x74\x61\x72\x67\x65\x74")==j.Name then return true end return false end function DetectBall()local _=FindBall() if _ then local b=_.Velocity.Magnitude local _=_.Position local a=j.Character and j.Character:FindFirstChild("\x48\x75\x6D\x61\x6E\x6F\x69\x64\x52\x6F\x6F\x74\x50\x61\x72\x74")and j.Character.HumanoidRootPart.Position if a then local a=(_-a).Magnitude local _=b*(d.Network.ServerStatsItem["\x44\x61\x74\x61\x20\x50\x69\x6E\x67"]:GetValue()/1000) a-=_ a-=3.7 local _=a/b if _<=0.5 then return true end end end return false end function DeflectBall()if f and DetectBall()then if l.ParryType.Value=='\x4B\x65\x79'then game:GetService("\x56\x69\x72\x74\x75\x61\x6C\x49\x6E\x70\x75\x74\x4D\x61\x6E\x61\x67\x65\x72"):SendKeyEvent(true,"\x46",false,nil) game:GetService("\x56\x69\x72\x74\x75\x61\x6C\x49\x6E\x70\x75\x74\x4D\x61\x6E\x61\x67\x65\x72"):SendKeyEvent(false,"\x46",false,nil)else c.Remotes.ParryButtonPress:Fire()end end end local _=m.Main:AddToggle("\x41\x75\x74\x6F\x50\x61\x72\x72\x79",{Title="\x41\x75\x74\x6F\x20\x50\x61\x72\x72\x79",Default=false,Callback=function(_)if _ then repeat task.wait() f=IsTarget() DeflectBall()until not l.AutoParry.Value or not k.Connected end end}) local _=m.Main:AddDropdown("\x50\x61\x72\x72\x79\x54\x79\x70\x65",{Title="\x41\x75\x74\x6F\x20\x50\x61\x72\x72\x79\x20\x54\x79\x70\x65",Values={"\x52\x65\x6D\x6F\x74\x65","\x4B\x65\x79"},Multi=false,Default=false,Callback=function(_)end}) local _=m.Main:AddToggle("\x41\x75\x74\x6F\x55\x73\x65",{Title="\x41\x75\x74\x6F\x20\x41\x62\x69\x6C\x69\x74\x79",Default=false,Callback=function(_)if _ then repeat task.wait() local _,_=pcall(function()if not game:GetService("\x50\x6C\x61\x79\x65\x72\x73").LocalPlayer.PlayerGui.Packs.HUD.UltimateBlade.Visible then game:GetService("\x56\x69\x72\x74\x75\x61\x6C\x49\x6E\x70\x75\x74\x4D\x61\x6E\x61\x67\x65\x72"):SendKeyEvent(true,"\x51",false,nil) game:GetService("\x56\x69\x72\x74\x75\x61\x6C\x49\x6E\x70\x75\x74\x4D\x61\x6E\x61\x67\x65\x72"):SendKeyEvent(false,"\x51",false,nil)end end)until not l.AutoUse.Value or not k.Connected end end}) local _=m.Main:AddToggle("\x41\x75\x74\x6F\x4F\x70\x65\x6E",{Title="\x41\x75\x74\x6F\x20\x4F\x70\x65\x6E",Default=false,Callback=function(_)if _ then repeat task.wait() local _,_=pcall(function()if game:GetService("\x50\x6C\x61\x79\x65\x72\x73").LocalPlayer.PlayerGui.UI.Money.Value.Value>80 then if l.Selected.Value=="\x53\x77\x6F\x72\x64"then game:GetService("\x52\x65\x70\x6C\x69\x63\x61\x74\x65\x64\x53\x74\x6F\x72\x61\x67\x65").Remotes.Store.RequestOpenSwordBox:InvokeServer()elseif l.Selected.Value=="\x45\x78\x70\x6C\x6F\x73\x69\x6F\x6E"then game:GetService("\x52\x65\x70\x6C\x69\x63\x61\x74\x65\x64\x53\x74\x6F\x72\x61\x67\x65").Remotes.Store.RequestOpenExplosionBox:InvokeServer()end end end)until not l.AutoOpen.Value or not k.Connected end end}) local _=m.Main:AddDropdown("\x53\x65\x6C\x65\x63\x74\x65\x64",{Title="\x53\x65\x6C\x65\x63\x74\x20\x43\x72\x61\x74\x65",Values={"\x53\x77\x6F\x72\x64","\x45\x78\x70\x6C\x6F\x73\x69\x6F\x6E"},Multi=false,Default=false,Callback=function(_)end}) m.Main:AddButton({Title="\x52\x65\x64\x65\x65\x6D\x20\x43\x6F\x64\x65\x73",Callback=function()a()end}) local function a(_)local a=j.Character and j.Character:FindFirstChild("\x48\x75\x6D\x61\x6E\x6F\x69\x64") if a then a.WalkSpeed=_ end end local _=m.Player:AddToggle("\x57\x61\x6C\x6B\x53\x70\x65\x65\x64",{Title="\x57\x61\x6C\x6B\x73\x70\x65\x65\x64",Default=false,Callback=function(_)if _ then repeat task.wait() a(l.Walk.Value)until not l.WalkSpeed.Value or not k.Connected a(36)end end}) local _=m.Player:AddSlider("\x57\x61\x6C\x6B",{Title="\x57\x61\x6C\x6B\x20\x53\x70\x65\x65\x64",Default=36,Min=36,Max=200,Rounding=0,Callback=function(_)end}) local function a(_)local a=j.Character and j.Character:FindFirstChild("\x48\x75\x6D\x61\x6E\x6F\x69\x64") if a then a.JumpHeight=_ end end local _=m.Player:AddToggle("\x4A\x75\x6D\x70\x50\x6F\x77\x65\x72",{Title="\x4A\x75\x6D\x70\x20\x50\x6F\x77\x65\x72",Default=false,Callback=function(_)if _ then repeat task.wait() a(l.Jump.Value)until not l.JumpPower.Value or not k.Connected a(10)end end}) local _=m.Player:AddSlider("\x4A\x75\x6D\x70",{Title="\x4A\x75\x6D\x70\x20\x50\x6F\x77\x65\x72",Default=10,Min=10,Max=100,Rounding=0,Callback=function(_)end}) m.Settings:AddButton({Title="\x44\x65\x6C\x65\x74\x65\x20\x53\x65\x74\x74\x69\x6E\x67\x20\x43\x6F\x6E\x66\x69\x67",Callback=function()delfile("\x46\x4C\x4F\x52\x45\x4E\x43\x45\x2F\x73\x65\x74\x74\x69\x6E\x67\x73\x2F"..game.PlaceId.."\x2E\x6A\x73\x6F\x6E")end}) local _=m.Server:AddToggle("\x41\x75\x74\x6F\x52\x65\x6A\x6F\x69\x6E",{Title="\x41\x75\x74\x6F\x20\x52\x65\x6A\x6F\x69\x6E",Default=false,Callback=function(_)if _ then i:Notify({Title='\x41\x75\x74\x6F\x20\x52\x65\x6A\x6F\x69\x6E',Content='\x59\x6F\x75\x20\x77\x69\x6C\x6C\x20\x72\x65\x6A\x6F\x69\x6E\x20\x69\x66\x20\x79\x6F\x75\x20\x61\x72\x65\x20\x6B\x69\x63\x6B\x65\x64\x20\x6F\x72\x20\x64\x69\x73\x63\x6F\x6E\x6E\x65\x63\x74\x65\x64\x20\x66\x72\x6F\x6D\x20\x74\x68\x65\x20\x67\x61\x6D\x65',Duration=5}) repeat task.wait() local _,_,a=game:GetService('\x50\x6C\x61\x79\x65\x72\x73').LocalPlayer,game.CoreGui.RobloxPromptGui.promptOverlay,game:GetService('\x54\x65\x6C\x65\x70\x6F\x72\x74\x53\x65\x72\x76\x69\x63\x65') _.ChildAdded:connect(function(_)if _.Name=='\x45\x72\x72\x6F\x72\x50\x72\x6F\x6D\x70\x74'then a:Teleport(game.PlaceId) task.wait(2)end end)until l.AutoRejoin.Value or not k.Connected end end}) local _=m.Server:AddToggle("\x52\x65\x45\x78\x65\x63\x75\x74\x65",{Title="\x41\x75\x74\x6F\x20\x52\x65\x45\x78\x65\x63\x75\x74\x65",Default=false,Callback=function(_)if _ then repeat task.wait() local _=(syn and syn.queue_on_teleport)or queue_on_teleport or(fluxus and fluxus.queue_on_teleport) if _ then _('\x6C\x6F\x61\x64\x73\x74\x72\x69\x6E\x67\x28\x67\x61\x6D\x65\x3A\x48\x74\x74\x70\x47\x65\x74\x28\x22\x68\x74\x74\x70\x73\x3A\x2F\x2F\x72\x61\x77\x2E\x67\x69\x74\x68\x75\x62\x75\x73\x65\x72\x63\x6F\x6E\x74\x65\x6E\x74\x2E\x63\x6F\x6D\x2F\x31\x33\x42\x38\x42\x2F\x6E\x65\x78\x75\x73\x2F\x6D\x61\x69\x6E\x2F\x6C\x6F\x61\x64\x73\x74\x72\x69\x6E\x67\x22\x29\x29\x28\x29')end until not l.ReExecute.Value or not k.Connected end end}) m.Server:AddButton({Title="\x52\x65\x6A\x6F\x69\x6E\x2D\x53\x65\x72\x76\x65\x72",Callback=function()game:GetService("\x54\x65\x6C\x65\x70\x6F\x72\x74\x53\x65\x72\x76\x69\x63\x65"):Teleport(game.PlaceId,Player)end}) m.Server:AddButton({Title="\x53\x65\x72\x76\x65\x72\x2D\x48\x6F\x70",Callback=function()local _=game:GetService("\x48\x74\x74\x70\x53\x65\x72\x76\x69\x63\x65") local d=game:GetService("\x54\x65\x6C\x65\x70\x6F\x72\x74\x53\x65\x72\x76\x69\x63\x65") local a="\x68\x74\x74\x70\x73\x3A\x2F\x2F\x67\x61\x6D\x65\x73\x2E\x72\x6F\x62\x6C\x6F\x78\x2E\x63\x6F\x6D\x2F\x76\x31\x2F\x67\x61\x6D\x65\x73\x2F" local e,c=game.PlaceId,game.JobId local a=a..e.."\x2F\x73\x65\x72\x76\x65\x72\x73\x2F\x50\x75\x62\x6C\x69\x63\x3F\x73\x6F\x72\x74\x4F\x72\x64\x65\x72\x3D\x44\x65\x73\x63\x26\x6C\x69\x6D\x69\x74\x3D\x31\x30\x30" local function b(b)local a=game:HttpGet(a..((b and"\x26\x63\x75\x72\x73\x6F\x72\x3D"..b)or"")) return _:JSONDecode(a)end local a repeat local _=b(a) for _,_ in next,_.data do if _.playing<_.maxPlayers and _.id~=c then local a,_=pcall(d.TeleportToPlaceInstance,d,e,_.id,Player) if a then break end end end a=_.nextPageCursor until not a end}) h:SetLibrary(i) e:SetLibrary(i) h:SetIgnoreIndexes({}) h:IgnoreThemeSettings() e:SetFolder("\x46\x4C\x4F\x52\x45\x4E\x43\x45") h:SetFolder("\x46\x4C\x4F\x52\x45\x4E\x43\x45") e:BuildInterfaceSection(m.Settings,m.Premium) h:Load(game.PlaceId) g:SelectTab(1)
