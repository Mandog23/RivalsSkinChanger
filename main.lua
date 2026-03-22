
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- ═══════════════════════════════════════════════
-- SKIN LISTS
-- ═══════════════════════════════════════════════
local SkinLists = {
    ["Assault Rifle"] = {"Default", "AK-47", "AUG", "Tommy Gun", "Boneclaw Rifle", "Gingerbread AUG", "AKEY-47", "100K Visits"},
    ["Bow"] = {"Default", "Compound Bow", "Raven Bow", "Dream Bow", "Bat Bow", "Frostbite Bow", "Beloved Bow", "Balloon Bow", "Glorious Bow", "Key Bow"},
    ["Burst Rifle"] = {"Default", "Electro Burst", "Aqua Burst", "FAMAS", "Spectral Burst", "Pine Burst"},
    ["Crossbow"] = {"Default", "Pixel Crossbow", "Harpoon Crossbow", "Violin Crossbow", "Crossbone", "Frostbite Crossbow", "Arch Crossbow", "Glorious Crossbow"},
    ["Distortion"] = {"Default", "Plasma Distortion", "Magma Distortion", "Cyber Distortion", "Expirement D15", "Sleighstortion"},
    ["Energy Rifle"] = {"Default", "Hacker Rifle", "Hydro Rifle", "Void Rifle", "Soul Rifle", "New Years Energy Rifle"},
    ["Flamethrower"] = {"Default", "Pixel Flamethrower", "Lamethrower", "Glitterthrower", "Jack O' Thrower", "Snowblower", "Keythrower", "Rainbowthrower"},
    ["Grenade Launcher"] = {"Default", "Swashbuckler", "Uranium Launcher", "Gearnade Launcher", "Skull Grenade Launcher", "Snowball Launcher"},
    ["Gunblade"] = {"Default", "Hyper Gunblade", "Crude Gunblade", "Gunsaw", "Boneblade", "Elf's Gunblade"},
    ["Minigun"] = {"Default", "Lasergun 3000", "Pixel Minigun", "Fighter Jet", "Pumpkin Minigun", "Wrapped Minigun"},
    ["Paintball Gun"] = {"Default", "Slime Gun", "Boba Gun", "Ketchup Gun", "Brain Gun", "Snowball Gun"},
    ["RPG"] = {"Default", "Nuke Launcher", "Spaceship Launcher", "Squid Launcher", "Pumpkin Launcher", "Firework Launcher"},
    ["Shotgun"] = {"Default", "Balloon Shotgun", "Hyper Shotgun", "Cactus Shotgun", "Broomstick", "Wrapped Shotgun"},
    ["Sniper"] = {"Default", "Pixel Sniper", "Hyper Sniper", "Event Horizon", "Eyething Sniper", "Gingerbread Sniper", "Keyper", "Glorious Sniper"},
    ["Daggers"] = {"Default", "Aces", "Paper Planes", "Shurikens", "Bat Daggers", "Cookies", "Crystal Daggers", "Keynais"},
    ["Energy Pistols"] = {"Default", "Void Pistols", "Hydro Pistols", "Soul Pistols", "New Years Energy Pistols"},
    ["Exogun"] = {"Default", "Singularity", "Raygun", "Repulsor", "Exogourd", "Midnight Festive Exogun"},
    ["Flare Gun"] = {"Default", "Firework Gun", "Dynamite Gun", "Banana Flare", "Vexed Flare Gun", "Wrapped Flare Gun"},
    ["Handgun"] = {"Default", "Blaster", "Hand Gun", "Gumball Handgun", "Pumpkin Handgun", "Gingerbread Handgun"},
    ["Revolver"] = {"Default", "Desert Eagle", "Sheriff", "Peppergun", "Boneclaw Revolver", "Peppermint Sheriff"},
    ["Shorty"] = {"Default", "Not So Shorty", "Lovely Shorty", "Balloon Shorty", "Demon Shorty", "Wrapped Shorty"},
    ["Slingshot"] = {"Default", "Stick", "Goal Post", "Harp", "Boneshot", "Reindeer Slingshot", "Lucky Horseshoe"},
    ["Spray"] = {"Default", "Lovely Spray", "Nail Gun", "Bottle Spray", "Boneclaw Spray", "Pine Spray", "Key Spray"},
    ["Uzi"] = {"Default", "Water Uzi", "Electro Uzi", "Money Gun", "Demon Uzi", "Pine Uzi"},
    ["Warper"] = {"Default", "Glitter Warper", "Arcane Warper", "Hotel Bell", "Experiment W4", "Frost Warper"},
    ["Battle Axe"] = {"Default", "The Shred", "Ban Axe", "Cerulean Axe", "Mimic Axe", "Nordic Axe"},
    ["Chainsaw"] = {"Default", "Blobsaw", "Handsaws", "Mega Drill", "Buzzsaw", "Festive Buzzsaw"},
    ["Fists"] = {"Default", "Boxing Gloves", "Brass Knuckles", "Fists Of Hurt", "Pumpkin Claws", "Festive Fists"},
    ["Katana"] = {"Default", "Saber", "Lightning Bolt", "Stellar Katana", "Devil's Trident", "New Years Katana", "Keytana", "Arch Katana", "Crystal Katana", "Pixel Katana", "Glorious Katana"},
    ["Knife"] = {"Default", "Chancla", "Karambit", "Balisong", "Machete", "Candy Cane", "Keylisong", "Keyrambit", "Caladbolg"},
    ["Riot Shield"] = {"Default", "Door", "Energy Shield", "Masterpiece", "Tombstone Shield", "Sled"},
    ["Scythe"] = {"Default", "Scythe of Death", "Anchor", "Sakura Scythe", "Bat Scythe", "Cryo Scythe", "Crystal Scythe", "Keythe", "Bug Net"},
    ["Trowel"] = {"Default", "Plastic Shovel", "Garden Shovel", "Paintbrush", "Pumpkin Carver", "Snow Shovel"},
    ["Flashbang"] = {"Default", "Disco Ball", "Camera", "Lightbulb", "Skullbang", "Shining Star"},
    ["Freeze Ray"] = {"Default", "Temporal Ray", "Bubble Ray", "Gum Ray", "Spider Ray", "Wrapped Freeze Ray"},
    ["Grenade"] = {"Default", "Whoopee Cushion", "Water Balloon", "Dynamite", "Soul Grenade", "Jingle Grenade"},
    ["Jump Pad"] = {"Default", "Trampoline", "Bounce House", "Shady Chicken Sandwich", "Spider Web", "Jolly Man"},
    ["Medkit"] = {"Default", "Sandwich", "Laptop", "Medkitty", "Bucket of Candy", "Milk & Cookies", "Box of Chocolates", "Briefcase"},
    ["Molotov"] = {"Default", "Coffee", "Torch", "Lava Lamp", "Vexed Candle", "Hot Coals", "Arch Molotov"},
    ["Satchel"] = {"Default", "Advanced Satchel", "Notebook Satchel", "Bag O' Money", "Potion Satchel", "Suspicious Gift"},
    ["Smoke Grenade"] = {"Default", "Emoji Cloud", "Balance", "Hourglass", "Eyeball", "Snowglobe"},
    ["Subspace Tripmine"] = {"Default", "Don't Press", "Spring", "DIY Tripmine", "Trick or Treat", "Dev In the Box", "Pot O Keys"},
    ["War Horn"] = {"Default", "Trumpet", "Megaphone", "Air Horn", "Boneclaw Horn", "Mammoth Horn"},
    ["Warpstone"] = {"Default", "Cyber Warpstone", "Teleport Disc", "Electropunk Warpstone", "Warpbone", "Warpstar"},
    ["Permafrost"] = {"Default", "Snowman Permafrost", "Ice Permafrost", "Glorious Permafrost"},
}

-- ═══════════════════════════════════════════════
-- SAVE / LOAD CONFIG
-- ═══════════════════════════════════════════════
local SAVE_FILE = "AnihaSkinConfig.json"

local function SaveConfig()
    local success, err = pcall(function()
        local data = {}
        for weapon, info in pairs(_G.EquippedData) do
            data[weapon] = {Skin = info.Skin or "Default", Wrap = info.Wrap or "None"}
        end
        writefile(SAVE_FILE, game:GetService("HttpService"):JSONEncode(data))
    end)
    return success
end

local function LoadConfig()
    local success, result = pcall(function()
        if isfile(SAVE_FILE) then
            local raw = readfile(SAVE_FILE)
            return game:GetService("HttpService"):JSONDecode(raw)
        end
        return nil
    end)
    if success and result then
        for weapon, info in pairs(result) do
            if _G.EquippedData[weapon] then
                _G.EquippedData[weapon].Skin = info.Skin or "Default"
                _G.EquippedData[weapon].Wrap = info.Wrap or "None"
            end
        end
        return true
    end
    return false
end

-- ═══════════════════════════════════════════════
-- GLOBAL STATE
-- ═══════════════════════════════════════════════
_G.ActiveSelection = nil
_G.EquippedData = _G.EquippedData or {}
for weapon in pairs(SkinLists) do
    if not _G.EquippedData[weapon] then
        _G.EquippedData[weapon] = {Skin = "Default", Wrap = "None"}
    end
end

-- Load saved config on startup
LoadConfig()
print("[+] Initializing Aniha Skin Changer...")

-- ═══════════════════════════════════════════════
-- COSMETIC HOOKS & ROBUST INITIALIZATION
-- ═══════════════════════════════════════════════
local function robust_require(module)
    local success, result = pcall(require, module)
    if success then return result end
    
    -- Try getgenv/getrenv bypasses if standard require fails (Executor context issue)
    if getgenv and getgenv().require then
        local ok, res = pcall(getgenv().require, module)
        if ok then return res end
    end
    if getrenv and getrenv().require then
        local ok, res = pcall(getrenv().require, module)
        if ok then return res end
    end
    
    warn("[!] Skin Changer: Failed to require module: " .. tostring(module))
    return nil
end

task.spawn(function()
    local CosmeticLibrary = robust_require(ReplicatedStorage:WaitForChild("Modules", 10):WaitForChild("CosmeticLibrary", 10))
    local ItemLibrary = robust_require(ReplicatedStorage.Modules:WaitForChild("ItemLibrary", 10))
    local ReplicatedClass = robust_require(ReplicatedStorage.Modules:WaitForChild("ReplicatedClass", 10))
    
    local Modules = player.PlayerScripts:WaitForChild("Modules", 10)
    local ClientItem = robust_require(Modules:WaitForChild("ClientReplicatedClasses", 10):WaitForChild("ClientFighter", 10):WaitForChild("ClientItem", 10))
    local ClientViewModel = robust_require(Modules.ClientReplicatedClasses.ClientFighter.ClientItem:WaitForChild("ClientViewModel", 10))

    if not CosmeticLibrary or not ItemLibrary or not ClientViewModel then
        warn("[!] Skin Changer: One or more critical modules failed to load. Check console for details.")
        return
    end


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
    -- Fully wrapped so any error falls back to the original GetWrap cleanly
    local ok, result = pcall(function()
        local weaponName = self.ClientItem and self.ClientItem.Name
        if weaponName and _G.EquippedData[weaponName] then
            local wrapName = _G.EquippedData[weaponName].Wrap
            if wrapName and wrapName ~= "None" then
                return getCosmeticData(wrapName, "Wrap")
            end
        end
    end)
    if ok and result then return result end
    return oldGetWrap(self)
end

local oldNew = ClientViewModel.new
ClientViewModel.new = function(replicatedData, clientItem)
    -- CRITICAL: wrap everything in pcall so that if *any* skin logic errors,
    -- oldNew still runs and the weapon still loads normally.
    -- Previously an error here would silently skip oldNew and leave the
    -- weapon invisible and potentially corrupt the camera state.
    pcall(function()
        if not clientItem then return end
        local weaponName = clientItem.Name
        if not weaponName then return end
        if not _G.EquippedData[weaponName] then return end

        -- ClientFighter may not exist on every weapon type
        local cf = rawget(clientItem, "ClientFighter")
            or (pcall(function() return clientItem.ClientFighter end) and clientItem.ClientFighter)
        if not cf or cf.Player ~= player then return end

        local selectedSkin = _G.EquippedData[weaponName].Skin
        if not selectedSkin or selectedSkin == "Default" then return end

        local cosData = getCosmeticData(selectedSkin, "Skin")
        -- Only patch replicatedData when we have valid cosmetic data.
        -- Assigning nil here would corrupt the table and break weapon init.
        if not cosData then return end

        local dataKey = ReplicatedClass:ToEnum("Data")
        local skinKey = ReplicatedClass:ToEnum("Skin")
        local nameKey = ReplicatedClass:ToEnum("Name")
        replicatedData[dataKey] = replicatedData[dataKey] or {}
        replicatedData[dataKey][skinKey] = cosData
        replicatedData[dataKey][nameKey] = selectedSkin
    end)

    -- Always call the original regardless of what happened above
    local vm = oldNew(replicatedData, clientItem)
    task.delay(0.1, function()
        pcall(function() if vm and vm._UpdateWrap then vm:_UpdateWrap() end end)
    end)
    return vm
end

-- ═══════════════════════════════════════════════
-- AUTO-INJECT
-- The ClientViewModel.new hook already reads _G.EquippedData every time a tool
-- is equipped, so skins apply automatically on spawn without us needing to do
-- anything extra. ApplyAllSkins is only used for the Load Config button.
-- ═══════════════════════════════════════════════
local function ApplyAllSkins()
    for weapon, info in pairs(_G.EquippedData) do
        if info.Skin ~= "Default" then
            pcall(function() CosmeticLibrary.Equip(weapon, "Skin", info.Skin) end)
        end
    end
    print("[+] Aniha: Skin state synced for " .. player.Name)
end

    -- No CharacterAdded hook needed — the ClientViewModel.new intercept handles it.
end)


-- ═══════════════════════════════════════════════
-- GUI
-- ═══════════════════════════════════════════════
local ScreenGui = Instance.new("ScreenGui", player.PlayerGui)
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "AnihaSkinChanger"
-- Do NOT set IgnoreGuiInset=true or ZIndexBehavior that intercepts game input

local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 950, 0, 660)
Main.Position = UDim2.new(0.5, -475, 0.5, -330)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
Main.BorderSizePixel = 0
-- Active=false (default) so the frame does NOT sink game mouse input
-- We implement dragging manually below so we don't need Draggable=true
Main.Active = false

-- Title bar
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
Title.Text = "Aniha Skin Changer  •  [ K ] Toggle"
Title.TextColor3 = Color3.fromRGB(255, 80, 80)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 22
Title.BorderSizePixel = 0

-- Weapon panel (left)
local Left = Instance.new("Frame", Main)
Left.Size = UDim2.new(0, 280, 1, -110)
Left.Position = UDim2.new(0, 15, 0, 60)
Left.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
Left.BorderSizePixel = 0

local WeaponSearch = Instance.new("TextBox", Left)
WeaponSearch.Size = UDim2.new(1, -20, 0, 35)
WeaponSearch.Position = UDim2.new(0, 10, 0, 10)
WeaponSearch.PlaceholderText = "Search weapon..."
WeaponSearch.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
WeaponSearch.TextColor3 = Color3.new(1, 1, 1)
WeaponSearch.Font = Enum.Font.Gotham
WeaponSearch.TextSize = 14
WeaponSearch.BorderSizePixel = 0
WeaponSearch.ClearTextOnFocus = false

local WeaponScroll = Instance.new("ScrollingFrame", Left)
WeaponScroll.Size = UDim2.new(1, -20, 1, -55)
WeaponScroll.Position = UDim2.new(0, 10, 0, 55)
WeaponScroll.BackgroundTransparency = 1
WeaponScroll.ScrollBarThickness = 6
WeaponScroll.BorderSizePixel = 0

local WeaponLayout = Instance.new("UIListLayout", WeaponScroll)
WeaponLayout.Padding = UDim.new(0, 6)
WeaponLayout.SortOrder = Enum.SortOrder.Name

-- Skin panel (right)
local Right = Instance.new("Frame", Main)
Right.Size = UDim2.new(1, -310, 1, -110)
Right.Position = UDim2.new(0, 305, 0, 60)
Right.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
Right.BorderSizePixel = 0

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
SkinScroll.BorderSizePixel = 0

local SkinGrid = Instance.new("UIGridLayout", SkinScroll)
SkinGrid.CellSize = UDim2.new(0, 130, 0, 155)
SkinGrid.CellPadding = UDim2.new(0, 15, 0, 15)

-- ═══════════════════════════════════════════════
-- BOTTOM TOOLBAR (Save / Load / Status)
-- ═══════════════════════════════════════════════
local Toolbar = Instance.new("Frame", Main)
Toolbar.Size = UDim2.new(1, 0, 0, 48)
Toolbar.Position = UDim2.new(0, 0, 1, -48)
Toolbar.BackgroundColor3 = Color3.fromRGB(26, 26, 32)
Toolbar.BorderSizePixel = 0

local StatusLabel = Instance.new("TextLabel", Toolbar)
StatusLabel.Size = UDim2.new(1, -310, 1, 0)
StatusLabel.Position = UDim2.new(0, 15, 0, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Ready  •  Config: AnihaSkinConfig.json"
StatusLabel.TextColor3 = Color3.fromRGB(140, 140, 160)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 13
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left

local function MakeToolbarBtn(text, xPos, color)
    local btn = Instance.new("TextButton", Toolbar)
    btn.Size = UDim2.new(0, 140, 0, 32)
    btn.Position = UDim2.new(1, xPos, 0.5, -16)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.BorderSizePixel = 0
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 6)
    return btn
end

local SaveBtn = MakeToolbarBtn("💾  Save Config", -300, Color3.fromRGB(50, 130, 50))
local LoadBtn = MakeToolbarBtn("📂  Load Config", -150, Color3.fromRGB(60, 100, 180))

local function FlashStatus(msg, color)
    StatusLabel.Text = msg
    StatusLabel.TextColor3 = color or Color3.fromRGB(140, 200, 140)
    task.delay(3, function()
        StatusLabel.Text = "Ready  •  Config: AnihaSkinConfig.json"
        StatusLabel.TextColor3 = Color3.fromRGB(140, 140, 160)
    end)
end

SaveBtn.MouseButton1Click:Connect(function()
    if SaveConfig() then
        FlashStatus("✅ Config saved to AnihaSkinConfig.json!", Color3.fromRGB(100, 220, 100))
    else
        FlashStatus("❌ Save failed (writefile not available)", Color3.fromRGB(220, 80, 80))
    end
end)

LoadBtn.MouseButton1Click:Connect(function()
    if LoadConfig() then
        FlashStatus("✅ Config loaded! Skins will apply next spawn.", Color3.fromRGB(100, 180, 255))
        -- Immediately re-apply to current character
        ApplyAllSkins()
    else
        FlashStatus("❌ No config file found or load failed.", Color3.fromRGB(220, 80, 80))
    end
end)

-- ═══════════════════════════════════════════════
-- THUMBNAIL HELPER
-- ═══════════════════════════════════════════════
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

-- ═══════════════════════════════════════════════
-- EQUIP SKIN
-- ═══════════════════════════════════════════════
local function EquipSkin(weapon, skin)
    _G.EquippedData[weapon].Skin = skin
    -- Update the cosmetic library state so next time the tool spawns it picks up the skin.
    -- We do NOT re-parent the tool here — that causes camera lock + vanishing weapons.
    pcall(function() CosmeticLibrary.Equip(weapon, "Skin", skin) end)
    SelectedLabel.Text = "✅ EQUIPPED: " .. weapon .. " — " .. skin
end

-- ═══════════════════════════════════════════════
-- WEAPON BUTTONS
-- ═══════════════════════════════════════════════
local function MakeWeaponBtn(weapon)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 52)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
    btn.Text = "   " .. weapon
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 16
    btn.BorderSizePixel = 0
    btn.Parent = WeaponScroll

    local img = Instance.new("ImageLabel", btn)
    img.Size = UDim2.new(0, 40, 0, 40)
    img.Position = UDim2.new(1, -50, 0.5, -20)
    img.BackgroundTransparency = 1
    img.Image = GetThumb(weapon)

    -- Active skin badge
    local badge = Instance.new("TextLabel", btn)
    badge.Size = UDim2.new(0, 60, 0, 18)
    badge.Position = UDim2.new(1, -120, 0, 4)
    badge.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
    badge.TextColor3 = Color3.new(1, 1, 1)
    badge.Font = Enum.Font.GothamBold
    badge.TextSize = 10
    badge.BorderSizePixel = 0
    badge.TextScaled = true
    local badgeCorner = Instance.new("UICorner", badge)
    badgeCorner.CornerRadius = UDim.new(0, 4)
    local function UpdateBadge()
        local skin = _G.EquippedData[weapon] and _G.EquippedData[weapon].Skin or "Default"
        if skin ~= "Default" then
            badge.Text = skin:sub(1, 8)
            badge.Visible = true
        else
            badge.Visible = false
        end
    end
    UpdateBadge()

    btn.MouseButton1Click:Connect(function()
        for _, b in pairs(WeaponScroll:GetChildren()) do
            if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(40, 40, 48) end
        end
        btn.BackgroundColor3 = Color3.fromRGB(80, 140, 255)
        for _, child in pairs(SkinScroll:GetChildren()) do
            if child:IsA("ImageButton") then child:Destroy() end
        end
        SelectedLabel.Text = weapon .. " — Choose a Skin"
        for _, skin in ipairs(SkinLists[weapon]) do
            local sbtn = Instance.new("ImageButton")
            sbtn.BackgroundColor3 =
                (_G.EquippedData[weapon] and _G.EquippedData[weapon].Skin == skin)
                and Color3.fromRGB(60, 130, 60)
                or Color3.fromRGB(35, 35, 42)
            sbtn.Image = GetThumb(skin)
            sbtn.BorderSizePixel = 0
            sbtn.Parent = SkinScroll
            local lbl = Instance.new("TextLabel", sbtn)
            lbl.Size = UDim2.new(1, 0, 0, 35)
            lbl.Position = UDim2.new(0, 0, 1, -35)
            lbl.BackgroundTransparency = 0.3
            lbl.BackgroundColor3 = Color3.new(0, 0, 0)
            lbl.Text = skin
            lbl.TextColor3 = Color3.new(1, 1, 1)
            lbl.Font = Enum.Font.Gotham
            lbl.TextScaled = true
            lbl.BorderSizePixel = 0
            sbtn.MouseButton1Click:Connect(function()
                -- deselect all cards
                for _, c in pairs(SkinScroll:GetChildren()) do
                    if c:IsA("ImageButton") then c.BackgroundColor3 = Color3.fromRGB(35, 35, 42) end
                end
                sbtn.BackgroundColor3 = Color3.fromRGB(60, 130, 60)
                EquipSkin(weapon, skin)
                UpdateBadge()
            end)
        end
        SkinScroll.CanvasSize = UDim2.new(0, 0, 0, SkinGrid.AbsoluteContentSize.Y + 40)
    end)
end

for weapon in pairs(SkinLists) do
    MakeWeaponBtn(weapon)
end
WeaponScroll.CanvasSize = UDim2.new(0, 0, 0, WeaponLayout.AbsoluteContentSize.Y)

-- ═══════════════════════════════════════════════
-- SEARCH
-- ═══════════════════════════════════════════════
WeaponSearch:GetPropertyChangedSignal("Text"):Connect(function()
    local txt = WeaponSearch.Text:lower()
    for _, btn in pairs(WeaponScroll:GetChildren()) do
        if btn:IsA("TextButton") then
            local btnText = btn.Text:match("^%s*(.-)%s*$"):lower()
            btn.Visible = txt == "" or btnText:find(txt)
        end
    end
    WeaponScroll.CanvasSize = UDim2.new(0, 0, 0, WeaponLayout.AbsoluteContentSize.Y)
end)

-- ═══════════════════════════════════════════════
-- MANUAL DRAG (replaces Draggable=true which can steal mouse lock)
-- ═══════════════════════════════════════════════
do
    local dragging, dragStart, startPos
    local TitleBar = Title -- drag via the title bar
    TitleBar.Active = true  -- only the title bar is active/interactive

    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
        end
    end)
    TitleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- ═══════════════════════════════════════════════
-- TOGGLE KEY  [K]
-- ═══════════════════════════════════════════════
UserInputService.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.K then
        Main.Visible = not Main.Visible
        if not Main.Visible then
            pcall(function() WeaponSearch:ReleaseFocus() end)
            -- Force mouse back to default so the game camera can reclaim it
            pcall(function()
                UserInputService.MouseBehavior = Enum.MouseBehavior.Default
            end)
        end
    end
end)

print("[+] Aniha Skin Changer loaded. Press K to toggle. Drag via title bar.")
