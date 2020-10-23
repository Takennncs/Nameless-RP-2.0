fx_version "adamant"
game "gta5"

name "48Radio"
description "21 Jump Street radio - 48 Day edition"
author "Xawirses (xawirses@gmail.com)"
version "48.50.0"

ui_page "html/index.html"

client_scripts {
	"config.lua",
	"client.lua",
}

dependencies {
	"mumble-voip",
}

files {
	"html/on.ogg",
	"html/off.ogg",
	"html/radio.png",
	"html/ElectronicHighwaySign.woff",
	"html/ElectronicHighwaySign.woff2",
	"html/ElectronicHighwaySign.ttf",
	"html/ElectronicHighwaySign.svg",
	"html/skins.json",
	"html/standard.css",
	"html/style.css",
	"html/script.js",
	"html/index.html",
}
