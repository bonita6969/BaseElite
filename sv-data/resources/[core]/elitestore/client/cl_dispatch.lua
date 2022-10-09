-----------------------------------------------------------------------------------------------------------------------------------------
-- INICIAR TREM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SwitchTrainTrack(0,true)
	SwitchTrainTrack(3,true)
	N_0x21973bbf8d17edfa(0,120000)
	SetRandomTrains(true)
  end)
  -----------------------------------------------------------------------------------------------------------------------------------------
  -- DENSITY NPCS 2
  -----------------------------------------------------------------------------------------------------------------------------------------
  Citizen.CreateThread(function()
	  while true do
	  Citizen.Wait(1)
		  SetPedDensityMultiplierThisFrame(11.0)
		  SetVehicleDoorsLocked(1)
		  SetVehicleDensityMultiplierThisFrame(10.05)
		  SetSomeVehicleDensityMultiplierThisFrame(11.0)
		  SetRandomVehicleDensityMultiplierThisFrame(11.0)
		  SetParkedVehicleDensityMultiplierThisFrame(10.35)
		  SetVehicleDoorsLockedForAllPlayers(true)
		  SetScenarioPedDensityMultiplierThisFrame(1.0,1.0)
	  end
  end)
--[ DISPATCH ]---------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	for i = 1,120 do
		EnableDispatchService(i,false)
	end
end)
---------------------------MINI MAPA ILHA---------------------------------------
Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0)
		SetRadarAsExteriorThisFrame()
		SetRadarAsInteriorThisFrame("h4_fake_islandx",vec(4700.0,-5145.0),0,0)
	end
end)
--[ BLIPS ]------------------------------------------------------------------------------------------------------------------------------

local blips = {}
Citizen.CreateThread(function()
	for _,v in pairs(blips) do
		local blip = AddBlipForCoord(v.x,v.y,v.z)
		SetBlipSprite(blip,v.sprite)
		SetBlipAsShortRange(blip,true)
		SetBlipColour(blip,v.color)
		SetBlipScale(blip,v.scale)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.nome)
		EndTextCommandSetBlipName(blip)
	end
end)

--[ TASERTIME ]--------------------------------------------------------------------------------------------------------------------------

local tasertime = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(200)
		local ped = PlayerPedId()
		if IsPedBeingStunned(ped) then
			SetPedToRagdoll(ped,10000,10000,0,0,0,0)
		end

		if IsPedBeingStunned(ped) and not tasertime then
			tasertime = true
			SetTimecycleModifier("REDMIST_blend")
			ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE",1.0)
		elseif not IsPedBeingStunned(ped) and tasertime then
			tasertime = false
			SetTimeout(5000,function()
				SetTimecycleModifier("hud_def_desat_Trevor")
				SetTimeout(10000,function()
					SetTimecycleModifier("")
					SetTransitionTimecycleModifier("")
					StopGameplayCamShaking()
				end)
			end)
		end
	end
end)

--[ BLACKOUT ]---------------------------------------------------------------------------------------------------------------------------

-- local isBlackout = false
-- local oldSpeed = 0

-- Citizen.CreateThread(function()
-- 	while true do
-- 		local idle = 2000
-- 		local vehicle = GetVehiclePedIsIn(PlayerPedId())
-- 		if IsEntityAVehicle(vehicle) and GetPedInVehicleSeat(vehicle,-1) == PlayerPedId() then
-- 			idle = 100
-- 			local currentSpeed = GetEntitySpeed(vehicle)*2.236936
-- 			if currentSpeed ~= oldSpeed then
-- 				if not isBlackout and (currentSpeed < oldSpeed) and ((oldSpeed - currentSpeed) >= 50) then
-- 					blackout()
-- 				end
-- 				oldSpeed = currentSpeed
-- 			end
-- 		else
-- 			if oldSpeed ~= 0 then
-- 				oldSpeed = 0
-- 			end
-- 		end

-- 		if isBlackout then
-- 			DisableControlAction(0,63,true)
-- 			DisableControlAction(0,64,true)
-- 			DisableControlAction(0,71,true)
-- 			DisableControlAction(0,72,true)
-- 			DisableControlAction(0,75,true)
-- 		end
-- 		Citizen.Wait(idle)
-- 	end
-- end)

-- function blackout()
-- 	TriggerEvent("vrp_sound:source",'heartbeat',0.5)
-- 	if not isBlackout then
-- 		isBlackout = true
-- 		SetEntityHealth(PlayerPedId(),GetEntityHealth(PlayerPedId())-200)
-- 		Citizen.CreateThread(function()
-- 			DoScreenFadeOut(500)
-- 			while not IsScreenFadedOut() do
-- 				Citizen.Wait(10)
-- 			end
-- 			Citizen.Wait(5000)
-- 			DoScreenFadeIn(5000)
-- 			isBlackout = false
-- 		end)
-- 	end
-- end

--[ DAMAGE WALK MODE ]-------------------------------------------------------------------------------------------------------------------

local hurt = false
Citizen.CreateThread(function()
	while true do
		local idle = 2000
		local ped = PlayerPedId()
		if not IsEntityInWater(ped) then
			if GetEntityHealth(ped) <= 199 then
				idle = 5
				setHurt()
			elseif hurt and GetEntityHealth(ped) > 200 then
				setNotHurt()
			end
		end
		Citizen.Wait(idle)
	end
end)

function setHurt()
    hurt = true
    RequestAnimSet("move_m@injured")
    SetPedMovementClipset(PlayerPedId(),"move_m@injured",true)
	SetPlayerHealthRechargeMultiplier(PlayerId(),0.0)
	DisableControlAction(0,21) 
	DisableControlAction(0,22)
end

function setNotHurt()
    hurt = false
	SetPlayerHealthRechargeMultiplier(PlayerId(),0.0)
    ResetPedMovementClipset(PlayerPedId())
    ResetPedWeaponMovementClipset(PlayerPedId())
    ResetPedStrafeClipset(PlayerPedId())
end


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- STATUS DO DISCORD
-- -----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
		SetDiscordAppId(830846909169008651) -- Aplication ID

		SetDiscordRichPresenceAsset('elitestore')  -- Imagem que vai aparecer no presence

        SetDiscordRichPresenceAssetText('NEW ELITE')
       
		SetDiscordRichPresenceAssetText('Compre sua NEW ELITE') -- Texto que vai aparecer ao passar o mouse em cima da imagem
 
		SetDiscordRichPresenceAssetSmallText('New Elite')
        
		SetDiscordRichPresenceAction(1, "Discord", "https://discord.gg/s9ufJuRYtZ") -- Link do botão (Normalmente o LINK do discord)

        local playerCount = #GetActivePlayers() -- Pega os Players ativos na cidade
        
		local player = GetPlayerServerId(PlayerId()) -- Função para pegar o ID do player

        local playerName = GetPlayerName(PlayerId()) -- Função para pegar o Nome do player

        local maxPlayerSlots = "120" -- Quantidade máxima de jogadores

        SetRichPresence(string.format("ID %s - %s \nMoradores %s/%s", player, playerName, playerCount,maxPlayerSlots))
        
		Citizen.Wait(60000) -- Quantidade de vezes que atualiza (configurado pra 1x por minuto)
	end
end)


--[ DRIFT ]------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(PlayerPedId())
		local idle = 1000
		if IsPedInAnyVehicle(ped) then
			local speed = GetEntitySpeed(vehicle)*2.236936
			if GetPedInVehicleSeat(vehicle,-1) == ped 
				and (GetEntityModel(vehicle) ~= GetHashKey("coach") 
				and GetEntityModel(vehicle) ~= GetHashKey("bus") 
				and GetEntityModel(vehicle) ~= GetHashKey("youga2") 
				and GetEntityModel(vehicle) ~= GetHashKey("ratloader") 
				and GetEntityModel(vehicle) ~= GetHashKey("taxi") 
				and GetEntityModel(vehicle) ~= GetHashKey("boxville4") 
				and GetEntityModel(vehicle) ~= GetHashKey("trash2") 
				and GetEntityModel(vehicle) ~= GetHashKey("tiptruck") 
				and GetEntityModel(vehicle) ~= GetHashKey("rebel") 
				and GetEntityModel(vehicle) ~= GetHashKey("speedo") 
				and GetEntityModel(vehicle) ~= GetHashKey("phantom") 
				and GetEntityModel(vehicle) ~= GetHashKey("packer") 
				and GetEntityModel(vehicle) ~= GetHashKey("paramedicoambu")) then
				idle = 5
				if speed <= 100.0 then
					if IsControlPressed(1,21) then
						SetVehicleReduceGrip(vehicle,true)
					else
						SetVehicleReduceGrip(vehicle,false)
					end
				end 
			end
		end
		Citizen.Wait(idle)
	end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------
-- Holograms
--------------------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    Holograms()
end)

function Holograms()
		while true do
			Citizen.Wait(0)				
		if GetDistanceBetweenCoords( -1033.0, -2725.2, 13.61, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1033.0, -2725.2, 13.61  -1.400, "Seja Bem-Vindo(a) a (SUA CIDADE)!", 4, 0.1, 0.1)
			Draw3DText( -1033.0, -2725.2, 13.61  -1.600, "Viva Intensamente sua nova Vida!", 4, 0.1, 0.1)
			Draw3DText( -1033.0, -2725.2, 13.61  -1.800, "Dúvidas ou Sugestões nossos Canais estão abertos no Discord", 4, 0.1, 0.1)	
			Draw3DText( -1033.0, -2725.2, 13.61  -2.000, "Equipe (SUA CIDADE) deseja um Excelente RP!", 4, 0.1, 0.1)	
		end	
		if GetDistanceBetweenCoords( 1118.16, 220.0, -49.43, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 1118.16, 220.0, -49.43  -1.500, "Seja Bem-Vindo(a) ao (SUA CIDADE) Casino!", 4, 0.1, 0.05)
			Draw3DText( 1118.16, 220.0, -49.43  -1.600, "A esquerda você consegue Vender suas Fichas.", 4, 0.1, 0.05)
			Draw3DText( 1118.16, 220.0, -49.43  -1.700, "A Direita você consegue Comprar Fichas.", 4, 0.1, 0.05)
			Draw3DText( 1118.16, 220.0, -49.43  -1.800, "Aposte com responsabilidade e Divirta-se!", 4, 0.1, 0.05)	
		end	
	end
end

-------------------------------------------------------------------------------------------------------------------------
function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
	local scale = (1/dist)*20
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov   
	SetTextScale(scaleX*scale, scaleY*scale)
	SetTextFont(fontId)
	SetTextProportional(1)
	SetTextColour(255,110,0, 220)		-- You can change the text color here
	SetTextDropshadow(1, 1, 1, 1, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(textInput)
	SetDrawOrigin(x,y,z+2, 0)
	DrawText(0.0, 0.0)
	ClearDrawOrigin()
end


-----------------------------------------------------------------------------------------------------------------------------------------
-- SKATE
-----------------------------------------------------------------------------------------------------------------------------------------
local RCCar = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- EVENT SKATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('skate')
AddEventHandler('skate',function() 
	local ped = PlayerPedId()
	if DoesEntityExist(RCCar.Entity) then return end
	RCCar.Spawn()
	while DoesEntityExist(RCCar.Entity) and DoesEntityExist(RCCar.Driver) do
		Citizen.Wait(5)
		local distanceCheck = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(RCCar.Entity),true)
		RCCar.HandleKeys(distanceCheck)
		if distanceCheck <= 3 then
			if not NetworkHasControlOfEntity(RCCar.Driver) then
				NetworkRequestControlOfEntity(RCCar.Driver)
			elseif not NetworkHasControlOfEntity(RCCar.Entity) then
				NetworkRequestControlOfEntity(RCCar.Entity)
			end
		else
			TaskVehicleTempAction(RCCar.Driver,RCCar.Entity,6,2500)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION CONTROL SKATE
-----------------------------------------------------------------------------------------------------------------------------------------
Attached = false
function RCCar.HandleKeys(distanceCheck)
	local ped = PlayerPedId()
	if distanceCheck <= 1.5 then
		if IsControlJustPressed(0,38) and IsInputDisabled(0) and not Attached then
			RCCar.Attach("pick")
		end
		if IsControlJustReleased(0,244) and IsInputDisabled(0) then
			if Attached then
				RCCar.AttachPlayer(false)
			else
				RCCar.AttachPlayer(true)
			end
		end
		if not Attached then
			DrawText3Ds(GetEntityCoords(RCCar.Entity).x,GetEntityCoords(RCCar.Entity).y,GetEntityCoords(RCCar.Entity).z+0.5,"~r~E ~w~ PEGAR      ~g~M ~w~ SUBIR",500)
		end
	end
	if distanceCheck <= 1.5 and Attached then
		if IsControlPressed(0,32) and IsInputDisabled(0) and not IsControlPressed(0,33)  and IsInputDisabled(0) then
			TaskVehicleTempAction(RCCar.Driver,RCCar.Entity,9,1)
		end
		if IsControlJustReleased(0,22) and IsInputDisabled(0) and Attached then
			local vel = GetEntityVelocity(RCCar.Entity)
			if not IsEntityInAir(RCCar.Entity) then
				SetEntityVelocity(RCCar.Entity,vel.x,vel.y,vel.z+5.0)
				Citizen.Wait(20)
			end		
		end	
		if IsControlJustReleased(0,32) or IsControlJustReleased(0,33) and IsInputDisabled(0) then
			TaskVehicleTempAction(RCCar.Driver,RCCar.Entity,6,2500)
		end
		if IsControlPressed(0,33) and not IsControlPressed(0,32) and IsInputDisabled(0) then
			TaskVehicleTempAction(RCCar.Driver,RCCar.Entity,22,1)
		end
		if IsControlPressed(0,34) and IsControlPressed(0,33) and IsInputDisabled(0) then
			TaskVehicleTempAction(RCCar.Driver,RCCar.Entity,13,1)
		end
		if IsControlPressed(0,35) and IsControlPressed(0,33) and IsInputDisabled(0) then
			TaskVehicleTempAction(RCCar.Driver,RCCar.Entity,14,1)
		end
		if IsControlPressed(0,32) and IsControlPressed(0,33) and IsInputDisabled(0) then
			TaskVehicleTempAction(RCCar.Driver,RCCar.Entity,30,100)
		end
		if IsControlPressed(0,34) and IsControlPressed(0,32) and IsInputDisabled(0) then
			TaskVehicleTempAction(RCCar.Driver,RCCar.Entity,7,1)
		end
		if IsControlPressed(0,35) and IsControlPressed(0,32) and IsInputDisabled(0) then
			TaskVehicleTempAction(RCCar.Driver,RCCar.Entity,8,1)
		end
		if IsControlPressed(0,34) and not IsControlPressed(0,32) and not IsControlPressed(0,33) and IsInputDisabled(0) then
			TaskVehicleTempAction(RCCar.Driver,RCCar.Entity,4,1)
		end
		if IsControlPressed(0,35) and not IsControlPressed(0,32) and not IsControlPressed(0,33) and IsInputDisabled(0) then
			TaskVehicleTempAction(RCCar.Driver,RCCar.Entity,5,1)
		end	
	end
	Citizen.CreateThread(function()
    	Citizen.Wait(1)
    	if Attached then
	        local x = GetEntityRotation(RCCar.Entity).x
	        local y = GetEntityRotation(RCCar.Entity).y

	        if (-60.0 < x and x > 60.0) or (-60.0 < y and y > 60.0) or (HasEntityCollidedWithAnything(RCCar.Entity) and GetEntitySpeed(RCCar.Entity) > 12.6) then
	        	RCCar.AttachPlayer(false)
	        	SetPedToRagdoll(ped,4000,4000,0,true,true,false)
	        elseif IsPedArmed(ped,7) or IsEntityInWater(RCCar.Entity) or GetEntityHealth(ped) <= 101 then
	        	RCCar.AttachPlayer(false)
	        	DetachEntity(RCCar.Entity)
			end	
	    end           
    end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION SPAWN SKATE
-----------------------------------------------------------------------------------------------------------------------------------------
function RCCar.Spawn()
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped) then
		RCCar.LoadModels({ GetHashKey("rcbandito"),68070371,GetHashKey("p_defilied_ragdoll_01_s"),"pickup_object","move_strafe@stealth" })
		local spawnCoords,spawnHeading = GetEntityCoords(ped)+GetEntityForwardVector(ped)*2.0,GetEntityHeading(ped)
		RCCar.Entity = CreateVehicle(GetHashKey("rcbandito"),spawnCoords,spawnHeading,true)
		RCCar.Skate = CreateObject(GetHashKey("p_defilied_ragdoll_01_s"),0.0,0.0,0.0,true,true,true)
		while not DoesEntityExist(RCCar.Entity) do
			Citizen.Wait(5)
		end
		while not DoesEntityExist(RCCar.Skate) do
			Citizen.Wait(5)
		end
		--ForceVehicleEngineAudio(RCCar.Entity,"VOLTIC")
		SetVehicleHandlingFloat(RCCar.Entity,"CHandlingData","fSuspensionForce",1.5)
		SetVehicleEngineTorqueMultiplier(RCCar.Entity,0.1)
		SetEntityNoCollisionEntity(RCCar.Entity,ped,false)
		SetEntityVisible(RCCar.Entity,false)
		SetAllVehiclesSpawn(RCCar.Entity,true,true,true,true)
		AttachEntityToEntity(RCCar.Skate,RCCar.Entity,GetPedBoneIndex(ped,28422),0.0,0.0,-0.15,0.0,0.0,90.0,true,true,true,true,1,true)	
		SetEntityCollision(RCCar.Skate,true,true)
		RCCar.Driver = CreatePed(5,68070371,spawnCoords,spawnHeading,true)
		SetEntityInvincible(RCCar.Driver,true)
		SetEntityVisible(RCCar.Driver,false)
		FreezeEntityPosition(RCCar.Driver,true)
		SetPedAlertness(RCCar.Driver,0.0)
		TaskWarpPedIntoVehicle(RCCar.Driver,RCCar.Entity,-1)
		while not IsPedInVehicle(RCCar.Driver,RCCar.Entity) do
			Citizen.Wait(0)
		end
		RCCar.Attach("place")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION ATTACH SKATE
-----------------------------------------------------------------------------------------------------------------------------------------
function RCCar.Attach(param)
	local ped = PlayerPedId()
	if not DoesEntityExist(RCCar.Entity) or GetEntityHealth(ped) <= 101 then
		return
	end
	if param == "place" then
		AttachEntityToEntity(RCCar.Entity,ped,GetPedBoneIndex(ped,28422),-0.1,0.0,-0.2,70.0,0.0,270.0,1,1,0,0,2,1)
		TaskPlayAnim(ped,"pickup_object","pickup_low",8.0,-8.0,-1,0,0,false,false,false)
		Citizen.Wait(800)
		DetachEntity(RCCar.Entity,false,true)
		PlaceObjectOnGroundProperly(RCCar.Entity)
	elseif param == "pick" then
		Citizen.Wait(100)
		TaskPlayAnim(ped,"pickup_object","pickup_low",8.0,-8.0,-1,0,0,false,false,false)
		Citizen.Wait(600)
		AttachEntityToEntity(RCCar.Entity,ped,GetPedBoneIndex(ped,28422),-0.1,0.0,-0.2,70.0,0.0,270.0,1,1,0,0,2,1)
		Citizen.Wait(900)
		DetachEntity(RCCar.Entity)
		DeleteEntity(RCCar.Skate)
		DeleteVehicle(RCCar.Entity)
		DeleteEntity(RCCar.Driver)
		for modelIndex = 1,#RCCar.CachedModels do
			local model = RCCar.CachedModels[modelIndex]
			if IsModelValid(model) then
				SetModelAsNoLongerNeeded(model)
			else
				RemoveAnimDict(model)   
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION LOADMODEL SKATE
-----------------------------------------------------------------------------------------------------------------------------------------
function RCCar.LoadModels(models)
	for modelIndex = 1, #models do
		local model = models[modelIndex]
		if not RCCar.CachedModels then
			RCCar.CachedModels = {}
		end
		table.insert(RCCar.CachedModels,model)
		if IsModelValid(model) then
			while not HasModelLoaded(model) do
				RequestModel(model)	
				Citizen.Wait(10)
			end
		else
			while not HasAnimDictLoaded(model) do
				RequestAnimDict(model)
				Citizen.Wait(10)
			end    
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION ATTACH SKATE TO PLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
function RCCar.AttachPlayer(toggle)
	local ped = PlayerPedId()
	if toggle then
		TaskPlayAnim(ped,"move_strafe@stealth","idle",8.0,8.0,-1,1,1.0,false,false,false)
		AttachEntityToEntity(ped,RCCar.Entity,20,0.0,0.0,0.98,0.0,0.0,-15.0,true,true,true,true,true,true)
		SetEntityCollision(ped,true,false)
		Attached = true		
	elseif not toggle then
		DetachEntity(ped,false,false)
		Attached = false
		StopAnimTask(ped,"move_strafe@stealth","idle",1.0)	
	end	
end

-- local relationshipTypes = {

--     'GANG_1',

--     'GANG_2',

--     'GANG_9',

--     'GANG_10',

--     'AMBIENT_GANG_LOST',

--     'AMBIENT_GANG_MEXICAN',

--     'AMBIENT_GANG_FAMILY',

--     'AMBIENT_GANG_BALLAS',

--     'AMBIENT_GANG_MARABUNTE',

--     'AMBIENT_GANG_CULT',

--     'AMBIENT_GANG_SALVA',

--     'AMBIENT_GANG_WEICHENG',

--     'AMBIENT_GANG_HILLBILLY',

--     'DEALER',

--     'COP',

--     'PRIVATE_SECURITY',

--     'SECURITY_GUARD',

--     'ARMY',

--     'MEDIC',

--     'FIREMAN',

--     'HATES_PLAYER',

--     'NO_RELATIONSHIP',

--     'SPECIAL',

--     'MISSION2',

--     'MISSION3',

--     'MISSION4',

--     'MISSION5',

--     'MISSION6',

--     'MISSION7',

--     'MISSION8'

-- }

-- Citizen.CreateThread(function()

--     while true do

--         Citizen.Wait(5000)

--         for _, group in ipairs(relationshipTypes) do

--             SetRelationshipBetweenGroups(1, GetHashKey('PLAYER'), GetHashKey(group)) 

--             SetRelationshipBetweenGroups(1, GetHashKey(group), GetHashKey('PLAYER'))

--         end

--     end

-- end)