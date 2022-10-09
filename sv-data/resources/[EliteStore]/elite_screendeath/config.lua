config = {}

config.license = "4GOAVFDU63N3ZWWJEMMF" -- Sua licença

config.permissaoems = "ems.permissao"-- Permissão que irá verificar se tem médico ou não

config.timeSOS = 1 -- Quando usado o comando /sos em quanto tempo o player será reanimado

config.deathtimer = 300 -- Tempo em que o player ficará inconsciente até poder usar o botão Voltar ao Hospital

config.hospital = vector3(-436.08+0.0001,-359.72+0.0001, 34.95+0.0001) -- Localização onde irá spawnar ao Reviver

config.heading = 354.95 -- Posição em que o jogador vai spawnar



-- Em seus comandos de /god /godall /re ou qualquer outro GOD que tiver, colocar o evento a baixo...




-- TriggerClientEvent('godblur',source) -- Esse na parte do código onde você da o god em SÍ mesmo

-- TriggerClientEvent('godblur',nplayer) -- Esse na parte do código onde você da o god em outro player 

-- O código a cima serve para tirar a "NUI" da tela quando reanimado

-- Exemplo de como MAIS OU MENOS deve ficar

-- TriggerClientEvent('godblur',source)
-- vRPclient.killGod(source)
-- TriggerClientEvent('cancelando',source,false)
-- vRPclient.setHealth(source,400)

return config