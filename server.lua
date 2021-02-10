--------------------------------------------------------------------------------------------
-- Guardian- A Far More Advanced FiveM Script Than DiscordWhitelist, Made By Jordan.#2139 --
--------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
                  -- !WARNING! !WARNING! !WARNING! !WARNING! !WARNING! --
        -- DO NOT TOUCH THIS FILE OR YOU /WILL/ FUCK SHIT UP! EDIT THE CONFIG.LUA --
-- DO NOT BE STUPID AND WHINE TO ME ABOUT THIS BEING BROKEN IF YOU TOUCHED THE LINES BELOW. --
----------------------------------------------------------------------------------------------
function ExtractIdentifiers(src)
    local identifiers = {
        discord = ""
    }

    --Loop over all identifiers
    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)

        --Convert it to a nice table.
        if string.find(id, "discord") then
            identifiers.discord = id
        end
    end
    return identifiers
end

roleList = Config.WhitelistRoles;

AddEventHandler("playerConnecting", function(name, setCallback, deferrals)
    local Config = Config
    deferrals.defer()
    local src = source
    local identifierDiscord = "";
    deferrals.update("Checking Whitelist Permissions For " .. Config.ServerName)
		
    Citizen.Wait(0); -- Necessary Citizen.Wait() before deferrals.done()

    for k, v in ipairs(GetPlayerIdentifiers(src)) do
				if string.sub(v, 1, string.len("discord:")) == "discord:" then
					identifierDiscord = v
				end
        end
        local isWhitelisted = false;
        if identifierDiscord then
                local roleIDs = exports.Badger_Discord_API:GetDiscordRoles(src)
                if not (roleIDs == false) then
                    for i = 1, #roleList do
                        for j = 1, #roleIDs do
                            if exports.Badger_Discord_API:CheckEqual(roleList[i], roleIDs[j]) then
                                print("[Guardian] (playerConnecting) Allowing " .. GetPlayerName(src) .. " to join with the role "  .. roleList[i])
				print("[Guardian] (playerConnecting) Player " .. GetPlayerName(src) .. "  Attempted to connect with Guardian, They were allowed entry")
                                isWhitelisted = true;
                            else
                                if isWhitelisted == false then 
                                  isWhitelisted = false;
                                end
                            end
                        end
                    end
                else
                    print("[Guardian] (playerConnecting) Player " .. GetPlayerName(src) .. "  Could not connect because role id\'s were not present")
		    print("[Guardian] (playerConnecting) Player " .. GetPlayerName(src) .. "  Attempted to connect with Guardian, however they failed")
                    deferrals.done(Config.RoleIdsYeet)
                    CancelEvent()
                    return;
                end
            else
                print("[Guardian] (playerConnecting) Declined connection from " .. GetPlayerName(src) .. "  because they did not have Discord open")
		print("[Guardian] (playerConnecting) Player " .. GetPlayerName(src) .. "  Attempted to connect with Guardian, however they failed")
                deferrals.done(Config.DiscordYeet)
                CancelEvent()
                return;
            end
        if isWhitelisted then 
          deferrals.done();
        else
          deferrals.done(Config.WhitelistYeet);
          CancelEvent()
        end
end)
