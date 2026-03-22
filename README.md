# Roblox Rivals Skin Changer

A client-side skin changer script for the Roblox game **Rivals**. It features a custom user interface that allows you to easily browse all weapons and apply any skin or wrap locally to your character.

### Join Our Discord!
[Discord Server](https://discord.gg/PKBB5QpmPs)

## Features
- **All Weapons Supported:** Automatically fetches and categorizes skins for Assault Rifles, Snipers, Melees, and more.
- **Client-Side:** Safely visualizes skins locally without needing to own them.
- **Interactive UI:** Smooth UI with search functionality and visual thumbnails for all items.
- **Hotkeys:** Toggle the UI instantly using the `K` key.

## Usage

You can execute this script using any modern Roblox executor (e.g., Synapse X, Krnl, Fluxus). 

### Option 1: Direct Execution
Simply copy the entire contents of `main.lua` and paste it into your executor, then execute.

### Option 2: Loadstring
If you are hosting this repository on GitHub, players can run it using a loadstring. Replace `YOUR_GITHUB_USERNAME` with your actual username:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/RivalsSkinChanger/main/main.lua"))()
```

## How It Works
The script hooks into Rivals' `CosmeticLibrary` and `ClientItem` ViewModels to force the client to render the selected cosmetic `Skin` and `Wrap` data over your current equipped weapon.

***

*Disclaimer: This script is for educational purposes. Use at your own risk.*
