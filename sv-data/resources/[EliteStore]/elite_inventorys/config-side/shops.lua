---------------------------------------------------------------------------------------------------------
---------------------------------------- [ elite_inventory ] --------------------------------------------
---------------------------------------------------------------------------------------------------------
shops = {}

shops.props = {
	-- { "prop_vend_coffe_01","sodaMachine" },
	{ "prop_vend_soda_02","sodaMachine" },
	{ "prop_vend_soda_01","sodaMachine" },
	{ "v_ret_247_donuts","donutMachine" },
	{ "prop_burgerstand_01","burgerMachine" },
	{ "prop_vend_coffe_01","coffeeMachine" },
	{ "prop_hotdogstand_01","hotdogMachine" }
}

shops.coords = {
	{ 562.46, 2741.61, 42.87,"pets" },
	{ 25.68,-1346.6,29.5,"departamentStore" },
	{ 2556.47,382.05,108.63,"departamentStore" },
	{ 1163.55,-323.02,69.21,"departamentStore" },
	{ -707.31,-913.75,19.22,"departamentStore" },
	{ -47.72,-1757.23,29.43,"departamentStore" },
	{ 373.89,326.86,103.57,"departamentStore" },
	{ -3242.95,1001.28,12.84,"departamentStore" },
	{ 1729.3,6415.48,35.04,"departamentStore" },
	{ 548.0,2670.35,42.16,"departamentStore" },
	{ 1960.69,3741.34,32.35,"departamentStore" },
	{ 2677.92,3280.85,55.25,"departamentStore" },
	{ 1698.5,4924.09,42.07,"departamentStore" },
	{ -1820.82,793.21,138.12,"departamentStore" },
	{ 1393.21,3605.26,34.99,"departamentStore" },
	{ -2967.78,390.92,15.05,"departamentStore" },
	{ -3040.14,585.44,7.91,"departamentStore" },
	{ 1135.56,-982.24,46.42,"departamentStore" },
	{ 1166.0,2709.45,38.16,"departamentStore" },
	{ -1487.21,-378.99,40.17,"departamentStore" },
	{ -1222.76,-907.21,12.33,"departamentStore" },

	{ 1550.19, 3513.32, 36.01, "Desmanche"}, -- Venda de peças

	{ -631.27, 223.79, 81.89, "lojadecafe"  }, -- Café SHOP

	{ -492.33, -340.85, 42.33, "drugshop"  }, -- "Farmácia"
	{ 317.13, -1077.07, 29.48, "drugshop" }, -- "Farmácia"
	{  92.03, -229.62, 54.67, "drugshop" }, -- "Farmácia"

	{ -38.65, -1660.78, 29.5, "toolshop" }, -- Loja de ferramentas

	{ -561.92, 285.54, 82.18,"pubs" }, -- Tequi-La-La;
	{ -1577.46, -3016.62, -79.0,"pubs" }, -- Galaxy Club;
	{ -1579.81, -3018.51, -79.0, "pubs" }, -- Galaxy Club;
	{ 131.03, -1284.07, 29.28,"pubs" }, -- Vanilla Unicorn;
	{ 736.37, -826.2, 22.67,"pubs" }, -- PixelBar

	{ -620.9,-224.68,38.06,"minerStore" },

	{ 485.82, -1005.72, 25.74,"policearsenal" },

	{ -626.97, -279.08, 35.58,"ifruit" },
	{ -629.15, -275.38, 35.58,"ifruit" },

	{ -2080.47,2610.33,3.09,"contrabandista" },

	{ 1692.62,3759.50,34.70,"ammunationStore" },
	{ 252.89,-49.25,69.94,"ammunationStore" },
	{ 843.28,-1034.02,28.19,"ammunationStore" },
	{ -331.35,6083.45,31.45,"ammunationStore" },
	{ -663.15,-934.92,21.82,"ammunationStore" },
	{ -1305.18,-393.48,36.69,"ammunationStore" },
	{ -1118.80,2698.22,18.55,"ammunationStore" },
	{ 2568.83,293.89,108.73,"ammunationStore" },
	{ -3172.68,1087.10,20.83,"ammunationStore" },
	{ 21.32,-1106.44,29.79,"ammunationStore" },
	{ 811.19,-2157.67,29.61,"ammunationStore" },

	{ 1169.37, -296.81, 69.1,"marketstore" },
	{ -1816.33, -1193.4, 14.31, "pescador"},
	{ 793.83,2162.96,53.1,"itensilegais"},

	{ 112.8, -141.56, 54.87,"CoinsCarImports" },
	{ 119.44, -140.27, 54.85,"CoinsCarImports1" },
	{ 128.88, -152.38, 54.87,"CoinsCarPremium" },
	{ 136.75, -155.25, 54.86,"CoinsCarLendars" },
	{ 144.6, -158.47, 54.86,"CoinsBarco" },
	{ 142.42, -162.82, 54.79,"CoinsHeli" },
	{ -1083.12, -248.23, 37.77,"CoinsGroup" },
	{ -1081.0, -247.25, 37.77,"CoinsItem" },
	
}

shops.list = {
	["megaMallStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["notepad"] = 20,
			["emptybottle"] = 40,
			["cigarette"] = 75,
			["lighter"] = 300,
			-- ["sandwich"] = 18,
			-- ["cola"] = 18,
			["teddy"] = 500,
			["rose"] = 50,
			-- ["bucket"] = 200,
			-- ["compost"] = 10,
			-- ["cannabisseed"] = 10,
			-- ["silk"] = 3,
			["plastic"] = 300,
			["glass"] = 300,
			["rubber"] = 300,
			["aluminum"] = 300,
			["copper"] = 300,
			["paperbag"] = 50,
			-- ["credential"] = 500,
			["firecracker"] = 1000
		}
	},
	
	["pescador"] = {
        ["mode"] = "Sell",
        ["type"] = "Cash",
        ["list"] = {
            ["dourado"] = 240,
            ["corvina"] = 210,
            ["salmao"] = 220,
            ["pacu"] = 210,
            ["pintado"] = 210,
            ["pirarucu"] = 225,
            ["tilapia"] = 215,
            ["tucunare"] = 210,
            ["lambari"] = 650
        }
    },

	["departamentStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			['agua'] = 700,
			['leite'] = 400,
			['sprunk'] = 400,
			['cola'] = 400,
			['hotdog'] = 300,
			['xburguer'] = 300,
			['chips'] = 100,
			['batataf'] = 300,
			['pizza'] = 400,
			['frango'] = 300,
			['bcereal'] = 150,
			['bchocolate'] = 150,
			['taco'] = 400,
			["roupas"] = 10000,
		}
	},
	
	["ifruit"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["celular"] = 4000,
			["radio"] = 4000,
			["maquininha"] = 10000,
			["cartao-debito"] = 1500,
		}
	},

	["pets"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["husky"] = 40000,
			["pug"] = 50000,
			["rottweiler"] = 35000,
			["shepherd"] = 51500,
			["westy"] = 50000,
			["poodle"] = 45000,
			["retriever"] = 25000,
			["cat"] = 25000,
		}
	},

	['pubs'] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["pibwassen"] = 130,
			["tequilya"] = 300,
			["patriot"] = 90,
			["blarneys"] = 130,
			["jakeys"] = 300,
			["barracho"] = 90,
			["ragga"] = 130,
			["nogo"] = 300,
			["mount"] = 90,
			["cherenkov"] = 130,
			["bourgeoix"] = 300,
			["bleuterd"] = 90,
		}
	},

	["policearsenal"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "policia.permissao",
		["list"] = {
			["WEAPON_COMBATPISTOL"] = 800,
			["WEAPON_STUNGUN"] = 0,
			["WEAPON_NIGHTSTICK"] = 0,
			["WEAPON_FLASHLIGHT"] = 0,
			["WEAPON_SMG"] = 1000,
			["WEAPON_SMG_MK2"] = 1000,
			["WEAPON_COMBATPDW"] = 1000,
			["WEAPON_CARBINERIFLE"] = 1800,
			["WEAPON_SPECIALCARBINE"] = 1800,
			["WEAPON_MICROSMG"] = 1800,
			["WEAPON_PUMPSHOTGUN_MK2"] = 2000,
			["WEAPON_SMG_AMMO"] = 20,
			["WEAPON_PISTOL_AMMO"] = 10,
			["WEAPON_SHOTGUN_AMMO"] = 50,
			["WEAPON_RIFLE_AMMO"] = 50,
			["colete"] = 2000,
		}
	},
	["ammunationStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			-- ["colete"] = 5000,
			["WEAPON_DAGGER"] = 5000,
			["WEAPON_BAT"] = 5000,
			["WEAPON_BOTTLE"] = 8000,
			["WEAPON_CROWBAR"] = 1000,
			["WEAPON_GOLFCLUB"] = 9000,
			["WEAPON_HAMMER"] = 6000,
			["WEAPON_HATCHET"] = 9000,
			["WEAPON_KNUCKLE"] = 4000,
			["WEAPON_KNIFE"] = 6000,
			["WEAPON_MACHETE"] = 5000,
			["WEAPON_SWITCHBLADE"] = 8000,
			["WEAPON_WHENCH"] = 9000,
			-- ["WEAPON_BATTLEAXE"] = 7000,
			["WEAPON_POOLCUE"] = 7000,
			["WEAPON_STONE_HATCHET"] = 9000,
			["GADGET_PARACHUTE"] = 5000,
		}
	},
	["minerStore"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["minerio-prata"] = 700,
			["minerio-ouro"] = 1000,
			["minerio-diamante"] = 1500,
		}
	},

	["contrabandista"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["alvejante"] = 2000,
			["corpo-doze"] = 84000,
			["corpo-sub"] = 84000,
			["corpo-pistola"] = 50000,
			["corpo-fuzil"] = 100000,
			["placa-aluminio"] = 1000,
			["capuz"] = 10000,
			["algema"] = 10000,
		}
	},

	['toolshop'] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["garrafa-vazia"] = 200,
			["caixa-vazia"] = 120,
			["ponta-britadeira"] = 200,
			["paninho"] = 1000,
			["isca"] = 50,
			["repairkit"] = 6000,
			["pa-jardinagem"] = 1000,
			["furadeira"] = 4000,
			["binoculos"] = 5000,
			["mochila"] = 25000,
			["WEAPON_HAMMER"] = 1000,
			["WEAPON_CROWBAR"] = 1000,
			["WEAPON_HATCHET"] = 1000,
			["WEAPON_BATTLEAXE"] = 1000,
		}
	},

	['drugshop'] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["dorflex"] = 130,
			["tandrilax"] = 5000,
			["hirudoid"] = 800,
			["nebacetin"] = 90,
			["dipirona"] = 130,
			["xarelto"] = 800,
			["bandagem"] = 15000,

		}
	},

	["itensilegais"] = {
        ["mode"] = "Sell",
        ["type"] = "Cash",
        ["list"] = {
            ["relogioroubado"] = 15000,
            ["pulseiraroubada"] = 15000,
            ["colarroubado"] = 15000,
            ["anelroubado"] = 15000,
            ["brincoroubado"] = 15000,
            ["carteiraroubada"] = 5000,
            ["carregadorroubado"] = 5000,
            ["tabletroubado"] = 5000,
            ["sapatosroubado"] = 5000,
            ["vibradorroubado"] = 5000,
            ["perfumeroubado"] = 5000,
            ["maquiagemroubada"] = 5000,
            ["etiqueta"] = 5000
        }
    },

	["Desmanche"] = {
        ["mode"] = "Sell",
        ["type"] = "BlackCash",
        ["perm"] = "thelost.permissao",
        ["list"] = {
			["motorcarro"] = 3000,
            ["volante"] = 3000,
            ["rodacarro"] = 3000,
            ["portacarro"] = 2000,
            ["placa"] = 1000,
			
			["motorcarroimport"] = 6000,
            ["volanteimport"] = 4000,
            ["rodacarroimport"] = 5000,
            ["portacarroimport"] = 8000,
			
			["motorcarroexclusive"] = 10000,
            ["volanteexclusive"] = 8000,
            ["rodacarroexclusive"] = 5000,
            ["portacarroexclusive"] = 6000,

			-----------
			
            ["motormoto"] = 3000,
            ["discofreio"] = 3000,
            ["rodamoto"] = 3000,
            ["parachoque"] = 3000,

            ["motormotoimport"] = 6000,
            ["discofreioimport"] = 6000,
            ["rodamotoimport"] = 6000,

            ["motormotoexclusive"] = 8000,
            ["discofreioexclusive"] = 8000,
            ["rodamotoexclusive"] = 8000,
        }
		
    },

	----- [MÁQUINAS AUTOMÁTICAS ] ----------

	["sodaMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["sprunk"] = 300,
			["agua"] = 300,
			["cola"] = 150,
		}
	},
	["burgerMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["sanduiche"] = 25,
		}
	},
	["donutMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["rosquinha"] = 25,
		}
	},
	["hotdogMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["hotdog"] = 18,
		}
	},
	["coffeeMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["cafecleite"] = 400,
			["cafe"] = 300,
			["cafeexpresso"] = 500,
			["capuccino"] = 600,
		}
	},

	['lojadecafe'] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "cafeteria.permissao",
		["list"] = {
			["cafe"] = 100,
			["cafecleite"] = 100,
			["cafeexpresso"] = 100,
			["capuccino"] = 100,
			["frappuccino"] = 100,
			["coldbrew"] = 100,
			["chapreto"] = 100,
			["chaverde"] = 100,
			["chadecamomila"] = 100,
			["cha"] = 100,
			["chadehortela"] = 100,
			["icecha"] = 100,
			["sanduiche"] = 100,
			["rosquinha"] = 100,
			["bolococolate"] = 100,
			["bolodemorango"] = 100,
			["tortagelada"] = 100,
			["cookie"] = 100,
			["palhaitaliana"] = 100,
			["coxinha"] = 100,
			["ovocbacon"] = 100,
			["torrada"] = 100,
			["croissant"] = 100,
			["salada"] = 100,

		}
	},
	
	["CoinsCarImports"] = {
		["mode"] = "Buy",
		["type"] = "CoinsCar",
		["list"] = {
			["19ftype"] = 1000,
            ["19ramdonk"] = 1000,
            ["70camarofn"] = 1000,
            ["71gtx"] = 1000,
            ["180sx"] = 1000,
            ["240sx"] = 1000,
            ["350z"] = 1000,
            ["abarth695"] = 1000,
            ["amcdefiant"] = 1000,
            ["astonmartinvantage"] = 1000,
            ["audirs6"] = 1000,
            ["bacalar"] = 1000,
            ["bbentayga"] = 1000,
            ["bentleygt"] = 1000,
            ["bme6tun"] = 1000,
            ["bmwm3f80"] = 1000,
            ["bmwm3gtr"] = 1000,
            ["bmwm4gts"] = 1000,
            ["bmwm5e34"] = 1000,
            ["bmwm5f90"] = 1000,
            ["bmwm8"] = 1000,
            ["c7"] = 1000,
            ["c63amg"] = 1000,
            ["c63b"] = 1000,
            ["camarozl1"] = 1000,
            ["caravan"] = 1000,
            ["vwamarok"] = 1000,
            ["vwfox"] = 1000,
            ["vwfusca"] = 1000,
            ["vwgol"] = 1000,
            ["vwgolfgti"] = 1000,
            ["vwgolfmk7"] = 1000,
            ["compass"] = 1000,
            ["db11"] = 1000,
            ["chevroletcamarozl1"] = 1000,
            ["dbs"] = 1000,
            ["dodgechallenger"] = 800,
            ["dodgecharger"] = 800,
            ["dodgeram2500"] = 800,
            ["eclipse"] = 800,
            ["eg6"] = 800,
            ["escort"] = 600,
            ["escortrs"] = 600,
            ["ferrari458"] = 1000,
            ["ferrari812"] = 1000,
            ["ferrarif12tdf"] = 1000,
			["hondafk8"] = 1000,
			["cb500x"] = 1000,
			["hondacbr650r"] = 1000,
		}
	},

	["CoinsCarImports1"] = {
		["mode"] = "Buy",
		["type"] = "CoinsCar",
		["list"] = {
			["ferrariitalia"] = 1000,
            ["ferrarif40"] = 1000,
            ["filthynsx"] = 1000,
            ["fordfocusrs"] = 600,
            ["fordmustang"] = 1000,
            ["fordraptor2017"] = 1000,
            ["fordshelby"] = 1000,
            ["gt17"] = 1000,
            ["gt63"] = 1000,
            ["harleydavidsonfx"] = 600,
            ["harleydavidsonrg"] = 600,
            ["hondacivic2000"] = 1000,
            ["ie"] = 1000,
            ["jeepgladiator"] = 1000,
            ["jeepcherokee"] = 1000,
            ["kombi"] = 600,
            ["lancerevolution9"] = 1000,
            ["lancerevolutionx"] = 1000,
            ["lexuslfa"] = 1000,
            ["lp6504"] = 1000,
            ["m2"] = 1000,
            ["m6e63"] = 1000,
            ["mazdarx7"] = 1000,
            ["mercedesg65"] = 1000,
            ["mercedess63"] = 1000,
            ["monza"] = 600,
            ["mustangeleanor"] = 1000,
            ["mustangmach1"] = 1000,
            ["nissan370z"] = 1000,
            ["nissantitan17"] = 1000,
            ["opalass"] = 600,
            ["porsche930"] = 1000,
            ["porschemacan"] = 1000,
            ["r32"] = 1000,
            ["r33"] = 1000,
            ["rangerovervelar"] = 1000,
            ["rr14"] = 1000,
            ["s15"] = 1000,
            ["s600"] = 1000,
            ["silv86"] = 1000,
            ["subarubrz"] = 1000,
            ["subaruwrx2004"] = 1000,
            ["toyotasupra"] = 1000,
            ["viper"] = 1000,
            ["tonkat"] = 1000,
		}
	},
	
	["CoinsCarPremium"] = {
		["mode"] = "Buy",
		["type"] = "CoinsCar",
		["list"] =	{
			["488"] = 1950,
            ["570s"] = 1950,
            ["675lt"] = 1950,
            ["720s"] = 1950,
            ["911r"] = 1950,
            ["918"] = 1950,
            ["918spyder"] = 1950,
            ["auditt"] = 1950,
            ["audir8"] = 1950,
            ["bugattichiron"] = 1950,
            ["bmwz4"] = 1950,
            ["boxster"] = 1950,
            ["vwjetta"] = 1950,
            ["mclarensenna"] = 1950,
            ["mercedesamggtr"] = 1950,
            ["mercedesa45"] = 1950,
            ["trucksub"] = 1950,
            ["mercedesslsamg"] = 1950,
            ["nissangtr"] = 1950,
            ["nissangtrnismo"] = 1950,
            ["nisanssilvias15"] = 1950,
            ["nissanskyliner34"] = 1950,
            ["p1"] = 1950,
            ["panamera"] = 1950,
            ["porsche992"] = 1950,
            ["rmodamgc63"] = 1950,
            ["rrghost"] = 1950,
            ["rs6"] = 1950,
            ["teslamodelx"] = 1950,
            ["teslaprior"] = 1950,
            ["toyotasupragr"] = 1950,
            ["africat"] = 1950,
            ["yamahar1"] = 1950,
            ["urus"] = 1950,
            ["corvettec8"] = 1950,
            ["ferraricalifornia"] = 1950,
            ["gtr50"] = 1950,
            ["mercedescla45"] = 1950,
            ["laferrari"] = 1950,
            ["lamborghinievo"] = 1950,
            ["lamborghinigallardo"] = 1950,
            ["lamborghinihuracan"] = 1950,
            ["i8"] = 1950,
            ["audirs7"] = 1950,
            ["lp670"] = 1950,
            ["lp700r"] = 1950,
		}
	},

	["CoinsCarLendars"] = {
		["mode"] = "Buy",
		["type"] = "CoinsCar",
		["list"] = {
            ["bolide"] = 2500,
            ["c7r"] = 2500,
            ["bugattichiron"] = 2500,
            ["essenza"] = 2500,
            ["fxxkevo"] = 2500,
            ["lamtmc"] = 2500,
            ["jesko"] = 2500,
            ["p1gtr"] = 2500,
            ["regera"] = 2500,
            ["rmodbugatti"] = 2500,
            ["sian"] = 2500,
            ["skyr34"] = 2500,
            ["speedtail"] = 2500,
            ["supragr"] = 2500,
            ["bmwm8gte"] = 2500,
            ["bmwi8"] = 2500,
		}
	},
	
	["CoinsHeli"] = {
		["mode"] = "Buy",
		["type"] = "CoinsCar",
		["list"] = {
            ["buzzard2"] = 3000,
			["frogger"] = 3000,
			["seasparrow"] = 3000,
            ["supervolito"] = 3000,
			["supervolito2"] = 3000,
            ["swift"] = 3000,
            ["swift2"] = 3000,
            ["volatus"] = 3000,
            ["swift"] = 3000,
		}
	},

	["CoinsBarco"] = {
		["mode"] = "Buy",
		["type"] = "CoinsCar",
		["list"] = {
            ["speeder"] = 1000,
			["seashark3"] = 1000,
			["seashark2"] = 1000,
            ["longfin"] = 1000,
			["squalo"] = 1000,
            ["speeder2"] = 1000,
            ["tropic2"] = 1000,
            ["tropic"] = 1000,
            ["toro"] = 1000,
            ["toro2"] = 1000,
            ["marquis"] = 1000,
            ["jetmax"] = 1000,
		}
	},

	["CoinsGroup"] = {
		["mode"] = "Buy",
		["type"] = "CoinsGroup",
		["list"] = {
			["Ultimate"] = 8000,
			["Diamante"] = 6000,
			["Platina"] = 4500,
			["Ouro"] = 3500,
			["Prata"] = 2500,
			["Bronze"] = 1500,
		}
	},
	
	["CoinsItem"] = {
		["mode"] = "Buy",
		["type"] = "CoinsItem",
		["list"] = {
			["dinheiro"] = 6,
			["dinheiro-sujo"] = 3,
			["silenciador"] = 15,
			["pente"] = 12,
			["empunhadura"] = 9,
			["mira"] = 8,
			["lanterna"] = 8,
			["spray"] = 8,
			["celular"] = 2,
			["radio"] = 2,
			["roupas"] = 2,
			["repairkit"] = 2,
			["algema"] = 2,
			["capuz"] = 2,
			["lockpick"] = 8,
			["agua"] = 2,
			["sanduiche"] = 3,
			["WEAPON_ASSAULTRIFLE"] = 1000,
			["WEAPON_ASSAULTSMG"] = 800,
			["WEAPON_COMBATPISTOL"] = 500,
		}
	},
}
