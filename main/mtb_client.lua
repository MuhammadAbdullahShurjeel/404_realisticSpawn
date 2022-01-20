local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
mtbS = Tunnel.getInterface("404_realisticSpawn")
mtb = {}
Tunnel.bindInterface("404_realisticSpawn", mtb)

local cam

Citizen.CreateThread(function()

		RegisterNetEvent(Mtb_Config.eventoMostrarSpawn)
		AddEventHandler(Mtb_Config.eventoMostrarSpawn, function(firstspawn)
			if Mtb_Config.base == 'creative' then
				if firstspawn then
					local spawns = {}

					for k,v in pairs(Mtb_Config.spawns) do 
						if v.mostrar then
							local obj = {Nome = v.Nome}
							table.insert(spawns,obj)
						end
					end

					pos = GetEntityCoords(PlayerPedId())
					cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x, pos.y, pos.z + 200.0, 270.00, 0.00, 0.00, 80.00, 0, 0)
					SetCamActive(cam, true)
					RenderScriptCams(true, false, 1, true, true)
					FreezeEntityPosition(PlayerPedId(), true)
					SetEntityVisible(PlayerPedId(), false, false)

					SendNUIMessage({ action = "abrir"})
					SetNuiFocus(true,true)
				else
					FreezeEntityPosition(PlayerPedId(), false)
					SetEntityVisible(PlayerPedId(), true, false)
					if cam then
						RenderScriptCams(false, false, 0, true, true)
						SetCamActive(cam, false)
						DestroyCam(cam, true)
					end
					Citizen.Wait(800)
					DoScreenFadeIn(800)
				end
			else
				local spawns = {}

				for k,v in pairs(Mtb_Config.spawns) do 
					if v.mostrar then
						local obj = {Nome = v.Nome}
						table.insert(spawns,obj)
					end
				end

				pos = GetEntityCoords(PlayerPedId())
				cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x, pos.y, pos.z + 200.0, 270.00, 0.00, 0.00, 80.00, 0, 0)
				SetCamActive(cam, true)
				RenderScriptCams(true, false, 1, true, true)
				FreezeEntityPosition(PlayerPedId(), true)
				SetEntityVisible(PlayerPedId(), false, false)

				SendNUIMessage({ action = "abrir"})
				SetNuiFocus(true,true)
			end
		end)

		RegisterNUICallback("escolha",function(data,cb)

			if data.voltarUltimoLocal then
					SendNUIMessage({ action = "fechar" })
					SetNuiFocus(false,false)
					Citizen.Wait(800)
					DoScreenFadeIn(800)
					spawn()
				else 

				for k, v in pairs(Mtb_Config.spawns) do
					if v.Nome == data then
						SendNUIMessage({ action = "fechar" })
						DoScreenFadeOut(200)
						Citizen.Wait(500)
						SetEntityCoords(PlayerPedId(),v.locs.x,v.locs.y,v.locs.z,false,false,false,false)
						Citizen.Wait(2000)
						DoScreenFadeIn(500)
						SetNuiFocus(false,false)
						spawn()
					end
				end
			end

		end)

		function spawn()
			FreezeEntityPosition(PlayerPedId(), false)
			SetEntityVisible(PlayerPedId(), true, false)
			RenderScriptCams(false, false, 0, true, true)
			SetCamActive(cam, false)
			DestroyCam(cam, true)
			TriggerEvent("ToogleBackCharacter")
		end
end)

