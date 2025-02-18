local Library = {}

function Library.CreateLib(title, theme)
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local TitleLabel = Instance.new("TextLabel")
    local TabContainer = Instance.new("Frame")
    local TabButtons = Instance.new("Frame")
    local MinimizeButton = Instance.new("TextButton")
    local CloseButton = Instance.new("TextButton")
    local Notification = Instance.new("TextLabel")
    
    ScreenGui.Name = "LibraryUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = game.CoreGui

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    MainFrame.Size = UDim2.new(0, 500, 0, 400)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Active = true
    MainFrame.Draggable = true

    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = MainFrame
    TitleLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TitleLabel.Size = UDim2.new(1, 0, 0, 50)
    TitleLabel.Font = Enum.Font.SourceSans
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 24

    TabButtons.Name = "TabButtons"
    TabButtons.Parent = MainFrame
    TabButtons.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TabButtons.Position = UDim2.new(0, 0, 0, 50)
    TabButtons.Size = UDim2.new(1, 0, 0, 30)

    TabContainer.Name = "TabContainer"
    TabContainer.Parent = MainFrame
    TabContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TabContainer.Position = UDim2.new(0, 0, 0, 80)
    TabContainer.Size = UDim2.new(1, 0, 1, -80)
    TabContainer.ClipsDescendants = true

    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Parent = MainFrame
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    MinimizeButton.Position = UDim2.new(1, -60, 0, 10)
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Font = Enum.Font.SourceSans
    MinimizeButton.Text = "-"
    MinimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    MinimizeButton.TextSize = 24

    CloseButton.Name = "CloseButton"
    CloseButton.Parent = MainFrame
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    CloseButton.Position = UDim2.new(1, -30, 0, 10)
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Font = Enum.Font.SourceSans
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    CloseButton.TextSize = 24

    Notification.Name = "Notification"
    Notification.Parent = ScreenGui
    Notification.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Notification.BackgroundTransparency = 0.5
    Notification.Position = UDim2.new(1, -250, 1, -50)
    Notification.Size = UDim2.new(0, 240, 0, 40)
    Notification.Font = Enum.Font.SourceSans
    Notification.Text = "Press Right Control to restore UI"
    Notification.TextColor3 = Color3.fromRGB(255, 255, 255)
    Notification.TextSize = 18
    Notification.Visible = false

    if theme == "DarkTheme" then
        MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        TitleLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TabButtons.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TabContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    elseif theme == "LightTheme" then
        MainFrame.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
        TitleLabel.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
        TitleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
        TabButtons.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
        TabContainer.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
    elseif theme == "BlueTheme" then
        MainFrame.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
        TitleLabel.BackgroundColor3 = Color3.fromRGB(60, 120, 170)
        TabButtons.BackgroundColor3 = Color3.fromRGB(60, 120, 170)
        TabContainer.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    elseif theme == "GreenTheme" then
        MainFrame.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
        TitleLabel.BackgroundColor3 = Color3.fromRGB(30, 130, 30)
        TabButtons.BackgroundColor3 = Color3.fromRGB(30, 130, 30)
        TabContainer.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
    elseif theme == "RedTheme" then
        MainFrame.BackgroundColor3 = Color3.fromRGB(220, 20, 60)
        TitleLabel.BackgroundColor3 = Color3.fromRGB(210, 10, 50)
        TabButtons.BackgroundColor3 = Color3.fromRGB(210, 10, 50)
        TabContainer.BackgroundColor3 = Color3.fromRGB(220, 20, 60)
    end

    local Window = {}
    local tabs = {}

    function Window:NewTab(tabName)
        local TabButton = Instance.new("TextButton")
        local TabFrame = Instance.new("Frame")

        TabButton.Name = tabName .. "Button"
        TabButton.Parent = TabButtons
        TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TabButton.Size = UDim2.new(0, 100, 1, 0)
        TabButton.Position = UDim2.new(#tabs * 0.25, 0, 0, 0)
        TabButton.Font = Enum.Font.SourceSans
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 18

        TabFrame.Name = tabName .. "Frame"
        TabFrame.Parent = TabContainer
        TabFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TabFrame.Size = UDim2.new(1, 0, 1, 0)
        TabFrame.Visible = #tabs == 0

        table.insert(tabs, TabFrame)

        TabButton.MouseButton1Click:Connect(function()
            for _, tab in pairs(tabs) do
                tab.Visible = false
            end
            TabFrame.Visible = true
        end)

        local Tab = {}
        function Tab:CreateButton(buttonData)
            local Button = Instance.new("TextButton")

            Button.Name = buttonData.Name
            Button.Parent = TabFrame
            Button.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            Button.Size = UDim2.new(0, 200, 0, 50)
            Button.Position = UDim2.new(0, 10, 0, 10 + (#TabFrame:GetChildren() - 1) * 60)
            Button.Font = Enum.Font.SourceSans
            Button.Text = buttonData.Name
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 18

            Button.MouseButton1Click:Connect(buttonData.Callback)
        end

        function Tab:CreateSlider(sliderData)
            local SliderFrame = Instance.new("Frame")
            local SliderLabel = Instance.new("TextLabel")
            local Slider = Instance.new("TextButton")
            local SliderBar = Instance.new("Frame")

            SliderFrame.Name = sliderData.Name .. "Frame"
            SliderFrame.Parent = TabFrame
            SliderFrame.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            SliderFrame.Size = UDim2.new(0, 300, 0, 50)
            SliderFrame.Position = UDim2.new(0, 10, 0, 10 + (#TabFrame:GetChildren() - 1) * 60)

            SliderLabel.Name = sliderData.Name .. "Label"
            SliderLabel.Parent = SliderFrame
            SliderLabel.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            SliderLabel.Size = UDim2.new(0, 100, 0, 50)
            SliderLabel.Font = Enum.Font.SourceSans
            SliderLabel.Text = sliderData.Name
            SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderLabel.TextSize = 18

            SliderBar.Name = sliderData.Name .. "Bar"
            SliderBar.Parent = SliderFrame
            SliderBar.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
            SliderBar.Position = UDim2.new(0, 110, 0.5, -5)
            SliderBar.Size = UDim2.new(1, -120, 0, 10)

            Slider.Name = sliderData.Name
            Slider.Parent = SliderBar
            Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Slider.Size = UDim2.new(0, 20, 1, 0)
            Slider.Position = UDim2.new((sliderData.Default - sliderData.Min) / (sliderData.Max - sliderData.Min), -10, 0, 0)
            Slider.Text = ""

            local dragging = false
            local function updateSlider(input)
                local pos = UDim2.new(math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1), -10, 0, 0)
                Slider.Position = pos
                local value = math.floor(sliderData.Min + (pos.X.Scale * (sliderData.Max - sliderData.Min)))
                sliderData.Callback(value)
            end

            Slider.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                end
            end)

            Slider.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)

            game:GetService("UserInputService").InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    updateSlider(input)
                end
            end)
        end

        function Tab:CreateLabel(labelData)
            local Label = Instance.new("TextLabel")

            Label.Name = labelData.Name
            Label.Parent = TabFrame
            Label.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            Label.Size = UDim2.new(0, 300, 0, 50)
            Label.Position = UDim2.new(0, 10, 0, 10 + (#TabFrame:GetChildren() - 1) * 60)
            Label.Font = Enum.Font.SourceSans
            Label.Text = labelData.Text
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 18
        end

        function Tab:CreateToggle(toggleData)
            local ToggleFrame = Instance.new("Frame")
            local ToggleLabel = Instance.new("TextLabel")
            local Toggle = Instance.new("TextButton")

            ToggleFrame.Name = toggleData.Name .. "Frame"
            ToggleFrame.Parent = TabFrame
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            ToggleFrame.Size = UDim2.new(0, 200, 0, 50)
            ToggleFrame.Position = UDim2.new(0, 10, 0, 10 + (#TabFrame:GetChildren() - 1) * 60)

            ToggleLabel.Name = toggleData.Name .. "Label"
            ToggleLabel.Parent = ToggleFrame
            ToggleLabel.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            ToggleLabel.Size = UDim2.new(0.8, 0, 1, 0)
            ToggleLabel.Font = Enum.Font.SourceSans
            ToggleLabel.Text = toggleData.Name
            ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.TextSize = 18

            Toggle.Name = toggleData.Name
            Toggle.Parent = ToggleFrame
            Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            Toggle.Size = UDim2.new(0.2, 0, 1, 0)
            Toggle.Position = UDim2.new(0.8, 0, 0, 0)
            Toggle.Text = "Off"

            local toggled = false
            Toggle.MouseButton1Click:Connect(function()
                toggled = not toggled
                Toggle.BackgroundColor3 = toggled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
                Toggle.Text = toggled and "On" or "Off"
                toggleData.Callback(toggled)
            end)
        end

        function Tab:CreateTextBox(textBoxData)
            local TextBoxFrame = Instance.new("Frame")
            local TextBoxLabel = Instance.new("TextLabel")
            local TextBox = Instance.new("TextBox")

            TextBoxFrame.Name = textBoxData.Name .. "Frame"
            TextBoxFrame.Parent = TabFrame
            TextBoxFrame.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            TextBoxFrame.Size = UDim2.new(0, 300, 0, 50)
            TextBoxFrame.Position = UDim2.new(0, 10, 0, 10 + (#TabFrame:GetChildren() - 1) * 60)

            TextBoxLabel.Name = textBoxData.Name .. "Label"
            TextBoxLabel.Parent = TextBoxFrame
            TextBoxLabel.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            TextBoxLabel.Size = UDim2.new(0.3, 0, 1, 0)
            TextBoxLabel.Font = Enum.Font.SourceSans
            TextBoxLabel.Text = textBoxData.Name
            TextBoxLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBoxLabel.TextSize = 18

            TextBox.Name = textBoxData.Name
            TextBox.Parent = TextBoxFrame
            TextBox.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
            TextBox.Position = UDim2.new(0.3, 10, 0, 10)
            TextBox.Size = UDim2.new(0.65, -20, 0.8, -20)
            TextBox.Font = Enum.Font.SourceSans
            TextBox.Text = textBoxData.Default or ""
            TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.TextSize = 18
            TextBox.FocusLost:Connect(function(enterPressed)
                if enterPressed then
                    textBoxData.Callback(TextBox.Text)
                end
            end)
        end

        return Tab
    end

    MinimizeButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        Notification.Visible = true
        delay(5, function()
            if Notification then
                Notification.Visible = false
            end
        end)
    end)

    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.RightControl and not gameProcessed then
            MainFrame.Visible = true
            Notification.Visible = false
        end
    end)

    print("UI Library created with title:", title)

    return Window
end

return Library
