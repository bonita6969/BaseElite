-----------------------------------------------------------------------------------------------------------------------------------------
-- PLATE 01 PADRÃO (Standard White)
-----------------------------------------------------------------------------------------------------------------------------------------
local textureDic = CreateRuntimeTxd('duiTxd') 
local object = CreateDui('https://cidadealta.gg/imagens/placas/CDAAzul.png', 256, 128) 
local handle = GetDuiHandle(object)
CreateRuntimeTextureFromDuiHandle(textureDic, "duiTex", handle)
AddReplaceTexture('vehshare', 'plate01', 'duiTxd', 'duiTex')
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLATE 02 (Yellow Plate)
-----------------------------------------------------------------------------------------------------------------------------------------
local textureDic = CreateRuntimeTxd('duiTxd') 
local object = CreateDui('https://cidadealta.gg/imagens/placas/CDAAzul.png', 256, 128) 
local handle = GetDuiHandle(object)
CreateRuntimeTextureFromDuiHandle(textureDic, "duiTex", handle)
AddReplaceTexture('vehshare', 'plate02', 'duiTxd', 'duiTex')
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLATE 03 (Blue Plate)
-----------------------------------------------------------------------------------------------------------------------------------------
local textureDic = CreateRuntimeTxd('duiTxd') 
local object = CreateDui('https://cidadealta.gg/imagens/placas/CDAAzul.png', 256, 128) 
local handle = GetDuiHandle(object)
CreateRuntimeTextureFromDuiHandle(textureDic, "duiTex", handle)
AddReplaceTexture('vehshare', 'plate03', 'duiTxd', 'duiTex')
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLATE 04 ALUGEL (White Plate 2)
-----------------------------------------------------------------------------------------------------------------------------------------
local textureDic = CreateRuntimeTxd('duiTxd') 
local object = CreateDui('https://cidadealta.gg/imagens/placas/CDAVerde.png', 256, 128) 
local handle = GetDuiHandle(object)
CreateRuntimeTextureFromDuiHandle(textureDic, "duiTex", handle)
AddReplaceTexture('vehshare', 'plate04', 'duiTxd', 'duiTex')
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLATE 05 EMERGENCIA (Police guv plate)
-----------------------------------------------------------------------------------------------------------------------------------------
local textureDic = CreateRuntimeTxd('duiTxd') 
local object = CreateDui('https://cidadealta.gg/imagens/placas/CDAVermelha.png', 256, 128) 
local handle = GetDuiHandle(object)
CreateRuntimeTextureFromDuiHandle(textureDic, "duiTex", handle)
AddReplaceTexture('vehshare', 'plate05', 'duiTxd', 'duiTex')
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLATE 06 SERVIÇO (yankton plate)
-----------------------------------------------------------------------------------------------------------------------------------------
local textureDic = CreateRuntimeTxd('duiTxd') 
local object = CreateDui('https://cidadealta.gg/imagens/placas/CDALaranja.png', 256, 128) 
local handle = GetDuiHandle(object)
CreateRuntimeTextureFromDuiHandle(textureDic, "duiTex", handle)
AddReplaceTexture('vehshare', 'yankton_plate', 'duiTxd', 'duiTex')
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLATE NORMAL MAP
-----------------------------------------------------------------------------------------------------------------------------------------
local object = CreateDui('https://cidadealta.gg/imagens/placas/CDABump.png', 256, 128)
local handle = GetDuiHandle(object)
CreateRuntimeTextureFromDuiHandle(textureDic, "duiTex2", handle)
AddReplaceTexture('vehshare', 'plate01_n', 'duiTxd', 'duiTex2')
AddReplaceTexture('vehshare', 'plate02_n', 'duiTxd', 'duiTex2')
AddReplaceTexture('vehshare', 'plate03_n', 'duiTxd', 'duiTex2')
AddReplaceTexture('vehshare', 'plate04_n', 'duiTxd', 'duiTex2')
AddReplaceTexture('vehshare', 'plate05_n', 'duiTxd', 'duiTex2')
AddReplaceTexture('vehshare', 'yankton_plate_n', 'duiTxd', 'duiTex2')