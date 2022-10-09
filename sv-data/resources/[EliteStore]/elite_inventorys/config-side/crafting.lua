---------------------------------------------------------------------------------------------------------
----------------------------------------[ SCRIPT vrp_crafting ]------------------------------------------
---------------------------------------------------------------------------------------------------------
craft = {}

craft.list = {
	["Merryweather"] = {
        ['coords'] = { {-61.7, 504.67, 144.57} },
        ['text'] = "Mesa de Trabalho",
		["perm"] = "mw.permissao",
		['skillbar'] = false,
		["list"] = {
			["WEAPON_PISTOL_AMMO"] = {
				["amount"] = 100,
				["destroy"] = true,
				["require"] = {
					["capsulas"] = 20,
					["polvora"] = 20,
				}
			},
			["WEAPON_SMG_AMMO"] = {
				["amount"] = 100,
				["destroy"] = true,
				["require"] = {
					["capsulas"] = 30,
					["polvora"] = 30,
				}
			},
			["WEAPON_GUSENBERG_AMMO"] = {
				["amount"] = 100,
				["destroy"] = true,
				["require"] = {
					["capsulas"] = 30,
					["polvora"] = 30,
				}
			},
			["WEAPON_SHOTGUN_AMMO"] = {
				["amount"] = 100,
				["destroy"] = true,
				["require"] = {
					["capsulas"] = 30,
					["polvora"] = 30,
				}
			},
			["WEAPON_RIFLE_AMMO"] = {
				["amount"] = 100,
				["destroy"] = true,
				["require"] = {
					["capsulas"] = 40,
					["polvora"] = 40,
				}
			},
		}
	},
	["minerCrafting"] = {
        ['coords'] = { {1084.88, -2002.33, 31.43} },
        ['text'] = "Fundir",
		['skillbar'] = false,
		["list"] = {
			["diamante"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["minerio-diamante"] = 3,
				}
			},
			["barra-ouro"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["minerio-ouro"] = 3,
				}
			},
			["barra-prata"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["minerio-prata"] = 3,
				}
			},
			["barra-ferro"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["minerio-ferro"] = 3,
				}
			},
		}
	},
	["mcCrafting"] = {
        ['coords'] = { {987.87, -137.57, 73.1} },
        ['text'] = "Mesa de Trabalho",
		['skillbar'] = false,
		["perm"] = "thelost.permissao",
		["list"] = {
			["colete"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["paninho"] = 2,
					["aco"] = 2,
				}
			},
			["placa-clonada"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["barra-ferro"] = 2,
					["aco"] = 2,
				}
			},
			
		}
	},
	["Laranjas"] = {
        ['coords'] = { {974.48, -1844.44, 26.41} },
        ['text'] = "Mesa de Trabalho",
		['skillbar'] = false,
		["perm"] = "laranjas.permissao",
		["list"] = {
			["colete"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["paninho"] = 2,
					["aco"] = 2,
				}
			},
			["placa-"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["barra-ferro"] = 1,
					["aco"] = 1,
				}
			},
			
		}
	},
	["Mafia"] = {
        ['coords'] = { {1405.86, 1138.05, 109.75} }, -- 1405.86, 1138.05, 109.75 -- -1870.16, 2061.89, 135.44
        ['text'] = "Mesa de Trabalho",
		['skillbar'] = false,
		["perm"] = "mafia.permissao",
		["list"] = {
			["WEAPON_MINISMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["corpo-sub"] = 1,
					["molas"] = 8,
					["placa-metal"] = 20,
					["gatilho"] = 6,
				}
		},
		   ["WEAPON_PISTOL_MK2"] = {
			   ["amount"] = 1,
			   ["destroy"] = true,
			   ["require"] = {
				   ["corpo-pistola"] = 1,
				   ["molas"] = 4,
				   ["placa-metal"] = 10,
				   ["gatilho"] = 4,
			   }
		   },
		   ["WEAPON_ASSAULTSMG"] = {
			   ["amount"] = 1,
			   ["destroy"] = true,
			   ["require"] = {
				   ["corpo-sub"] = 1,
				   ["molas"] = 6,
				   ["placa-metal"] = 15,
				   ["gatilho"] = 6,
			   }
		   },
		   ["WEAPON_GUSENBERG"] = {
			   ["amount"] = 1,
			   ["destroy"] = true,
			   ["require"] = {
				   ["corpo-sub"] = 1,
				   ["molas"] = 6,
				   ["placa-metal"] = 15,
				   ["gatilho"] = 6,
			   }
		   },
		   ["WEAPON_SAWNOFFSHOTGUN"] = {
			   ["amount"] = 1,
			   ["destroy"] = true,
			   ["require"] = {
				   ["corpo-doze"] = 1,
				   ["molas"] = 6,
				   ["placa-metal"] = 20,
				   ["gatilho"] = 6,
			   }
		   },
		   ["WEAPON_ASSAULTRIFLE"] = {
			   ["amount"] = 1,
			   ["destroy"] = true,
			   ["require"] = {
				   ["corpo-fuzil"] = 1,
				   ["molas"] = 12,
				   ["placa-metal"] = 35,
				   ["gatilho"] = 12,
			   }
		   },
			["WEAPON_ASSAULTRIFLE_MK2"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["corpo-fuzil"] = 1,
					["molas"] = 12,
					["placa-metal"] = 35,
					["gatilho"] = 12,
				}
			},
			["WEAPON_MACHINEPISTOL"] = {
			   ["amount"] = 1,
			   ["destroy"] = true,
			   ["require"] = {
				   ["corpo-sub"] = 1,
				   ["molas"] = 16,
				   ["placa-metal"] = 35,
				   ["gatilho"] = 16,
			   }
		   },
		   ["WEAPON_COMPACTRIFLE"] = {
			   ["amount"] = 1,
			   ["destroy"] = true,
			   ["require"] = {
				   ["corpo-fuzil"] = 1,
				   ["molas"] = 24,
			       ["placa-metal"] = 45,
				   ["gatilho"] = 24,
			   }
		   },
		   ["WEAPON_MICROSMG"] = {
			   ["amount"] = 1,
			   ["destroy"] = true,
			   ["require"] = {
				   ["corpo-sub"] = 1,
				   ["molas"] = 24,
				   ["placa-metal"] = 40,
				   ["gatilho"] = 24,
			   }
		   },
		   ["corpo-fuzil"] = {
			   ["amount"] = 1,
			   ["destroy"] = true,
			   ["require"] = {
				   ["peca-de-arma"] = 40,
			   }
		   },
		   ["corpo-sub"] = {
			   ["amount"] = 1,
			   ["destroy"] = true,
			   ["require"] = {
				   ["peca-de-arma"] = 20,
			   }
		   },
		   ["corpo-pistola"] = {
			   ["amount"] = 1,
			   ["destroy"] = true,
			   ["require"] = {
				   ["peca-de-arma"] = 10,
			   }
		   },
		   ["corpo-doze"] = {
			   ["amount"] = 1,
			   ["destroy"] = true,
			   ["require"] = {
				   ["peca-de-arma"] = 30,
			   }
		   },
	   }
    },
	["PlaboyCrafting"] = {
        ['coords'] = { 
			{-1518.39, 125.56, 48.66} 
		},
        ['text'] = "Mesa de Trabalho",
		['skillbar'] = false,
		["perm"] = "playboy.permissao",
		["list"] = {
			 ["WEAPON_MINISMG"] = {
			 	["amount"] = 1,
			 	["destroy"] = true,
			 	["require"] = {
			 		["corpo-pistola"] = 8,
			 		["molas"] = 8,
			 		["placa-metal"] = 20,
			 		["gatilho"] = 6,
			 	}
		 },
			["WEAPON_PISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["corpo-pistola"] = 1,
					["molas"] = 4,
					["placa-metal"] = 10,
					["gatilho"] = 4,
				}
			},
			["WEAPON_ASSAULTSMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["corpo-sub"] = 1,
					["molas"] = 6,
					["placa-metal"] = 15,
					["gatilho"] = 6,
				}
			},
			["WEAPON_GUSENBERG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["corpo-sub"] = 1,
					["molas"] = 6,
					["placa-metal"] = 15,
					["gatilho"] = 6,
				}
			},
			["WEAPON_SAWNOFFSHOTGUN"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["corpo-doze"] = 1,
					["molas"] = 6,
					["placa-metal"] = 20,
					["gatilho"] = 6,
				}
			},
			["WEAPON_ASSAULTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["corpo-fuzil"] = 1,
					["molas"] = 12,
					["placa-metal"] = 35,
					["gatilho"] = 12,
				}
			},
			 ["WEAPON_ASSAULTRIFLE_MK2"] = {
			 	["amount"] = 1,
			 	["destroy"] = true,
			 	["require"] = {
			 		["corpo-fuzil"] = 1,
			 		["molas"] = 12,
			 		["placa-metal"] = 35,
			 		["gatilho"] = 12,
			 	}
			 },
			 ["WEAPON_MACHINEPISTOL"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["corpo-sub"] = 1,
					["molas"] = 16,
					["placa-metal"] = 35,
					["gatilho"] = 16,
				}
			},
			["WEAPON_COMPACTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["corpo-fuzil"] = 1,
					["molas"] = 24,
					["placa-metal"] = 45,
					["gatilho"] = 24,
				}
			},
			["WEAPON_MICROSMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["corpo-sub"] = 1,
					["molas"] = 24,
					["placa-metal"] = 40,
					["gatilho"] = 24,
				}
			},
			["corpo-fuzil"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["peca-de-arma"] = 40,
				}
			},
			["corpo-sub"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["peca-de-arma"] = 20,
				}
			},
			["corpo-pistola"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["peca-de-arma"] = 10,
				}
			},
			["corpo-doze"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["peca-de-arma"] = 30,
				}
			},
		}
	},
	["Vagos"] = {
        ['coords'] = { 
			{2039.11, 478.35, 170.98} 
		},
        ['text'] = "Mesa de Trabalho",
		['skillbar'] = false,
		["perm"] = "vagos.permissao",
		["list"] = {
			 ["WEAPON_MINISMG"] = {
			 	["amount"] = 1,
			 	["destroy"] = true,
			 	["require"] = {
			 		["corpo-pistola"] = 8,
			 		["molas"] = 8,
			 		["placa-metal"] = 20,
			 		["gatilho"] = 6,
			 	}
		 },
			["WEAPON_PISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["corpo-pistola"] = 1,
					["molas"] = 4,
					["placa-metal"] = 10,
					["gatilho"] = 4,
				}
			},
			["WEAPON_ASSAULTSMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["corpo-sub"] = 1,
					["molas"] = 6,
					["placa-metal"] = 15,
					["gatilho"] = 6,
				}
			},
			["WEAPON_GUSENBERG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["corpo-sub"] = 1,
					["molas"] = 6,
					["placa-metal"] = 15,
					["gatilho"] = 6,
				}
			},
			["WEAPON_SAWNOFFSHOTGUN"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["corpo-doze"] = 1,
					["molas"] = 6,
					["placa-metal"] = 20,
					["gatilho"] = 6,
				}
			},
			["WEAPON_ASSAULTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["corpo-fuzil"] = 1,
					["molas"] = 12,
					["placa-metal"] = 35,
					["gatilho"] = 12,
				}
			},
			 ["WEAPON_ASSAULTRIFLE_MK2"] = {
			 	["amount"] = 1,
			 	["destroy"] = true,
			 	["require"] = {
			 		["corpo-fuzil"] = 1,
			 		["molas"] = 12,
			 		["placa-metal"] = 35,
			 		["gatilho"] = 12,
			 	}
			 },
			 ["WEAPON_MACHINEPISTOL"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["corpo-sub"] = 1,
					["molas"] = 16,
					["placa-metal"] = 35,
					["gatilho"] = 16,
				}
			},
			["WEAPON_COMPACTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["corpo-fuzil"] = 1,
					["molas"] = 24,
					["placa-metal"] = 45,
					["gatilho"] = 24,
				}
			},
			["WEAPON_MICROSMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["corpo-sub"] = 1,
					["molas"] = 24,
					["placa-metal"] = 40,
					["gatilho"] = 24,
				}
			},
			["corpo-fuzil"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["peca-de-arma"] = 40,
				}
			},
			["corpo-sub"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["peca-de-arma"] = 20,
				}
			},
			["corpo-pistola"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["peca-de-arma"] = 10,
				}
			},
			["corpo-doze"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["peca-de-arma"] = 30,
				}
			},
		}
	},
	["Vermelhos"] = {
        ['coords'] = { 
			{1272.48, -125.84, 87.63},
			{1271.86, -127.41, 87.66},
		},
		['skillbar'] = false,
        ['text'] = "Mesa de Trabalho",
		["perm"] = "vermelhos.permissao",
		["list"] = {
			["maconha"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["folha-marijuana"] = 3,
				}
			},
			["baseado"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["maconha"] = 3,
					["seda"] = 3,
				}
			},
		}
	},
	-- ["Roxos"] = {
    --     ['coords'] = { 
	-- 		{2039.29, 478.48, 170.98}, 
	-- 		{2037.45, 478.39, 170.98}, 
	-- 	},
	-- 	['skillbar'] = false,
    --     ['text'] = "Mesa de Trabalho",
	-- 	["perm"] = "roxos.permissao",
	-- 	["list"] = {
	-- 		["cocaina"] = {
	-- 			["amount"] = 3,
	-- 			["destroy"] = true,
	-- 			["require"] = {
	-- 				["pasta-base"] = 3,
	-- 			}
	-- 		},
	-- 		["cocaina-embalada"] = {
	-- 			["amount"] = 3,
	-- 			["destroy"] = true,
	-- 			["require"] = {
	-- 				["cocaina"] = 3,
	-- 				["ziplock"] = 3,
	-- 			}
	-- 		},
	-- 	}
	-- },
	["Azuis"] = {
        ['coords'] = { 
			{822.57, 1062.91, 292.61},
			{822.57, 1061.21, 292.59},
		},
		['skillbar'] = false,
        ['text'] = "Mesa de Trabalho",
		["perm"] = "azuis.permissao",
		["list"] = {
			["lsd"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["ergolina"] = 3,
				}
			},
			["lsdselo"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["lsd"] = 3,
					["folhadeselo"] = 3,
				}
			},
		}
	},
	["Verdes"] = {
        ['coords'] = { 
			{803.2, -291.92, 69.48},
			{801.65, -293.54, 69.46},
		},
		['skillbar'] = false,
        ['text'] = "Mesa de Trabalho",
		["perm"] = "verdes.permissao",
		["list"] = {
			["cristal-metanfetamina"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["composito"] = 3,
				}
			},
			["metanfetamina"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["cristal-metanfetamina"] = 3,
					["acido"] = 3,
				}
			},
		}
	},
	["Mecanicos"] = {
        ['coords'] = { 
			{-196.6, -1318.39, 31.09},
		},
		['skillbar'] = false,
        ['text'] = "Mesa de Trabalho",
		["perm"] = "mecanico.permissao",
		["list"] = {
			["ticket-corrida"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["papelada"] = 3,
					["tinta"] = 3,
				}
			},
		}
	},
	["iaacraft"] = {
        ['coords'] = { 
			{ 713.29, -972.19, 30.4 },
		},
		['skillbar'] = false,
        ['text'] = "Mesa de Trabalho",
		["perm"] = "iaa.permissao",
		["list"] = {
			["silenciador"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aco"] = 2,
					["barra-ferro"] = 2,
				}
			},
			["pente"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aco"] = 2,
					["barra-ferro"] = 2,
				}
			},			
			["mira"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aco"] = 2,
					["barra-ferro"] = 2,
				}
			},			
			["lanterna"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aco"] = 2,
					["barra-ferro"] = 2,
				}
			},			
			["spray"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aco"] = 2,
					["barra-ferro"] = 2,
				}
			},
		}
	},
	["Bahamas"] = {
        ['coords'] = { 
			{ -1365.69, -617.0, 30.32 },
		},
		['skillbar'] = false,
        ['text'] = "Mesa de Trabalho",
		["perm"] = "bahamas.permissao",
		["list"] = {
			["notebook"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["dinheiro"] = 5000
				}
			},
			["algemas"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aco"] = 2,
					["barra-ferro"] = 2,
				}
			},			
			["furadeira"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aco"] = 5,
				}
			},			
			["lockpick"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aco"] = 2,
					["barra-ferro"] = 2,
				}
			},			
			["capuz"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aco"] = 2,
					["barra-ferro"] = 2,
				}
			},			
		}
	},
	["Cartel"] = {
        ['coords'] = { { -1869.77, 2064.59, 135.54 } },
        ['text'] = "Mesa de lavagem",
		["perm"] = "cartel.permissao",
		["list"] = {
			["dinheiro"] = {
				["amount"] = 10000,
				["destroy"] = true,
				["require"] = {
					["dinheiro-sujo"] = 10000,
					["alvejante"] = 1,
					["papelada"] = 1,
				}
			},
			["energetico"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["cafe"] = 1,
					["sprunk"] = 1,
					["garrafa-vazia"] = 1,
				}
			},
		}
	},
	["LavagemPública"] = {
        ['coords'] = { { 147.84, -1531.74, 29.15 } },
        ['text'] = "Mesa de lavagem",
		-- ["perm"] = "portas.permissao",
		["list"] = {
			["papel"] = {
				["amount"] = 100,
				["destroy"] = true,
				["require"] = {
					["dinheiro-sujo"] = 50000,
				}
			},
			["cedulas"] = {
				["amount"] = 50000,
				["destroy"] = true,
				["require"] = {
					["papel"] = 100,
				}
			},
			["dinheiro"] = {
				["amount"] = 25000,
				["destroy"] = true,
				["require"] = {
					["cedulas"] = 50000,
				}
			},
		}
	},

	["Restaurante"] = {
        ['coords'] = { { -1365.69, -617.0, 30.32 } },
        ['text'] = "Fogão",
		["perm"] = "restaurante.permissao",
		["list"] = {
			["esfirra"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["frango2"] = 1,
					["massa"] = 1,
					["tomate"] = 1,
				}
			},
			["xburguer"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pao"] = 2,
					["tomate"] = 1,
					["carne"] = 1,
					["alface"] = 1,
				}
			},
			["pizza"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["queijo"] = 3,
					["tomate"] = 2,
					["massa"] = 1,
				}
			},
			["hotdog"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["salsicha"] = 1,
					["pao"] = 1,
				}
			},
			["coxinha"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["frango"] = 1,
					["massa"] = 3,
				}
			},
			["paoqueijo"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["queijo"] = 2,
					["massa"] = 2,
				}
			},
			["sanduiche"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pao"] = 2,
					["tomate"] = 2,
					["carne"] = 1,
					["alface"] = 1,
				}
			},
			["taco"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["massa"] = 3,
					["tomate"] = 1,
					["alface"] = 1,
				}
			},
			["combo1"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pao"] = 2,
					["tomate"] = 1,
					["alface"] = 1,
					["carne"] = 1,
					["cola"] = 1,
				}
			},
		}
	},
	["Confeitaria"] = {
        ['coords'] = { 
			{ 261.45, -816.77, 29.44 },
			{ 260.22, -821.11, 29.44 },
			{ 264.56, -821.55, 29.44 },
		},
        ['text'] = "Bancada",
		["perm"] = "confeitaria.permissao",
		["list"] = {
			["torta"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["ovos"] = 2,
					["leite"] = 3,
					["massa"] = 1,
					["morangos"] = 2,
				}
			},
			["bolo1"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["ovos"] = 2,
					["maragarina"] = 3,
					["leite"] = 4,
					["acucar"] = 2,
				}
			},
			["trufa"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["massa"] = 2,
					["maragarina"] = 1,
					["morangos"] = 2,
					["leite"] = 2,
					["acucar"] = 2,
				}
			},
			["sucolaranja"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["laranja"] = 2,
					["gelo"] = 2,
					["morangos"] = 2,
					["leite"] = 2,
					["acucar"] = 2,
				}
			},
			["palha"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["fermento"] = 3,
					["massa"] = 3,
					["leite"] = 2,
					["acucar"] = 2,
				}
			},
			["torrada"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pao"] = 1,
					["margarina"] = 1,
				}
			},
			["cupcake"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["massa"] = 3,
					["morangos"] = 5,
					["leite"] = 3,
					["fermento"] = 1,
					["acucar"] = 2,
				}
			},
			["combo1"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pao"] = 2,
					["tomate"] = 1,
					["alface"] = 1,
					["carne"] = 1,
					["cola"] = 1,
				}
			},
		}
	},
}
