

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

local SkinLists = {
    ["Assault Rifle"] = {"Default", "AK-47", "AUG", "Tommy Gun", "Boneclaw Rifle", "Gingerbread AUG", "AKEY-47", "100K Visits"},
    ["Bow"] = {"Default", "Compound Bow", "Raven Bow", "Dream Bow", "Bat Bow", "Frostbite Bow", "Beloved Bow", "Balloon Bow", "Glorious Bow", "Key Bow"},
    ["Burst Rifle"] = {"Default", "Electro Burst", "Aqua Burst", "FAMAS", "Spectral Burst", "Pine Burst"},
    ["Crossbow"] = {"Default", "Pixel Crossbow", "Harpoon Crossbow", "Violin Crossbow", "Crossbone", "Frostbite Crossbow", "Arch Crossbow", "Glorious Crossbow"},
    ["Distortion"] = {"Default", "Plasma Distortion", "Magma Distortion", "Cyber Distortion", "Expirement D15", "Sleighstortion"},
    ["Energy Rifle"] = {"Default", "Hacker Rifle", "Hydro Rifle", "Void Rifle", "Soul Rifle", "New Years Energy Rifle"},
    ["Flamethrower"] = {"Default", "Pixel Flamethrower", "Lamethrower", "Glitterthrower", "Jack O' Thrower", "Snowblower", "Keythrower"},
    ["Grenade Launcher"] = {"Default", "Swashbuckler", "Uranium Launcher", "Gearnade Launcher", "Skull Grenade Launcher", "Snowball Launcher"},
    ["Gunblade"] = {"Default", "Hyper Gunblade", "Crude Gunblade", "Gunsaw", "Boneblade", "Elf's Gunblade"},
    ["Minigun"] = {"Default", "Lasergun 3000", "Pixel Minigun", "Fighter Jet", "Pumpkin Minigun", "Wrapped Minigun"},
    ["Paintball Gun"] = {"Default", "Slime Gun", "Boba Gun", "Ketchup Gun", "Brain Gun", "Snowball Gun"},
    ["RPG"] = {"Default", "Nuke Launcher", "Spaceship Launcher", "Squid Launcher", "Pumpkin Launcher", "Firework Launcher"},
    ["Shotgun"] = {"Default", "Balloon Shotgun", "Hyper Shotgun", "Cactus Shotgun", "Broomstick", "Wrapped Shotgun"},
    ["Sniper"] = {"Default", "Pixel Sniper", "Hyper Sniper", "Event Horizon", "Eyething Sniper", "Gingerbread Sniper", "Keyper", "Glorious Sniper"},
    ["Daggers"] = {"Default", "Aces", "Paper Planes", "Shurikens", "Bat Daggers", "Cookies", "Crystal Daggers"},
    ["Energy Pistols"] = {"Default", "Void Pistols", "Hydro Pistols", "Soul Pistols", "New Years Energy Pistols"},
    ["Exogun"] = {"Default", "Singularity", "Raygun", "Repulsor", "Exogourd", "Midnight Festive Exogun"},
    ["Flare Gun"] = {"Default", "Firework Gun", "Dynamite Gun", "Banana Flare", "Vexed Flare Gun", "Wrapped Flare Gun"},
    ["Handgun"] = {"Default", "Blaster", "Hand Gun", "Gumball Handgun", "Pumpkin Handgun", "Gingerbread Handgun"},
    ["Revolver"] = {"Default", "Desert Eagle", "Sheriff", "Peppergun", "Boneclaw Revolver", "Peppermint Sheriff"},
    ["Shorty"] = {"Default", "Not So Shorty", "Lovely Shorty", "Balloon Shorty", "Demon Shorty", "Wrapped Shorty"},
    ["Slingshot"] = {"Default", "Stick", "Goal Post", "Harp", "Boneshot", "Reindeer Slingshot"},
    ["Spray"] = {"Default", "Lovely Spray", "Nail Gun", "Bottle Spray", "Boneclaw Spray", "Pine Spray", "Key Spray"},
    ["Uzi"] = {"Default", "Water Uzi", "Electro Uzi", "Money Gun", "Demon Uzi", "Pine Uzi"},
    ["Warper"] = {"Default", "Glitter Warper", "Arcane Warper", "Hotel Bell", "Experiment W4", "Frost Warper"},
    ["Battle Axe"] = {"Default", "The Shred", "Ban Axe", "Cerulean Axe", "Mimic Axe", "Nordic Axe"},
    ["Chainsaw"] = {"Default", "Blobsaw", "Handsaws", "Mega Drill", "Buzzsaw", "Festive Buzzsaw"},
    ["Fists"] = {"Default", "Boxing Gloves", "Brass Knuckles", "Fists Of Hurt", "Pumpkin Claws", "Festive Fists"},
    ["Katana"] = {"Default", "Saber", "Lightning Bolt", "Stellar Katana", "Devil's Trident", "New Years Katana", "Keytana", "Arch Katana", "Crystal Katana", "Pixel Katana", "Glorious Katana"},
    ["Knife"] = {"Default", "Chancla", "Karambit", "Balisong", "Machete", "Candy Cane", "Keylisong", "Keyrambit"},
    ["Riot Shield"] = {"Default", "Door", "Energy Shield", "Masterpiece", "Tombstone Shield", "Sled"},
    ["Scythe"] = {"Default", "Scythe of Death", "Anchor", "Sakura Scythe", "Bat Scythe", "Cryo Scythe", "Crystal Scythe", "Keythe", "Bug Net"},
    ["Trowel"] = {"Default", "Plastic Shovel", "Garden Shovel", "Paintbrush", "Pumpkin Carver", "Snow Shovel"},
    ["Flashbang"] = {"Default", "Disco Ball", "Camera", "Lightbulb", "Skullbang", "Shining Star"},
    ["Freeze Ray"] = {"Default", "Temporal Ray", "Bubble Ray", "Gum Ray", "Spider Ray", "Wrapped Freeze Ray"},
    ["Grenade"] = {"Default", "Whoopee Cushion", "Water Balloon", "Dynamite", "Soul Grenade", "Jingle Grenade"},
    ["Jump Pad"] = {"Default", "Trampoline", "Bounce House", "Shady Chicken Sandwich", "Spider Web", "Jolly Man"},
    ["Medkit"] = {"Default", "Sandwich", "Laptop", "Medkitty", "Bucket of Candy", "Milk & Cookies", "Box of Chocolates", "Briefcase"},
    ["Molotov"] = {"Default", "Coffee", "Torch", "Lava Lamp", "Vexed Candle", "Hot Coals"},
    ["Satchel"] = {"Default", "Advanced Satchel", "Notebook Satchel", "Bag O' Money", "Potion Satchel", "Suspicious Gift"},
    ["Smoke Grenade"] = {"Default", "Emoji Cloud", "Balance", "Hourglass", "Eyeball", "Snowglobe"},
    ["Subspace Tripmine"] = {"Default", "Don't Press", "Spring", "DIY Tripmine", "Trick or Treat", "Dev In the Box"},
    ["War Horn"] = {"Default", "Trumpet", "Megaphone", "Air Horn", "Boneclaw Horn", "Mammoth Horn"},
    ["Warpstone"] = {"Default", "Cyber Warpstone", "Teleport Disc", "Electropunk Warpstone", "Warpbone", "Warpstar"},
    ["Permafrost"] = {"Default", "Snowman Permafrost", "Ice Permafrost", "Glorious Permafrost"},
}

_G.ActiveSelection = nil
_G.EquippedData = _G.EquippedData or {}
for weapon in pairs(SkinLists) do
    if not _G.EquippedData[weapon] then
        _G.EquippedData[weapon] = {Skin = "Default", Wrap = "None"}
    end
end

local rbx_require = getrenv and getrenv().require or require
local CosmeticLibrary = rbx_require(ReplicatedStorage.Modules:WaitForChild("CosmeticLibrary"))
local ItemLibrary = rbx_require(ReplicatedStorage.Modules:WaitForChild("ItemLibrary"))
local ReplicatedClass = rbx_require(ReplicatedStorage.Modules:WaitForChild("ReplicatedClass"))
local ClientItem = rbx_require(player.PlayerScripts:WaitForChild("Modules"):WaitForChild("ClientReplicatedClasses"):WaitForChild("ClientFighter"):WaitForChild("ClientItem"))
local ClientViewModel = rbx_require(player.PlayerScripts.Modules.ClientReplicatedClasses.ClientFighter.ClientItem:WaitForChild("ClientViewModel"))

local function getCosmeticData(name, cType)
    local base = CosmeticLibrary.Cosmetics[name]
    if not base then return nil end
    local data = table.clone(base)
    data.Name = name
    data.Type = cType
    if name == "AKEY-47" then
        data.IsMythical = true
        data.BundlePath = "Bundles"
    elseif name:find("Gingerbread") then
        data.BundlePath = "Festive Skin Case"
    end
    return data
end

local oldGetWrap = ClientViewModel.GetWrap
ClientViewModel.GetWrap = function(self)
    local weaponName = self.ClientItem and self.ClientItem.Name
    if weaponName and _G.EquippedData[weaponName] then
        local wrapName = _G.EquippedData[weaponName].Wrap
        if wrapName ~= "None" then return getCosmeticData(wrapName, "Wrap") end
    end
    return oldGetWrap(self)
end

local oldNew = ClientViewModel.new
ClientViewModel.new = function(replicatedData, clientItem)
    local weaponName = clientItem.Name
    if _G.EquippedData[weaponName] and clientItem.ClientFighter.Player == player then
        local dataKey = ReplicatedClass:ToEnum("Data")
        local skinKey = ReplicatedClass:ToEnum("Skin")
        local nameKey = ReplicatedClass:ToEnum("Name")
        replicatedData[dataKey] = replicatedData[dataKey] or {}
        local selectedSkin = _G.EquippedData[weaponName].Skin
        if selectedSkin ~= "Default" then
            replicatedData[dataKey][skinKey] = getCosmeticData(selectedSkin, "Skin")
            replicatedData[dataKey][nameKey] = selectedSkin
        end
    end
    local vm = oldNew(replicatedData, clientItem)
    task.delay(0.1, function() if vm and vm._UpdateWrap then vm:_UpdateWrap() end end)
    return vm
end

local ScreenGui = Instance.new("ScreenGui", player.PlayerGui)
ScreenGui.ResetOnSpawn = false

local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 950, 0, 620)
Main.Position = UDim2.new(0.5, -475, 0.5, -310)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
Title.Text = "Aniha Skin Changer"
Title.TextColor3 = Color3.fromRGB(255, 80, 80)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 26

local Left = Instance.new("Frame", Main)
Left.Size = UDim2.new(0, 280, 1, -70)
Left.Position = UDim2.new(0, 15, 0, 60)
Left.BackgroundColor3 = Color3.fromRGB(28, 28, 34)

local WeaponSearch = Instance.new("TextBox", Left)
WeaponSearch.Size = UDim2.new(1, -20, 0, 35)
WeaponSearch.Position = UDim2.new(0, 10, 0, 10)
WeaponSearch.PlaceholderText = "Search weapon..."
WeaponSearch.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
WeaponSearch.TextColor3 = Color3.new(1,1,1)
WeaponSearch.Font = Enum.Font.Gotham

local WeaponScroll = Instance.new("ScrollingFrame", Left)
WeaponScroll.Size = UDim2.new(1, -20, 1, -55)
WeaponScroll.Position = UDim2.new(0, 10, 0, 55)
WeaponScroll.BackgroundTransparency = 1
WeaponScroll.ScrollBarThickness = 6

local WeaponLayout = Instance.new("UIListLayout", WeaponScroll)
WeaponLayout.Padding = UDim.new(0, 6)
WeaponLayout.SortOrder = Enum.SortOrder.Name

local Right = Instance.new("Frame", Main)
Right.Size = UDim2.new(1, -310, 1, -70)
Right.Position = UDim2.new(0, 305, 0, 60)
Right.BackgroundColor3 = Color3.fromRGB(28, 28, 34)

local SelectedLabel = Instance.new("TextLabel", Right)
SelectedLabel.Size = UDim2.new(1, -20, 0, 40)
SelectedLabel.Position = UDim2.new(0, 10, 0, 10)
SelectedLabel.BackgroundTransparency = 1
SelectedLabel.Text = "Select a weapon on the left"
SelectedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
SelectedLabel.Font = Enum.Font.GothamBold
SelectedLabel.TextSize = 20

local SkinScroll = Instance.new("ScrollingFrame", Right)
SkinScroll.Size = UDim2.new(1, -20, 1, -70)
SkinScroll.Position = UDim2.new(0, 10, 0, 60)
SkinScroll.BackgroundTransparency = 1
SkinScroll.ScrollBarThickness = 8

local SkinGrid = Instance.new("UIGridLayout", SkinScroll)
SkinGrid.CellSize = UDim2.new(0, 130, 0, 155)
SkinGrid.CellPadding = UDim2.new(0, 15, 0, 15)

local function GetThumb(name)
    if ItemLibrary.ViewModels and ItemLibrary.ViewModels[name] then
        local data = ItemLibrary.ViewModels[name]
        if data.ImageHighResolution then return data.ImageHighResolution end
        if data.Image then return data.Image end
        if data.Thumbnail then return data.Thumbnail end
    end
    if CosmeticLibrary and CosmeticLibrary.Skins then
        for _, tbl in pairs(CosmeticLibrary.Skins) do
            if tbl[name] then
                local data = tbl[name]
                if data.ImageHighResolution then return data.ImageHighResolution end
                if data.Image then return data.Image end
                if data.Thumbnail then return data.Thumbnail end
            end
        end
    end
    if ItemLibrary.ViewModels and ItemLibrary.ViewModels.Bundles then
        local bundle = ItemLibrary.ViewModels.Bundles
        if bundle[name] then
            local data = bundle[name]
            if data.ImageHighResolution then return data.ImageHighResolution end
            if data.Image then return data.Image end
            if data.Thumbnail then return data.Thumbnail end
        end
    end
    return ""
end

local function EquipSkin(weapon, skin)
    _G.EquippedData[weapon].Skin = skin
    pcall(function() CosmeticLibrary.Equip(weapon, "Skin", skin) end)
    pcall(function()
        local rem = ReplicatedStorage:FindFirstChild("EquipCosmetic", true) or ReplicatedStorage.Remotes:FindFirstChild("EquipCosmetic")
        if rem then rem:FireServer(weapon, skin) end
    end)
    pcall(function()
        local char = player.Character
        if char then
            local tool = char:FindFirstChild(weapon)
            if tool then
                local oldParent = tool.Parent
                tool.Parent = nil
                task.wait()
                tool.Parent = oldParent
            end
        end
    end)
    SelectedLabel.Text = "EQUIPPED: " .. weapon .. " - " .. skin
end

local function MakeWeaponBtn(weapon)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 52)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
    btn.Text = "   " .. weapon
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 16
    btn.Parent = WeaponScroll
    local img = Instance.new("ImageLabel", btn)
    img.Size = UDim2.new(0, 40, 0, 40)
    img.Position = UDim2.new(1, -50, 0.5, -20)
    img.BackgroundTransparency = 1
    img.Image = GetThumb(weapon)
    btn.MouseButton1Click:Connect(function()
        for _, b in pairs(WeaponScroll:GetChildren()) do
            if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(40,40,48) end
        end
        btn.BackgroundColor3 = Color3.fromRGB(80, 140, 255)
        for _, child in pairs(SkinScroll:GetChildren()) do
            if child:IsA("ImageButton") then child:Destroy() end
        end
        SelectedLabel.Text = weapon .. " Skins"
        for _, skin in ipairs(SkinLists[weapon]) do
            local sbtn = Instance.new("ImageButton")
            sbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
            sbtn.Image = GetThumb(skin)
            sbtn.Parent = SkinScroll
            local lbl = Instance.new("TextLabel", sbtn)
            lbl.Size = UDim2.new(1,0,0,35)
            lbl.Position = UDim2.new(0,0,1,-35)
            lbl.BackgroundTransparency = 0.3
            lbl.BackgroundColor3 = Color3.new(0,0,0)
            lbl.Text = skin
            lbl.TextColor3 = Color3.new(1,1,1)
            lbl.Font = Enum.Font.Gotham
            lbl.TextScaled = true
            sbtn.MouseButton1Click:Connect(function()
                EquipSkin(weapon, skin)
            end)
        end
        SkinScroll.CanvasSize = UDim2.new(0,0,0, SkinGrid.AbsoluteContentSize.Y + 40)
    end)
end

for weapon in pairs(SkinLists) do
    MakeWeaponBtn(weapon)
end
WeaponScroll.CanvasSize = UDim2.new(0,0,0, WeaponLayout.AbsoluteContentSize.Y)

WeaponSearch:GetPropertyChangedSignal("Text"):Connect(function()
    local txt = WeaponSearch.Text:lower()
    for _, btn in pairs(WeaponScroll:GetChildren()) do
        if btn:IsA("TextButton") then
            local btnText = btn.Text:match("^%s*(.-)%s*$"):lower()
            btn.Visible = txt == "" or btnText:find(txt)
        end
    end
end)

UserInputService.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.K then Main.Visible = not Main.Visible end
end)