-----------------------------------------------------------
-- Guardian- A Simple FiveM Script, Made By Jordan.#2139 --
-----------------------------------------------------------

fx_version "cerulean"
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

-- Define the resource metadata
name "Guardian"
description "A simple whitelist script that utilizes Badger's new API"
author "Jordan.#2139"
version "v1.3.0"


server_script "config.lua"
server_script "server.lua"
server_script "version_check.lua"
