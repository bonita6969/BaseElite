config = {} -- Não mexer

config.license = "N8FIVYFWFCBD0K3AEFBD" -- Sua licença

--> Como vai aparecer na log no discord
config.homicidioLog = "[MATOU]: {killerName} {killerFirstName}, \n [ID]: {killerId} \n [ARMA]: {weapon} \n [MORTO]: {deathName} {deathFirstName} \n [MORTO ID]: {deathId} \n [CDS de quem Matou]: "
config.suicidiolog = "[CIDADÃO]: {deathName} {deathFirstName} \n [ID] {deathId} Se matou \n [CDS DO SUICIDA]:"


   -- A baixo estão algumas opções adicionais para por a LOG

   -- {weapon} --> Arma usada pra fazer a ação

   -- {deathId} --> ID do Player morto
   -- {deathName} --> Primeiro nome do Player morto
   -- {deathFirstName} --> Segundo nome do Player morto

   -- {killerId} --> ID do Player que Matou
   -- {killerName} --> Primeiro nome do Player que Matou
   -- {killerFirstName} --> Segundo nome do Player que Matou 

config.Weapons = {
   [tostring(GetHashKey('WEAPON_UNARMED'))] = 'Soco',
   [tostring(GetHashKey('WEAPON_KNIFE'))] = 'Faca',
   [tostring(GetHashKey('WEAPON_NIGHTSTICK'))] = 'Nightstick',
   [tostring(GetHashKey('WEAPON_HAMMER'))] = 'Hammer',
   [tostring(GetHashKey('WEAPON_BAT'))] = 'Taco de Basebol',
   [tostring(GetHashKey('WEAPON_GOLFCLUB'))] = 'Taco de Golf',
   [tostring(GetHashKey('WEAPON_CROWBAR'))] = 'Crowbar',
   [tostring(GetHashKey('WEAPON_PISTOL'))] = 'Pistol',
   [tostring(GetHashKey('WEAPON_COMBATPISTOL'))] = 'Combat Pistol',
   [tostring(GetHashKey('WEAPON_APPISTOL'))] = 'AP Pistol',
   [tostring(GetHashKey('WEAPON_PISTOL50'))] = 'Pistol .50',
   [tostring(GetHashKey('WEAPON_MICROSMG'))] = 'Micro SMG',
   [tostring(GetHashKey('WEAPON_PISTOL_MK2'))] = 'FIVE7',
   [tostring(GetHashKey('WEAPON_SMG'))] = 'SMG',
   [tostring(GetHashKey('WEAPON_ASSAULTSMG'))] = 'Assault SMG',
   [tostring(GetHashKey('WEAPON_ASSAULTRIFLE'))] = 'Assault Rifle',
   [tostring(GetHashKey('WEAPON_CARBINERIFLE'))] = 'Carbine Rifle',
   [tostring(GetHashKey('WEAPON_ADVANCEDRIFLE'))] = 'Advanced Rifle',
   [tostring(GetHashKey('WEAPON_MG'))] = 'MG',
   [tostring(GetHashKey('WEAPON_COMBATMG'))] = 'Combat MG',
   [tostring(GetHashKey('WEAPON_PUMPSHOTGUN'))] = 'Pump Shotgun',
   [tostring(GetHashKey('WEAPON_SAWNOFFSHOTGUN'))] = 'Sawed-Off Shotgun',
   [tostring(GetHashKey('WEAPON_ASSAULTSHOTGUN'))] = 'Assault Shotgun',
   [tostring(GetHashKey('WEAPON_BULLPUPSHOTGUN'))] = 'Bullpup Shotgun',
   [tostring(GetHashKey('WEAPON_STUNGUN'))] = 'Stun Gun',
   [tostring(GetHashKey('WEAPON_SNIPERRIFLE'))] = 'Sniper Rifle',
   [tostring(GetHashKey('WEAPON_HEAVYSNIPER'))] = 'Heavy Sniper',
   [tostring(GetHashKey('WEAPON_REMOTESNIPER'))] = 'Remote Sniper',
   [tostring(GetHashKey('WEAPON_GRENADELAUNCHER'))] = 'Grenade Launcher',
   [tostring(GetHashKey('WEAPON_GRENADELAUNCHER_SMOKE'))] = 'Smoke Grenade Launcher',
   [tostring(GetHashKey('WEAPON_RPG'))] = 'RPG',
   [tostring(GetHashKey('WEAPON_PASSENGER_ROCKET'))] = 'Passenger Rocket',
   [tostring(GetHashKey('WEAPON_AIRSTRIKE_ROCKET'))] = 'Airstrike Rocket',
   [tostring(GetHashKey('WEAPON_STINGER'))] = 'Stinger [Vehicle]',
   [tostring(GetHashKey('WEAPON_MINIGUN'))] = 'Minigun',
   [tostring(GetHashKey('WEAPON_GRENADE'))] = 'Grenade',
   [tostring(GetHashKey('WEAPON_STICKYBOMB'))] = 'Sticky Bomb',
   [tostring(GetHashKey('WEAPON_SMOKEGRENADE'))] = 'Tear Gas',
   [tostring(GetHashKey('WEAPON_BZGAS'))] = 'BZ Gas',
   [tostring(GetHashKey('WEAPON_MOLOTOV'))] = 'Molotov',
   [tostring(GetHashKey('WEAPON_FIREEXTINGUISHER'))] = 'Fire Extinguisher',
   [tostring(GetHashKey('WEAPON_PETROLCAN'))] = 'Jerry Can',
   [tostring(GetHashKey('OBJECT'))] = 'Object',
   [tostring(GetHashKey('WEAPON_BALL'))] = 'Ball',
   [tostring(GetHashKey('WEAPON_FLARE'))] = 'Flare',
   [tostring(GetHashKey('VEHICLE_WEAPON_TANK'))] = 'Tank Cannon',
   [tostring(GetHashKey('VEHICLE_WEAPON_SPACE_ROCKET'))] = 'Rockets',
   [tostring(GetHashKey('VEHICLE_WEAPON_PLAYER_LASER'))] = 'Laser',
   [tostring(GetHashKey('AMMO_RPG'))] = 'Rocket',
   [tostring(GetHashKey('AMMO_TANK'))] = 'Tank',
   [tostring(GetHashKey('AMMO_SPACE_ROCKET'))] = 'Rocket',
   [tostring(GetHashKey('AMMO_PLAYER_LASER'))] = 'Laser',
   [tostring(GetHashKey('AMMO_ENEMY_LASER'))] = 'Laser',
   [tostring(GetHashKey('WEAPON_RAMMED_BY_CAR'))] = 'Rammed by Car',
   [tostring(GetHashKey('WEAPON_BOTTLE'))] = 'Bottle',
   [tostring(GetHashKey('WEAPON_GUSENBERG'))] = 'Gusenberg Sweeper',
   [tostring(GetHashKey('WEAPON_SNSPISTOL'))] = 'SNS Pistol',
   [tostring(GetHashKey('WEAPON_VINTAGEPISTOL'))] = 'Vintage Pistol',
   [tostring(GetHashKey('WEAPON_DAGGER'))] = 'Antique Cavalry Dagger',
   [tostring(GetHashKey('WEAPON_FLAREGUN'))] = 'Flare Gun',
   [tostring(GetHashKey('WEAPON_HEAVYPISTOL'))] = 'Heavy Pistol',
   [tostring(GetHashKey('WEAPON_SPECIALCARBINE'))] = 'Special Carbine',
   [tostring(GetHashKey('WEAPON_MUSKET'))] = 'Musket',
   [tostring(GetHashKey('WEAPON_FIREWORK'))] = 'Firework Launcher',
   [tostring(GetHashKey('WEAPON_MARKSMANRIFLE'))] = 'Marksman Rifle',
   [tostring(GetHashKey('WEAPON_HEAVYSHOTGUN'))] = 'Heavy Shotgun',
   [tostring(GetHashKey('WEAPON_PROXMINE'))] = 'Proximity Mine',
   [tostring(GetHashKey('WEAPON_HOMINGLAUNCHER'))] = 'Homing Launcher',
   [tostring(GetHashKey('WEAPON_HATCHET'))] = 'Hatchet',
   [tostring(GetHashKey('WEAPON_COMBATPDW'))] = 'Combat PDW',
   [tostring(GetHashKey('WEAPON_KNUCKLE'))] = 'Knuckle Duster',
   [tostring(GetHashKey('WEAPON_MARKSMANPISTOL'))] = 'Marksman Pistol',
   [tostring(GetHashKey('WEAPON_MACHETE'))] = 'Machete',
   [tostring(GetHashKey('WEAPON_MACHINEPISTOL'))] = 'Machine Pistol',
   [tostring(GetHashKey('WEAPON_FLASHLIGHT'))] = 'Flashlight',
   [tostring(GetHashKey('WEAPON_DBSHOTGUN'))] = 'Double Barrel Shotgun',
   [tostring(GetHashKey('WEAPON_COMPACTRIFLE'))] = 'Compact Rifle',
   [tostring(GetHashKey('WEAPON_SWITCHBLADE'))] = 'Switchblade',
   [tostring(GetHashKey('WEAPON_REVOLVER'))] = 'Heavy Revolver',
   [tostring(GetHashKey('WEAPON_FIRE'))] = 'Fire',
   [tostring(GetHashKey('WEAPON_HELI_CRASH'))] = 'Heli Crash',
   [tostring(GetHashKey('WEAPON_RUN_OVER_BY_CAR'))] = 'Run over by Car',
   [tostring(GetHashKey('WEAPON_HIT_BY_WATER_CANNON'))] = 'Hit by Water Cannon',
   [tostring(GetHashKey('WEAPON_EXHAUSTION'))] = 'Exhaustion',
   [tostring(GetHashKey('WEAPON_EXPLOSION'))] = 'Explosion',
   [tostring(GetHashKey('WEAPON_ELECTRIC_FENCE'))] = 'Electric Fence',
   [tostring(GetHashKey('WEAPON_BLEEDING'))] = 'Bleeding',
   [tostring(GetHashKey('WEAPON_DROWNING_IN_VEHICLE'))] = 'Drowning in Vehicle',
   [tostring(GetHashKey('WEAPON_DROWNING'))] = 'Drowning',
   [tostring(GetHashKey('WEAPON_BARBED_WIRE'))] = 'Barbed Wire',
   [tostring(GetHashKey('WEAPON_VEHICLE_ROCKET'))] = 'Vehicle Rocket',
   [tostring(GetHashKey('WEAPON_BULLPUPRIFLE'))] = 'Bullpup Rifle',
   [tostring(GetHashKey('WEAPON_ASSAULTSNIPER'))] = 'Assault Sniper',
   [tostring(GetHashKey('VEHICLE_WEAPON_ROTORS'))] = 'Rotors',
   [tostring(GetHashKey('WEAPON_RAILGUN'))] = 'Railgun',
   [tostring(GetHashKey('WEAPON_AIR_DEFENCE_GUN'))] = 'Air Defence Gun',
   [tostring(GetHashKey('WEAPON_AUTOSHOTGUN'))] = 'Automatic Shotgun',
   [tostring(GetHashKey('WEAPON_BATTLEAXE'))] = 'Battle Axe',
   [tostring(GetHashKey('WEAPON_COMPACTLAUNCHER'))] = 'Compact Grenade Launcher',
   [tostring(GetHashKey('WEAPON_MINISMG'))] = 'Mini SMG',
   [tostring(GetHashKey('WEAPON_PIPEBOMB'))] = 'Pipebomb',
   [tostring(GetHashKey('WEAPON_POOLCUE'))] = 'Poolcue',
   [tostring(GetHashKey('WEAPON_WRENCH'))] = 'Wrench',
   [tostring(GetHashKey('WEAPON_SNOWBALL'))] = 'Snowball',
   [tostring(GetHashKey('WEAPON_ANIMAL'))] = 'Animal',
   [tostring(GetHashKey('WEAPON_COUGAR'))] = 'Cougar'
  }


return config