local function callback(Text)
  if Text == "Button1 text" then
   print ("Answer")
 elseif Text == ("Button2 text") then
  print ("Answer2")
  end
 end
 
 local NotificationBindable = Instance.new("BindableFunction")
 NotificationBindable.OnInvoke = callback
 --
 game.StarterGui:SetCore("SendNotification",  {
  Title = "FluentGG";
  Text = "Loading...";
  Icon = "";
  Duration = 5;
  Button1 = "I Agree";
  Callback = NotificationBindable;
 })
 
 local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
 
 local Window = Library:CreateWindow{
     Title = `FluentGG`,
     SubTitle = "SpeedAndJump",
     TabWidth = 160,
     Size = UDim2.fromOffset(830, 525),
     Resize = true, -- Resize this ^ Size according to a 1920x1080 screen, good for mobile users but may look weird on some devices
     MinSize = Vector2.new(470, 380),
     Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
     Theme = "Dark",
     MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
 }
 
 -- Fluent Renewed provides ALL 1544 Lucide 0.469.0 https://lucide.dev/icons/ Icons and ALL 9072 Phosphor 2.1.0 https://phosphoricons.com/ Icons for the tabs, icons are optional
 local Tabs = {
     Main = Window:CreateTab{
         Title = "Main",
         Icon = "phosphor-users-bold"
     },
     Settings = Window:CreateTab{
         Title = "Settings",
         Icon = "settings"
     }
 }
 
 local Options = Library.Options
 
 Library:Notify{
     Title = "Test Notif",
     Content = "SpeedAndJumpHack",
     SubContent = "SubContent", -- Optional
     Duration = 5 -- Set to nil to make the notification not disappear
 }
 
 local Paragraph = Tabs.Main:CreateParagraph("Paragraph", {
     Title = "Client Time",  -- The title of the paragraph
     Content = "0h:0m:0s"    -- Initial content, starting at 0 hours, 0 minutes, 0 seconds
 })
 
 -- Function to update the time dynamically like a clock
 task.spawn(function()
     local startTime = tick()  -- Get the current time in seconds since the game started
 
     while true do
         local elapsed = tick() - startTime  -- Calculate the time elapsed since start
         local hours = math.floor(elapsed / 3600)  -- Get hours
         local minutes = math.floor((elapsed % 3600) / 60)  -- Get minutes
         local seconds = math.floor(elapsed % 60)  -- Get seconds
 
         -- Format the time as "Xh:Xm:Xs"
         local formattedTime = string.format("%dh:%dm:%ds", hours, minutes, seconds)
 
         -- Update the content of the paragraph
         Paragraph:SetValue(formattedTime)
 
         wait(1)  -- Wait for 1 second before updating the time again
     end
 end)
 
 
 Tabs.Main:CreateButton{
     Title = "Dex",
     Description = "Work fine",
     Callback = function()
         Window:Dialog{
             Title = "Title",
             Content = "Dick",
             Buttons = {
                 {
                     Title = "Confirm",
                     Callback = function()
                        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
                         print("Confirmed the dialog.")
                     end
                 },
                 {
                     Title = "Cancel",
                     Callback = function()
                         print("Cancelled the dialog.")
                     end
                 }
             }
         }
     end
 }
 
 local Toggle = Tabs.Main:CreateToggle("MyToggle", {Title = "Toggle", Default = false })
 
 Tabs.Main:CreateButton{
     Title = "Inf Yield Script",
     Description = "Inf Yield",
     Callback = function()
         Window:Dialog{
             Title = "Title",
             Content = "Dick",
             Buttons = {
                 {
                     Title = "Confirm",
                     Callback = function()
                        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
                         print("Confirmed the dialog.")
                     end
                 },
                 {
                     Title = "Cancel",
                     Callback = function()
                         print("Cancelled the dialog.")
                     end
                 }
             }
         }
     end
 }
 
 Toggle:OnChanged(function()
     print("Toggle changed:", Options.MyToggle.Value)
 end)
 
 Options.MyToggle:SetValue(false)
 
 local Slider = Tabs.Main:CreateSlider("Slider", {
     Title = "Slider",
     Description = "JumpPower",
     Default = 50,
     Min = 0,
     Max = 10000,
     Rounding = 1,
     Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
         print("Slider was changed:", Value)
     end
 })
 
 local Slider = Tabs.Main:CreateSlider("Slider", {
     Title = "Slider",
     Description = "SpeedHack",
     Default = 16,
     Min = 0,
     Max = 10000,
     Rounding = 1,
     Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
         print("Slider was changed:", Value)
     end
 })
 
 local gameid = ""
 local jobid = ""
 
 Tabs.Main:CreateButton{
     Title = "Copy gameid",
     Description = "",
     Callback = function()
         local clipboardFunc = setclipboard or toclipboard
         if clipboardFunc then
             clipboardFunc(tostring(game.PlaceId))
             print("Copied Game ID:", game.PlaceId)
         else
             warn("Clipboard not supported on this executor.")
         end
     end
 }
 
 Tabs.Main:CreateButton{
     Title = "Copy jobid",
     Description = "",
     Callback = function()
         local clipboardFunc = setclipboard or toclipboard
         if clipboardFunc then
             clipboardFunc(tostring(game.JobId))
             print("Copied Job ID:", game.JobId)
         else
             warn("Clipboard not supported on this executor.")
         end
     end
 }
 
 local Input = Tabs.Main:CreateInput("Input", {
     Title = "GameId",
     Default = "",
     Placeholder = "",
     Numeric = false, -- Only allows numbers
     Finished = false,
     Callback = function(Value)
         gameid = Value
         print("Game ID set to:", gameid)
     end
 })
 
 local Input = Tabs.Main:CreateInput("Input", {
     Title = "JobId",
     Default = "",
     Placeholder = "",
     Numeric = false, -- Only allows numbers
     Finished = false,
     Callback = function(Value)
         jobid = Value
         print("Job ID set to:", jobid)
     end
 })
 
 Tabs.Main:CreateButton{
     Title = "Join Server",
     Description = "",
     Callback = function()
         local TeleportService = game:GetService("TeleportService")
         local placeId = tonumber(gameid)
         local instanceId = tostring(jobid)
 
         if placeId and instanceId ~= "" then
             TeleportService:TeleportToPlaceInstance(placeId, instanceId, game.Players.LocalPlayer)
         else
             warn("Invalid Game ID or Job ID.")
         end
     end
 }
 
 Tabs.Main:CreateButton{
     Title = "Server Hop",
     Description = "",
     Callback = function()
         local HttpService = game:GetService("HttpService")
         local TeleportService = game:GetService("TeleportService")
         local LocalPlayer = game.Players.LocalPlayer
 
         local PlaceId = game.PlaceId
         local currentJobId = game.JobId
 
         local function serverHop()
             local success, response = pcall(function()
                 return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
             end)
 
             if success and response and response.data then
                 for _, server in pairs(response.data) do
                     if server.playing < server.maxPlayers and server.id ~= currentJobId then
                         TeleportService:TeleportToPlaceInstance(PlaceId, server.id, LocalPlayer)
                         return
                     end
                 end
                 warn("No different server found.")
             else
                 warn("Failed to get server list.")
             end
         end
 
         serverHop()
     end
 }
 
 Tabs.Main:CreateButton{
     Title = "Small Server",
     Description = "Work",
     Callback = function()
         local HttpService = game:GetService("HttpService")
         local TeleportService = game:GetService("TeleportService")
         local LocalPlayer = game.Players.LocalPlayer
 
         local PlaceId = game.PlaceId
         local currentJobId = game.JobId
 
         local function getSmallestServer()
             local smallestServerId = nil
             local smallestPlayerCount = math.huge
 
             local success, response = pcall(function()
                 return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
             end)
 
             if success and response and response.data then
                 for _, server in pairs(response.data) do
                     if server.id ~= currentJobId and server.playing < server.maxPlayers then
                         if server.playing < smallestPlayerCount and server.playing > 0 then
                             smallestPlayerCount = server.playing
                             smallestServerId = server.id
                         end
                     end
                 end
             else
                 warn("Failed to fetch server data.")
             end
 
             return smallestServerId
         end
 
         local smallestServer = getSmallestServer()
         if smallestServer then
             TeleportService:TeleportToPlaceInstance(PlaceId, smallestServer, LocalPlayer)
         else
             warn("No smaller server found.")
         end
     end
 }
 
 Tabs.Main:CreateButton{
     Title = "Rejoin Server",
     Description = "Work",
     Callback = function()
         local TeleportService = game:GetService("TeleportService")
         local Players = game:GetService("Players")
         local LocalPlayer = Players.LocalPlayer
 
         local function rejoinServer()
             local currentJobId = game.JobId
             TeleportService:TeleportToPlaceInstance(game.PlaceId, currentJobId, LocalPlayer)
         end
 
         rejoinServer()
     end
 }
 
 local Tabs = {
     Main = Window:CreateTab{
         Title = "Snipe",
         Icon = "nil"
     }
 }
