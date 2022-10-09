--[ vRP ]-------------------------------------------------------------------------------------------

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

--[ ISPED ]-------------------------------------------------------------------------------------

RegisterServerEvent("isped:update")
AddEventHandler("isped:update",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local job = vRP.getUserGroupByType(user_id,'job')
	local money = vRP.getBankMoney(user_id)
	TriggerClientEvent('ispedclient:update',source,user_id,job,money)
end)

--[ VARIABLES ]-------------------------------------------------------------------------------------

local hours = 6
local minutes = 20
local weather = "EXTRASUNNY"
local timers = {
	[1] = { "EXTRASUNNY" }
}

--[ REQUESTSYNC ]-----------------------------------------------------------------------------------

RegisterServerEvent("vrp_misc:requestSync")
AddEventHandler("vrp_misc:requestSync",function()
	TriggerClientEvent("vrp_misc:updateWeather",-1,weather)
end)

--[ UPDATECLOCK ]-----------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		minutes = minutes + 1
		if minutes >= 60 then
			minutes = 0
			hours = hours + 1
			if hours >= 24 then
				hours = 0
			end
		end
		TriggerClientEvent("vrp_misc:syncTimers",-1,{minutes,hours})
	end
end)

RegisterCommand('time',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"vsync.permissao") then
			if args[1] and args[2] then
				hours = parseInt(args[1])
				minutes = parseInt(args[2])
				TriggerClientEvent("vrp_misc:syncTimers",-1,{minutes,hours})
			end
		end
	end
end)

--[ UPDATETIMERS ]----------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(600000)
		weather = timers[math.random(1)][1]
		TriggerClientEvent("vrp_misc:updateWeather",-1,weather)
	end
end)

RegisterCommand('clima',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"vsync.permissao") then
			TriggerClientEvent("vrp_misc:updateWeather",-1,args[1])
		end
	end
end)