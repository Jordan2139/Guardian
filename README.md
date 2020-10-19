# Guardian
## What is it? 
Essentially Guardian is a script that will replace Faxes old Discord whitelist that requires you to setup yet another bot token and pull Discord role id's. This script utilizes [Badger's](https://github.com/JaredScar) new [Discord API](https://github.com/JaredScar/Badger_Discord_API). This will make things much easier and won't require you to pull Discord role id's 19 times while making your server.

## Configuration
```
-----------------------------------------------------------
-- Guardian- A Simple FiveM Script, Made By Jordan.#2139 --
-----------------------------------------------------------

-------------------------------------------------------
--           CONFIG YOUR PERIPHERALS HERE!           --
-------------------------------------------------------
Config = {
DiscordYeet = 'Sorry but this server reqiures you to have Discord (Desktop Edition) to play. Please restart FiveM and Discord if it is already open.', -- Message to client if their discord cannot be found by the script
WhitelistYeet = 'Sorry but this is a whitelisted community if you would like to join please see our website- WEBSITE to apply!', -- Message to client if they are not whitelisted
RoleIdsYeet = 'Sorry but I could not find your role ID\'s please reconnect and if this persists please contact the server developer',
WhitelistRoles = { -- Roles that you assigned in Badgers API that should pass the whitelist
    "Whitelisted",
    "MaybeWhitelisted",
    "ScrewItMakeThis",
},
}
--------------------------
-- ^^^ DO THAT HERE ^^^ -- 
--------------------------
```
# Acknowledgments 
- [Faxes](https://github.com/FAXES)- Original Discord whitelist script
- [Badger](https://github.com/JaredScar)- Amazing API, helping me figure out a deferral issue
# TJH Development Discord
[![Developer Discord](https://discordapp.com/api/guilds/696266949348425739/widget.png?style=banner4)](https://discord.com/invite/x7cYjg5)
