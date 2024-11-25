_G.ESP = false
_G.ESPColor = Color3.fromRGB(255, 255, 255)

pcall(
    function()
        local highlight = Instance.new("Highlight")
        highlight.Parent = gethui()

        game:GetService("RunService").RenderStepped:Connect(
            function()
                for _, v in pairs(game.Players:GetPlayers()) do
                    if not v.Character:FindFirstChild("Highlight") then
                        highlight.FillTransparency = 1
                        highlight:Clone().Parent = v.Character
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    end

                    game.Players.PlayerAdded:Connect(
                        function(plr)
                            plr.CharacterAdded:Connect(
                                function(char)
                                    if not char:FindFirstChild("Highlight") then
                                        highlight.FillTransparency = 1
                                        highlight:Clone().Parent = char
                                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                                    end
                                end
                            )
                        end
                    )
                end

                for _, v in pairs(game.Players:GetPlayers()) do
                    local hl = v.Character:FindFirstChild("Highlight")
                    hl.Enabled = _G.ESP
                    hl.OutlineColor = _G.ESPColor
                end
            end
        )
    end
)

local library =
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3")))()

local w = library:CreateWindow("Simple ESP")

local b = w:CreateFolder("Main")

b:Toggle(
    "ESP",
    function(bool)
        _G.ESP = bool
    end
)

b:ColorPicker(
    "ESP Color",
    Color3.fromRGB(255, 255, 255),
    function(color)
        _G.ESPColor = color
    end
)
