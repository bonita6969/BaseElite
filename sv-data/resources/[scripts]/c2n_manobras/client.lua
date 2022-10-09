--[BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319]--
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
c2nbike = Tunnel.getInterface("c2n_manobras")

--[ VARIAVEIS ]-------------------------------------------------------------------
local comecar = false
local dict = "rcmextreme2atv"
local anims = {
	"idle_b",
	"idle_c",
	"idle_d",
	"idle_e"
}

--[ THREADS ]-------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do 
		local idle = 1000
		local ped = PlayerPedId()
		local bike = GetVehiclePedIsIn(ped)
		local speed = GetEntitySpeed(bike)*3.6
		if comecar == true then
			if IsPedOnAnyBike(ped) then
				if speed >= 30 then
					idle = 5
					while not HasAnimDictLoaded(dict) do 
						Wait(0)
						RequestAnimDict(dict)
					end
	
					if IsControlJustPressed(0,174) or IsControlJustPressed(0,108) then -- Seta Esquerda ou NumPad 4 = Manobra esquerda
						TaskPlayAnim(ped,dict,anims[1], 8.0, -8.0, -1, 32, 0, false, false, false)
						
					elseif IsControlJustPressed(0,175) or IsControlJustPressed(0,107) then -- Seta Direita ou NumPad 6 = Manobra direita
						TaskPlayAnim(ped,dict,anims[2], 8.0, -8.0, -1, 32, 0, false, false, false)
	
					elseif IsControlJustPressed(0,173) or IsControlJustPressed(0,110) then -- Seta para Baixo ou NumPad 5 = Manobra lados
						TaskPlayAnim(ped,dict,anims[3], 8.0, -8.0, -1, 32, 0, false, false, false)
	
					elseif IsControlJustPressed(0,27) or IsControlJustPressed(0,111) then -- Seta para Cima ou NumPad 8 = Manobra cima
						TaskPlayAnim(ped,dict,anims[4], 8.0, -8.0, -1, 32, 0, false, false, false)
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

--[ COMANDOS ]-------------------------------------------------------------------
RegisterCommand("manobras",function(raw,args)
	if comecar == false then
		if c2nbike.checkPermVip() then
			comecar = true
			TriggerEvent("Notify","sucesso","Você está preparado para fazer as manobras")
		else
			TriggerEvent("Notify","negado","Você não tem permissão")
			return false
		end
	else
		comecar = false
		TriggerEvent("Notify","importante","Você está parou de fazer manobras")
	end
end)
--[BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319 BrennoC2N#6319]--