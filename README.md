# Roblox Rivals Skin Changer

A client-side skin changer script for the Roblox game **Rivals**. It features a custom user interface that allows you to easily browse all weapons and apply any skin or wrap locally to your character.

### Join Our Discord!
[Discord Server](https://discord.gg/PKBB5QpmPs) NOT UD JOIN DC

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
If you are hosting this repository on GitHub, players can run it using a loadstring. **IMPORTANT**: Replace `YOUR_GITHUB_USERNAME` in the link below with your actual GitHub username (case-sensitive) for the script to load correctly.

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/Mandog23/RivalsSkinChanger/main/main.lua"))()
```

If you see a `404: Not Found` error, it means the URL above is incorrect or your repository is private.


## How It Works
The script hooks into Rivals' `CosmeticLibrary` and `ClientItem` ViewModels to force the client to render the selected cosmetic `Skin` and `Wrap` data over your current equipped weapon.

***

*Disclaimer: This script is for educational purposes. Use at your own risk.*
