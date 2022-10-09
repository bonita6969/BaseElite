local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
rot = Tunnel.getInterface("rot_policia_rotas")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local servico = false
local targetDistance = 0
local maxSpeed = 81
local selecionado = 0
local id = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local kswait = 1000
		if not servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			for i = 0, 4 do
				local bowz,cdz = GetGroundZFor_3dCoord(Config[i].CoordenadaX, Config[i].CoordenadaY, Config[i].CoordenadaZ)
				local distance = GetDistanceBetweenCoords(Config[i].CoordenadaX, Config[i].CoordenadaY,cdz,x,y,z,true)
	
				if distance <= 10.0 then
					kswait = 4
					DrawMarker(21,Config[i].CoordenadaX, Config[i].CoordenadaY, Config[i].CoordenadaZ-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4, Config[i].colorRed, Config[i].colorGreen, Config[i].colorBlue,50,0,0,0,0)
					if distance <= 1.1 then
						drawTxt("~".. Config[i].colorLetter .."~PRESSIONE  ~w~E~".. Config[i].colorLetter .."~  PARA PATRULHAR NA ZONA ".. Config[i].nome .."",4,0.5,0.93,0.50, Config[i].colorRed, Config[i].colorGreen, Config[i].colorBlue, 180)
						if IsControlJustPressed(0,38) and rot.checkPermission() then
							if servico then
								TriggerEvent("Notify","negado","Já possui uma rota em andamento, cancele (F7) antes de pegar outra rota.")
								Citizen.Wait(2000)
							else
								TriggerEvent("Notify","aviso","Patrulha na zona <b>".. Config[i].nome .."</b> iniciada, embarque em sua viatura e inicie o patrulhamento.")
								rot.startService()
								servico = true
								selecionado = 1
								id = i
								targetDistance = CriandoBlip(selecionado)
							end
						end
					end
				end
			end
		end
		Citizen.Wait(kswait)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local kswait = 1000
		if servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(Config[id].rota[selecionado].x, Config[id].rota[selecionado].y, Config[id].rota[selecionado].z)
			local distance = GetDistanceBetweenCoords(Config[id].rota[selecionado].x, Config[id].rota[selecionado].y, cdz,x,y,z,true)
			local vehicle = GetVehiclePedIsUsing(ped)
			local vspeed = math.ceil(GetEntitySpeed(vehicle)*3.6)

			-- Checa e define velocidade máxima atingida
			if maxSpeed < vspeed then
				maxSpeed = vspeed
			end

			if distance <= 60.0 then
				kswait = 4
				DrawMarker(21, Config[id].rota[selecionado].x, Config[id].rota[selecionado].y, Config[id].rota[selecionado].z+0.30,0,0,0,0,180.0,130.0,2.0,2.0,1.0, Config[id].colorRed, Config[id].colorGreen, Config[id].colorBlue,50,1,0,0,1)
				if distance <= 2.5 then
					if rot.checkPermission() then
						if IsVehicleModel(GetVehiclePedIsUsing(PlayerPedId()),GetHashKey("policiataurus")) or IsVehicleModel(GetVehiclePedIsUsing(PlayerPedId()),GetHashKey("policiavictoria")) or IsVehicleModel(GetVehiclePedIsUsing(PlayerPedId()),GetHashKey("mercedespolicia")) or IsVehicleModel(GetVehiclePedIsUsing(PlayerPedId()),GetHashKey("policiabmwr1200")) or IsVehicleModel(GetVehiclePedIsUsing(PlayerPedId()),GetHashKey("amarokpolicia")) or IsVehicleModel(GetVehiclePedIsUsing(PlayerPedId()),GetHashKey("policiatahoe")) or IsVehicleModel(GetVehiclePedIsUsing(PlayerPedId()),GetHashKey("policiacharger2018")) or IsVehicleModel(GetVehiclePedIsUsing(PlayerPedId()),GetHashKey("pd_i8")) then
							RemoveBlip(blips)

							-- Verifica se o blip é o último da rota
							if selecionado == (#Config[id].rota -1) then
								selecionado = 1
							else
								selecionado = selecionado + 1
							end

							-- Paga de acordo com a velocidade máxima atingida
							if vspeed > 70 then
								TriggerEvent("Notify","aviso","Patrulha não é corrida!<br>Chegou a "..vspeed.."km/h neste trecho e não recebeu nenhuma bonificação.")
							else
								rot.checkPayment(targetDistance)
							end

							-- Cria o próximo blip
							targetDistance = CriandoBlip(selecionado)
						else
							TriggerEvent("Notify","negado","Você não está em uma viatura adequada para patrulha.")
							Citizen.Wait(5000)
						end
					end
				end
			end
		end
		Citizen.Wait(kswait)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local kswait = 1000
		if servico then
			kswait = 4
			if IsControlJustPressed(0,168) then
				rot.endService()
				servico = false
				RemoveBlip(blips)
			end
		end
		Citizen.Wait(kswait)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function CriandoBlip(selecionado)
	-- Adicionar blip destino
	blips = AddBlipForCoord(Config[id].rota[selecionado].x, Config[id].rota[selecionado].y, Config[id].rota[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips, Config[id].colorBlip) -- COR DO BLIP: https://runtime.fivem.net/doc/natives/#_0x03D7FB09E75D6B7E
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Rota de Patrulha")
	EndTextCommandSetBlipName(blips)

	-- Calcular distância da rota
	posicaoAtual = GetEntityCoords(PlayerPedId())
	targetDistance = math.ceil(CalculateTravelDistanceBetweenPoints(posicaoAtual, Config[id].rota[selecionado].x, Config[id].rota[selecionado].y, Config[id].rota[selecionado].z, true))
	return targetDistance
end
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end