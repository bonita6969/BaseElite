configtaxi = {}

textotaxista = "~g~[EMPREGOS]\n~w~PRESSIONE ~r~[E]~w~ INICIAR EXPEDIENTE" -- O que aparece em 3D no "BLIP"


--[ CARRO ]----------------------------------------------------------------------------------------------------------------------------

-- CARRO QUE SERÁ NECESSÁRIO PARA INICIAR O SERVIÇO

configtaxi.cartaxi = "cdataxi"

--[ GROUP ]----------------------------------------------------------------------------------------------------------------------------

-- SET QUE SERA DADO AO INICIAR A ROTA

configtaxi.group = "Taxista"

--[ REMGROUP ]----------------------------------------------------------------------------------------------------------------------------

-- SET QUE SERA TIRADO AO ENCERRAR A ROTA

configtaxi.remgroup = "Taxista"

--[ PERMGROUP ]----------------------------------------------------------------------------------------------------------------------------

-- PERMISSAO PARA RECEBER CHAMADO DE PLAYERS

configtaxi.permgroup = "taxista.permissao"

--[ PAYMENT ]----------------------------------------------------------------------------------------------------------------------------

-- VALOR MATH.RANDOM QUE IRA RECEBER AO ENTREGAR O NPC, LEMBRANDO QUE ELE NAO PAGA SE PASSAR DE X VELOCIDADE

configtaxi.taxipayment = { 250, 400 }

--[ LOCTAXI ]----------------------------------------------------------------------------------------------------------------------------

-- LOCALIZAÇÃO PARA INICIAR AS ROTAS

configtaxi.taxiloc = {
	['x'] = 896.3, ['y'] = -177.53, ['z'] = 74.71
}

--[ MAXVEL ]----------------------------------------------------------------------------------------------------------------------------

-- VELOCIDADE MÁXIMA DO TAXISTA PARA NAO TOMAR PUNIÇÃO (KM/H)

configtaxi.maxvel = 100

--[ NPCS ]----------------------------------------------------------------------------------------------------------------------------

-- NPCS 

configtaxi.pedlist = {
	[1] = { ['model'] = "ig_abigail", ['hash'] = 0x400AEC41 },
	[2] = { ['model'] = "a_m_o_acult_02", ['hash'] = 0x4BA14CCA },
	[3] = { ['model'] = "a_m_m_afriamer_01", ['hash'] = 0xD172497E },
	[4] = { ['model'] = "ig_mp_agent14", ['hash'] = 0xFBF98469 },
	[5] = { ['model'] = "u_m_m_aldinapoli", ['hash'] = 0xF0EC56E2 },
	[6] = { ['model'] = "ig_amandatownley", ['hash'] = 0x6D1E15F7 },
	[7] = { ['model'] = "ig_andreas", ['hash'] = 0x47E4EEA0 },
	[8] = { ['model'] = "csb_anita", ['hash'] = 0x0703F106 },
	[9] = { ['model'] = "u_m_y_antonb", ['hash'] = 0xCF623A2C },
	[10] = { ['model'] = "g_m_y_armgoon_02", ['hash'] = 0xC54E878A },
	[11] = { ['model'] = "ig_ashley", ['hash'] = 0x7EF440DB },
	[12] = { ['model'] = "s_m_m_autoshop_01", ['hash'] = 0x040EABE3 },
	[13] = { ['model'] = "g_m_y_ballaeast_01", ['hash'] = 0xF42EE883 },
	[14] = { ['model'] = "g_m_y_ballaorig_01", ['hash'] = 0x231AF63F },
	[15] = { ['model'] = "s_m_y_barman_01", ['hash'] = 0xE5A11106 },
	[16] = { ['model'] = "u_m_y_baygor", ['hash'] = 0x5244247D },
	[17] = { ['model'] = "a_m_o_beach_01", ['hash'] = 0x8427D398 },
	[18] = { ['model'] = "a_m_y_beachvesp_01", ['hash'] = 0x7E0961B8 },
	[19] = { ['model'] = "ig_bestmen", ['hash'] = 0x5746CD96 },
	[20] = { ['model'] = "a_f_y_bevhills_01", ['hash'] = 0x445AC854 },
}

--[ LOCS ROTA ]----------------------------------------------------------------------------------------------------------------------------

-- LOCALIZAÇÃO PARA PEGAR OS NPCS E ENTREGAR

configtaxi.taxi = {
	[1] = { ['x'] = 151.30, ['y'] = -1028.63, ['z'] = 28.84, ['xp'] = 152.45, ['yp'] = -1041.24, ['zp'] = 29.37, ['h'] = 252.0 },
	[2] = { ['x'] = 423.84, ['y'] = -959.30, ['z'] = 28.81, ['xp'] = 437.37, ['yp'] = -979.03, ['zp'] = 30.68, ['h'] = 271.0 },
	[3] = { ['x'] = 1.03, ['y'] = -1510.86, ['z'] = 29.40, ['xp'] = 20.67, ['yp'] = -1505.62, ['zp'] = 31.85, ['h'] = 319.0 },
	[4] = { ['x'] = -188.07, ['y'] = -1612.28, ['z'] = 33.39, ['xp'] = -189.55, ['yp'] = -1585.80, ['zp'] = 34.76, ['h'] = 178.0 },
	[5] = { ['x'] = 98.88, ['y'] = -1927.16, ['z'] = 20.25, ['xp'] = 101.02, ['yp'] = -1912.35, ['zp'] = 21.40, ['h'] = 70.0 },
	[6] = { ['x'] = 324.43, ['y'] = -1976.27, ['z'] = 23.5, ['xp'] = 324.38, ['yp'] = -1990.93, ['zp'] = 24.17, ['h'] = 321.0 },
	[7] = { ['x'] = 755.53, ['y'] = -2486.26, ['z'] = 19.54, ['xp'] = 774.34, ['yp'] = -2475.07, ['zp'] = 20.14, ['h'] = 356.0 },
	[8] = { ['x'] = 1057.66, ['y'] = -2124.80, ['z'] = 32.20, ['xp'] = 1040.09, ['yp'] = -2115.65, ['zp'] = 32.84, ['h'] = 175.0 },
	[9] = { ['x'] = 1377.08, ['y'] = -1530.01, ['z'] = 56.07, ['xp'] = 1379.33, ['yp'] = -1514.99, ['zp'] = 58.43, ['h'] = 119.0 },
	[10] = { ['x'] = 1260.24, ['y'] = -588.15, ['z'] = 68.53, ['xp'] = 1240.60, ['yp'] = -601.63, ['zp'] = 69.78, ['h'] = 193.0 },
	[11] = { ['x'] = 899.58, ['y'] = -590.58, ['z'] = 56.85, ['xp'] = 886.76, ['yp'] = -608.20, ['zp'] = 58.44, ['h'] = 238.0 },
	[12] = { ['x'] = 945.18, ['y'] = -140.04, ['z'] = 74.07, ['xp'] = 959.34, ['yp'] = -121.23, ['zp'] = 74.96, ['h'] = 60.0 },
	[13] = { ['x'] = 84.44, ['y'] = 476.19, ['z'] = 146.91, ['xp'] = 80.10, ['yp'] = 486.12, ['zp'] = 148.20, ['h'] = 118.0 },
	[14] = { ['x'] = -720.03, ['y'] = 482.23, ['z'] = 107.10, ['xp'] = -721.10, ['yp'] = 489.75, ['zp'] = 109.38, ['h'] = 110.0 },
	[15] = { ['x'] = -1244.39, ['y'] = 497.98, ['z'] = 93.86, ['xp'] = -1229.15, ['yp'] = 515.72, ['zp'] = 95.42, ['h'] = 359.0 },
	[16] = { ['x'] = -1514.99, ['y'] = 442.97, ['z'] = 109.70, ['xp'] = -1495.97, ['yp'] = 437.10, ['zp'] = 112.49, ['h'] = 296.0 },
	[17] = { ['x'] = -1684.14, ['y'] = -308.47, ['z'] = 51.41, ['xp'] = -1684.87, ['yp'] = -291.66, ['zp'] = 51.89, ['h'] = 234.0 },
	[18] = { ['x'] = -1413.14, ['y'] = -531.91, ['z'] = 30.98, ['xp'] = -1447.29, ['yp'] = -537.71, ['zp'] = 34.74, ['h'] = 215.0 },
	[19] = { ['x'] = -1036.80, ['y'] = -492.27, ['z'] = 36.15, ['xp'] = -1007.32, ['yp'] = -486.80, ['zp'] = 39.97, ['h'] = 27.0 },
	[20] = { ['x'] = -551.46, ['y'] = -648.64, ['z'] = 32.73, ['xp'] = -533.39, ['yp'] = -622.87, ['zp'] = 34.67, ['h'] = 92.0 },
	[21] = { ['x'] = -616.30, ['y'] = -920.80, ['z'] = 22.98, ['xp'] = -598.49, ['yp'] = -929.96, ['zp'] = 23.86, ['h'] = 291.0 },
	[22] = { ['x'] = -752.13, ['y'] = -1041.29, ['z'] = 12.25, ['xp'] = -759.21, ['yp'] = -1047.16, ['zp'] = 13.50, ['h'] = 117.0 },
	[23] = { ['x'] = -1155.20, ['y'] = -1413.48, ['z'] = 4.46, ['xp'] = -1150.56, ['yp'] = -1426.38, ['zp'] = 4.95, ['h'] = 247.0 },
	[24] = { ['x'] = -997.88, ['y'] = -1599.65, ['z'] = 4.59, ['xp'] = -989.04, ['yp'] = -1575.82, ['zp'] = 5.17, ['h'] = 271.0 },
	[25] = { ['x'] = -829.38, ['y'] = -1218.09, ['z'] = 6.54, ['xp'] = -822.50, ['yp'] = -1223.35, ['zp'] = 7.36, ['h'] = 319.0 },
	[26] = { ['x'] = -334.47, ['y'] = -1418.13, ['z'] = 29.71, ['xp'] = -320.10, ['yp'] = -1389.73, ['zp'] = 36.50, ['h'] = 91.0 },
	[27] = { ['x'] = 135.28, ['y'] = -1306.46, ['z'] = 28.65, ['xp'] = 132.91, ['yp'] = -1293.90, ['zp'] = 29.26, ['h'] = 119.0 },
	[28] = { ['x'] = -34.00, ['y'] = -1079.86, ['z'] = 26.26, ['xp'] = -39.02, ['yp'] = -1082.46, ['zp'] = 26.42, ['h'] = 69.0 }
}
