---------------------------------------------------------------------------------------------------------
---------------------------------------- [ SCRIPT jobs_gerais ] -----------------------------------------
---------------------------------------------------------------------------------------------------------

texto = "~g~[EMPREGOS]\n~w~PRESSIONE ~r~[E]~w~ INICIAR EXPEDIENTE" -- O que aparece em 3D no "BLIP"

jobs = {}

local empmultiplier = 1.0  ---- MULTIPLICADOR GERAL DE PAGAMENTOS

jobs.motorista = { 35*empmultiplier, 50*empmultiplier } --- VALOR POR ROTA

jobs.farmer = { 200*empmultiplier, 250*empmultiplier } --- VALOR POR ENTREGA

jobs.lixeiro = { 200*empmultiplier, 300*empmultiplier } --- VALOR POR SACO DE LIXO

jobs.lenhador = { 200*empmultiplier, 250*empmultiplier }  --- VALOR POR ENTREGA

jobs.milkman = { 255*empmultiplier, 255*empmultiplier }  --- VALOR POR ENTREGA

jobs.sedex = { 350*empmultiplier, 550*empmultiplier }  --- VALOR POR ENTREGA

jobs.caminhao = { 55*empmultiplier, 55*empmultiplier }  --- VALOR POR ENTREGA

jobs.taxi = { 250*empmultiplier, 250*empmultiplier }  --- VALOR POR PASSAGEIRO

jobs.trucker = {
	["diesel"] = {
		[1] = { pay = math.random(6250*empmultiplier,6750*empmultiplier) },
		[2] = { pay = math.random(6250*empmultiplier,6750*empmultiplier) },
		[3] = { pay = math.random(6250*empmultiplier,6750*empmultiplier) },
		[4] = { pay = math.random(6350*empmultiplier,7000*empmultiplier) },
		[5] = { pay = math.random(9500*empmultiplier,9700*empmultiplier) },
		[6] = { pay = math.random(5560*empmultiplier,5850*empmultiplier) }
	},
	["gasolina"] = {
		[1] = { pay = math.random(7500*empmultiplier,7800*empmultiplier) },
		[2] = { pay = math.random(4800*empmultiplier,5200*empmultiplier) },
		[3] = { pay = math.random(2900*empmultiplier,3300*empmultiplier) },
		[4] = { pay = math.random(2550*empmultiplier,2800*empmultiplier) },
		[5] = { pay = math.random(1900*empmultiplier,2100*empmultiplier) },
		[6] = { pay = math.random(2500*empmultiplier,2650*empmultiplier) },
		[7] = { pay = math.random(4800*empmultiplier,4950*empmultiplier) }
	},
	["carros"] = {
		[1] = { pay = math.random(3600*empmultiplier,3800*empmultiplier) },
		[2] = { pay = math.random(2600*empmultiplier,2700*empmultiplier) },
		[3] = { pay = math.random(3300*empmultiplier,3350*empmultiplier) },
		[4] = { pay = math.random(2800*empmultiplier,2950*empmultiplier) },
		[5] = { pay = math.random(5750*empmultiplier,5950*empmultiplier) },
		[6] = { pay = math.random(2600*empmultiplier,2750*empmultiplier) }
	},
	["madeira"] = {
		[1] = { pay = math.random(9250*empmultiplier,9800*empmultiplier) },
		[2] = { pay = math.random(4320*empmultiplier,4520*empmultiplier) },
		[3] = { pay = math.random(2250*empmultiplier,2650*empmultiplier) },
		[4] = { pay = math.random(3300*empmultiplier,3500*empmultiplier) }
	},
	["show"] = {
		[1] = { pay = math.random(6400*empmultiplier,6600*empmultiplier) },
		[2] = { pay = math.random(3700*empmultiplier,3950*empmultiplier) },
		[3] = { pay = math.random(4000*empmultiplier,4300*empmultiplier) },
		[4] = { pay = math.random(2300*empmultiplier,2350*empmultiplier) }
	}
}