-- Full Loader for V2 TAT (dracoonmacoc / RealScripts)

local correctKey = "92635824"
local rawScriptUrl = "https://raw.githubusercontent.com/dracoonmacoc/RealScripts/refs/heads/main/V2%20TAT"
local keyLink = "https://link-hub.net/1104136/7ybtWpbDc6V1" -- your key system link

local StarterGui = game:GetService("StarterGui")

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "KeySystem"
ScreenGui.Parent = game:GetService("CoreGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 320, 0, 140)
Frame.Position = UDim2.new(0.5, -160, 0.5, -70)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 8)
Title.BackgroundTransparency = 1
Title.Text = "Enter Key"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextScaled = true
Title.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, -30, 0, 35)
TextBox.Position = UDim2.new(0, 15, 0, 45)
TextBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
TextBox.TextColor3 = Color3.fromRGB(255,255,255)
TextBox.Text = ""
TextBox.ClearTextOnFocus = true
TextBox.TextScaled = true
TextBox.Parent = Frame

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 120, 0, 35)
Button.Position = UDim2.new(0.5, -60, 0, 95)
Button.BackgroundColor3 = Color3.fromRGB(60,60,60)
Button.TextColor3 = Color3.fromRGB(255,255,255)
Button.Text = "Submit"
Button.TextScaled = true
Button.Parent = Frame

Button.MouseButton1Click:Connect(function()
    local key = TextBox.Text

    if key == correctKey then
        -- correct key
        StarterGui:SetCore("SendNotification", {
            Title = "Key Accepted",
            Text = "Loading script...",
            Duration = 3
        })

        ScreenGui:Destroy()

        local s, code = pcall(function()
            return game:HttpGet(rawScriptUrl)
        end)

        if s then
            loadstring(code)()
        else
            warn("Failed to load script:", code)
        end

    else
        -- wrong key
        local copied = pcall(function()
            setclipboard(keyLink)
        end)

        StarterGui:SetCore("SendNotification", {
            Title = "Wrong Key",
            Text = copied and "Key link copied!" or "Copy manually: "..keyLink,
            Duration = 5
        })
    end
end)
