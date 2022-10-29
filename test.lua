local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Dave's Hub",
    LoadingTitle = "Dave's Hub Loading...",
    LoadingSubtitle = "By Dave",
    ConfigurationSaving = {
        Enabled = true,
        FileName = "Big Hub",
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
        Title = "Dave's Hub",
        Subtitle = "Key System",
        Note = "the key is ABCDEF",
        Key = "ABCDEF"
    }
    })


    Rayfield:Notify("Loading","The hub will take some time to load",10010348543)
    task.wait(1)
    Rayfield:Notify("Successful","It has completed loading!",10010348543)

    function died()
        Rayfield:Notify("Resetted","You will be respawning in 4 secs..",10010348543) -- (t,c,image)
    end

    --Tabs

    local Character = Window:CreateTab("Character")

    local Server = Window:CreateTab("Server")

    --Buttons

    local Label = Character:CreateLabel("Humanoid Settings")

    -- Sliders


    local speed = Character:CreateSlider({
        Name = "Walkspeed",
        Range = {0, 1000},
        Increment = 1,
        Suffix = "Walkspeed Power",
        CurrentValue = 0,
        Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end,
    })

    local jumppower = Character:CreateSlider({
        Name = "JumpPower",
        Range = {0, 1000},
        Increment = 1,
        Suffix = "JumpPower",
        CurrentValue = 50,
        Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end,
    })

        local jumpheight = Character:CreateSlider({
        Name = "JumpHeight",
        Range = {0, 1000},
        Increment = 1,
        Suffix = "JumpHeight Power",
        CurrentValue = 50,
        Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.JumpHeight = Value
        end,
    })
    
    local clocktime = Server:CreateSlider({
        Name = "ClockTime",
        Range = {0, 24},
        Increment = 1,
        Suffix = "Time",
        CurrentValue = 14,
        Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
       game.Lighting.ClockTime = Value
        end,
    })


    -- Adaptive Text

    local Lighting = Server:CreateInput({
        Name = "FogEnd",
        PlaceholderText = "FogEnd",
        RemoveTextAfterFocusLost = false,
        Callback = function(Text)
            game.Lighting.FogEnd = Text
        end,
    })

    local Label = Character:CreateLabel("Character")

    local Reset = Character:CreateButton({
        Name = "Reset Character",
        Callback = function()
            game.Players.LocalPlayer.Character:BreakJoints()
            died()
        end,
    })


    local Sit = Character:CreateButton({
        Name = "Sit",
        Callback = function()
            game.Players.LocalPlayer.Character.Humanoid.Sit = true
        end,
    })

    local Sit = Character:CreateButton({
        Name = "PlatForm Stand",
        Callback = function()
            game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
        end,
    })


    local Teleport = Character:CreateInput({
        Name = "Teleport to specific user",
        PlaceholderText = "User",
        RemoveTextAfterFocusLost = false,
        Callback = function(Text)
            targetUsername = Text

players = game:GetService("Players")
targetPlayer = players:FindFirstChild(targetUsername)
players.LocalPlayer.Character:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
        end,
    })
