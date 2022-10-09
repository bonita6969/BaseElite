-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP ( Fazendo conexão para o resto da pasta client-side )
-----------------------------------------------------------------------------------------------------------------------------------------
Tunnel = module("vrp","lib/Tunnel")
Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

cO = {}
Tunnel.bindInterface(GetCurrentResourceName(),cO)

vSERVER = Tunnel.getInterface(GetCurrentResourceName()) -- Pega o diretório atual, se mudar o nome da pasta tem que muda no JavaScript
local uqyvsv_checkauth = false
local uqyvsv_checkauth2 = false
local currentWeapon = nil
local currentWeaponModel = nil
local takingWeapon = false

-----------------------------------------------------------------------------------------------------------------------------------------
-- INVCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("invClose",function(data,cb)
	local tipinho = "hideNUI"
	if data ~= nil then 
		if data.type == "Craft" then 
			tipinho = "crafting"
		end
		if data.type == "Trunk" then 
			local ped = GetPlayerPed(-1)
			vSERVER.TrunkchestClose()
			local vehicle = vRP.getNearestVehicle(7)
			if IsEntityAVehicle(vehicle) then
				if not IsPedInAnyVehicle(ped) then
					TriggerServerEvent("trytrunk",VehToNet(vehicle))
				end
			end
		elseif data.type == "Homes" then 
			vSERVER.HomeschestClose()
		elseif data.type == "Chest" then 
			vSERVER.chestClose()
		elseif data.type == "Inspect" then 
			vSERVER.resetInspect()
		end
	end
	SetNuiFocus(false,false)
	TransitionFromBlurred(1000)
	SetCursorLocation(0.5,0.5)
	SendNUIMessage({ action = tipinho })
end)