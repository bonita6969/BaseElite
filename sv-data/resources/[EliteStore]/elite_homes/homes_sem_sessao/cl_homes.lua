local houseOpen = ""

Citizen.CreateThread(function()
	SetNuiFocus(false,false)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("takeHome",function(data)
	vSERVER.takeItemHome(tostring(houseOpen),data.item,data.slot,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("storeHome",function(data)
	vSERVER.storeItemHome(tostring(houseOpen),data.item,data.slot,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("populateHome",function(data,cb)
	TriggerServerEvent("vrp_homes:populateSlot",data.item,data.slot,data.target,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateHome",function(data,cb)
	TriggerServerEvent("vrp_homes:updateSlot",data.item,data.slot,data.target,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("sumHome",function(data,cb)
	TriggerServerEvent("vrp_homes:sumSlot",data.item,data.slot,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP_HOMES:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_homes:Update")
AddEventHandler("vrp_homes:Update",function(action)
	SendNUIMessage({ action = action })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTVAULT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestVault",function(data,cb)
	local inventario,inventario2,peso,maxpeso,peso2,maxpeso2,infos = vSERVER.openHomeChest(tostring(houseOpen))
	if inventario then
		cb({ inventario = inventario, inventario2 = inventario2, peso = peso, maxpeso = maxpeso, peso2 = peso2, maxpeso2 = maxpeso2, infos = infos })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Blip Entrar
-----------------------------------------------------------------------------------------------------------------------------------------
local homein = false
local casa = ''
Citizen.CreateThread(function()
	while true do
		local idle = 1000
		local ped = PlayerPedId()
		local playerCoords = GetEntityCoords(ped)
		for k,v in pairs(config2.homes) do
			if casa ~= '' then
				if k == casa then 
					
					if #(playerCoords - vector3(v["enter"][1],v["enter"][2],v["enter"][3])) < 3 then
						idle = 5
						DrawText3D(v["enter"][1],v["enter"][2],v["enter"][3],'~y~E~w~  ENTRAR')
					else
						casa = ''
					end
				end
			elseif #(playerCoords - vector3(v["enter"][1],v["enter"][2],v["enter"][3])) < 3 then
				casa = k
			end
		end
		Citizen.Wait(idle)
	end
end)

function srkhomeexit()
local casa1 = ''
Citizen.CreateThread(function()
	while homein do
		local idle = 1000
		local ped = PlayerPedId()
		local playerCoords = GetEntityCoords(ped)
		for k,v in pairs(config2.homes) do
			if casa1 ~= '' then
				if k == casa1 then
					
					if #(playerCoords - vector3(v["exit"][1],v["exit"][2],v["exit"][3])) < 3 then
						idle = 5
						DrawText3D(v["exit"][1],v["exit"][2],v["exit"][3],'~y~E~w~  SAIR')
					else
						casa1 = ''
					end
				end
			elseif #(playerCoords - vector3(v["exit"][1],v["exit"][2],v["exit"][3])) < 3 then
				casa1 = k
			end
		end
		Citizen.Wait(idle)
	end
end)
end

function srkhomechest()
local casa2 = ''
Citizen.CreateThread(function()
	while homein do
		local idle = 1000
		local ped = PlayerPedId()
		local playerCoords = GetEntityCoords(ped)
		for k,v in pairs(config2.homes) do
			if casa2 ~= '' then
				if k == casa2 then
					if #(playerCoords - vector3(v["vault"][1],v["vault"][2],v["vault"][3])) < 3 then
						idle = 5
						DrawText3D(v["vault"][1],v["vault"][2],v["vault"][3],'~y~E~w~  BAU')
					else
						casa2 = ''
					end
				end
			elseif #(playerCoords - vector3(v["vault"][1],v["vault"][2],v["vault"][3])) < 3 then
				casa2 = k
			end
		end
		Citizen.Wait(idle)
	end
end)
end

RegisterNetEvent("vrp_homes:join")
AddEventHandler("vrp_homes:join",function()
	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(ped))
	for k,v in pairs(config2.homes) do
		local _,i = GetGroundZFor_3dCoord(v["enter"][1],v["enter"][2],v["enter"][3])
		local distance = Vdist(x,y,z,v["enter"][1],v["enter"][2],i)
		if distance <= 1.5 and vSERVER.checkPermissions(k) then
			srkhomechest()
			srkhomeexit()
			homein = true
			DoScreenFadeOut(1000)
			TriggerEvent("vrp_sound:source","enterexithouse",0.7)
			SetTimeout(1400,function()
				SetEntityCoords(ped,v["exit"][1]+0.0001,v["exit"][2]+0.0001,v["exit"][3]+0.0001-1,1,0,0,1)
				Citizen.Wait(750)
				DoScreenFadeIn(1000)
				houseOpen = tostring(k)
			end)
		end
	end
end)


RegisterNetEvent("vrp_homes:exit")
AddEventHandler("vrp_homes:exit",function()
	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(ped))
	for k,v in pairs(config2.homes) do
		local _,i = GetGroundZFor_3dCoord(v["exit"][1],v["exit"][2],v["exit"][3])
		local distance = Vdist(x,y,z,v["exit"][1],v["exit"][2],i)
		if distance <= 1.5 then
			homein = false
			DoScreenFadeOut(1000)
			TriggerEvent("vrp_sound:source","enterexithouse",0.5)
			SetTimeout(1300,function()
				SetEntityCoords(ped,v["enter"][1]+0.0001,v["enter"][2]+0.0001,v["enter"][3]+0.0001-1,1,0,0,1)
				Citizen.Wait(750)
				DoScreenFadeIn(1000)
				houseOpen = ""
			end)
		end
	end
end)

RegisterNetEvent("vrp_homes:chest")
AddEventHandler("vrp_homes:chest",function()
	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(ped))
	for k,v in pairs(config2.homes) do
		local _,i = GetGroundZFor_3dCoord(v["vault"][1],v["vault"][2],v["vault"][3])
		local distance = Vdist(x,y,z,v["vault"][1],v["vault"][2],i)
		if distance <= 2.0 and vSERVER.checkIntHomesPermissions(k) then
			if vSERVER.antidumphomes(k) then
				TriggerEvent("vrp_sound:source","mochila",0.5)
				SetNuiFocus(true,true)
				SendNUIMessage({ action = "showVault", log = 'Homes' })
				houseOpen = tostring(k)
			else
				TriggerEvent("Notify","negado","Existe outra pessoa utilizando o bau.")
			end
		end
	end
end)


local timer = 0

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)
		if timer ~= 0 then
			timer = timer-1
		end
	end
end)

RegisterKeyMapping('vrp:use', 'Interação', 'keyboard', 'e')

RegisterCommand('vrp:use', function()
	if timer == 0 then
		timer = 1
		TriggerEvent('vrp_homes:join')
		TriggerEvent('vrp_homes:exit')
		TriggerEvent('vrp_homes:chest')
	end
end, false)

function cO.getHomeStatistics()
	return tostring(houseOpen)
end

function cO.setBlipsOwner(homeName)
	local blip = AddBlipForCoord(config2.homes[homeName]["enter"][1],config2.homes[homeName]["enter"][2],config2.homes[homeName]["enter"][3])
	SetBlipSprite(blip,411)
	SetBlipAsShortRange(blip,true)
	SetBlipColour(blip,36)
	SetBlipScale(blip,0.4)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Residência: ~g~"..homeName)
	EndTextCommandSetBlipName(blip)
end

function cO.setBlipsHomes(status)
	for k,v in pairs(status) do
		local blip = AddBlipForCoord(config2.homes[v.name]["enter"][1],config2.homes[v.name]["enter"][2],config2.homes[v.name]["enter"][3])
		SetBlipSprite(blip,411)
		SetBlipAsShortRange(blip,true)
		SetBlipColour(blip,2)
		SetBlipScale(blip,0.4)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Disponível: ~g~"..v.name)
		EndTextCommandSetBlipName(blip)
		SetTimeout(30000,function()
			if DoesBlipExist(blip) then
				RemoveBlip(blip)
			end
		end)
	end
end

function DrawText3D(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,100)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 400
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,100)
end

