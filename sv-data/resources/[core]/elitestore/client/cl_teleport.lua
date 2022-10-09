local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("vrp_trafico")
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
local Teleport = {
	["TRAFICO01"] = {
		positionFrom = { ['x'] = -793.97, ['y'] = -1245.79, ['z'] = 7.34, ['perm'] = "portas.permissao" },
		positionTo = { ['x'] = -773.78, ['y'] = -1207.53, ['z'] = 51.15, ['perm'] = "portas.permissao" },
	},

	["TRAFICO02"] = {
		positionFrom = { ['x'] = -435.92, ['y'] = -359.44, ['z'] = 34.95, ['perm'] = "ems.permissao" },
		positionTo = { ['x'] = -440.33, ['y'] = -339.66, ['z'] = 78.32, ['perm'] = "ems.permissao" }
	
    },

	["TRAFICO03"] = {
		positionFrom = { ['x'] = 215.81, ['y'] = -1523.69, ['z'] = 29.29, ['perm'] = "mw.permissao" },
		positionTo = { ['x'] = 996.88, ['y'] = -3200.79, ['z'] = -36.39, ['perm'] = "mw.permissao" }

	},

	["TRAFICO04"] = {
	positionFrom = { ['x'] = 183.68, ['y'] = -1442.4, ['z'] = 29.15, ['perm'] = "mw.permissao" },
	positionTo = { ['x'] = 894.26, ['y'] = -3245.92, ['z'] = -98.25, ['perm'] = "mw.permissao" }

    },
	
	 ["TRAFICO05"] = {
	positionFrom = { ['x'] = 340.18, ['y'] = -584.69, ['z'] = 28.79, ['perm'] = "paramedico.permissao" },
	positionTo = { ['x'] = 327.07, ['y'] = -603.86, ['z'] = 43.28, ['perm'] = "paramedico.permissao" }

     }
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for k,v in pairs(Teleport) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.positionFrom.x,v.positionFrom.y,v.positionFrom.z)
			local distance = GetDistanceBetweenCoords(v.positionFrom.x,v.positionFrom.y,cdz,x,y,z,true)
			local bowz,cdz2 = GetGroundZFor_3dCoord(v.positionTo.x,v.positionTo.y,v.positionTo.z)
			local distance2 = GetDistanceBetweenCoords(v.positionTo.x,v.positionTo.y,cdz2,x,y,z,true)
			local bowz,cdz3 = GetGroundZFor_3dCoord(v.positionTo.x,v.positionTo.y,v.positionTo.z)
			local distance3 = GetDistanceBetweenCoords(v.positionTo.x,v.positionTo.y,cdz3,x,y,z,true)
			local bowz,cdz4 = GetGroundZFor_3dCoord(v.positionTo.x,v.positionTo.y,v.positionTo.z)
			local distance4 = GetDistanceBetweenCoords(v.positionTo.x,v.positionTo.y,cdz4,x,y,z,true)
			local bowz,cdz5 = GetGroundZFor_3dCoord(v.positionTo.x,v.positionTo.y,v.positionTo.z)
			local distance5 = GetDistanceBetweenCoords(v.positionTo.x,v.positionTo.y,cdz5,x,y,z,true)


			if distance <= 10 then
				DrawMarker(21,v.positionFrom.x,v.positionFrom.y,v.positionFrom.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,222, 67, 11,50,0,0,0,1)
				if distance <= 1.5 then
					if IsControlJustPressed(0,38) and func.checkPermission(v.positionTo.perm) then
						SetEntityCoords(PlayerPedId(),v.positionTo.x,v.positionTo.y,v.positionTo.z-0.50)
					end
				end
			end

			if distance2 <= 10 then
				DrawMarker(21,v.positionTo.x,v.positionTo.y,v.positionTo.z-0.6,0,0,0,0,0,0,1.0,1.0,0.4,222, 67, 11,50,0,0,0,0)
				if distance2 <= 1.5 then
					if IsControlJustPressed(0,38) and func.checkPermission(v.positionFrom.perm) then
						SetEntityCoords(PlayerPedId(),v.positionFrom.x,v.positionFrom.y,v.positionFrom.z-0.50)
					end
				end
			end

			if distance3 <= 10 then
				DrawMarker(21,v.positionTo.x,v.positionTo.y,v.positionTo.z-0.6,0,0,0,0,0,0,1.0,1.0,0.4,222, 67, 11,50,0,0,0,0)
				if distance3 <= 1.5 then
					if IsControlJustPressed(0,38) and func.checkPermission(v.positionFrom.perm) then
						SetEntityCoords(PlayerPedId(),v.positionFrom.x,v.positionFrom.y,v.positionFrom.z-0.50)
					end
				end
			end
			if distance4 <= 10 then
				DrawMarker(21,v.positionTo.x,v.positionTo.y,v.positionTo.z-0.6,0,0,0,0,0,0,1.0,1.0,0.4,222, 67, 11,50,0,0,0,0)
				if distance3 <= 1.5 then
					if IsControlJustPressed(0,38) and func.checkPermission(v.positionFrom.perm) then
						SetEntityCoords(PlayerPedId(),v.positionFrom.x,v.positionFrom.y,v.positionFrom.z-0.50)
					end
				end
			end
			if distance5 <= 10 then
				DrawMarker(21,v.positionTo.x,v.positionTo.y,v.positionTo.z-0.6,0,0,0,0,0,0,1.0,1.0,0.4,222, 67, 11,50,0,0,0,0)
				if distance3 <= 1.5 then
					if IsControlJustPressed(0,38) and func.checkPermission(v.positionFrom.perm) then
						SetEntityCoords(PlayerPedId(),v.positionFrom.x,v.positionFrom.y,v.positionFrom.z-0.50)
					end
				end
			end
		end
	end
end)