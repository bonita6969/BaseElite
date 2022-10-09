-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Tools = module("vrp", "lib/Tools")
local vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
local src = {}
Tunnel.bindInterface("zo_cars", src)
local vSERVER = Tunnel.getInterface("zo_cars")
local parts = {"wheel_lf", "wheel_lr", "wheel_rf", "wheel_rr"}
local partsProntas = {}
local instalando = false
local vehicleInstall = nil
function src.instalando(bool)
    instalando = bool
end
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if instalando then
            DisableControlAction(0, 167, true)
        end
    end
end)
Citizen.CreateThread(function()
    src.close()
    RegisterCommand(cfg.comandoXenon, function(source, args, rawCommand)
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsUsing(ped)
        if vehicle ~= 0 then
            if vSERVER.checkXenon() then
                local vehicleSpeed = math.ceil(GetEntitySpeed(vehicle) * 3.605936)
                local cor = GetVehicleXenonLightsColour(vehicle)
                if vehicleSpeed <= 25 then
                    ToggleVehicleMod(vehicle, 22, true)
                    SetNuiFocus(true, true)
                    SendNUIMessage({
                        type = 'openXenon',
                        color = cor
                    })
                else
                    TriggerEvent("Notify", "aviso", "Você está muito rápido!", 5000)
                end
            else
                TriggerEvent("Notify", "aviso", "O veículo não possui o módulo de xenon.", 5000)
            end
        else
            TriggerEvent("Notify", "aviso", "Você não está em um veículo!", 5000)
        end
    end)
    RegisterCommand(cfg.comandoNeon, function(source, args, rawCommand)
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsUsing(ped)
        if vehicle ~= 0 then
            if vSERVER.checkNeon() then
                local vehicleSpeed = math.ceil(GetEntitySpeed(vehicle) * 3.605936)
                cor = { r = 255, g = 255, b = 255 }
                if checkNeonIsEnable(vehicle) then
                    cor = GetVehicleNeonLightsColour(vehicle)
                end
                if vehicleSpeed <= 25 then
                    SetNuiFocus(true, true)
                    SendNUIMessage({
                        type = 'openNeon',
                        color = cor
                    })
                else
                    TriggerEvent("Notify", "aviso", "Você está muito rápido!", 5000)
                end
            else
                TriggerEvent("Notify", "aviso", "O veículo não possui o módulo de neon.", 5000)
            end
        else
            TriggerEvent("Notify", "aviso", "Você não está em um veículo!", 5000)
        end
    end)
    RegisterCommand(cfg.comandoSuspensao, function(source, args, rawCommand)
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsUsing(ped)
        if vehicle ~= 0 then
            if vSERVER.checkSuspension(vehicle) then
                local vehicleSpeed =
                    math.ceil(GetEntitySpeed(vehicle) * 3.605936)
                if vehicleSpeed <= 25 then
                    SetNuiFocus(true, true)
                    SendNUIMessage({type = 'openControle'})
                else
                    TriggerEvent("Notify", "aviso",
                                    "Você está muito rápido!", 5000)
                end
            else
                TriggerEvent("Notify", "aviso",
                                "O veículo não possui suspensão a ar!",
                                5000)
            end
        else
            TriggerEvent("Notify", "aviso",
                            "Você não está em um veículo!", 5000)
        end
    end)
end)
function src.close()
    SetNuiFocus(false, false)
    TransitionFromBlurred(1000)
    SendNUIMessage({
        type = 'closeNuis'
    })
end
RegisterNUICallback("ButtonClick", function(data, cb)
    if data == "comprar-suspensao" then
		TriggerServerEvent("departamento-comprar", "suspensaoar")
	elseif data == "comprar-neon" then
		TriggerServerEvent("departamento-comprar", "moduloneon")
	elseif data == "comprar-xenon" then
		TriggerServerEvent("departamento-comprar", "moduloxenon")
	elseif data == "fechar" then
		ToggleActionMenu()
	end
    if data.action == "closeNuis" then
        src.close()
    end
    if data.action == "trocar-cor-xenon" then
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        SetVehicleXenonLightsColour(vehicle, data.cor)
    end
    if data.action == "on-off-neon" then
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        local toggle = checkNeonIsEnable(vehicle)
        local lados = {0, 1, 2, 3}
        for i, l in pairs(lados) do
            SetVehicleNeonLightEnabled(vehicle, l, not toggle)
        end
        if not toggle then
            local r, g, b = GetVehicleNeonLightsColour(vehicle)
            SendNUIMessage({
                type = 'setColorNeon',
                color = {
                    r = r,
                    g = g,
                    b = b
                }
            })
        end
    end
    if data.action == "toggle-neon" then
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        local r, g, b = GetVehicleNeonLightsColour(vehicle)
        SendNUIMessage({
            type = 'setColorNeon',
            color = {
                r = r,
                g = g,
                b = b
            }
        })
        SetVehicleNeonLightEnabled(vehicle, data.lado, not IsVehicleNeonLightEnabled(vehicle, data.lado))
    end
    if data.action == "trocar-cor-neon" then
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        SetVehicleNeonLightsColour(vehicle, data.cor.r, data.cor.g, data.cor.b)
    end
    if data.action == "savepreset" then
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped)
        local alturaAtual = GetVehicleSuspensionHeight(vehicle)
        vSERVER.setPreset(tonumber(alturaAtual))
        TriggerEvent("Notify", "sucesso",
                     "Novo preset definido para suspensão!", 5000)
    end
    if data.action == "useControl" then
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped)
        local alturaAnterior = GetVehicleSuspensionHeight(vehicle)
        local alturaAtual = 0
        local type = data.typeAction
        local variacao = 0.003
        if type == 'max' then
            alturaAtual = tonumber(-0.09)
            variacao = 0.003
        elseif type == 'normal' then
            alturaAtual = tonumber(0.0)
            variacao = 0.003
        elseif type == 'low' then
            alturaAtual = tonumber(0.09)
            variacao = 0.003
        elseif type == 'up' then
            alturaAtual = alturaAnterior - tonumber(0.003)
            variacao = 0.0003
        elseif type == 'down' then
            alturaAtual = alturaAnterior + tonumber(0.003)
            variacao = 0.0003
        elseif type == 'preset' then
            variacao = 0.003
            alturaAtual = tonumber(vSERVER.returnPreset())
        end
        if alturaAtual > tonumber(0.09) then
            TriggerEvent("Notify", "aviso", "Altura máxima atingida!", 5000)
            return
        end
        if alturaAtual < tonumber(-0.09) then
            TriggerEvent("Notify", "aviso", "Altura miníma atingida!", 5000)
            return
        end
        if alturaAnterior < alturaAtual then
            SendNUIMessage({
                transactionType = 'playSound',
                transactionFile = "esvaziar",
                transactionVolume = 0.5
            })
            TriggerServerEvent("tryzosuspe", VehToNet(vehicle), alturaAtual,
                               alturaAnterior, variacao, "descer")
        else
            SendNUIMessage({
                transactionType = 'playSound',
                transactionFile = "encher",
                transactionVolume = 0.5
            })
            TriggerServerEvent("tryzosuspe", VehToNet(vehicle), alturaAtual,
                               alturaAnterior, variacao, "subir")
        end
    end
end)
function checkNeonIsEnable(vehicle)
    local toggle = false
    local lados = {0, 1, 2, 3}
    for i, l in pairs(lados) do
        if IsVehicleNeonLightEnabled(vehicle, l) then
            toggle = true
        end
    end
    return toggle
end
RegisterNetEvent("zo_install_mod_xenon")
AddEventHandler('zo_install_mod_xenon', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsUsing(ped)
    if vehicle ~= 0 then
        if ped == GetPedInVehicleSeat(vehicle, -1) then
            local vehicleSpeed = math.ceil(GetEntitySpeed(vehicle) * 3.605936)
            if vehicleSpeed == 0 then
                if vSERVER.checkPermission() then
                    if not vSERVER.checkXenon() then
                        SetVehicleEngineOn(vehicle, false, true, true)
                        vSERVER.installXenon(vehicle)
                    else
                        TriggerEvent("Notify", "aviso", "Veículo já possui módulo de Xenon", 5000)
                    end
                else
                    TriggerEvent("Notify", "aviso", "Você não possui permissão para instalar o módulo de Xenon!", 5000)
                end
            else
                TriggerEvent("Notify", "aviso", "O veículo deve estar parado!", 5000)
            end
        else
            TriggerEvent("Notify", "aviso", "Você não é o motorista do veículo", 5000)
        end
    else
        TriggerEvent("Notify", "aviso", "Você não está em um veículo!", 5000)
    end
end)
RegisterNetEvent("zo_install_mod_neon")
AddEventHandler('zo_install_mod_neon', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsUsing(ped)
    
    if vehicle ~= 0 then
        if ped == GetPedInVehicleSeat(vehicle, -1) then
            local vehicleSpeed = math.ceil(GetEntitySpeed(vehicle) * 3.605936)
            if vehicleSpeed == 0 then
                if vSERVER.checkPermission() then
                    if not vSERVER.checkNeon() then
                        SetVehicleEngineOn(vehicle, false, true, true)
                        vSERVER.installNeon(vehicle)
                    else
                        TriggerEvent("Notify", "aviso", "Veículo já possui módulo de neon", 5000)
                    end
                else
                    TriggerEvent("Notify", "aviso", "Você não possui permissão para instalar o módulo de neon!", 5000)
                end
            else
                TriggerEvent("Notify", "aviso", "O veículo deve estar parado!", 5000)
            end
        else
            TriggerEvent("Notify", "aviso", "Você não é o motorista do veículo", 5000)
        end
    else
        TriggerEvent("Notify", "aviso", "Você não está em um veículo!", 5000)
    end
end)
RegisterNetEvent("zo_install_suspe_ar")
AddEventHandler('zo_install_suspe_ar', function()
    if vSERVER.checkPermission() then
        local ped = PlayerPedId()
        vehicleInstall = vRP.getNearestVehicle(5)
        if not vSERVER.checkSuspension(vehicleInstall) then
            local coords = nil
            local ppos = GetEntityCoords(ped)
            partsProntas = {}
            if vehicleInstall then
                for i, v in ipairs(parts) do
                    local bone = GetEntityBoneIndexByName(vehicleInstall, v)
                    if bone ~= -1 then
                        coords = GetWorldPositionOfEntityBone(vehicleInstall,
                                                              bone)
                        if coords then
                            local len = GetDistanceBetweenCoords(
                                            vector3(ppos.x, ppos.y, ppos.z),
                                            coords)
                            if len < 5 then
                                local x, y, z = table.unpack(coords)
                                while vehicleInstall and partsProntas[v] == nil do
                                    DrawMarker(21, x, y, z - 0.6, 0, 0, 0, 0, 0,
                                               0, 1.0, 1.0, 1.7, 0, 222, 67, 11,
                                               0, 0, 0, 1)
                                    ppos = GetEntityCoords(ped)
                                    len =
                                        GetDistanceBetweenCoords(
                                            vector3(ppos.x, ppos.y, ppos.z),
                                            coords)
                                    if len < 1 then
                                        DrawText3D(x, y, z, "Pressione [~r~E~w~] para instalar a suspensão nesta roda.")
                                        if IsControlJustPressed(0, 38) then
                                            instalando = true
                                            Citizen.CreateThread(function()
                                                while true do
                                                    Citizen.Wait(2000)
                                                    vehicleInstall = vRP.getNearestVehicle(5)
                                                    if vehicleInstall == nil or #partsProntas == 4 then
                                                        if vehicleInstall == nil then
                                                            TriggerEvent("Notify", "aviso", "Instalação cancelada, você não está próximo do veículo!", 5000)
                                                        end
                                                        return
                                                    end
                                                end
                                            end)
                                            
                                            vSERVER.anim()
                                            partsProntas[v] = v
                                            table.insert(partsProntas, v)
                                        end
                                    end
                                    if #partsProntas == 4 then
                                        vSERVER.setSuspensao(vehicleInstall)
                                        TriggerEvent("Notify", "sucesso", "Suspensão a ar instalada no veículo!", 5000)
                                    end
                                    Citizen.Wait(5)
                                end
                            end
                        end
                    end
                end
            else
                TriggerEvent("Notify", "aviso",
                             "Você não está próximo de um veículo!", 5000)
            end
        else
            TriggerEvent("Notify", "aviso",
                         "Veículo já possui suspensão a ar", 5000)
        end
    else
        TriggerEvent("Notify", "aviso",
                     "Você não possui permissão para instalar suspensão a ar!",
                     5000)
    end
end)
RegisterNetEvent("synczosuspe")
AddEventHandler('synczosuspe', function(vehicle, altura)
    if NetworkDoesNetworkIdExist(vehicle) then
        local v = NetToVeh(vehicle)
        SetVehicleSuspensionHeight(v, altura)
    end
end)
function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.28, 0.28)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.003 + factor, 0.03, 41, 11, 41, 68)
end

async(function()
	SetNuiFocus(false)
	TransitionFromBlurred(1000)
end)

local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true, true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
	end
end

Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local idle = 1000
		
		for k, l in pairs(cfg.blipsShopMec) do
			local v = l.loc
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z, true) < 2.1 and not menuactive then
				DrawText3D(v.x, v.y, v.z, "Pressione [~p~E~w~] para acessar a Loja de Peças.")
			end
			if distance < 5.1 then
				DrawMarker(21, v.x, v.y, v.z - 0.6, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.5, 136, 222, 67, 11, 0, 0, 0, 0)
				idle = 5
				if distance <= 1.2 then
					if IsControlJustPressed(0, 38) then
						for i, perm in pairs(l.perms) do
							if vSERVER.checkPermissionShop(perm) then
								ToggleActionMenu()
							end
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)
