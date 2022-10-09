local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

--[ CONNECTION ]----------------------------------------------------------------------------------------------------------------

emp8 = Tunnel.getInterface("emp_lumberjack-delivery")

--[ VARIABLES ]-----------------------------------------------------------------------------------------------------------------

local blips = false
local servico = false
local selecionado = 0
local quantidade = 0

--[ THREAD ]--------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		if not servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(configlumberjackdelivery.cord.x,configlumberjackdelivery.cord.y,configlumberjackdelivery.cord.z)
			local distance = GetDistanceBetweenCoords(configlumberjackdelivery.cord.x,configlumberjackdelivery.cord.y,cdz,x,y,z,true)
			if distance <= 3 then
				idle = 5
				-- DrawMarker(21, configlumberjackdelivery.cord.x, configlumberjackdelivery.cord.y, configlumberjackdelivery.cord.z-0.6, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.5, 222, 67, 11, 100, 0, 0, 0, 0)
				DrawText3D(configlumberjackdelivery.cord.x, configlumberjackdelivery.cord.y, configlumberjackdelivery.cord.z, textolumberjack)
				if distance <= 1.2 then
					-- drawTxt("PRESSIONE  ~r~G~w~  PARA INICIAR AS ENTREGAS",4,0.5,0.92,0.35,255,255,255,180)
					
					if IsControlJustPressed(0,47) then
						servico = true
						emplenhador12()
						emplenhador11()
						selecionado = math.random(9)
						Criandoblip(locs,selecionado)
						emp8.Quantidade()
						TriggerEvent("Notify","sucesso","Você entrou em serviço.")
						TriggerEvent("Notify","importante","Vá até o próximo local e entregue <b>"..quantidade.."x Toras de Madeira</b>.")
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

--[ THREAD ]--------------------------------------------------------------------------------------------------------------------
function emplenhador11()
Citizen.CreateThread(function()
	while servico do
		local idle = 1000
		if servico then
			idle = 5
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(configlumberjackdelivery.locs[selecionado].x,configlumberjackdelivery.locs[selecionado].y,configlumberjackdelivery.locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(configlumberjackdelivery.locs[selecionado].x,configlumberjackdelivery.locs[selecionado].y,cdz,x,y,z,true)
			local vehicle = GetPlayersLastVehicle()
			if distance <= 3 then
				DrawMarker(21,configlumberjackdelivery.locs[selecionado].x,configlumberjackdelivery.locs[selecionado].y,configlumberjackdelivery.locs[selecionado].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,222, 67, 11,180,0,0,0,1)
				if distance <= 1.2 then
					idle = 5
					drawTxt("PRESSIONE  G  PARA ENTREGAR AS TORAS DE MADEIRA",4,0.5,0.92,0.35,255,255,255,255)
					if IsControlJustPressed(0,47) and not IsPedInAnyVehicle(ped) then
						if emp8.checkPayment() then
							RemoveBlip(blips)
							backentrega = selecionado
							while true do
								if backentrega == selecionado then
									selecionado = math.random(configlumberjackdelivery.random)
								else
									break
								end
								Citizen.Wait(1)
							end
							Criandoblip(locs,selecionado)
							TriggerEvent("Notify","importante","Vá até o próximo local e entregue <b>"..quantidade.."x Toras de Madeira</b>.")
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)
end
--[ CANCEL | THREAD ]--------------------------------------------------------------------------------------------------------------------
function emplenhador12()
Citizen.CreateThread(function()
	while servico do
		local idle=1000
		if servico then
			idle=5
			if IsControlJustPressed(0,168) then
					servico = false
					RemoveBlip(blips)
					TriggerEvent("Notify","importante","Você saiu de serviço.",8000)
			end
		end
		Citizen.Wait(idle)
	end
end)
end

RegisterNetEvent("quantidade-tora")
AddEventHandler("quantidade-tora",function(status)
    quantidade = status
end)

--[ FUNCTION ]------------------------------------------------------------------------------------------------------------------

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

function Criandoblip(locs,selecionado)
	blips = AddBlipForCoord(configlumberjackdelivery.locs[selecionado].x,configlumberjackdelivery.locs[selecionado].y,configlumberjackdelivery.locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,27)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega de Madeira")
	EndTextCommandSetBlipName(blips)
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end	