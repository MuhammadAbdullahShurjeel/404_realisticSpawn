local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
local Mtb_Config = module("404_realisticSpawn","mtb_config")
mtbC = Tunnel.getInterface("404_realisticSpawn")
mtb = {}
Tunnel.bindInterface("404_realisticSpawn",mtb)