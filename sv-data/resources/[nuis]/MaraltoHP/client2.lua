local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

hpServer = Tunnel.getInterface("MaraltoHP")

local cfg = nil
Citizen.CreateThread(function()
    while cfg == nil do
        Citizen.Wait(0)
        cfg = hpServer.getConfig()
    end
    local drawMarker = cfg.atendimentos.marker.use
    local drawText = cfg.atendimentos.text.use
    local m_id = cfg.atendimentos.marker.marker_id
    local r,g,b = table.unpack(cfg.atendimentos.marker.marker_rgb_color)
    local m_ha = cfg.atendimentos.marker.marker_height_adjustment
    local m_s = cfg.atendimentos.marker.marker_size 
    local text = cfg.atendimentos.text.string
    local tX,tY = table.unpack(cfg.atendimentos.text.positionsXY)
    while true do
        local sleep = 2000
        local x,y,z = table.unpack(cfg.atendimentos.coords)
        local x2,y2,z2 = table.unpack(GetEntityCoords(PlayerPedId()))
        local distance = GetDistanceBetweenCoords(x,y,z,x2,y2,z2,true)
        if distance <= 10 then
            sleep = 5
            if distance <= 8 then
                if drawMarker then
                    DrawMarker(m_id,x,y,z+m_ha,0,0,0,0,0.0,0.0,m_s,m_s,m_s,r,g,b,150,0,0,0,1)
                end
            end
            if distance <= 1.5 then
                if drawText then
                    drawTxt(text,4,tX,tY,0.36,255,255,255,255)
                end
                if IsControlJustPressed(0,38) then
					TriggerEvent("MaraltoHP/Atendimentos/openNui")
				end
            end
        end
        Citizen.Wait(sleep)
    end
end)

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

local function parse_part(key)
	if type(key) == "string" and string.sub(key,1,1) == "p" then
		return true,tonumber(string.sub(key,2))
	else
		return false,tonumber(key)
	end
end

RegisterNetEvent("MaraltoHP/Gesso/apply")
AddEventHandler("MaraltoHP/Gesso/apply",function(parts,preset)
    local r = async()
	Citizen.CreateThread(function()
		local mhash = GetEntityModel(PlayerPedId())
		custom = preset[mhash]
        if custom then
            for k,v in pairs(custom) do
                for k2,v2 in pairs(parts) do 
                    if v.part == k2 then
                        local value1 = v.part_data[1]
                        local value2 = v.part_data[2]
                        local value3 = v.part_data[3]
                        if type(value1) == "string" then
                            value1 = value1:gsub('"','')
                            value1 = tonumber(value1)
                        end 
                        if type(value2) == "string" then
                            value2 = value2:gsub('"','')
                            value2 = tonumber(value2)
                        end
                        if type(value3) == "string" then
                            value3 = value3:gsub('"','')
                            value3 = tonumber(value3)
                        end
                        SetPedComponentVariation(PlayerPedId(),k,value1,value2,1) 
                    end
                end               
            end
        end
		r()
	end)
	return r:wait()
end)

RegisterNetEvent("MaraltoHP/Gesso/remove")
AddEventHandler("MaraltoHP/Gesso/remove",function(oldCustom)
    local r = async()
	Citizen.CreateThread(function()
		if oldCustom then
			local ped = PlayerPedId()
			for k,v in pairs(oldCustom) do
				if k ~= "model" and k ~= "modelhash" then
					local isprop,index = parse_part(k)
					if isprop then
						local value1 = v[1]
						local value2 = v[2]
						local value3 = v[3]
						if type(value1) == "string" then
							value1 = value1:gsub('"','')
							value1 = tonumber(value1)
						end
						if type(value2) == "string" then
							value2 = value2:gsub('"','')
							value2 = tonumber(value2)
						end
						if type(value3) == "string" then
							value3 = value3:gsub('"','')
							value3 = tonumber(value3)
						end
						if value1 < 0 then
							ClearPedProp(ped,index)
						else
							SetPedPropIndex(ped,index,value1,value2,1)
						end
					else
						local value1 = v[1]
						local value2 = v[2]
						local value3 = v[3]
						if type(value1) == "string" then
							value1 = value1:gsub('"','')
							value1 = tonumber(value1)
						end 
						if type(value2) == "string" then
							value2 = value2:gsub('"','')
							value2 = tonumber(value2)
						end
						if type(value3) == "string" then
							value3 = value3:gsub('"','')
							value3 = tonumber(value3)
						end
						SetPedComponentVariation(ped,index,value1,value2,1)
					end
				end
			end
		end
		r()
	end)
	return r:wait()
end)

local tab = nil

RegisterNetEvent("MaraltoHP/startAnim")
AddEventHandler("MaraltoHP/startAnim",function()
	Citizen.CreateThread(function()
	  	RequestAnimDict("amb@world_human_clipboard@male@base")
	  	while not HasAnimDictLoaded("amb@world_human_clipboard@male@base") do
	    	Citizen.Wait(0)
	  	end
	  	if tab ~= nil then
	  		DeleteEntity(tab)
	  	end
        tab = CreateObject(GetHashKey("prop_cs_tablet"), 0, 0, 0, true, true, true)
        AttachEntityToEntity(tab, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1),60309), 0, 0, 0, 0, 0.0, 0.0, true, true, false, true, 1, true)
		TaskPlayAnim( PlayerPedId(),"amb@world_human_clipboard@male@base","base", 8.0, 8.0, 1.0, 1, 1, 0, 0, 0 )
	end)
end)

RegisterNetEvent("MaraltoHP/stopAnim")
AddEventHandler("MaraltoHP/stopAnim",function()
    ClearPedTasks(PlayerPedId())
	DeleteEntity(tab)
end)