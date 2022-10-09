dossantos = {}

dossantos.sujo = "dinheiro-sujo" -- Nome do dinheiro sujo na sua base

dossantos.ilegal = "trafico.permissao" -- Permissão que receberá o Bonus por cada unidade

dossantos.bonusfac = 150 -- Bonus que dará a mais por ser membro de facção

dossantos.bonus = 200 --- Bonus que dará a cada Polícia em serviço

dossantos.paisana = "paisana.permissao" -- Permissão da sua Polícia a Paisana

dossantos.permbonus = 'policia.permissao' -- Permissão da Polícia no seu servidor

dossantos.rotasdrogas = {

    ['meta'] = { -- Nome da facção ou nome que preferir
        ['x'] = 1371.57, ['y'] = -764.04, ['z'] = 69.34, -- Loc para iniciar as entregas -- 1371.57,-764.04,69.34
        ['items'] = {
            {
                ['item'] = "metanfetamina", -- Droga que será necessária para iniciar nesse blip (Pode entregar todas ao mesmo tempo, mas ele checa se você tem a droga daquele blip pra iniciar ali)
                ['rewmin'] = 750, -- Valor mínimo sujo que o player receberá POR UNIDADE DA DROGA
                ['rewmax'] = 950, -- Valor máximo sujo que o player receberá POR UNIDADE DA DROGA
                ['qntmin'] = 2, -- Quantidade mínima de drogas por blip que o player venderá 
                ['qntmax'] = 6, -- Quantidade máxima de drogas por blip que o player venderá 
            },
        }
    },
   
    ['cocaina'] = { 
       ['x'] = 788.89, ['y'] = -291.91, ['z'] = 60.24,
       ['items'] = {
           {
               ['item'] = "cocaina-embalada",
               ['rewmin'] = 750,
               ['rewmax'] = 950,
               ['qntmin'] = 2,
               ['qntmax'] = 6,
           },
       }
    },
    
    ['lsdselo'] = { 
        ['x'] = -1185.48, ['y'] = -1753.16, ['z'] = 4.11,
        ['items'] = {
            {
                ['item'] = "lsdselo",
                ['rewmin'] = 750,
                ['rewmax'] = 950,
                ['qntmin'] = 2,
                ['qntmax'] = 6,
            },
        }
    },
    
    ['baseado'] = { 
        ['x'] = 1227.26, ['y'] = -236.96, ['z'] = 72.45,
        ['items'] = {
            {
                ['item'] = "baseado",
                ['rewmin'] = 750,
                ['rewmax'] = 950,
                ['qntmin'] = 2,
                ['qntmax'] = 6,
            },
        }
    },   

}