local colours = {[1] = { r = 255, g = 255, b = 255 }, [2] = { r = 237, g = 146, b = 48 }}

local lightsConfig = {
	{
		range = 10.0, alpha = 0.5, radius = 45.0, colour = 1, spotlight = true,
		direction = vector3(-2117.2180175781, -533.85723876953, 7.5980849266052),
		coords 	  = vector3(-2113.0744628906, -538.01928710938, 9.5531892776489)
	},
	{
		range = 5.0, alpha = 0.7, radius = 45.0, colour = 1, spotlight = true,
		direction = vector3(-2107.5346679688, -544.41864013672, 5.6472101211548),
		coords 	  = vector3(-2107.5346679688, -544.41864013672, 10.057209014893)
	},
	{
		range = 10.0, alpha = 0.5, radius = 40.0, colour = 1, spotlight = true,
		direction = vector3(-2110.7739257812, -551.3896484375, 7.8386323928833),
		coords 	  = vector3(-2111.1091308594, -548.0371093750, 6.4662132263184)
	},
	{
		range = 10.0, alpha = 0.5, radius = 40.0, colour = 1, spotlight = true,
		direction = vector3(-2123.6062011719, -538.07232666016, 8.4822111129761),
		coords 	  = vector3(-2119.4638671875, -538.28405761719, 6.4662084579468)
	},
	{
		range = 10.0, alpha = 0.5, radius = 40.0, colour = 1, spotlight = true,
		direction = vector3(-2112.8916015625, -527.73217773438, 8.3822111129761),
		coords 	  = vector3(-2112.6474609375, -531.46777343750, 6.4662117958069)
	},
	{
		range = 10.0, alpha = 0.5, radius = 40.0, colour = 1, spotlight = true,
		direction = vector3(-2099.9050292969, -541.23077392578, 8.1672067642212),
		coords 	  = vector3(-2103.8361816406, -540.99102783203, 6.4662070274353)
	},
	{
		range = 10.0, alpha = 0.5, radius = 40.0, colour = 1, spotlight = true,
		direction = vector3(-2049.1318359375, -563.16625976562, 7.6378555297852),
		coords 	  = vector3(-2053.5651855469, -564.24798583984, 7.8898563385010)
	},
	{
		range = 10.0, alpha = 0.5, radius = 40.0, colour = 1, spotlight = true,
		direction = vector3(-2059.1425781250, -552.82214355469, 7.6378555297852),
		coords 	  = vector3(-2059.7646484375, -556.50537109375, 7.8898563385010)
	},
	{
		range = 10.0, alpha = 0.5, radius = 40.0, colour = 1, spotlight = true,
		direction = vector3(-2067.8339843750, -558.49322509766, 7.1968541145325),
		coords 	  = vector3(-2065.2631835938, -561.42370605469, 7.8898563385010)
	},
	{
		range = 10.0, alpha = 0.5, radius = 40.0, colour = 1, spotlight = true,
		direction = vector3(-2055.3781738281, -572.43322753906, 7.1968541145325),
		coords 	  = vector3(-2058.1696777344, -569.29461669922, 7.8898563385010)
	},
	{
		range = 10.0, alpha = 0.5, radius = 40.0, colour = 1, spotlight = true,
		direction = vector3(-2063.6511230469, -580.60107421875, 7.1968541145325),
		coords 	  = vector3(-2066.2980957031, -577.73510742188, 7.8898563385010)
	},
	{
		range = 10.0, alpha = 0.5, radius = 40.0, colour = 1, spotlight = true,
		direction = vector3(-2077.6118164062, -566.14654541016, 7.1968541145325),
		coords 	  = vector3(-2072.8217773438, -570.60601806641, 7.8898563385010)
	},
	{
		range = 10.0, alpha = 0.5, radius = 40.0, colour = 1, spotlight = true,
		direction = vector3(-2072.5505371094, -588.10882568359, 7.1968541145325),
		coords 	  = vector3(-2072.0073242188, -583.18835449219, 7.8898563385010)
	},
	{
		range = 10.0, alpha = 0.5, radius = 40.0, colour = 1, spotlight = true,
		direction = vector3(-2084.7868652344, -575.18920898438, 7.1968541145325),
		coords 	  = vector3(-2080.1833496094, -574.73364257812, 7.8898563385010)
	},
	{
		range = 3.0, alpha = 0.5, radius = 5.0, colour = 1,
		coords = {
			vector3(-2104.8227539062, -523.44329833984, 9.6742467880249),
			vector3(-2102.5288085938, -521.24713134766, 9.8632459640503),
			vector3(-2102.6242675781, -523.93548583984, 9.8632459640503),
			vector3(-2074.5239257812, -580.32135009766, 8.6279472351074),
			vector3(-2077.5993652344, -578.41284179688, 8.6279472351074),
			vector3(-2077.4509277344, -580.80834960938, 8.6279472351074),
		}
	},
	{
		range = 8.0, alpha = 0.5, radius = 2.0, colour = 2,
		coords = {
			vector3(-2086.8203125000, -525.5537109375, 13.207184791565),
			vector3(-2094.0151367188, -546.4521484375, 15.727173805237),
			vector3(-2079.1584472656, -535.6386718750, 20.452154159546),
			vector3(-2080.8427734375, -559.0693969726, 20.452154159546),
			vector3(-2067.5253906250, -547.9594726562, 20.452154159546),
			vector3(-2049.9042968750, -568.9266357422, 25.421129226685),
			vector3(-2096.8977050781, -515.2624511718, 21.641145706177),
			vector3(-2110.1062011719, -527.0240478515, 17.672163009644),
			vector3(-2122.5034179688, -538.5091552734, 20.759149551392),
		}
	},
	{
		range = 4.3, alpha = 1.0, radius = 1.0, colour = 2,
		coords = {
			vector3(-2073.8789062500, -537.36334228516, 9.7422008514404),
			vector3(-2067.0273437500, -550.83184814453, 9.6082057952881),
			vector3(-2055.6293945312, -552.88208007812, 10.309198379517),
			vector3(-2049.7910156250, -559.72937011719, 10.868200302124),
			vector3(-2048.4592285156, -567.77355957031, 10.309198379517),
			vector3(-2065.0014648438, -585.07507324219, 7.5922036170959),
			vector3(-2077.2360839844, -560.12237548828, 8.0412082672119),
			vector3(-2095.7097167969, -514.76428222656, 8.7342042922974),
		}
	},
	{
		range = 3.0, alpha = 0.5, radius = 5.0, colour = 2,
		coords = {
			vector3(-2108.1579589844, -545.36181640625, 6.4662089347839+0.1),
			vector3(-2106.5322265625, -543.72656250000, 6.4662055969238+0.1),
			vector3(-2117.7102050781, -535.97589111328, 6.4662041664124+0.1),
			vector3(-2115.0576171875, -533.38934326172, 6.4662046432495+0.1),
			vector3(-2107.2128906250, -544.52478027344, 6.4662051200867+0.1),
		}
	},
	{
		range = 1.0, alpha = 0.5, radius = 3.0, colour = 2,
		coords = {
			vector3(-2108.4318847656, -548.19213867188, 6.1512055397034),
			vector3(-2103.6723632812, -543.88995361328, 6.4662051200867),
			vector3(-2122.4558105469, -538.10150146484, 6.4662051200867),
			vector3(-2113.2219238281, -529.43688964844, 6.4662051200867),
			vector3(-2080.4653320312, -532.98773193359, 6.4662046432495),
			vector3(-2085.6945800781, -527.86346435547, 6.4662046432495),
			vector3(-2094.4133300781, -546.28814697266, 6.4662046432495),
			vector3(-2099.4121093750, -541.12921142578, 6.4662046432495),
			vector3(-2059.8308105469, -553.82055664062, 5.8738465309143),
			vector3(-2049.8151855469, -564.29772949219, 5.8738465309143),
			vector3(-2072.3642578125, -585.98553466797, 5.8738465309143),
			vector3(-2082.7294921875, -574.93255615234, 5.8738465309143),
			vector3(-2059.0227050781, -559.50146484375, 5.8738465309143),
			vector3(-2085.4958496094, -530.06597900391, 6.4408483505249),
			vector3(-2095.2770996094, -544.48840332031, 6.4662051200867),
			vector3(-2090.9079589844, -528.89483642578, 6.5292062759399+0.1),
			vector3(-2096.4899902344, -523.87353515625, 6.5292062759399+0.1),
			vector3(-2102.8916015625, -531.88208007812, 6.5292062759399+0.1),
			vector3(-2098.6330566406, -536.29541015625, 6.5292062759399+0.1),
			vector3(-2089.5927734375, -544.39898681641, 6.5292062759399+0.1),
			vector3(-2086.1176757812, -548.18933105469, 6.5292062759399+0.1),
			vector3(-2079.1096191406, -541.24023437500, 6.5292062759399+0.1),
			vector3(-2082.8032226562, -537.62445068359, 6.5292062759399+0.1),
		}
	},
}

local LIGHTS = {}
local shouldDrawLights = true

local function IsNightTime()
	local clockTime = GetClockHours()
	return (clockTime < 6 or clockTime > 19)
end

local function RenderSpotlight(coords, direction, colour, range, alpha, radius, shadowId)
	DrawSpotLightWithShadow(coords, (direction - coords), colour.r, colour.g, colour.b, range, alpha, 3.0, radius, 3.0, shadowId)
end

local function RenderLight(coords, colour, range, alpha, radius)
	DrawLightWithRangeAndShadow(coords, colour.r, colour.g, colour.b, range, alpha, radius)
end

local function GetColour(id)
	if id == 1 then
		if Config.Colour and Config.Palette[Config.Colour] then
			return Config.Palette[Config.Colour]
		end
	end
	return colours[2]
end

Citizen.CreateThread(function()
	local shadowId = 100
	for _,lights in ipairs(lightsConfig) do
		if lights.spotlight then
			shadowId = shadowId + 1
			table.insert(LIGHTS, {
				draw = function()
					RenderSpotlight(lights.coords, lights.direction, GetColour(lights.colour), lights.range, lights.alpha, lights.radius, shadowId)
				end
			})
		else
	    	for k,coords in ipairs(lights.coords) do
	    		table.insert(LIGHTS, {
					draw = function()
						RenderLight(coords, GetColour(lights.colour), lights.range, lights.alpha, lights.radius)
					end
				})
			end
		end
	end

	while true do
        Wait(3000)
        local shouldDraw = false

        if IsNightTime() then
        	local playerPed = PlayerPedId()
        	local playerPos = GetEntityCoords(playerPed)
        	if #(playerPos - vector3(-2092.33, -538.75, 6.46)) <= 100 then
        		shouldDraw = true
        	end
        end

        shouldDrawLights = shouldDraw
    end
end)

Citizen.CreateThread(function()
	while true do
        Wait(5)

        if shouldDrawLights then
			for k,lights in ipairs(LIGHTS) do
				lights.draw()
			end
	    else
	    	Wait(1000)
	    end
	end
end)