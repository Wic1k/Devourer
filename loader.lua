local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

getgenv().keysystem = false

if isfile("devourer_key.txt") then
    local savedKey = readfile("devourer_key.txt")
    if savedKey == "Devourer" then
        getgenv().keysystem = true
    end
end

if not getgenv().keysystem then
    local DoGInterface = Instance.new("ScreenGui")
    local MainCanvas = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local MainStroke = Instance.new("UIStroke")
    local StrokeGradient = Instance.new("UIGradient")
    local TopBar = Instance.new("Frame")
    local TitleText = Instance.new("TextLabel")
    local SubTitle = Instance.new("TextLabel")
    local KeyInputFrame = Instance.new("Frame")
    local KeyInputBox = Instance.new("TextBox")
    local InputCorner = Instance.new("UICorner")
    local InputStroke = Instance.new("UIStroke")
    local ButtonContainer = Instance.new("Frame")
    local LoginButton = Instance.new("TextButton")
    local LoginCorner = Instance.new("UICorner")
    local LoginGradient = Instance.new("UIGradient")
    local GetKeyButton = Instance.new("TextButton")
    local GetKeyCorner = Instance.new("UICorner")
    local GetKeyStroke = Instance.new("UIStroke")

    DoGInterface.Name = "DevourerKeySystem"
    DoGInterface.Parent = CoreGui
    DoGInterface.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    MainCanvas.Name = "MainCanvas"
    MainCanvas.Parent = DoGInterface
    MainCanvas.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
    MainCanvas.BorderSizePixel = 0
    MainCanvas.Position = UDim2.new(0.5, -225, 0.5, -125)
    MainCanvas.Size = UDim2.new(0, 450, 0, 250)
    MainCanvas.ClipsDescendants = false

    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainCanvas

    MainStroke.Parent = MainCanvas
    MainStroke.Thickness = 2
    MainStroke.Transparency = 0
    MainStroke.Color = Color3.fromRGB(255, 255, 255)

    StrokeGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(138, 43, 226)),
        ColorSequenceKeypoint.new(0.50, Color3.fromRGB(75, 0, 130)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 43, 226))
    }
    StrokeGradient.Rotation = 45
    StrokeGradient.Parent = MainStroke

    task.spawn(function()
        while MainStroke.Parent do
            StrokeGradient.Rotation = StrokeGradient.Rotation + 1
            task.wait(0.02)
        end
    end)

    TopBar.Name = "TopBar"
    TopBar.Parent = MainCanvas
    TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopBar.BackgroundTransparency = 1.000
    TopBar.Size = UDim2.new(1, 0, 0, 80)

    TitleText.Name = "Title"
    TitleText.Parent = TopBar
    TitleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleText.BackgroundTransparency = 1.000
    TitleText.Position = UDim2.new(0, 0, 0, 15)
    TitleText.Size = UDim2.new(1, 0, 0, 35)
    TitleText.Font = Enum.Font.GothamBlack
    TitleText.Text = "DEVOURER HUB"
    TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleText.TextSize = 28.000

    local UIGradientTitle = Instance.new("UIGradient")
    UIGradientTitle.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(200, 100, 255)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))
    }
    UIGradientTitle.Parent = TitleText

    SubTitle.Name = "SubTitle"
    SubTitle.Parent = TopBar
    SubTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SubTitle.BackgroundTransparency = 1.000
    SubTitle.Position = UDim2.new(0, 0, 0, 45)
    SubTitle.Size = UDim2.new(1, 0, 0, 20)
    SubTitle.Font = Enum.Font.Gotham
    SubTitle.Text = "Authentication System"
    SubTitle.TextColor3 = Color3.fromRGB(150, 150, 180)
    SubTitle.TextSize = 14.000

    KeyInputFrame.Name = "InputFrame"
    KeyInputFrame.Parent = MainCanvas
    KeyInputFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
    KeyInputFrame.Position = UDim2.new(0.1, 0, 0.4, 0)
    KeyInputFrame.Size = UDim2.new(0.8, 0, 0, 50)

    InputCorner.CornerRadius = UDim.new(0, 8)
    InputCorner.Parent = KeyInputFrame

    InputStroke.Parent = KeyInputFrame
    InputStroke.Color = Color3.fromRGB(60, 60, 80)
    InputStroke.Thickness = 1
    InputStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    KeyInputBox.Name = "Box"
    KeyInputBox.Parent = KeyInputFrame
    KeyInputBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    KeyInputBox.BackgroundTransparency = 1.000
    KeyInputBox.Size = UDim2.new(1, 0, 1, 0)
    KeyInputBox.Font = Enum.Font.GothamBold
    KeyInputBox.PlaceholderColor3 = Color3.fromRGB(80, 80, 100)
    KeyInputBox.PlaceholderText = "Paste your key here..."
    KeyInputBox.Text = ""
    KeyInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyInputBox.TextSize = 16.000

    KeyInputBox.Focused:Connect(function()
        TweenService:Create(InputStroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(170, 0, 255)}):Play()
    end)

    KeyInputBox.FocusLost:Connect(function()
        TweenService:Create(InputStroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(60, 60, 80)}):Play()
    end)

    ButtonContainer.Name = "Buttons"
    ButtonContainer.Parent = MainCanvas
    ButtonContainer.BackgroundTransparency = 1.000
    ButtonContainer.Position = UDim2.new(0.1, 0, 0.7, 0)
    ButtonContainer.Size = UDim2.new(0.8, 0, 0, 45)

    LoginButton.Name = "Login"
    LoginButton.Parent = ButtonContainer
    LoginButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LoginButton.Size = UDim2.new(0.48, 0, 1, 0)
    LoginButton.Font = Enum.Font.GothamBold
    LoginButton.Text = "VERIFY KEY"
    LoginButton.TextColor3 = Color3.fromRGB(150, 150, 170)
    LoginButton.TextSize = 14.000
    LoginButton.AutoButtonColor = false
    LoginButton.ZIndex = 5

    LoginCorner.CornerRadius = UDim.new(0, 8)
    LoginCorner.Parent = LoginButton

    LoginGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(120, 20, 220)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(80, 0, 180))
    }
    LoginGradient.Parent = LoginButton

    GetKeyButton.Name = "GetKey"
    GetKeyButton.Parent = ButtonContainer
    GetKeyButton.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
    GetKeyButton.Position = UDim2.new(0.52, 0, 0, 0)
    GetKeyButton.Size = UDim2.new(0.48, 0, 1, 0)
    GetKeyButton.Font = Enum.Font.GothamBold
    GetKeyButton.Text = "GET KEY"
    GetKeyButton.TextColor3 = Color3.fromRGB(150, 150, 170)
    GetKeyButton.TextSize = 14.000
    GetKeyButton.AutoButtonColor = false

    GetKeyCorner.CornerRadius = UDim.new(0, 8)
    GetKeyCorner.Parent = GetKeyButton

    GetKeyStroke.Parent = GetKeyButton
    GetKeyStroke.Color = Color3.fromRGB(60, 60, 80)
    GetKeyStroke.Thickness = 1
    GetKeyStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local dragging, dragInput, dragStart, startPos
    local function update(input)
        local delta = input.Position - dragStart
        MainCanvas.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    MainCanvas.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = MainCanvas.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    MainCanvas.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    LoginButton.MouseEnter:Connect(function()
        TweenService:Create(LoginButton, TweenInfo.new(0.2), {Size = UDim2.new(0.48, 2, 1, 2), Position = UDim2.new(0, -1, 0, -1)}):Play()
    end)

    LoginButton.MouseLeave:Connect(function()
        TweenService:Create(LoginButton, TweenInfo.new(0.2), {Size = UDim2.new(0.48, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0)}):Play()
    end)

    GetKeyButton.MouseEnter:Connect(function()
        TweenService:Create(GetKeyStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(100, 100, 120)}):Play()
        TweenService:Create(GetKeyButton, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    end)

    GetKeyButton.MouseLeave:Connect(function()
        TweenService:Create(GetKeyStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(60, 60, 80)}):Play()
        TweenService:Create(GetKeyButton, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 150, 170)}):Play()
    end)

    GetKeyButton.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/eJ3y94X6Eu")
        local oldText = GetKeyButton.Text
        GetKeyButton.Text = "COPIED URL"
        GetKeyButton.TextColor3 = Color3.fromRGB(0, 255, 100)
        GetKeyStroke.Color = Color3.fromRGB(0, 255, 100)
        task.wait(1.5)
        GetKeyButton.Text = oldText
        GetKeyButton.TextColor3 = Color3.fromRGB(150, 150, 170)
        GetKeyStroke.Color = Color3.fromRGB(60, 60, 80)
    end)

    LoginButton.MouseButton1Click:Connect(function()
        if KeyInputBox.Text == "Devourer" then
            writefile("devourer_key.txt", KeyInputBox.Text)
            LoginButton.Text = "GRANTED"
            LoginGradient.Color = ColorSequence.new(Color3.fromRGB(0, 180, 80), Color3.fromRGB(0, 140, 60))
            MainCanvas.ClipsDescendants = true

            TweenService:Create(MainCanvas, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()
            TweenService:Create(MainStroke, TweenInfo.new(0.5), {Transparency = 1}):Play()
            TweenService:Create(DropShadow, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()

            for _, v in pairs(MainCanvas:GetDescendants()) do
                if v:IsA("GuiObject") then
                    TweenService:Create(v, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
                end
                if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
                    TweenService:Create(v, TweenInfo.new(0.3), {TextTransparency = 1, TextStrokeTransparency = 1}):Play()
                end
                if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                    TweenService:Create(v, TweenInfo.new(0.3), {ImageTransparency = 1}):Play()
                end
                if v:IsA("UIStroke") then
                    TweenService:Create(v, TweenInfo.new(0.3), {Transparency = 1}):Play()
                end
            end

            task.wait(1)
            getgenv().keysystem = true
            DoGInterface:Destroy()
        else
            local originalColor = InputStroke.Color
            InputStroke.Color = Color3.fromRGB(255, 50, 50)
            
            TweenService:Create(KeyInputFrame, TweenInfo.new(0.05, Enum.EasingStyle.Sine), {Position = UDim2.new(0.1, 5, 0.4, 0)}):Play()
            task.wait(0.05)
            TweenService:Create(KeyInputFrame, TweenInfo.new(0.05, Enum.EasingStyle.Sine), {Position = UDim2.new(0.1, -5, 0.4, 0)}):Play()
            task.wait(0.05)
            TweenService:Create(KeyInputFrame, TweenInfo.new(0.05, Enum.EasingStyle.Sine), {Position = UDim2.new(0.1, 0, 0.4, 0)}):Play()
            
            task.wait(1)
            InputStroke.Color = originalColor
        end
    end)
end

repeat task.wait(0.1) until getgenv().keysystem

if game.PlaceId == 71184132329621 then
  loadstring(game:HttpGet("https://api.junkie-development.de/api/v1/luascripts/public/06245a015e3d068a0e4be59993ab14c7531dd8e21f9d5087b5ca8cc9218181ad/download"))() -- purgatory
elseif game.PlaceId == 99323319663859 then
  loadstring(game:HttpGet("https://api.junkie-development.de/api/v1/luascripts/public/f1c9a9ac86c5a593c839d02f3355fc7c32ef6693afd322d309c5102a1ec22800/download"))() -- survive on a raft
end
