local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()
--credit to whoever made this hot ui i couldnt find u D:

--Place Variables
local Players = game:GetService("Players")
local RE = game:GetService("ReplicatedStorage")
local Remotes = RE:WaitForChild("Remotes")

--Remotes
local AddSpeed = Remotes:WaitForChild("AddSpeed")
local Rebirth = Remotes:WaitForChild("Rebirth")

--Variables
Autoclick = false
AutoOrb = false
AutoRebirth = false

--Functions
local function Click()
    while Autoclick == true do
        game:GetService("ReplicatedStorage").Remotes.AddSpeed:FireServer()
        wait(0.2)
    end
end

local function OrbCollect()
    while AutoOrb == true do
        for i, v in pairs(game:GetService("Workspace").OrbSpawns:GetDescendants()) do
            if v.Name == "TouchInterest" and v.Parent then
                firetouchinterest(game:GetService('Players').LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            end
        end
        task.wait()
    end
end

local function rebirth()
    while AutoRebirth == true do
        Rebirth:FireServer()
        wait(1)
    end
end

--UI
local win = lib:Window("Speed Run Simulator",Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

local AF = win:Tab("Auto-Farming")
local INFO = win:Tab("Info")

AF:Toggle("Auto Orb Collect",false, function(t)
    AutoOrb = t
    OrbCollect()
end)

AF:Toggle("Autoclick",false, function(t)
    Autoclick = t
    Click()
end)

AF:Toggle("Auto Rebirth",false, function(t)
    AutoRebirth = t
    rebirth()
end)

INFO:Label("Credits to:")
INFO:Label("token#7222 - making the code")
INFO:Label("simple#5910 - helping me not be bored")
INFO:Label("Whoever made this UI (I assume its Dawid) - UI Lib")
INFO:Label("To toggle the UI press Right-Control")