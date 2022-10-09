local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

--[ CONEXÃO ]----------------------------------------------------------------------------------------------------------------------------

cmB = Tunnel.getInterface("dossantos_rotas",cmB)

-----------------------------------------------------------------------------------------------------------------------------------------
--[ THREADS ]
-----------------------------------------------------------------------------------------------------------------------------------------

local perm = {}
local servico = false
local item = nil
local selecionado = 0

-- [ MARKERS ] --
CreateThread(function()
	repeat
		local idle = 2000
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

		for k,v in pairs(cfg.blipCoords) do
			if perm[k] then
				if not IsPedInAnyVehicle(ped, true) then
					if not servico then
						local distance = #(pedCoords - v['coords'])
						if distance <= 50 then
							idle = 1000
							if distance <= 30 then
								idle = 500
								if distance <= 7 then
									idle = 1
									DrawMarker(20, v['coords'].x, v['coords'].y, v['coords'].z-0.65, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 255, false, true, 2, false)
									DrawMarker(27, v['coords'].x, v['coords'].y, v['coords'].z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, 255, 0, 0, 255, false, false, 2, true)
									if distance < 1.2 then
										DrawText3D(v['coords'].x,v['coords'].y,v['coords'].z-0.25, "[~r~E~w~] PARA ~r~INICIAR~w~ A ROTA")
										if IsControlJustPressed(0,38) then
											servico = true
											item = k
											PrimeiraRota()
											TriggerEvent('Notify',"sucesso","Você iniciou a rota!")
										end
									end
								end
							end
						end
					end
				end
			end
		end

	Wait(idle)
	until false
end)

-- [ MARKERS SERVICO ] --
CreateThread(function()
	repeat
		local timer = 2000
		if servico then
			local ped = PlayerPedId()
			local pedCoords = GetEntityCoords(ped)
			local blipCoords = cfg.entregaCoords[selecionado]
			local distance = #(pedCoords - blipCoords)
			if distance <= 30 then
				timer = 1000
			end
			if distance < 7 then
				timer = 1
				DrawMarker(21, blipCoords.x, blipCoords.y, blipCoords.z-0.65, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 255, false, true, 2, false)
				if distance < 1.2 then
					DrawText3D(blipCoords.x, blipCoords.y, blipCoords.z-0.25, "[~r~E~w~] PARA ~r~COLETAR~w~ OS ITENS")
					if IsControlJustPressed(0,38) then
						RemoveBlip(blips)
						local bool = cmB.awardEntrega(item)
						if bool then
							vRP._playAnim(false,{{"anim@heists@ornate_bank@grab_cash_heels","grab"}},true)
							ProximaRota()
							SetTimeout(cfg.segundos*1000, function()
								vRP._stopAnim()
							end)
						end
					end
				end
			end
		end
	Wait(timer)
	until false
end)

-- [ PERM CHECK ] --
CreateThread(function()
	repeat
		local sleep = 5000
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

		for k,v in pairs(cfg.blipCoords) do
			local distance = #(pedCoords - v['coords'])
			-- local x,y,z = table.unpack(coords)
			if distance <= 50 and distance > 14 then
				perm[k] = false
				sleep = 1000
			end
			if distance <= 14 then
				if cmB.checkPerm(v['perm']) then
					perm[k] = true
				else
					perm[k] = false
				end
			end
		end
	Wait(sleep)
	until false
end)

-- [ SAIR SERVIÇO ] --
CreateThread(function()
	repeat
		local idle = 300
		if servico then
			idle = 1
			if IsControlJustPressed(0,168) then
				servico = false
				item = nil
				selecionado = 0
				RemoveBlip(blips)
				TriggerEvent("Notify","aviso","Você cancelou a rota!")
			end
		end
	Wait(idle)
	until false
end)

-----------------------------------------------------------------------------------------------------------------------------------------
--[ FUNCTIONS ]
-----------------------------------------------------------------------------------------------------------------------------------------

PrimeiraRota = function()
	if servico then
		selecionado = selecionado + 1
		CriandoBlip(cfg.entregaCoords,selecionado)
	end
end

ProximaRota = function()
	if servico then
		if RotasSequenciais then	
			if selecionado < #cfg.entregaCoords then
				selecionado = selecionado + 1
				CriandoBlip(cfg.entregaCoords,selecionado)
			else
				PrimeiraRota()
			end
			else 
				if selecionado < #cfg.entregaCoords then
					selecionado2 = selecionado + 1
					selecionado = math.random(selecionado2, #cfg.entregaCoords)
					while selecionado == selecionado2 or selecionado == #cfg.entregaCoords do
						selecionado = math.random(selecionado, #cfg.entregaCoords)
					end
					selecionado = selecionado + 1
					CriandoBlip(cfg.entregaCoords,selecionado)
				else
					PrimeiraRota()
				end
			end
		end
	end

DrawText3D = function(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
	-- local x,y,z = table.unpack(coords)
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
	local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 50)
end

CriandoBlip = function(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,1)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Coletar PEÇAS DE ARMA")
	EndTextCommandSetBlipName(blips)
end