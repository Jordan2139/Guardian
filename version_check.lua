--------------------------------------------------------------------------------------------
-- Guardian- A Far More Advanced FiveM Script Than DiscordWhitelist, Made By Jordan.#2139 --
--------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
                  -- !WARNING! !WARNING! !WARNING! !WARNING! !WARNING! --
        -- DO NOT TOUCH THIS FILE OR YOU /WILL/ FUCK SHIT UP! EDIT THE CONFIG.LUA --
-- DO NOT BE STUPID AND WHINE TO ME ABOUT THIS BEING BROKEN IF YOU TOUCHED THE LINES BELOW. --
----------------------------------------------------------------------------------------------

local label = 
[[ 
  //
  || 
  ||
  ||     ______                     ___           
  ||    / ____/_  ______ __________/ (_)___ _____ 
  ||   / / __/ / / / __ `/ ___/ __  / / __ `/ __ \
  ||  / /_/ / /_/ / /_/ / /  / /_/ / / /_/ / / / /
  ||  \____/\__,_/\__,_/_/   \__,_/_/\__,_/_/ /_/ 
  ||                                                
  ||            Created by Jordan.#2139
  ||]]
  
Citizen.CreateThread(function()
	local CurrentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)
	if not CurrentVersion then
		print('^1Guardian Version Check Failed!^7')
	end

	function VersionCheckHTTPRequest()
		PerformHttpRequest('https://raw.githubusercontent.com/Jordan2139/versions/master/guardian.json', VersionCheck, 'GET')
	end

	function VersionCheck(err, response, headers)
		Citizen.Wait(3000)
		if err == 200 then
			local Data = json.decode(response)
			if CurrentVersion ~= Data.NewestVersion then
				print( label )			
				print('  ||    \n  ||    Guardian is outdated!')
				print('  ||    Current version: ^2' .. Data.NewestVersion .. '^7')
				print('  ||    Your version: ^1' .. CurrentVersion .. '^7')
				print('  ||    Please download the lastest version from ^5' .. Data.DownloadLocation .. '^7')
				if Data.Changes ~= '' then
					print('  ||    \n  ||    ^5Changes: ^7' .. Data.Changes .. "\n^0  \\\\\n")
				end
			else
				print( label )			
				print('  ||    ^2Guardian is up to date!\n^0  ||\n  \\\\\n')
			end
		else
			print( label )			
			print('  ||    ^1There was an error getting the latest version information, if the issue persists contact Jordan.#2139 on Discord.\n^0  ||\n  \\\\\n')
		end
		
		SetTimeout(60000000, VersionCheckHTTPRequest)
	end

	VersionCheckHTTPRequest()
end)
