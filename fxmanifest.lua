fx_version 'bodacious'
games { 'gta5' }

author 'Mtb Development'
version '2.0'

ui_page "nui/mtb.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"main/mtb_client.lua",
	"mtb_config.lua"
}

files {
	"nui/*",
	"nui/images/*",
	"mtb_config.lua",
}