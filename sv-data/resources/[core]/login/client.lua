local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end

RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "garagem" then
		vRP.teleport(-277.59036254883,-916.46984863281,31.21568107605)
	elseif data == "aeroporto" then
		vRP.teleport(-1019.8137207031,-2699.7250976562,13.756647109985)
	elseif data == "pier" then
		vRP.teleport(-1611.1003417969,-1029.9466552734,13.149765014648)
	end
	ToggleActionMenu()
	TriggerEvent("ToogleBackCharacter")
	TriggerEvent("status:hud",false)
end)

RegisterCommand("tlogin",function(source,args)
	ToggleActionMenu()
end)

RegisterNetEvent('vrp:ToogleLoginMenu')
AddEventHandler('vrp:ToogleLoginMenu',function()
	ToggleActionMenu()
end)