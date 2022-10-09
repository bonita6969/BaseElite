local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
drogas_entregas = Tunnel.getInterface("vrp_rotas-entrega")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local servico = false
local selecionado = 0
local processo = false
local segundos = 0
local inservice = ''
local locs = {
	[1] = { ['x'] = -952.31, ['y'] = -1077.87, ['z'] = 2.48 },
	[2] = { ['x'] = -978.23, ['y'] = -1108.09, ['z'] = 2.16 },
	[3] = { ['x'] = -1024.49, ['y'] = -1139.6, ['z'] = 2.75 }, 
	[4] = { ['x'] = -1063.76, ['y'] = -1159.88, ['z'] = 2.56 }, 
	[5] = { ['x'] = -1001.68, ['y'] = -1218.78, ['z'] = 5.75 }, 
	[6] = { ['x'] = -1171.54, ['y'] = -1575.61, ['z'] = 4.51 }, 
	[7] = { ['x'] = -1097.94, ['y'] = -1673.36, ['z'] = 8.4 }, 
	[8] = { ['x'] = -1286.17, ['y'] = -1267.12, ['z'] = 4.52 }, 
	[9] = { ['x'] = -1335.75, ['y'] = -1146.55, ['z'] = 6.74 }, 
	[10] = { ['x'] = -1750.47, ['y'] = -697.09, ['z'] = 10.18 }, 
	[11] = { ['x'] = -1876.84, ['y'] = -584.39, ['z'] = 11.86 }, 
	[12] = { ['x'] = -1772.23, ['y'] = -378.12, ['z'] = 46.49 }, 
	[13] = { ['x'] = -1821.38, ['y'] = -404.97, ['z'] = 46.65 }, 
	[14] = { ['x'] = -1965.33, ['y'] = -296.96, ['z'] = 41.1 }, 
	[15] = { ['x'] = -3089.24, ['y'] = 221.49, ['z'] = 14.07 }, 
	[16] = { ['x'] = -3088.62, ['y'] = 392.3, ['z'] = 11.45 },
	[17] = { ['x'] = -3077.98, ['y'] = 658.9, ['z'] = 11.67 }, 
	[18] = { ['x'] = -3243.07, ['y'] = 931.84, ['z'] = 17.23 },
	[19] = { ['x'] = 1230.8, ['y'] = -1590.97, ['z'] = 53.77 }, 
	[20] = { ['x'] = 1286.53, ['y'] = -1604.26, ['z'] = 54.83 }, 
	[21] = { ['x'] = 1379.38, ['y'] = -1515.23, ['z'] = 58.24 }, 
	[22] = { ['x'] = 1379.38, ['y'] = -1515.23, ['z'] = 58.24 }, 
	[23] = { ['x'] = 1437.37, ['y'] = -1492.53, ['z'] = 63.63 }, 
	[24] = { ['x'] = 450.04, ['y'] = -1863.49, ['z'] = 27.77 },
	[25] = { ['x'] = 403.75, ['y'] = -1929.72, ['z'] = 24.75 }, 
	[26] = { ['x'] = 430.16, ['y'] = -1559.31, ['z'] = 32.8 }, 
	[27] = { ['x'] = 446.06, ['y'] = -1242.17, ['z'] = 30.29 },
	[28] = { ['x'] = 322.39, ['y'] = -1284.7, ['z'] = 30.57 }, 
	[29] = { ['x'] = 369.65, ['y'] = -1194.79, ['z'] = 31.34 },
	[30] = { ['x'] = 474.27, ['y'] = -635.05, ['z'] = 25.65 }, 
	[31] = { ['x'] = 158.87, ['y'] = -1215.65, ['z'] = 29.3 }, 
	[32] = { ['x'] = 154.68, ['y'] = -1335.62, ['z'] = 29.21 }, 
	[33] = { ['x'] = 215.54, ['y'] = -1461.67, ['z'] = 29.19 },
	[34] = { ['x'] = 167.46, ['y'] = -1709.3, ['z'] = 29.3 },
	[35] = { ['x'] = -444.47, ['y'] = 287.68, ['z'] = 83.3 }, 
	[36] = { ['x'] = -179.56, ['y'] = 314.25, ['z'] = 97.88 }, 
	[37] = { ['x'] = -16.07, ['y'] = 216.7, ['z'] = 106.75 }, 
	[38] = { ['x'] = 164.02, ['y'] = 151.87, ['z'] = 105.18 },
	[39] = { ['x'] = 840.2, ['y'] = -181.93, ['z'] = 74.19 }, 
	[40] = { ['x'] = 952.27, ['y'] = -252.17, ['z'] = 67.77 },
	[41] = { ['x'] = 1105.27, ['y'] = -778.84, ['z'] = 58.27 }, 
	[42] = { ['x'] = 1099.59, ['y'] = -345.68, ['z'] = 67.19 }, 
	[43] = { ['x'] = -1211.12, ['y'] = -401.56, ['z'] = 38.1 }, 
	[44] = { ['x'] = -1302.69, ['y'] = -271.32, ['z'] = 40.0 }, 
	[45] = { ['x'] = -1468.65, ['y'] = -197.3, ['z'] = 48.84 }, 
	[46] = { ['x'] = -1583.18, ['y'] = -265.78, ['z'] = 48.28 }, 
	[47] = { ['x'] = -603.96, ['y'] = -774.54, ['z'] = 25.02 },
	[48] = { ['x'] = -805.14, ['y'] = -959.54, ['z'] = 18.13 }, 
	[49] = { ['x'] = -325.07, ['y'] = -1356.35, ['z'] = 31.3 }, 
	[50] = { ['x'] = -321.94, ['y'] = -1545.74, ['z'] = 31.02 }, 
	[51] = { ['x'] = -428.95, ['y'] = -1728.13, ['z'] = 19.79 }, 
	[52] = { ['x'] = -582.38, ['y'] = -1743.65, ['z'] = 22.44 }, 
	[53] = { ['x'] = -670.43, ['y'] = -889.09, ['z'] = 24.5 }, 


	[54] = {['x'] = -17.23, ['y'] = -296.64, ['z'] = 45.76},
	[55] = {['x'] = -239.27, ['y'] = 244.48, ['z'] = 92.05},
    [56] = {['x'] = -559.41, ['y'] = -1804.25, ['z'] = 22.60},
    [57] = {['x'] = -566.13, ['y'] = 295.44, ['z'] = 83.02},
    [58] = {['x'] = 138.72, ['y'] = -1293.62, ['z'] = 29.23},
    [59] = {['x'] = 962.17, ['y'] = -2189.49, ['z'] = 30.50},
    [60] = {['x'] = 1121.15, ['y'] = -645.60, ['z'] = 56.81},
    [61] = {['x'] = 1242.95, ['y'] = -3113.73, ['z'] = 6.02},
    [62] = {['x'] = -67.10, ['y'] = -1312.11, ['z'] = 29.28},
    [63] = {['x'] = 1338.12, ['y'] = -1524.22, ['z'] = 54.58},
    [64] = {['x'] = -330.49, ['y'] = -2778.76, ['z'] = 5.32},
    [65] = {['x'] = 318.93, ['y'] = 268.84, ['z'] = 104.54},
    [66] = {['x'] = 1029.21, ['y'] = -408.81, ['z'] = 65.95},
    [67] = {['x'] = 632.83, ['y'] = -3015.15, ['z'] = 7.34},
    [68] = {['x'] = 183.03, ['y'] = -1688.77, ['z'] = 29.68},
    [69] = {['x'] = -1715.55, ['y'] = -447.27, ['z'] = 42.65},
    [70] = {['x'] = -1753.0, ['y'] = -724.24, ['z'] = 10.42},
    [71] = {['x'] = 794.5, ['y'] = -102.84, ['z'] = 82.04},
    [72] = {['x'] = -1116.95, ['y'] = -1505.63, ['z'] = 4.4},
    [73] = {['x'] = 941.16, ['y'] = -2141.44, ['z'] = 31.23},
    [74] = {['x'] = -18.4, ['y'] = 218.91, ['z'] = 106.75},
    [75] = {['x'] = -556.45, ['y'] = 274.72, ['z'] = 83.01},
    [76] = {['x'] = 91.33, ['y'] = 298.52, ['z'] = 110.22},
    [77] = {['x'] = -1038.40, ['y'] = -1396.94, ['z'] = 5.55},
    [78] = {['x'] = -1192.20, ['y'] = -1546.56, ['z'] = 4.37},
    [79] = {['x'] = -3005.09, ['y'] = 79.05, ['z'] = 11.60},
    [80] = {['x'] = 793.79, ['y'] = -735.68, ['z'] = 27.96},
    [81] = {['x'] = 220.47, ['y'] = 304.54, ['z'] = 105.57},
    [82] = {['x'] = 1234.31, ['y'] = -354.74, ['z'] = 69.08},
    [83] = {['x'] = -1342.50, ['y'] = -871.89, ['z'] = 16.85},
    [84] = {['x'] = 225.58, ['y'] = -1746.03, ['z'] = 29.28},
    [85] = {['x'] = -428.07, ['y'] = 294.03, ['z'] = 83.22},
    [86] = {['x'] = 930.08, ['y'] = 41.57, ['z'] = 81.09},
    [87] = {['x'] = -3152.76, ['y'] = 1110.03, ['z'] = 20.87},
    [88] = {['x'] = -1829.52, ['y'] = 801.37, ['z'] = 138.41},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 1000
		if not servico then
			for k,v in pairs(dossantos.rotasdrogas) do
				local ped = PlayerPedId()
				local x,y,z = table.unpack(GetEntityCoords(ped))
				local distance = Vdist(x,y,z,v['x'],v['y'],v['z'])
				if distance <= 3 then
					idle = 5
					DrawMarker(21,v['x'],v['y'],v['z']-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,222, 67, 11,100,0,0,0,1) 
					if distance <= 1.2 then
						drawTxt("PRESSIONE  ~r~G~w~  PARA ~y~INICIAR A ROTA",4,0.5,0.90,0.50,255,255,255,200)
						if IsControlJustPressed(0,47) then
							if drogas_entregas.checkPermission(k) then
								servico = true
								startthreadmafia()
								startthreadmafia1()
								inservice = k
								selecionado = math.random(53)
								CriandoBlip(locs,selecionado)
								TriggerEvent("Notify","sucesso","Rota iniciada")
							end
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGAS
-----------------------------------------------------------------------------------------------------------------------------------------
function startthreadmafia()
Citizen.CreateThread(function()
	while servico do
		local idle = 1000
		if servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(locs[selecionado].x,locs[selecionado].y,cdz,x,y,z,true)
			
			if distance <= 3 then
				idle = 5
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,222, 67, 11,150,1,0,0,1)
				if distance <= 1.2 then
					drawTxt("PRESSIONE  ~r~G~w~  PARA ~y~ENTREGAR",4,0.5,0.90,0.50,255,255,255,200)
					if IsControlJustPressed(0,47) and not IsPedInAnyVehicle(ped) then
						if drogas_entregas.checkPayment(inservice) then
							droga = CreateObject(GetHashKey("prop_drug_package_02"),locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-0.8,true,true,true)
							local random = math.random(100)
							if random >= 33 then
								drogas_entregas.MarcarOcorrencia()
							end
							
							TriggerEvent('cancelando',true)
							RemoveBlip(blips)
							backentrega = selecionado
							processo = true
							segundos = 3
							vRP._playAnim(false,{{"pickup_object","pickup_low"}},true)
							vRP._CarregarObjeto("pickup_object","pickup_low","hei_prop_heist_cash_pile",49,28422)
							
							SetTimeout(9000,function()
								vRP._stopAnim(false)
								DeleteObject(droga)
							end)

							while true do
								if backentrega == selecionado then
									selecionado = math.random(53)
								else
									break
								end
								Citizen.Wait(1)
							end
							CriandoBlip(locs,selecionado)
						end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
function startthreadmafia1()
Citizen.CreateThread(function()
	while servico do
		Citizen.Wait(5)
		if servico then
			if IsControlJustPressed(0,168) then
				servico = false
				RemoveBlip(blips)
				TriggerEvent("Notify","aviso","Você saiu de serviço.")
			end
		end
	end
end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if segundos > 0 then
			segundos = segundos - 1
			if segundos == 0 then
				processo = false
				TriggerEvent('cancelando',false)
				ClearPedTasks(PlayerPedId())
				vRP._DeletarObjeto()
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
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

function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entregar suprimentos")
	EndTextCommandSetBlipName(blips)
end