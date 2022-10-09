config = {}

config.license = "IDJ8JYDFDSCOAE0I5NQT" -- Sua licença

config.permissao = "policia.permissao" -- Permissão para avisar sobre os roubos

config.tempo = "3" -- Determine após quanto tempo o jogador pode roubar aquele local novamente (Em segundos)

config.type= {
	['Ammunation'] = {
		ptr = 0, -- Número de polícias necessários para iniciar o roubo
		tempoRoubo = 40, -- Tempo que demora para efetuar o roubo 
		chanceRoubo = 100, -- Determine quanto a chance de sucesso para efetuar o roubo. 
		webhook = "https://discord.com/api/webhooks/944790118865207367/_4U7cydNaelXiT0jQCUdNRzYqqzKoDo8bp4IElJR804KCv8R8nwTUMq0PQtGTjyKVXHs",
		animation = "anim@heists@ornate_bank@grab_cash_heels",
		animation_comp = "grab",
		item  = { -- Item que será dado
			['dinheiro-sujo'] = {min = 5000, max = 10000, div = 2},
			['WEAPON_PISTOL_AMMO'] = {min = 10, max = 100, div = 2},
			['WEAPON_VINTAGEPISTOL'] = {min = 0, max = 1, div = 2},
		},
        cds = { 
			{ id = 1, x = 1692.96, y = 3761.71, z = 34.71, h = 224.07 },
			{ id = 2, x = 253.4, y = -51.77, z = 69.95, h = 75.2598 },
			{ id = 3, x = 841.22, y = -1035.35, z = 28.2, h = 14.70 },
			{ id = 4, x = -330.7, y = 6085.85, z = 31.46, h = 232.55 },
			{ id = 5, x = -660.98, y = -933.57, z = 21.83, h = 177.06 },
			{ id = 6, x = -1304.51, y = -395.98, z = 36.7, h = 76.72 },
			{ id = 7, x = -1117.98, y = 2700.59, z = 18.56, h = 221.92 },
			{ id = 8, x = 2566.6, y = 292.6, z = 108.74, h = 354.67 },
			{ id = 9, x = -3172.98, y = 1089.56, z = 20.84, h = 244.17 },
			{ id = 10, x = 23.79, y = -1105.89, z = 29.8, h = 165.57 },
			{ id = 11, x = 808.88, y = -2159.01, z = 29.62, h = 0.102 },
        }
    },
	['Lojinha'] = {
		ptr = 0, 
		tempoRoubo = 60, 
		chanceRoubo = 100,
		webhook = "https://discord.com/api/webhooks/944790118865207367/_4U7cydNaelXiT0jQCUdNRzYqqzKoDo8bp4IElJR804KCv8R8nwTUMq0PQtGTjyKVXHs",
		animation = "anim@heists@ornate_bank@grab_cash_heels",
		animation_comp = "grab",
		item  = {  
			['dinheiro-sujo'] = {min = 7000, max = 15000, div = 2}
		},
        cds = { 
			{ id = 1, x = 28.82, y = -1339.34, z = 29.5 , h = 355.14846801758 },
			{ id = 2, x = 2549.73, y = 386.08, z = 108.63 , h = 268.07 },
			{ id = 3, x = 1159.56, y = -314.06, z = 69.21 , h = 268.07 },
			{ id = 4, x = -709.72, y = -904.12, z = 19.22 , h = 268.07 },
			{ id = 5, x = -1829.1, y = 798.72, z = 138.2 , h = 268.07 },
			{ id = 6, x = 378.27, y = 333.32, z = 103.57 , h = 268.07 },
			{ id = 7, x = -3249.98, y = 1004.54, z = 12.84 , h = 268.07 },
			{ id = 8, x = 1734.92, y = 6420.75, z = 35.04 , h = 268.07 },
			{ id = 9, x = 546.29, y = 2662.83, z = 42.16 , h = 268.07 },
			{ id = 10, x = 1959.45, y = 3748.92, z = 32.35 , h = 268.07 },
			{ id = 11, x = 2672.86, y = 3286.71, z = 55.25 , h = 268.07 },
			{ id = 12, x = 1707.8, y = 4920.45, z = 42.07 , h = 268.07 },
			{ id = 13, x = -43.49, y = -1748.44, z = 29.43 , h = 268.07 },
			{ id = 14, x = -3047.86, y = 585.51, z = 7.91 , h = 268.07 },
			{ id = 15, x = 1169.23, y = 2717.83, z = 37.16, h = 268.07 },
        }
    },
	['Caixa Registradora'] = {
		ptr = 0, 
		tempoRoubo = 20, 
		chanceRoubo = 100, 
		webhook = "https://discord.com/api/webhooks/944790118865207367/_4U7cydNaelXiT0jQCUdNRzYqqzKoDo8bp4IElJR804KCv8R8nwTUMq0PQtGTjyKVXHs",
		animation = "oddjobs@shop_robbery@rob_till",
		animation2 = "amb@prop_human_parking_meter@female@idle_a",
		animation_comp = "loop",
		animation_comp2 = "idle_a_female",
		item  = {  
			['dinheiro-sujo'] = {min = 500, max = 3000, div = 2}
		},
        cds = { 
			{ id = 1, x = 24.49, y = -1344.99, z = 29.49, h = 265.0 },
			{ id = 2, x = 24.50, y = -1347.34, z = 29.49, h = 267.0 },
			{ id = 3, x = 2554.90, y = 380.94, z = 108.62, h = 349.0 },
			{ id = 4, x = 2557.23, y = 380.83, z = 108.62, h = 354.0 },
			{ id = 5, x = 1165.07, y = -324.50, z = 69.20, h = 127.0 },
			{ id = 6, x = 1164.67, y = -322.76, z = 69.20, h = 94.0 },
			{ id = 7, x = -706.10, y = -915.43, z = 19.21, h = 116.0 },
			{ id = 8, x = -706.16, y = -913.65, z = 19.21, h = 85.0 },
			{ id = 9, x = -47.96, y = -1759.34, z = 29.42, h = 74.0 },
			{ id = 10, x = -46.80, y = -1757.94, z = 29.42, h = 45.0 },
			{ id = 11, x = 372.58, y = 326.39, z = 103.56, h = 252.0 },
			{ id = 12, x = 373.10, y = 328.64, z = 103.56, h = 255.0 },
			{ id = 13, x = -3242.24, y = 1000.01, z = 12.83, h = 352.0 },
			{ id = 14, x = -3244.56, y = 1000.20, z = 12.83, h = 354.0 },
			{ id = 15, x = 1727.88, y = 6415.21, z = 35.03, h = 239.0 },
			{ id = 16, x = 1728.90, y = 6417.25, z = 35.03, h = 240.0 },
			{ id = 17, x = 549.03, y = 2671.36, z = 42.15, h = 93.0 },
			{ id = 18, x = 549.33, y = 2669.04, z = 42.15, h = 93.0 },
			{ id = 19, x = 1958.96, y = 3742.01, z = 32.34, h = 298.0 },
			{ id = 20, x = 1960.12, y = 3740.01, z = 32.34, h = 295.0 },
			{ id = 21, x = 2678.07, y = 3279.42, z = 55.24, h = 327.0 },
			{ id = 22, x = 2676.03, y = 3280.56, z = 55.24, h = 327.0 },
			{ id = 23, x = 1696.57, y = 4923.95, z = 42.06, h = 353.0 },
			{ id = 24, x = 1698.06, y = 4922.96, z = 42.06, h = 323.0 },
			{ id = 25, x = -1818.89, y = 792.94, z = 138.08, h = 161.0 },
			{ id = 26, x = -1820.12, y = 794.16, z = 138.08, h = 129.0 },
			{ id = 27, x = 1392.87, y = 3606.39, z = 34.98, h = 195.0 },
			{ id = 28, x = -2966.44, y = 390.89, z = 15.04, h = 84.0 },
			{ id = 29, x = -3038.95, y = 584.55, z = 7.90, h = 16.0 },
			{ id = 30, x = -3041.19, y = 583.84, z = 7.90, h = 14.0 },
			{ id = 31, x = 1134.25, y = -982.47, z = 46.41, h = 273.0 },
			{ id = 32, x = 1165.93, y = 2710.77, z = 38.15, h = 177.0 },
			{ id = 33, x = -1486.29, y = -378.02, z = 40.16, h = 132.0 },
			{ id = 34, x = -1221.99, y = -908.29, z = 12.32, h = 28.0 },
			{ id = 35, x = 73.97, y = -1392.13, z = 29.37, h = 267.0 },
			{ id = 36, x = 74.86, y = -1387.70, z = 29.37, h = 182.0 },
			{ id = 37, x = 78.02, y = -1387.69, z = 29.37, h = 177.0 },
			{ id = 38, x = 426.96, y = -806.99, z = 29.49, h = 91.0 },
			{ id = 39, x = 426.08, y = -811.44, z = 29.49, h = 358.0 },
			{ id = 40, x = 422.91, y = -811.44, z = 29.49, h = 358.0 },
			{ id = 41, x = -816.56, y = -1073.25, z = 11.32, h = 122.0 },
			{ id = 42, x = -818.14, y = -1070.52, z = 11.32, h = 122.0 },
			{ id = 43, x = -822.41, y = -1071.94, z = 11.32, h = 206.0 },
			{ id = 44, x = -1195.24, y = -768.03, z = 17.31, h = 215.0 },
			{ id = 45, x = -1193.86, y = -767.00, z = 17.31, h = 215.0 },
			{ id = 46, x = -1192.44, y = -765.93, z = 17.31, h = 215.0 },
			{ id = 47, x = 5.21, y = 6510.88, z = 31.87, h = 41.0 },
			{ id = 48, x = 1.34, y = 6508.52, z = 31.87, h = 309.0 },
			{ id = 49, x = -0.80, y = 6510.80, z = 31.87, h = 309.0 },
			{ id = 50, x = 1695.38, y = 4822.23, z = 42.06, h = 92.0 },
			{ id = 51, x = 1695.10, y = 4817.71, z = 42.06, h = 4.0 },
			{ id = 52, x = 1691.98, y = 4817.31, z = 42.06, h = 4.0 },
			{ id = 53, x = 127.50, y = -222.58, z = 54.55, h = 70.0 },
			{ id = 54, x = 126.93, y = -224.18, z = 54.55, h = 70.0 },
			{ id = 55, x = 126.30, y = -225.88, z = 54.55, h = 70.0 },
			{ id = 56, x = 613.14, y = 2760.96, z = 42.08, h = 273.0 },
			{ id = 57, x = 612.99, y = 2762.69, z = 42.08, h = 273.0 },
			{ id = 58, x = 612.85, y = 2764.46, z = 42.08, h = 273.0 },
			{ id = 59, x = 1197.42, y = 2711.63, z = 38.22, h = 175.0 },
			{ id = 60, x = 1201.88, y = 2710.74, z = 38.22, h = 85.0 },
			{ id = 61, x = 1201.87, y = 2707.60, z = 38.22, h = 85.0 },
			{ id = 62, x = -3168.76, y = 1044.80, z = 20.86, h = 65.0 },
			{ id = 63, x = -3169.46, y = 1043.22, z = 20.86, h = 65.0 },
			{ id = 64, x = -3170.17, y = 1041.60, z = 20.86, h = 65.0 },
			{ id = 65, x = -1101.80, y = 2712.10, z = 19.10, h = 216.0 },
			{ id = 66, x = -1097.90, y = 2714.40, z = 19.10, h = 125.0 },
			{ id = 67, x = -1095.82, y = 2712.08, z = 19.10, h = 125.0 },
			{ id = 68, x = -821.91, y = -183.32, z = 37.56, h = 213.0 },
			{ id = 69, x = 134.39, y = -1707.83, z = 29.29, h = 136.0 },
			{ id = 70, x = -1284.26, y = -1115.05, z = 6.99, h = 89.0 },
			{ id = 71, x = 1930.56, y = 3727.93, z = 32.84, h = 205.0 },
			{ id = 72, x = 1211.52, y = -470.31, z = 66.20, h = 72.0 },
			{ id = 73, x = -30.42, y = -151.77, z = 57.07, h = 336.0 },
			{ id = 74, x = -277.76, y = 6230.73, z = 31.69, h = 38.0 }
        }
    },
	['Caixa'] = {
		ptr = 2, 
		tempoRoubo = 35, 
		chanceRoubo = 100,
		webhook = "https://discord.com/api/webhooks/944790118865207367/_4U7cydNaelXiT0jQCUdNRzYqqzKoDo8bp4IElJR804KCv8R8nwTUMq0PQtGTjyKVXHs",
		animation = "anim@heists@ornate_bank@grab_cash_heels",
		animation_comp = "grab",
		item  = { 
			['dinheiro-sujo'] = {min = 500, max = 1000, div = 2}
		},
        cds = {
			{ id = 1, x = 119.10, y = -883.70, z = 31.12, h = 71.0 },--Novo
			{ id = 2, x = -1315.80, y = -834.76, z = 16.96, h = 305.0 },
			{ id = 3, x = 285.44, y = 143.38, z = 104.17, h = 159.0 },
			{ id = 4, x = 1138.23, y = -468.89, z = 66.73, h = 74.0 },
			{ id = 5, x = 1077.70, y = -776.54, z = 58.24, h = 182.0 },
			{ id = 6, x = -710.03, y = -818.90, z = 23.72, h = 0.0 },
			{ id = 7, x = -821.63, y = -1081.89, z = 11.13, h = 31.0 },
			{ id = 8, x = -1409.75, y = -100.44, z = 52.38, h = 107.0 },
			{ id = 9, x = -846.29, y = -341.28, z = 38.68, h = 116.0 },
			{ id = 10, x = -2072.36, y = -317.29, z = 13.31, h = 260.0 },
			{ id = 11, x = -526.64, y = -1222.97, z = 18.45, h = 153.0 },
			{ id = 12, x = -254.41, y = -692.46, z = 33.60, h = 159.0 },
			{ id = 13, x = -283.34, y = 6225.71, z = 31.5, h = 313.90 },
			{ id = 14, x = 155.6, y = 6642.58, z = 31.61, h = 313.90 }
        }
    },
	['Banco Fleeca'] = {
		ptr = 3, 
		tempoRoubo = 500, 
		chanceRoubo = 100,
		webhook = "https://discord.com/api/webhooks/944790118865207367/_4U7cydNaelXiT0jQCUdNRzYqqzKoDo8bp4IElJR804KCv8R8nwTUMq0PQtGTjyKVXHs",
		animation = "anim@heists@ornate_bank@grab_cash_heels",
		animation_comp = "grab",
		need_item = {
			['laranja'] = 1,
			['lockpick'] = 2,
		},
		item  = { 
			['dinheiro-sujo'] = {min = 50000, max = 100000, div = 2}
		},
        cds = {
			{ id = 1, x = -1211.05, y = -335.9, z = 37.79, h = 71.0 },--Novo
			{ id = 2, x = -353.66, y = -54.51, z = 49.04, h = 305.0 },
			{ id = 3, x = 311.16, y = -283.73, z = 54.17, h = 159.0 },
			{ id = 4, x = -102.57, y = 6476.96, z = 31.63, h = 74.0 }
        }
    },
}

return config