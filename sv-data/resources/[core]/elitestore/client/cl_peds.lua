--[ BLACKLIST OBJECTS ]--------------------------------------------------------------------------

local blackObjects = {
    "stt_prop_stunt_jump45",
    "prop_const_fence02b",
    "apa_prop_flag_brazil"
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		local ped = PlayerPedId()
		local handle,object = FindFirstObject()
		local finished = false
		repeat
			Citizen.Wait(1000)
			for i=1,#blackObjects do
				if GetEntityModel(object) == GetHashKey(blackObjects[i]) then
					ReqAndDelete(object,false)
				end
			end
			finished,object = FindNextObject(handle)
		until not finished
		EndFindObject(handle)
	end
end)

function ReqAndDelete(object,detach)
	if DoesEntityExist(object) then
		NetworkRequestControlOfEntity(object)
		while not NetworkHasControlOfEntity(object) do
			Citizen.Wait(1)
		end

		if detach then
			DetachEntity(object,0,false)
		end

		SetEntityCollision(object,false,false)
		SetEntityAlpha(object,0.0,true)
		SetEntityAsMissionEntity(object,true,true)
		SetEntityAsNoLongerNeeded(object)
		DeleteEntity(object)
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- PEDLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local pedlist = {
    { 2519.27,4737.13,34.3,127.63,0xFCFA9E1E,"A_C_Cow" },
	{ 2511.97,4746.31,34.31,129.46,0xFCFA9E1E,"A_C_Cow" },
	{ 2503.51,4754.91,34.31,131.01,0xFCFA9E1E,"A_C_Cow" },
	{ 2494.99,4762.82,34.38,131.44,0xFCFA9E1E,"A_C_Cow" },
	{ 2472.8,4761.66,34.31,133.55,0xFCFA9E1E,"A_C_Cow" },
	{ 2464.73,4770.15,34.38,129.69,0xFCFA9E1E,"A_C_Cow" },
	{ 2457.19,4777.66,34.5,128.23,0xFCFA9E1E,"A_C_Cow" },
	{ 2448.75,4786.42,34.64,135.55,0xFCFA9E1E,"A_C_Cow" },
	{ 2441.27,4793.63,34.67,130.24,0xFCFA9E1E,"A_C_Cow" },
	{ 2432.51,4802.7,34.83,130.44,0xFCFA9E1E,"A_C_Cow" },
	{ 2400.45,4777.87,34.55,310.87,0xFCFA9E1E,"A_C_Cow" },
	{ 2409.17,4767.99,34.31,309.06,0xFCFA9E1E,"A_C_Cow" },
	{ 2416.74,4761.18,34.31,309.92,0xFCFA9E1E,"A_C_Cow" },
	{ 2424.82,4752.49,34.31,312.4,0xFCFA9E1E,"A_C_Cow" },
	{ 2433.06,4745.04,34.31,311.96,0xFCFA9E1E,"A_C_Cow" },
	{ 2440.76,4736.46,34.31,312.35,0xFCFA9E1E,"A_C_Cow" },
	{ 426.10,6463.47,28.77,315.75,0xFCFA9E1E,"A_C_Cow" },
	{ 431.42,6459.22,28.75,318.05,0xFCFA9E1E,"A_C_Cow" },
	{ 436.70,6454.85,28.74,321.40,0xFCFA9E1E,"A_C_Cow" },
	{ 428.42,6477.27,28.78,134.37,0xFCFA9E1E,"A_C_Cow" },

	
	{ 24.49,-1347.31,29.5,271.34,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 2557.25,380.8,108.63,355.54,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 1164.71,-322.72,69.21,98.92,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -706.11,-913.66,19.22,92.34,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -46.71,-1757.96,29.43,50.34,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 372.54,326.38,103.57,254.31,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -3242.27,999.97,12.84,354.9,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 1727.86,6415.24,35.04,241.92,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 549.1,2671.31,42.16,95.92,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 1960.1,3740.04,32.35,300.65,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 2678.1,3279.4,55.25,335.7,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 1698.09,4922.92,42.07,328.31,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -1820.07,794.18,138.09,131.05,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -2966.44,390.93,15.05,85.99,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -3038.95,584.55,7.91,16.82,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 1134.2,-982.52,46.42,278.98,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 1165.87,2710.83,38.16,181.59,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -1486.25,-378.0,40.17,132.59,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -1221.92,-908.29,12.33,34.77,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 160.56,6641.64,31.72,225.9,0x8B7D3766,"u_m_y_burgerdrug_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 1692.2,3760.96,34.71,225.61,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 253.78,-50.57,69.95,65.21,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 842.46,-1035.24,28.2,357.31,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -331.59,6085.03,31.46,222.94,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -662.29,-933.6,21.83,179.34,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -1304.08,-394.6,36.7,75.11,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -1118.94,2699.81,18.56,220.65,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 2568.04,292.65,108.74,359.32,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -3173.56,1088.33,20.84,246.11,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 22.55,-1105.53,29.8,160.13,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 810.2,-2159.05,29.62,359.45,0x1A021B83,"s_m_m_cntrybar_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 1773.4,3322.14,41.45,27.71,0xF06B849D,"s_m_m_autoshop_02","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -1083.3,-245.93,37.77,206.79,0x2F8845A3,"ig_barry","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -1564.01,-975.12,13.02,234.03,0xEF154C47,"ig_old_man2","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -1592.35,-1005.57,13.03,232.04,0x719D27F4,"ig_old_man1a","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 73.98,-1392.81,29.38,267.12,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -708.34,-152.77,37.42,119.8,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -164.54,-301.92,39.74,246.23,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 427.07,-806.19,29.5,91.2,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -823.1,-1072.3,11.33,208.54,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -1194.58,-767.5,17.32,212.84,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -1449.72,-238.91,49.82,44.85,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 5.79,6511.36,31.88,40.19,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 1695.35,4823.03,42.07,97.63,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 127.31,-223.42,54.56,68.28,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 612.99,2761.83,42.09,269.46,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 1196.6,2711.64,38.23,177.03,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -3169.09,1044.05,20.87,64.38,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -1102.51,2711.51,19.11,219.7,0x5B3BD90D,"ig_kerrymcintosh","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	
	
	{ -40.37, -1660.29, 29.5,228.94,0x062547E7 ,"cs_floyd","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ -626.07, -277.7, 35.58,119.85,0x45918E44 ,"cs_molly","anim@heists@prison_heistig1_p1_guard_checks_bus","loop" },
	{ -625.04, -275.25, 35.58,119.85,0x45918E44 ,"cs_molly","anim@heists@prison_heistig1_p1_guard_checks_bus","loop" },


	{ -1816.7469482422,-1193.8205566406,14.304763793945,-40.02,0x69F46BF3,"s_f_y_factory_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 910.04522705078,-1064.7436523438,37.943222045898,200.02,0x85889AC3,"ig_chef2","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 2885.5173339844,4387.3203125,50.735778808594,200.02,0xF6157D8F,"g_m_m_chemwork_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 1151.7214355469,-3249.1096191406,5.9008111953735,180.38,0x59511A6C,"s_m_m_trucker_01","anim@heists@heist_corona@single_team","single_team_loop_boss" },
	{ 166.94,2229.08,90.78, 60.11,0x6C9B2849,"a_m_m_hillbilly_01" },
		---- VANILLA

		{106.99, -1290.25, 29.25,219.7,0x52580019,"s_f_y_stripper_01","mini@strip_club@private_dance@part1","priv_dance_p1" },
		{104.7,-1293.1,29.26,219.7,0x52580019,"s_f_y_stripper_01","mini@strip_club@private_dance@part2","priv_dance_p2" },
		{103.6,-1290.77,29.26,219.7,0x52580019,"s_f_y_stripper_01","mini@strip_club@private_dance@part2","priv_dance_p2" }
	
	---- VANILLA
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADPEDLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local localPeds = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped))

		for k,v in pairs(pedlist) do
			local distance = GetDistanceBetweenCoords(x,y,z,v[1],v[2],v[3],true)
			if distance <= 10 then
				if localPeds[k] == nil then
					RequestModel(GetHashKey(v[6]))
					while not HasModelLoaded(GetHashKey(v[6])) do
						RequestModel(GetHashKey(v[6]))
						Citizen.Wait(10)
					end

					localPeds[k] = CreatePed(4,v[5],v[1],v[2],v[3]-1,v[4],false,false)
					SetEntityInvincible(localPeds[k],true)
					FreezeEntityPosition(localPeds[k],true)
					SetEntityAsMissionEntity(localPeds[k],true,true)
					SetBlockingOfNonTemporaryEvents(localPeds[k],true)

					if v[7] ~= nil then
						RequestAnimDict(v[7])
						while not HasAnimDictLoaded(v[7]) do
							RequestAnimDict(v[7])
							Citizen.Wait(10)
						end

						TaskPlayAnim(localPeds[k],v[7],v[8],8.0,0.0,-1,1,0,0,0,0)
					end
				end
			else
				if localPeds[k] then
					SetEntityAsMissionEntity(localPeds[k],false,false)
					DeleteEntity(localPeds[k])
					localPeds[k] = nil
				end
			end
		end
	end
end)