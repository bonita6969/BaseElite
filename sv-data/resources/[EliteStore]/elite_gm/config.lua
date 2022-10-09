Config = {} -- Não mexa

Config.license = "736JLJ4DGHRJKDQZVF2I" -- Sua licença

-- Evento para cair a LOG quando algm TIRAR algo ou GUARDAR
-- TriggerEvent("dossantos:logbau"

Config.ExisteDataTable = true -- Se sua tabela de groups salvar no DataTable deixe true



if Config.ExisteDataTable then 
    cfg = module("cfg/groups")
    groups = groups.list
end

Config.webhooks = {

    demitir = "https://discord.com/api/webhooks/1026203802963038238/wHq1aF1dTu5e5nB9c6_uljJg2ue94hLDeEDowh7NcN4mz7M-DqG6sRpIgOmn7ZMaRvJx",

    promover = "https://discord.com/api/webhooks/1026203922060300308/QjiNU7KfS_38tM8u7K-ppRis2dFuSijeUAg69F5oTsTSD4e9rIjdzSQZexlnJ4AL-Fga",

    contratar = "https://discord.com/api/webhooks/1026203992512004167/J6OJyS2Zo8djzpJXbn8_eB-pX_qAbLevlbR6CZBgTGEY5atVWNXF6Vs7HL2KydSvkSOY",

    bau = "https://discord.com/api/webhooks/1026204086997098567/Mhv0yzS1tJhNPHBYkFz5bEg0Kpk4O0q3TX8mZjEw3ggCYQ9erbr-1BBlenW2nfsvd0c3"

}

-- Para melhor entendimento a baixo um breve tutorial

-- Grupo = Cargo em serviço
-- Toogle = Cargo fora de serviço
-- Título = Nome do cargo que vai aparecer no painel
-- O maior número é sempre o CARGO mais Alto
-- Membros não tem acesso a ver quem está fora de serviço na Aba membros


-- Na aba foto é a imagem que vai aparecer no painél junto com o nome da organização 
-- Para a LOG de Baú aparecer no painel é necessário que o mesmo nome do baú no seu vrp_chest, esteja aqui em bau = "nome do baú"

-- Líder = Cargo mais alto do Painel (Que pode contratar, promover e demitir)


Config.grupos = {
    ["Policia"] = { -- Início e nome da Organização
        config = {
            foto ="https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png", -- (A proporção deve ser 1:1 ou seja 1080x1080 / 1000x1000)
            bau = "Policia" -- Nome do Baú dessa ORGANIZAÇÃO
        },
        grupos = { 
            ["Líder"] = {grupo = "Comandante", toogle = "ComandanteAP", titulo = "Comandante Policia"}, -- grupo -> igual ao do group id grupo | titulo -> um titulo mais bonito para gerar mais imesão na NUI
            ["Membros"] = { -- Aqui irão ficar todos os grupos dos membros que não sao líderes, esses grupos devem ser numerados sempre respeitando que o grupo base deve ser o número 1

                [13] = {grupo = "Subcomandante", toogle = "CubcomandanteAP", titulo = "SubComandante Policia"}, -- esse seria o rank mais alto do grupo pois ele acompanha o maior número junto com ele
                [12] = {grupo = "Coronel", toogle = "CoronelAP", titulo = "Coronel Policia"},
                [11] = {grupo = "Tencoronel", toogle = "TencoronelAP", titulo = "TenCoronel Policia"},
                [10] = {grupo = "Major", toogle = "MajorAP", titulo = "Major Policia"},
                [9] = {grupo = "Capitao", toogle = "CapitaoAP", titulo = "Capitao Policia"},
                [8] = {grupo = "Tenente", toogle = "TenenteAP", titulo = "Tenente Policia"},
                [7] = {grupo = "Subtenente", toogle = "SubtenenteAP", titulo = "Subtenente Policia"},
                [6] = {grupo = "1Sargento", toogle = "1SargentoAP", titulo = "1Sargento Policia"},
                [5] = {grupo = "2Sargento", toogle = "2SargentoAP", titulo = "2Sargento Policia"},
                [4] = {grupo = "3Sargento", toogle = "3SargentoAP", titulo = "3Sargento Policia"},
                [3] = {grupo = "Cabo", toogle = "CaboAP", titulo = "Cabo Policia"},
                [2] = {grupo = "Soldado", toogle = "SoldadoAP", titulo = "Soldado Policia"},
                [1] = {grupo = "Recruta", toogle = "RecrutaAP", titulo = "Recruta Policia"}
            }
        }
    }, -- final de um grupo

    ---------------------------------------------------------------------------------------------------------------
    ["Hospital"] = { -- inicio de um grupo
        config = {
            foto = "https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png", -- link direto da imagem que será a foto do grupo (A proporção deve ser 1:1 ou seja 1080x1080 / 1000x1000)
            bau = "Hospital" -- Nome do Baú dessa ORGANIZAÇÃO
        },
        grupos = { 
            ["Líder"] = {grupo = "Diretorems",toogle = "DiretoremsAP", titulo = "Diretor Hospital"}, -- grupo -> igual ao do group id grupo | titulo -> um titulo mais bonito para gerar mais imesão na NUI
            ["Membros"] = {
                -- aqui irão ficar todos os grupos dos membros que não sao líderes, esses grupos devem ser numerados sempre respeitando que o grupo base deve ser o número 1

                [4] = {grupo = "Vicediretorems", toogle = "VicediretoremsAP", titulo = "Vicediretorems Hospital"}, -- esse seria o rank mais alto do grupo pois ele acompanha o maior número junto com ele
                [3] = {grupo = "Paramedicoems", toogle = "ParamedicoemsAP", titulo = "Paramedicoems Hospital"}, 
                [2] = {grupo = "Medicoems", toogle = "MedicoemsAP", titulo = "Medicoems Hospital"}, 
                [1] = {grupo = "Enfermeiroems", toogle = "EnfermeiroemsAP", titulo = "Enfermeiroems Hospital"}
            }
        }
    }, -- final de um grupo

    ---------------------------------------------------------------------------------------------------------------------
    ["Mecanico"] = {
        config = {
            foto = "https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png",
            bau = "Mecanico" 
        },
        grupos = { 
            ["Líder"] = {grupo = "Lidermec", toogle = "LidermecAP", titulo = "Mecanico Chefe"},
            ["Membros"] = {

                [3] = {grupo = "Gerentemec", toogle = "GerentemecAP", titulo = "Mecanico Gerente"},
                [2] = {grupo = "Mecanico", toogle = "MecanicoAP", titulo = "Mecanico"},
                [1] = {grupo = "Estagiariomec", toogle = "EstagiariomecAP", titulo = "Estagiario Mecanico"}
            }
        }
    },
    ---------------------------------------------------------------------------------------------------------------------
    ["Confeitaria"] = {
        config = {
            foto = "https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png",
            bau = "Confeitaria" 
        },
        grupos = { 
            ["Líder"] = {grupo = "Liderconfeitaria", toogle = "liderconfeitaria", titulo = "Confeitaria Chefe"},
            ["Membros"] = {

                [3] = {grupo = "Gerenteconfeitaria", toogle = "GerenteconfeitariaAP", titulo = "Confeitaria Gerente"},
                [2] = {grupo = "Confeitaria", toogle = "ConfeitariaAP", titulo = "Funcionário Confeitaria"},
                [1] = {grupo = "Atendenteconfeitaria", toogle = "AtendenteconfeitariaAP", titulo = "Confeitaria Atendente"}
            }
        }
    },

    ---------------------------------------------------------------------------------------------------------------------
    ["Vermelhos"] = {
        config = {
            foto = "https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png",
            bau = "Vermelhos" 
        },
        grupos = { 
            ["Líder"] = {grupo = "Lidervermelhos", titulo = "Lider Vermelhos"},
            ["Membros"] = {
                
                [2] = {grupo = "Gerentevermelhos", titulo = "Gerente Vermelhos"},
                [1] = {grupo = "Vermelhos", titulo = "Membro Vermelhos"}
            }
        }
    },

    ---------------------------------------------------------------------------------------------------------------------
    ["Verdes"] = {
        config = {
            foto = "https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png",
            bau = "Verdes" 
        },
        grupos = { 
            ["Líder"] = {grupo = "Liderverdes", titulo = "Lider Verdes"},
            ["Membros"] = {
                
                [2] = {grupo = "Gerenteverdes", titulo = "Gerente verdes"},
                [1] = {grupo = "Verdes", titulo = "Gerente verdes"}
            }
        }
    },

    ---------------------------------------------------------------------------------------------------------------------
    ["Azuis"] = {
        config = {
            foto = "https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png",
            bau = "Azuis" 
        },
        grupos = { 
            ["Líder"] = {grupo = "Liderazuis", titulo = "Lider Azuis"},
            ["Membros"] = {
                
                [2] = {grupo = "Gerenteazuis", titulo = "Gerente Azuis"},
                [1] = {grupo = "Azuis", titulo = "Membro Azuis"}
            }
        }
    },

    ---------------------------------------------------------------------------------------------------------------------
    ["Roxos"] = {
        config = {
            foto = "https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png",
            bau = "Roxos" 
        },
        grupos = { 
            ["Líder"] = {grupo = "Liderroxos", titulo = "Lider Roxos"},
            ["Membros"] = {
                
                [2] = {grupo = "Gerenteroxos", titulo = "Gerente Roxos"},
                [1] = {grupo = "Roxos", titulo = "Membro Roxos"}
            }
        }
    },

    ---------------------------------------------------------------------------------------------------------------------
    ["MerryWeather"] = {
        config = {
            foto = "https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png",
            bau = "MW" 
        },
        grupos = { 
            ["Líder"] = {grupo = "Lidermw", titulo = "Lider Mw"},
            ["Membros"] = {
                
                [2] = {grupo = "Gerentemw", titulo = "Gerente MW"},
                [1] = {grupo = "Mw", titulo = "Membro Mw"}
            }
        }
    },

    ---------------------------------------------------------------------------------------------------------------------
    ["Anonymous"] = {
        config = {
            foto = "https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png",
            bau = "Anonymous" 
        },
        grupos = { 
            ["Líder"] = {grupo = "Lideranonymous", titulo = "Lider Anonymous"},
            ["Membros"] = {
                
                [1] = {grupo = "Gerenteanonymous", titulo = "Gerente Anonymous"},
                [1] = {grupo = "Anonymous", titulo = "Membro Anonymous"}
            }
        }
    },

    ---------------------------------------------------------------------------------------------------------------------
    ["Mafia"] = {
        config = {
            foto = "https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png",
            bau = "Mafia" 
        },
        grupos = { 
            ["Líder"] = {grupo = "Lidermafia", titulo = "Lider Mafia"},
            ["Membros"] = {
                
                [2] = {grupo = "Gerentemafia", titulo = "Gerente Mafia"},
                [1] = {grupo = "Mafia", titulo = "Membro Mafia"}
            }
        }
    },

    ---------------------------------------------------------------------------------------------------------------------
    ["Cartel"] = {
        config = {
            foto = "https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png",
            bau = "Cartel" 
        },
        grupos = { 
            ["Líder"] = {grupo = "Lidercartel", titulo = "Lider Cartel"},
            ["Membros"] = {
                
                [1] = {grupo = "Gerentecartel", titulo = "Gerente Cartel"},
                [1] = {grupo = "Cartel", titulo = "Membro Cartel"}
            }
        }
    },

   ---------------------------------------------------------------------------------------------------------------------
    ["Playboy"] = {
    config = {
        foto = "https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png",
        bau = "Playboy" 
         },
        grupos = { 
            ["Líder"] = {grupo = "Liderplayboy", titulo = "Lider PlayBoy"},
            ["Membros"] = {
            
                [1] = {grupo = "Gerenteplayboy", titulo = "Gerente PlayBoy"},
                [1] = {grupo = "Playboy", titulo = "Membro PlayBoy"}
            }
        }
    },

    ---------------------------------------------------------------------------------------------------------------------
    ["The Lost"] = {
    config = {
        foto = "https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png",
        bau = "TheLost" 
         },
        grupos = { 
            ["Líder"] = {grupo = "Liderthelost", titulo = "Lider Lost"},
            ["Membros"] = {
            
                [1] = {grupo = "Gerentethelost", titulo = "Gerente Lost"},
                [1] = {grupo = "Thelost", titulo = "Membro Lost"}
            }
        }
    },

    ---------------------------------------------------------------------------------------------------------------------
    ["Vanilla"] = {
    config = {
        foto = "https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png",
        bau = "Vanilla" 
         },
        grupos = { 
            ["Líder"] = {grupo = "Lidervanilla", titulo = "Lider Vanilla"},
            ["Membros"] = {
            
                [1] = {grupo = "Gerentevanilla", titulo = "Gerente Vanilla"},
                [1] = {grupo = "Vanilla", titulo = "Membro Vanilla"}
            }
        }
    },

    ---------------------------------------------------------------------------------------------------------------------
    ["Bahamas"] = {
    config = {
        foto = "https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png",
        bau = "Bahamas" 
         },
        grupos = { 
            ["Líder"] = {grupo = "Liderbahamas", titulo = "Lider Bahamas"},
            ["Membros"] = {
            
                [1] = {grupo = "Gerentebahamas", titulo = "Gerente Bahamas"},
                [1] = {grupo = "Bahamas", titulo = "Membro Bahamas"}
            }
        }
    },

        ---------------------------------------------------------------------------------------------------------------------
        ["Cafeteria"] = {
            config = {
                foto = "https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png",
                bau = "Cafeteria" 
            },
            grupos = { 
                ["Líder"] = {grupo = "Lidercafeteria", titulo = "Cafeteria Chefe"},
                ["Membros"] = {
    
                    [3] = {grupo = "Gerentecafeteria", titulo = "Cafeteria Gerente"},
                    [2] = {grupo = "Cafeteria", titulo = "Cafeteria"},
                    [1] = {grupo = "Estagiariocafe", titulo = "Estagiario Cafeteria"}
                }
            }
        },

}



return Config