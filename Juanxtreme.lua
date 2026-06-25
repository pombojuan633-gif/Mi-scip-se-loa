local Players = game:GetService("Players")
local player = Players.LocalPlayer

local cooldown = false
local cooldownTime = 30

-- Crear GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Parent = screenGui
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.8, 0)
button.Text = "Ir a Etapa 15"

button.MouseButton1Click:Connect(function()
	if cooldown then
		return
	end

	local checkpoint = workspace:FindFirstChild("Area15")

	if checkpoint and player.Character then
		player.Character:PivotTo(checkpoint.CFrame + Vector3.new(0, 5, 0))
	end

	cooldown = true

	for i = cooldownTime, 1, -1 do
		button.Text = "Espera " .. i .. "s"
		task.wait(1)
	end

	button.Text = "Ir a Etapa 15"
	cooldown = false
end)
