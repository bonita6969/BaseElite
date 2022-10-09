local menu_state = {}
local anims = {
	{ dict = "random@mugging3","handsup_standing_base", anim = "handsup_standing_base" },
	{ dict = "random@arrests@busted", anim = "idle_a" },
	{ dict = "anim@heists@heist_corona@single_team", anim = "single_team_loop_boss" },
	{ dict = "mini@strip_club@idles@bouncer@base", anim = "base" },
	{ dict = "anim@mp_player_intupperfinger", anim = "idle_a_fp" },
	{ dict = "random@arrests", anim = "generic_radio_enter" },
	{ dict = "mp_player_int_upperpeace_sign", anim = "mp_player_int_peace_sign" }
}

--[ COOLDOWN ]---------------------------------------------------------------------------------------------------------------------------

local cooldown = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if cooldown > 0 then
			cooldown = cooldown - 1
		end
	end
end)

function tvRP.openMenuData(menudata)
	SendNUIMessage({ act = "open_menu", menudata = menudata })
end

function tvRP.closeMenu()
	SendNUIMessage({ act = "close_menu" })
end

function tvRP.getMenuState()
	return menu_state
end

local agachar = false

function tvRP.getAgachar()
    return agachar
end

--[ CANCELANDO O F6 ]--------------------------------------------------------------------------------------------------------------------

local cancelando = false
RegisterNetEvent('cancelando')
AddEventHandler('cancelando',function(status)
    cancelando = status
	srkcancelando()
end)

function srkcancelando()
	Citizen.CreateThread(function()
		while cancelando do
			if cancelando then
				idle = 5
				BlockWeaponWheelThisFrame()
				DisableControlAction(0,29,true)
				DisableControlAction(0,38,true)
				DisableControlAction(0,47,true)
				DisableControlAction(0,56,true)
				DisableControlAction(0,57,true)
				DisableControlAction(0,73,true)
				DisableControlAction(0,137,true)
				DisableControlAction(0,166,true)
				DisableControlAction(0,167,true)
				DisableControlAction(0,169,true)
				DisableControlAction(0,170,true)
				DisableControlAction(0,182,true)
				DisableControlAction(0,187,true)
				DisableControlAction(0,188,true)
				DisableControlAction(0,189,true)
				DisableControlAction(0,190,true)
				DisableControlAction(0,243,true)
				DisableControlAction(0,245,true)
				DisableControlAction(0,257,true)
				DisableControlAction(0,288,true)
				DisableControlAction(0,289,true)
				DisableControlAction(0,311,true)
				DisableControlAction(0,344,true)			
			end
			Citizen.Wait(idle)
		end
	end)
end

local menu_celular = false
RegisterNetEvent("status:celular")
AddEventHandler("status:celular",function(status)
	menu_celular = status
	srkmenucelular()
end)

function srkmenucelular()
	Citizen.CreateThread(function()
		while menu_celular do
			if menu_celular then
				idle = 5
				BlockWeaponWheelThisFrame()
				DisableControlAction(0,16,true)
				DisableControlAction(0,17,true)
				DisableControlAction(0,24,true)
				DisableControlAction(0,25,true)
				DisableControlAction(0,29,true)
				DisableControlAction(0,56,true)
				DisableControlAction(0,57,true)
				DisableControlAction(0,73,true)
				DisableControlAction(0,166,true)
				DisableControlAction(0,167,true)
				DisableControlAction(0,170,true)				
				DisableControlAction(0,182,true)	
				DisableControlAction(0,187,true)
				DisableControlAction(0,188,true)
				DisableControlAction(0,189,true)
				DisableControlAction(0,190,true)
				DisableControlAction(0,243,true)
				DisableControlAction(0,245,true)
				DisableControlAction(0,257,true)
				DisableControlAction(0,288,true)
				DisableControlAction(0,289,true)
				DisableControlAction(0,344,true)			
			end
			Citizen.Wait(idle)
		end
	end)
end

function srkmenustate()
	Citizen.CreateThread(function()
		while menu_state.opened do
			if menu_state.opened then
				idle = 5
				DisableControlAction(0,75)
			end
			Citizen.Wait(idle)
		end
	end)
end

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		for _,block in pairs(anims) do
			if IsEntityPlayingAnim(PlayerPedId(),block.dict,block.anim,3) or object then
				idle = 5
			    BlockWeaponWheelThisFrame()
				DisableControlAction(0,16,true)
				DisableControlAction(0,17,true)
				DisableControlAction(0,24,true)
				DisableControlAction(0,25,true)
				DisableControlAction(0,137,true)
				DisableControlAction(0,245,true)
				DisableControlAction(0,257,true)
			end
		end
		Citizen.Wait(idle)
	end
end)


function tvRP.prompt(title,default_text)
	SendNUIMessage({ act = "prompt", title = title, text = tostring(default_text) })
	SetNuiFocus(true)
end

function tvRP.request(id,text,time)
	SendNUIMessage({ act = "request", id = id, text = tostring(text), time = time })
end

RegisterNUICallback("menu",function(data,cb)
	if data.act == "close" then
		vRPserver._closeMenu(data.id)
	elseif data.act == "valid" then
		vRPserver._validMenuChoice(data.id,data.choice,data.mod)
	end
end)

RegisterNUICallback("menu_state",function(data,cb)
	menu_state = data
	srkmenustate()
end)

RegisterNUICallback("prompt",function(data,cb)
	if data.act == "close" then
		SetNuiFocus(false)
		vRPserver._promptResult(data.result)
	end
end)

RegisterNUICallback("request",function(data,cb)
	if data.act == "response" then
		vRPserver._requestResult(data.id,data.ok)
	end
end)

RegisterNUICallback("init",function(data,cb)
	SendNUIMessage({ act = "cfg", cfg = {} })
	TriggerEvent("vRP:NUIready")
end)

function tvRP.setDiv(name,css,content)
	SendNUIMessage({ act = "set_div", name = name, css = css, content = content })
end

function tvRP.setDivContent(name,content)
	SendNUIMessage({ act = "set_div_content", name = name, content = content })
end

function tvRP.removeDiv(name)
	SendNUIMessage({ act = "remove_div", name = name })
end

local apontar = false
local object = nil

function tvRP.loadAnimSet(dict)
	RequestAnimSet(dict)
	while not HasAnimSetLoaded(dict) do
		Citizen.Wait(10)
	end
	SetPedMovementClipset(PlayerPedId(),dict,0.25)
end

function tvRP.CarregarAnim(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(10)
	end
end

function tvRP.CarregarObjeto(dict,anim,prop,flag,hand,pos1,pos2,pos3,pos4,pos5,pos6)
	local ped = PlayerPedId()

	RequestModel(GetHashKey(prop))
	while not HasModelLoaded(GetHashKey(prop)) do
		Citizen.Wait(10)
	end

	if pos1 then
		local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.0,-5.0)
		object = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
		SetEntityCollision(object,false,false)
		AttachEntityToEntity(object,ped,GetPedBoneIndex(ped,hand),pos1,pos2,pos3,pos4,pos5,pos6,true,true,false,true,1,true)
	else
		tvRP.CarregarAnim(dict)
		TaskPlayAnim(ped,dict,anim,3-.0,3.0,-1,flag,0,0,0,0)
		local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.0,-5.0)
		object = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
		SetEntityCollision(object,false,false)
		AttachEntityToEntity(object,ped,GetPedBoneIndex(ped,hand),0.0,0.0,0.0,0.0,0.0,0.0,false,false,false,false,2,true)
	end
	Citizen.InvokeNative(0xAD738C3085FE7E11,object,true,true)
end

function tvRP.DeletarObjeto()
    tvRP.stopAnim(true)
    TriggerEvent("binoculos")
    if DoesEntityExist(object) then
        TriggerServerEvent("trydeleteobj",ObjToNet(object))
        object = nil
    end
end

--[  ]-----------------------------------------------------------------------------

RegisterKeyMapping ( 'vrp:accept' , 'Aceitar' , 'keyboard' , 'y' )

RegisterCommand('vrp:accept', function()
    SendNUIMessage({ act = "event", event = "Y" })
end, false)

RegisterKeyMapping ( 'vrp:decline' , 'Negar' , 'keyboard' , 'U' )

RegisterCommand('vrp:decline', function()
    SendNUIMessage({ act = "event", event = "U" })
end, false)

--[  ]-----------------------------------------------------------------------------

RegisterKeyMapping ( 'vrp:up' , 'Cima' , 'keyboard' , 'UP' )

RegisterCommand('vrp:up', function()
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 and not menu_state.opened and not menu_celular then
		tvRP.playAnim(true,{{"anim@mp_player_intcelebrationmale@salute","salute"}},false)
	end
	if menu_state.opened then
		SendNUIMessage({ act = "event", event = "UP" }) 
        tvRP.playSound("NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET") 
	end
end, false)

RegisterKeyMapping ( 'vrp:down' , 'Baixo' , 'keyboard' , 'DOWN' )

RegisterCommand('vrp:down', function()
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 and not menu_state.opened and not menu_celular then
		tvRP.playAnim(true,{{"rcmnigel1c","hailing_whistle_waive_a"}},false)
	end
	if menu_state.opened then
		SendNUIMessage({ act = "event", event = "DOWN" })
        tvRP.playSound("NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET")
	end
end, false)

RegisterKeyMapping ( 'vrp:left' , 'Esquerda' , 'keyboard' , 'LEFT' )

RegisterCommand('vrp:left', function()
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 and not menu_state.opened and not menu_celular then
		tvRP.playAnim(true,{{"anim@mp_player_intupperthumbs_up","enter"}},false)
	end
	if menu_state.opened then
		SendNUIMessage({ act = "event", event = "LEFT" })
        tvRP.playSound("NAV_LEFT_RIGHT","HUD_FRONTEND_DEFAULT_SOUNDSET")
	end
end, false)

RegisterKeyMapping ( 'vrp:right' , 'Direita' , 'keyboard' , 'RIGHT' )

RegisterCommand('vrp:right', function()
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 and not menu_state.opened and not menu_celular then
		tvRP.playAnim(true,{{"anim@mp_player_intcelebrationmale@face_palm","face_palm"}},false)
	end
	if menu_state.opened then
		SendNUIMessage({ act = "event", event = "RIGHT" }) 
        tvRP.playSound("NAV_LEFT_RIGHT","HUD_FRONTEND_DEFAULT_SOUNDSET")
	end
end, false)

RegisterKeyMapping ( 'vrp:select' , 'Selecionar' , 'keyboard' , 'RETURN' )

RegisterCommand('vrp:select', function()
	if menu_state.opened then
		SendNUIMessage({ act = "event", event = "SELECT" })
		tvRP.playSound("SELECT","HUD_FRONTEND_DEFAULT_SOUNDSET") 
	end
end, false)

RegisterKeyMapping ( 'vrp:cancel' , 'Cancelar' , 'keyboard' , 'BACK' )

RegisterCommand('vrp:cancel', function()
	SendNUIMessage({ act = "event", event = "CANCEL" })
end, false)

--[  ]-----------------------------------------------------------------------------

RegisterKeyMapping ( 'vrp:anim01' , '[A] Cruzar os braços' , 'keyboard' , 'F1' )

RegisterCommand('vrp:anim01', function()
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 and not menu_state.opened and not menu_celular and not cancelando then
		if IsEntityPlayingAnim(ped,"anim@heists@heist_corona@single_team","single_team_loop_boss",3) then
			tvRP.DeletarObjeto()
		else
			tvRP.playAnim(true,{{"anim@heists@heist_corona@single_team","single_team_loop_boss"}},true)
		end
	end
end, false)

RegisterKeyMapping ( 'vrp:anim02' , '[A] Aguardar' , 'keyboard' , 'F2' )

RegisterCommand('vrp:anim02', function()
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 and not menu_state.opened and not menu_celular and not cancelando then
		if IsEntityPlayingAnim(ped,"mini@strip_club@idles@bouncer@base","base",3) then
			tvRP.DeletarObjeto()
		else
			tvRP.playAnim(true,{{"mini@strip_club@idles@bouncer@base","base"}},true)
		end
	end
end, false)

RegisterKeyMapping ( 'vrp:anim03' , '[A] Dedo do meio' , 'keyboard' , 'F3' )

RegisterCommand('vrp:anim03', function()
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 and not menu_state.opened and not menu_celular and not cancelando then
		if IsEntityPlayingAnim(ped,"anim@mp_player_intupperfinger","idle_a_fp",3) then
			tvRP.DeletarObjeto()
		else
			tvRP.playAnim(true,{{"anim@mp_player_intupperfinger","idle_a_fp"}},true)
		end
	end
end, false)

RegisterKeyMapping ( 'vrp:anim05' , '[A] Puto' , 'keyboard' , 'F5' )

RegisterCommand('vrp:anim05', function()
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 and not menu_state.opened and not menu_celular and not cancelando then
		tvRP.playAnim(true,{{"misscarsteal4@actor","actor_berating_loop"}},false)
	end
end, false)

RegisterKeyMapping ( 'vrp:cancelAnims' , 'Cancelar animações' , 'keyboard' , 'F6' )

RegisterCommand('vrp:cancelAnims', function()
	local ped = PlayerPedId()
	if cooldown < 1 then
		cooldown = 20
		if GetEntityHealth(ped) > 101 then
			if not menu_state.opened and not cancelando then
				tvRP.DeletarObjeto()
				ClearPedTasks(ped)
			end
		end
	end
end, false)

RegisterKeyMapping ( 'vrp:anim10' , '[A] Mãos na cabeça' , 'keyboard' , 'F10' )

RegisterCommand('vrp:anim10', function()
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 and not menu_state.opened and not menu_celular and not cancelando then
		if IsEntityPlayingAnim(ped,"random@arrests@busted","idle_a",3) then
			tvRP.DeletarObjeto()
		else
			tvRP.DeletarObjeto()
			tvRP.playAnim(true,{{"random@arrests@busted","idle_a"}},true)
		end
	end
end, false)

RegisterKeyMapping ( 'vrp:animX' , '[A] Levantar as mãos' , 'keyboard' , 'X' )

RegisterCommand('vrp:animX', function()
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 and not menu_celular and not cancelando then
		SetCurrentPedWeapon(ped,GetHashKey("WEAPON_UNARMED"),true)
		if IsEntityPlayingAnim(ped,"random@mugging3","handsup_standing_base",3) then
			tvRP.DeletarObjeto()
		else
			tvRP.playAnim(true,{{"random@mugging3","handsup_standing_base"}},true)
		end
	end
end, false)

RegisterKeyMapping ( 'vrp:vehicleZ' , '[V] Ligar motor' , 'keyboard' , 'Z' )

RegisterCommand('vrp:vehicleZ', function()
	local ped = PlayerPedId()
	if IsPedInAnyVehicle(ped) then
		local vehicle = GetVehiclePedIsIn(ped,false)
		if GetPedInVehicleSeat(vehicle,-1) == ped then
			tvRP.DeletarObjeto()
			local running = Citizen.InvokeNative(0xAE31E7DF9B5B132E,vehicle)
			SetVehicleEngineOn(vehicle,not running,true,true)
			if running then
				SetVehicleUndriveable(vehicle,true)
			else
				SetVehicleUndriveable(vehicle,false)
			end
		end
	end
end, false)

local pointersleep = false

RegisterKeyMapping ( 'vrp:animB' , '[A] Apontar o dedo' , 'keyboard' , 'B' )

RegisterCommand('vrp:animB', function()
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 and not menu_celular then
		tvRP.CarregarAnim("anim@mp_point")
		if not apontar then
			srkapontar()
			pointersleep = true
			SetPedCurrentWeaponVisible(ped,0,1,1,1)
			SetPedConfigFlag(ped,36,1)
			Citizen.InvokeNative(0x2D537BA194896636,ped,"task_mp_pointing",0.5,0,"anim@mp_point",24)
			apontar = true
		else
			pointersleep = false
			Citizen.InvokeNative(0xD01015C7316AE176,ped,"Stop")
			if not IsPedInjured(ped) then
				ClearPedSecondaryTask(ped)
			end
			if not IsPedInAnyVehicle(ped) then
				SetPedCurrentWeaponVisible(ped,1,1,1,1)
			end
			SetPedConfigFlag(ped,36,0)
			ClearPedSecondaryTask(ped)
			apontar = false
		end
	end
end, false)

--[ SYNCCLEAN ]--------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("syncclean")
AddEventHandler("syncclean",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				SetVehicleDirtLevel(v,0.0)
				SetVehicleUndriveable(v,false)
				tvRP.DeletarObjeto()
			end
		end
	end
end)

--[ SYNCDELETEPED ]----------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("syncdeleteped")
AddEventHandler("syncdeleteped",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToPed(index)
		if DoesEntityExist(v) then
			Citizen.InvokeNative(0xAD738C3085FE7E11,v,true,true)
			SetPedAsNoLongerNeeded(Citizen.PointerValueIntInitialized(v))
			DeletePed(v)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÃO DO APONTAR
-----------------------------------------------------------------------------------------------------------------------------------------

function srkapontar()
	Citizen.CreateThread(function()
		while pointersleep do
			local ped = PlayerPedId()
			if apontar then
				idle = 5
				local camPitch = GetGameplayCamRelativePitch()
				if camPitch < -70.0 then
					camPitch = -70.0
				elseif camPitch > 42.0 then
					camPitch = 42.0
				end
				camPitch = (camPitch + 70.0) / 112.0

				local camHeading = GetGameplayCamRelativeHeading()
				local cosCamHeading = Cos(camHeading)
				local sinCamHeading = Sin(camHeading)
				if camHeading < -180.0 then
					camHeading = -180.0
				elseif camHeading > 180.0 then
					camHeading = 180.0
				end
				camHeading = (camHeading + 180.0) / 360.0

				local blocked = 0
				local nn = 0
				local coords = GetOffsetFromEntityInWorldCoords(ped,(cosCamHeading*-0.2)-(sinCamHeading*(0.4*camHeading+0.3)),(sinCamHeading*-0.2)+(cosCamHeading*(0.4*camHeading+0.3)),0.6)
				local ray = Cast_3dRayPointToPoint(coords.x,coords.y,coords.z-0.2,coords.x,coords.y,coords.z+0.2,0.4,95,ped,7);
				nn,blocked,coords,coords = GetRaycastResult(ray)

				Citizen.InvokeNative(0xD5BB4025AE449A4E,ped,"Pitch",camPitch)
				Citizen.InvokeNative(0xD5BB4025AE449A4E,ped,"Heading",camHeading*-1.0+1.0)
				Citizen.InvokeNative(0xB0A6CFD2C69C1088,ped,"isBlocked",blocked)
				Citizen.InvokeNative(0xB0A6CFD2C69C1088,ped,"isFirstPerson",Citizen.InvokeNative(0xEE778F8C7E1142E2,Citizen.InvokeNative(0x19CAFA3C87F7C2FF))==4)
			end
			Citizen.Wait(idle)
		end
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BIND
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("keybind",function(source,args)
	if not IsPauseMenuActive() then
		local ped = PlayerPedId()
		if not celular and GetEntityHealth(ped) > 101 then
			if args[1] == "1" then
				TriggerServerEvent("vrp_inventory:useItem","1",1)
			elseif args[1] == "2" then
				TriggerServerEvent("vrp_inventory:useItem","2",1)
			elseif args[1] == "3" then
				TriggerServerEvent("vrp_inventory:useItem","3",1)
			elseif args[1] == "4" then
				TriggerServerEvent("vrp_inventory:useItem","4",1)
			elseif args[1] == "5" then
				TriggerServerEvent("vrp_inventory:useItem","5",1)
			elseif args[1] == "f1" and not IsPedInAnyVehicle(ped) then
				if IsEntityPlayingAnim(ped,"anim@heists@heist_corona@single_team","single_team_loop_boss",3) then
					StopAnimTask(ped,"anim@heists@heist_corona@single_team","single_team_loop_boss",2.0)
					-- tvRP.stopActived()
				else
					tvRP.playAnim(true,{"anim@heists@heist_corona@single_team","single_team_loop_boss"},true)
				end
			elseif args[1] == "f2" and not IsPedInAnyVehicle(ped) then
				if IsEntityPlayingAnim(ped,"mini@strip_club@idles@bouncer@base","base",3) then
					StopAnimTask(ped,"mini@strip_club@idles@bouncer@base","base",2.0)
					-- tvRP.stopActived()
				else
					tvRP.playAnim(true,{"mini@strip_club@idles@bouncer@base","base"},true)
				end
			elseif args[1] == "6" and not IsPedInAnyVehicle(ped) then
				if IsEntityPlayingAnim(ped,"anim@mp_player_intselfiethe_bird" , "idle_a",3) then
					StopAnimTask(ped,"anim@mp_player_intselfiethe_bird" , "idle_a",2.0)
					-- tvRP.stopActived()
				else
					tvRP.playAnim(true,{"anim@mp_player_intselfiethe_bird" , "idle_a"},true)
				end
			elseif args[1] == "7" and not IsPedInAnyVehicle(ped) then
				if IsEntityPlayingAnim(ped,"anim@heists@prison_heiststation@cop_reactions","cop_a_idle",3) then
					StopAnimTask(ped,"anim@heists@prison_heiststation@cop_reactions","cop_a_idle",2.0)
					-- tvRP.stopActived()
				else
					tvRP.playAnim(true,{"anim@heists@prison_heiststation@cop_reactions","cop_a_idle"},true)
				end
			elseif args[1] == "8" and not IsPedInAnyVehicle(ped) then
				if IsEntityPlayingAnim(ped,"amb@world_human_cop_idles@female@base","base",3) then
					StopAnimTask(ped,"amb@world_human_cop_idles@female@base","base",2.0)
					-- tvRP.stopActived()
				else
					tvRP.playAnim(true,{"amb@world_human_cop_idles@female@base","base"},true)
				end
			elseif args[1] == "9" and not IsPedInAnyVehicle(ped) then
				if IsEntityPlayingAnim(ped,"random@arrests@busted","idle_a",3) then
					StopAnimTask(ped,"random@arrests@busted","idle_a",2.0)
					-- tvRP.stopActived()
				else
					tvRP.playAnim(true,{"random@arrests@busted","idle_a"},true)
				end
			elseif args[1] == "left" and not IsPedInAnyVehicle(ped) then
				if not IsPedInAnyVehicle(ped) then
					tvRP.playAnim(true,{"anim@mp_player_intupperthumbs_up","enter"},false)
				end
			elseif args[1] == "right" and not IsPedInAnyVehicle(ped) then
				if not IsPedInAnyVehicle(ped) then
					tvRP.playAnim(true,{"anim@mp_player_intupperface_palm" , "idle_a"},false)
				end
			elseif args[1] == "up" and not IsPedInAnyVehicle(ped) then
				if not IsPedInAnyVehicle(ped) then
					tvRP.playAnim(true,{"anim@mp_player_intcelebrationmale@salute","salute"},false)
				end
			elseif args[1] == "down" and not IsPedInAnyVehicle(ped) then
				if not IsPedInAnyVehicle(ped) then
					tvRP.playAnim(true,{"rcmnigel1c","hailing_whistle_waive_a"},false)
				end
			end
		end
	end
end)
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- HOSLTER
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- local holstered = true
-- local weapon
-- local disabled

-- local weapons = {
-- 		"WEAPON_PISTOL_MK2",
-- 		"WEAPON_COMBATPISTOL",
-- 		"WEAPON_PISTOL",
-- 		"WEAPON_ASSAULTRIFLE",
-- 		"WEAPON_CARBINERIFLE",
-- 		"WEAPON_SMG",
-- 		"WEAPON_ASSAULTSMG",		
-- 		"WEAPON_BULLPUPRIFLE",
-- 		"WEAPON_SAWNOFFSHOTGUN",
-- 		"WEAPON_STUNGUN",
-- 		"WEAPON_SPECIALCARBINE",
-- 		"WEAPON_PUMPSHOTGUN"
	
-- }

-- function CheckWeapon(ped)
-- 	for i = 1, #weapons do
-- 		if GetHashKey(weapons[i]) == GetSelectedPedWeapon(ped) then
-- 			weapon = weapons[i]
-- 			return true
-- 		end
-- 	end
-- 	return false
-- end

-- function loadAnimDict(dict)
-- 	while (not HasAnimDictLoaded(dict)) do
-- 		RequestAnimDict(dict)
-- 		Citizen.Wait(0)
-- 	end
-- end

-- function srkdisabled()
-- 	Citizen.CreateThread(function()
-- 	while disabled do
-- 		local idle = 300
-- 		if disabled then
-- 			idle = 5
-- 			DisableControlAction(1,243,true)
-- 			DisableControlAction(1,213,true)
-- 			DisableControlAction(0,21,true) 
-- 			DisableControlAction(0,24,true)
-- 			DisableControlAction(0,25,true) 
-- 			DisableControlAction(0,47,true) 
-- 			DisableControlAction(0,49,true)
-- 			DisableControlAction(0,44,true) 
-- 			DisableControlAction(0,303,true) 
-- 			DisableControlAction(0,246,true) 
-- 			DisableControlAction(0,311,true) 
-- 			DisableControlAction(0,58,true) 
-- 			DisableControlAction(0,263,true) 
-- 			DisableControlAction(0,264,true) 
-- 			DisableControlAction(0,257,true) 
-- 			DisableControlAction(0,140,true) 
-- 			DisableControlAction(0,141,true) 
-- 			DisableControlAction(0,142,true)
-- 			DisableControlAction(0,143,true) 
-- 			DisableControlAction(0,75,true) 
-- 			DisableControlAction(27,75,true) 
-- 			end
-- 			Citizen.Wait(idle)
-- 		end
-- 	end)
-- end
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- HOLSTER
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Config = {}
-- Config.WeaponList = {
-- 	"weapon_dagger",
-- 	"weapon_bat",
-- 	"weapon_bottle",
-- 	"weapon_crowbar",
-- 	"weapon_unarmed",
-- 	"weapon_flashlight",
--    "weapon_golfclub",
--    "weapon_hammer",
--    "weapon_hatchet",
--    "weapon_knuckle",
--    "weapon_knife",
--    "weapon_machete",
--    "weapon_switchblade",
--    "weapon_nightstick",
--    "weapon_wrench",
--    "weapon_battleaxe",
--    "weapon_poolcue",
--    "weapon_stone_hatchet",
--    "weapon_pistol",
--    "weapon_pistol_mk2",
--    "weapon_combatpistol",
--    "weapon_appistol",
--    "weapon_stungun",
--    "weapon_pistol50",
--    "weapon_snspistol",
--    "weapon_snspistol_mk2",
--    "weapon_heavypistol",
--    "weapon_vintagepistol",
--    "weapon_flaregun",
--    "weapon_marksmanpistol",
--    "weapon_revolver",
--    "weapon_revolver_mk2",
--    "weapon_doubleaction",
--    "weapon_raypistol",
--    "weapon_ceramicpistol",
--    "weapon_navyrevolver",
--    "weapon_gadgetpistol",
--    "weapon_stungun_mp",
--    "weapon_microsmg",
--    "weapon_smg",
--    "weapon_smg_mk2",
--    "weapon_assaultsmg",
--    "weapon_combatpdw",
--    "weapon_machinepistol",
--    "weapon_minismg",
--    "weapon_raycarbine",
--    "weapon_pumpshotgun",
--    "weapon_pumpshotgun_mk2",
--    "weapon_sawnoffshotgun",
--    "weapon_assaultshotgun",
--    "weapon_bullpupshotgun",
--    "weapon_musket",
--    "weapon_heavyshotgun",
--    "weapon_dbshotgun",
--    "weapon_autoshotgun",
--    "weapon_combatshotgun",
--    "weapon_assaultrifle",
--    "weapon_assaultrifle_mk2",
--    "weapon_carbinerifle",
--    "weapon_carbinerifle_mk2",
--    "weapon_advancedrifle",
--    "weapon_specialcarbine",
--    "weapon_specialcarbine_mk2",
--    "weapon_bullpuprifle_mk2",
--    "weapon_compactrifle",
--    "weapon_militaryrifle",
--    "weapon_heavyrifle",
--    "weapon_mg",
--    "weapon_combatmg",
--    "weapon_combatmg_mk2",
--    "weapon_gusenberg",
--    "weapon_sniperrifle",
--    "weapon_heavysniper",
--    "weapon_heavysniper_mk2",
--    "weapon_marksmanrifle",
--    "weapon_marksmanrifle_mk2",
--    "weapon_rpg",
--    "weapon_grenadelauncher",
--    "weapon_grenadelauncher_smoke",
--    "weapon_minigun",
--    "weapon_firework",
--    "weapon_railgun",
--    "weapon_hominglauncher",
--    "weapon_compactlauncher",
--    "weapon_rayminigun",
--    "weapon_emplauncher",
--    "weapon_grenade",
--    "weapon_bzgas",
--    "weapon_molotov",
--    "weapon_stickybomb",
--    "weapon_proxmine",
--    "weapon_snowball",
--    "weapon_pipebomb",
--    "weapon_ball",
--    "weapon_smokegrenade",
--    "weapon_flare",
--    "weapon_petrolcan",
--    "weapon_fireextinguisher",
--    "weapon_hazardcan",
--    "weapon_fertilizercan"





-- }

-- local LastWeapon = nil
-- local block = false
-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(1)
-- 		local ped = PlayerPedId()
-- 		if DoesEntityExist(ped) and not IsEntityDead(ped) and not IsPedInAnyVehicle(ped) then
-- 			for i=1,#Config.WeaponList do
-- 				tvRP.CarregarAnim("reaction@intimidation@1h")
-- 				if not holstered and LastWeapon ~= nil and LastWeapon ~= GetHashKey(Config.WeaponList[i]) and GetSelectedPedWeapon(ped) == GetHashKey(Config.WeaponList[i]) then
-- 					block = true
-- 					SetCurrentPedWeapon(ped,-1569615261,true)
-- 					TaskPlayAnim(ped,"reaction@intimidation@1h","intro",8.0,8.0,-1,48,10,0,0,0)

-- 				   Citizen.Wait(1200)
-- 					SetCurrentPedWeapon(ped,GetHashKey(Config.WeaponList[i]),true)
-- 					Citizen.Wait(1300)
-- 				   ClearPedTasks(ped)
-- 					holstered = true
-- 				   block = false
-- 			   end

-- 			   if holstered and LastWeapon ~= nil and LastWeapon == GetHashKey(Config.WeaponList[i]) and GetSelectedPedWeapon(ped) == -1569615261 then
-- 				   block = true
-- 				   SetCurrentPedWeapon(ped,GetHashKey(Config.WeaponList[i]),true)
-- 				   TaskPlayAnim(ped,"reaction@intimidation@1h","outro",8.0,8.0,-1,48,10,0,0,0)

-- 					Citizen.Wait(1400)
-- 					SetCurrentPedWeapon(ped,-1569615261,true)
-- 					Citizen.Wait(600)
-- 					ClearPedTasks(ped)
-- 					holstered = false
-- 					block = false
-- 				end
-- 			end
-- 			LastWeapon = GetSelectedPedWeapon(ped)
-- 		end
-- 	end
-- end)

-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(1)
-- 		if block then
-- 			BlockWeaponWheelThisFrame()
-- 			DisableControlAction(0,25,true)
-- 		end
-- 	end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISABLECONTROLS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		-- DisableControlAction(1,37,false)
		-- DisableControlAction(1,99,false)
		-- DisableControlAction(1,100,false)
		DisableControlAction(1,157,false)
		DisableControlAction(1,158,false)
		DisableControlAction(1,160,false)
		DisableControlAction(1,164,false)
		DisableControlAction(1,165,false)
		Citizen.Wait(4)
	end
end)

RegisterKeyMapping("keybind 1","Inventory Bind 1","keyboard","1")
RegisterKeyMapping("keybind 2","Inventory Bind 2","keyboard","2")
RegisterKeyMapping("keybind 3","Inventory Bind 3","keyboard","3")
RegisterKeyMapping("keybind 4","Inventory Bind 4","keyboard","4")
RegisterKeyMapping("keybind 5","Inventory Bind 5","keyboard","5")