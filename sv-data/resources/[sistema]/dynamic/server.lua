-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- VRP
-- -----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- CONNECTION
-- -----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("dynamic",cRP)
-- vPLAYER = Tunnel.getInterface("player")
-- vTASKBAR = Tunnel.getInterface("taskbar")
-- vSKINSHOP = Tunnel.getInterface("skinshop")
-- vHOMES = Tunnel.getInterface("homes")
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- PLAYER:OUTFITFUNCTIONS
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterNetEvent("player:outfitFunctions")
-- AddEventHandler("player:outfitFunctions",function(outfitFunctions)
-- 	local user_id = vRP.getUserId(source)
-- 	if user_id then
-- 	    if vRPclient.getHealth(source) > 101 and not vPLAYER.getHandcuff(source) then
-- 			vPLAYER.setRemoveoutfit(source)
-- 	    end
-- 	end
-- end)
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- OUTFIT SAVE
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterServerEvent("player:outfitPlayerSave")
-- AddEventHandler("player:outfitPlayerSave",function()
--     local source = source
--     local user_id = vRP.getUserId(source)
--     if user_id then
--         -- if not vRP.wantedReturn(user_id) and not vRP.reposeReturn(user_id) then
--             local custom = vSKINSHOP.getCustomization(source)
--             if custom then
--                 vRP.setSData("outfit:"..parseInt(user_id),json.encode(custom))
--                 TriggerClientEvent("Notify",source,"sucesso","Outfit salvo com sucesso.",3000)
--             -- end
--         end
--     end
-- end)
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- OUTFIT APPLY
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterServerEvent("player:outfitPlayerApply")
-- AddEventHandler("player:outfitPlayerApply",function()
--     local source = source
--     local user_id = vRP.getUserId(source)
--     if user_id then
--         -- if not vRP.wantedReturn(user_id) and not vRP.reposeReturn(user_id) then
--             local consult = vRP.getSData("outfit:"..parseInt(user_id))
--             local result = json.decode(consult)
--             if result then
--                 TriggerClientEvent("updateRoupas",source,result)
--                 TriggerClientEvent("Notify",source,"sucesso","Outfit aplicado com sucesso.",3000)
--             -- end
--         end
--     end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVEANIMAL
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.giveAnimal(animal)
	local source = source
    local user_id = vRP.getUserId(source)
	if user_id then
		vRP.giveInventoryItem(user_id,animal:lower(),1,true)
	end
end