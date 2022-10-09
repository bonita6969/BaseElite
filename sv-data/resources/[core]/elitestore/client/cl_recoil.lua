local recoil = {
	[453432689] = 0.0, -- PISTOL
		[3219281620] = 0.0, -- PISTOL MK2
		[584646201] = 0.0, -- AP PISTOL
		[2578377531] = 0.0, -- PISTOL .50
		[324215364] = 0.0, -- MICRO SMG
		[4024951519] = 0.0, -- ASSAULT SMG
		[3220176749] = 0.0, -- ASSAULT RIFLE
		[2937143193] = 0.0, -- ADVANCED RIFLE
		[2634544996] = 0.0, -- MG
		[2144741730] = 0.0, -- COMBAT MG
		[3686625920] = 0.0, -- COMBAT MG MK2
		[487013001] = 0.0, -- PUMP SHOTGUN
		[961495388] = 0.0, -- ASSAULT RIFLE MK2
		[-2084633992] = 0.0, -- CARBINE RIFLE
		[-86904375] = 0.0, -- CARBINE RIFLE MK2
		[-1768145561] = 0.0, -- SPECIAL CARBINE MK2
		[-1075685676] = 0.0, -- PISTOL MK2
		[1593441988] = 0.0, -- COMBAT PISTOL
		[-1076751822] = 0, -- SNS PISTOL
		[-771403250] = 0, -- HEAVY PISTOL
		[1432025498] = 0.0, -- PUMP SHOTGUN MK2
		[2017895192] = 0.0, -- SAWNOFF SHOTGUN
		[3800352039] = 0.0, -- ASSAULT SHOTGUN
		[2640438543] = 0.0, -- BULLPUP SHOTGUN
		[911657153] = 0.0, -- STUN GUN
		[100416529] = 0.0, -- SNIPER RIFLE
		[205991906] = 0.0, -- HEAVY SNIPER
		[177293209] = 0.0, -- HEAVY SNIPER MK2
		[856002082] = 1.0, -- REMOTE SNIPER
		[2726580491] = 1.0, -- GRENADE LAUNCHER
		[1305664598] = 1.0, -- GRENADE LAUNCHER SMOKE
		[2982836145] = 0.0, -- RPG
		[1752584910] = 0.0, -- STINGER
		[1119849093] = 0.0, -- MINIGUN
		[3218215474] = 0.0, -- SNS PISTOL
		[1627465347] = 0.0, -- GUSENBERG
		[3523564046] = 0.0, -- HEAVY PISTOL
		[2132975508] = 0.0, -- BULLPUP RIFLE
		[-619010992] = 0.0, -- MACHINE PISTOL
		[736523883] = 0.0, -- SMG
		[2024373456] = 0.0, -- SMG MK2
		[171789620] = 0.0, -- COMBAT PDW
		[-2066285827] = 0.0, -- BULLPUP RIFLE MK2
		[137902532] = 0.4, -- VINTAGE PISTOL
		[2828843422] = 0.7, -- MUSKET
		[984333226] = 0.2, -- HEAVY SHOTGUN
		[3342088282] = 0.3, -- MARKSMAN RIFLE
		[1785463520] = 0.25, -- MARKSMAN RIFLE MK2
		[1672152130] = 0, -- HOMING LAUNCHER
		[1198879012] = 0.0, -- FLARE GUN
		[3696079510] = 0.0, -- MARKSMAN PISTOL
		[1834241177] = 0.0, -- RAILGUN
		[3675956304] = 0.0, -- MACHINE PISTOL
		[3249783761] = 0.0, -- REVOLVER
		[-879347409] = 0.0, -- REVOLVER MK2
		[4019527611] = 0.0, -- DOUBLE BARREL SHOTGUN
		[1649403952] = 0.0, -- COMPACT RIFLE
		[317205821] = 0.0, -- AUTO SHOTGUN
		[125959754] = 0.0, -- COMPACT LAUNCHER
		[3173288789] = 0.0, -- MINI SMG		
	}
	------------------------------------------------------------------------------
	-- DANO POR OSSO + RECOIL CONFIG
	------------------------------------------------------------------------------
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if IsPedShooting(PlayerPedId()) then
				local wep = GetSelectedPedWeapon(PlayerPedId())
				if recoil[wep] and recoil[wep] ~= 0 then
					Wait(0)
					p = GetGameplayCamRelativePitch()
					if not IsPedInAnyHeli(PlayerPedId()) then
						SetGameplayCamRelativePitch(p+recoil[wep], 1.2)
					end
				end
			end
			local headshotFive = HasPedBeenDamagedByWeapon(PlayerPedId(), -1075685676, 0) -- Pistol
			local headshotFive1 = HasPedBeenDamagedByWeapon(PlayerPedId(), 453432689, 0) -- Pistol
			local headshotGlock = HasPedBeenDamagedByWeapon(PlayerPedId(), 1593441988, 0) -- Pistol
			local headshotFajuta = HasPedBeenDamagedByWeapon(PlayerPedId(), -1076751822, 0) -- Pistol
			local headshotPesada = HasPedBeenDamagedByWeapon(PlayerPedId(), 3523564046, 0) -- Pistol
	
			local headshotTec = HasPedBeenDamagedByWeapon(PlayerPedId(), -619010992, 0) -- SMG
			local headshotSmg = HasPedBeenDamagedByWeapon(PlayerPedId(), 736523883, 0) -- SMG
			local headshotSmg2 = HasPedBeenDamagedByWeapon(PlayerPedId(), 2024373456, 0) -- SMG
			local headshotMtar = HasPedBeenDamagedByWeapon(PlayerPedId(), 3675956304, 0) -- SMG
			local headshotSig = HasPedBeenDamagedByWeapon(PlayerPedId(), 171789620, 0) -- SMG
	
			local headshotAK = HasPedBeenDamagedByWeapon(PlayerPedId(), 3220176749, 0) -- Fuzil
			local headshotAK2 = HasPedBeenDamagedByWeapon(PlayerPedId(), 961495388, 0) -- Fuzil
			local headshotM4 = HasPedBeenDamagedByWeapon(PlayerPedId(), -2084633992, 0) -- Fuzil
			local headshotMPX = HasPedBeenDamagedByWeapon(PlayerPedId(), -86904375, 0) -- Fuzil
			local headshotG3 = HasPedBeenDamagedByWeapon(PlayerPedId(), -1063057011, 0) -- Fuzil
			local headshotG32 = HasPedBeenDamagedByWeapon(PlayerPedId(), -1768145561, 0) -- Fuzil
	
			local headshot12 = HasPedBeenDamagedByWeapon(PlayerPedId(), 487013001, 0) -- 12
			local headshotMini12 = HasPedBeenDamagedByWeapon(PlayerPedId(), 2017895192, 0) -- 12
			local headshotMini12 = HasPedBeenDamagedByWeapon(PlayerPedId(), 2017895192, 0) -- 12
			local headshotMini12 = HasPedBeenDamagedByWeapon(PlayerPedId(), 2017895192, 0) -- 12
			local headshotMiniSGM = HasPedBeenDamagedByWeapon(PlayerPedId(), 3173288789, 0) -- 12
			local headshotGusenberg = HasPedBeenDamagedByWeapon(PlayerPedId(), 1627465347, 0) -- 12
			local headshotCompactrifle = HasPedBeenDamagedByWeapon(PlayerPedId(), 1649403952, 0) -- 12
			local headshotAssaultSMG = HasPedBeenDamagedByWeapon(PlayerPedId(), 4024951519, 0) -- 12
			local a, b = GetPedLastDamageBone(PlayerPedId())
			if a and b == 31086 then
				if headshotFive or headshotGlock or headshotFajuta or headshotPesada or headshotSmg or headshotSmg2 or headshotMtar or headshotSig or headshotTec or headshotCompactrifle or headshotMiniSGM or headshotGusenberg or headshotAssaultSMG then
					SetEntityHealth(PlayerPedId(), 101)
				elseif headshotAK or headshotAK2 or headshotM4 or headshotMPX or headshotG3 or headshotG32 or headshot12 or headshotMini12 or headshotCompactrifle or headshotMiniSGM or headshotGusenberg or headshotAssaultSMG then
					SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) - 101)
				end
				a, b, headshotFive, headshotGlock, headshotFajuta, headshotPesada, headshotTec, headshotSmg, headshotSmg2, headshotMtar, headshotSig, headshotAK, headshotAK2, headshotM4, headshotMPX, headshotG3, headshotG32, headshot12, headshotMini12, headshotCompactrifle, headshotMiniSGM, headshotGusenberg, headshotAssaultSMG  = nil, nil, nil, nil, nil, nil
			end
		end
	end)
	
	Citizen.CreateThread(function()
		while true do
			local sleep = 100
			if IsPedArmed(PlayerPedId(),6) then
				sleep = 4
				DisableControlAction(1,140,true)
				DisableControlAction(1,141,true)
				DisableControlAction(1,142,true)
			end
			Citizen.Wait(sleep)
		end
	end)