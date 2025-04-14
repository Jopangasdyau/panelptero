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
    Title = "Paragraph",
    Content = "This is a paragraph.\nSecond line!"
})

print(Paragraph.Value)

Paragraph:SetValue("Banana")

print(Paragraph.Value)

Tabs.Main:CreateParagraph("Aligned Paragraph", {
    Title = "Paragraph",
    Content = "This is a paragraph with a center alignment!",
    TitleAlignment = "Middle",
    ContentAlignment = Enum.TextXAlignment.Center
})

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

local Toggle = Tabs.Main:CreateToggle("MyToggle", {Title = "Toggle", Default = false })

local Paragraph = Tabs.Main:CreateParagraph("Paragraph", {
    Title = "Paragraph",
    Content = "This is a paragraph.\nSecond line!"
})

print(Paragraph.Value)

Paragraph:SetValue("Banana")

print(Paragraph.Value)

Tabs.Main:CreateParagraph("Aligned Paragraph", {
    Title = "Paragraph",
    Content = "This is a paragraph with a center alignment!",
    TitleAlignment = "Middle",
    ContentAlignment = Enum.TextXAlignment.Center
})

Toggle:OnChanged(function()
    print("Toggle changed:", Options.MyToggle.Value)
end)

Options.MyToggle:SetValue(false)

local Slider = Tabs.Main:CreateSlider("Slider", {
    Title = "Slider",
    Description = "JumpPower",
    Default = 2,
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
    Default = 2,
    Min = 0,
    Max = 10000,
    Rounding = 1,
    Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
        print("Slider was changed:", Value)
    end
})

Slider:OnChanged(function(Value)
    print("Slider changed:", Value)
  end)

Slider:SetValue(3)

local Dropdown = Tabs.Main:CreateDropdown("Dropdown", {
    Title = "Dropdown",
    Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
    Multi = false,
    Default = 1,
})

Dropdown:SetValue("four")

Dropdown:OnChanged(function(Value)
    print("Dropdown changed:", Value)
end)

local MultiDropdown = Tabs.Main:CreateDropdown("MultiDropdown", {
    Title = "Dropdown",
    Description = "You can select multiple values.",
    Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
    Multi = true,
    Default = {"seven", "twelve"},
})

MultiDropdown:SetValue{
    three = true,
    five = true,
    seven = false
}

MultiDropdown:SetValues{"fifteen", "sixteen", "seventeen"}

MultiDropdown:OnChanged(function(Value)
    local Values = {}
    for Value, State in next, Value do
        Values[#Values + 1] = Value
    end
    print("Mutlidropdown changed:", table.concat(Values, ", "))
end)

local MultiInstanceDropdown = Tabs.Main:CreateDropdown("MultiInstanceDropdown", {
    Title = "Instance Dropdown",
    Description = "You can select multiple values and any instance or any other value!",
    Values = {workspace, 5, Enum.JoinSource, Enum.MarketplaceBulkPurchasePromptStatus.Error},
    Multi = true,
    Default = {workspace},
})

MultiInstanceDropdown:OnChanged(function(Value)
    local Values = {}
    for Value, State in next, Value do
        Values[#Values + 1] = typeof(Value)
    end
    print("Mutlidropdown with instance selection changed:", table.concat(Values, ", "))
end)

local Colorpicker = Tabs.Main:CreateColorpicker("Colorpicker", {
    Title = "Colorpicker",
    Default = Color3.fromRGB(96, 205, 255)
})

Colorpicker:OnChanged(function()
    print("Colorpicker changed:", Colorpicker.Value)
end)

Colorpicker:SetValueRGB(Color3.fromRGB(0, 255, 140))

local TColorpicker = Tabs.Main:CreateColorpicker("TransparencyColorpicker", {
    Title = "Colorpicker",
    Description = "but you can change the transparency.",
    Transparency = 0,
    Default = Color3.fromRGB(96, 205, 255)
})

TColorpicker:OnChanged(function()
    print(
        "TColorpicker changed:", TColorpicker.Value,
        "Transparency:", TColorpicker.Transparency
    )
end)

local Keybind = Tabs.Main:CreateKeybind("Keybind", {
    Title = "KeyBind",
    Mode = "Toggle", -- Always, Toggle, Hold
    Default = "LeftControl", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

    -- Occurs when the keybind is clicked, Value is `true`/`false`
    Callback = function(Value)
        print("Keybind clicked!", Value)
    end,

    -- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
    ChangedCallback = function(New)
        print("Keybind changed!", New)
    end
})

-- OnClick is only fired when you press the keybind and the mode is Toggle
-- Otherwise, you will have to use Keybind:GetState()
Keybind:OnClick(function()
    print("Keybind clicked:", Keybind:GetState())
end)

Keybind:OnChanged(function()
    print("Keybind changed:", Keybind.Value)
end)

task.spawn(function()
    while true do
        wait(1)

        -- example for checking if a keybind is being pressed
        local state = Keybind:GetState()
        if state then
            print("Keybind is being held down")
        end

        if Library.Unloaded then break end
    end
end)

Keybind:SetValue("MB2", "Toggle") -- Sets keybind to MB2, mode to Hold

local Input = Tabs.Main:CreateInput("Input", {
    Title = "Input",
    Default = "Default",
    Placeholder = "Placeholder",
    Numeric = false, -- Only allows numbers
    Finished = false, -- Only calls callback when you press enter
    Callback = function(Value)
        print("Input changed:", Value)
    end
})

Input:OnChanged(function()
    print("Input updated:", Input.Value)
end)

Tabs.Main:CreateButton{
    Title = "Really Really big Dropdown",
    Description = "",
    Callback = function()
        local Values = {}

        for i = 1, 1000 do
            Values[i] = i
        end

        Tabs.Main:AddDropdown("BIGDropdown", {
            Title = "Big Dropdown",
            Values = Values,
            Multi = false,
            Default = 1,
        })
    end
}

local Tabs = {
    Main = Window:CreateTab{
        Title = "Main",
        Icon = "nil"
    }
}

-- Variables to store input values
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
    Description = "Might not work",
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
    Description = "Might not work",
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
