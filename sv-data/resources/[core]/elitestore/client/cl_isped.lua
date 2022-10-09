local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface('vRP')

local cid
local myjob
local mycash

RegisterNetEvent('ispedclient:update')
AddEventHandler('ispedclient:update',function(cidc,myjobc,mycashc)
    cid = cidc
    myjob = myjobc
    mycash = mycashc
end)

function getUserCid()
    TriggerServerEvent('isped:update')
    TriggerEvent('refreshPlayerCid',cid)
end

function isPed(checkType)
	local checkType = string.lower(checkType)
	local pass = false

    if checkType == "cid" then
        pass = cid
    end

    if checkType == "myjob" then
        pass = myjob
    end

    if checkType == "mycash" then
        pass = mycash
    end

    if checkType == "dead" then
        if GetEntityHealth(PlayerPedId()) > 101 then
            pass = false
        else
            pass = true
        end
    end

    return pass 
end

Citizen.CreateThread(function()
    TriggerServerEvent('isped:update')
end)