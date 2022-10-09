---------------------------------------------------------------------------------------------------------
---------------------------------------- [ SCRIPT vrp_chest ] -------------------------------------------
---------------------------------------------------------------------------------------------------------
chestc = {}

chestc.list = {
    ---------------------------------------------------------------------------------------------------------------------------------------
    ------------------------------------------------------- [ LEGAL ] ---------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------------------------------------------
    ['PoliciaAp'] = { ['x'] = 459.35, ['y'] = -990.58, ['z'] = 24.92, ['kg'] = 15000, ['perm'] = 'baupolicia.permissao', logs = "https://discord.com/api/webhooks/1026206248321957938/an5UVb4cltisdpAlaijg7O3DZTJbrJYO6hDltfdXgwL7YcVzoddac26rGouyZ_AWyU9_"},
    ['Policia'] = { ['x'] = 472.13, ['y'] = -1006.09, ['z'] = 34.22, ['kg'] = 15000, ['perm'] = 'baupolicia.permissao', logs = "https://discord.com/api/webhooks/1026206248321957938/an5UVb4cltisdpAlaijg7O3DZTJbrJYO6hDltfdXgwL7YcVzoddac26rGouyZ_AWyU9_"},
    ['Hospital'] = { ['x'] = -814.16, ['y'] = -1240.14, ['z'] = 7.34, ['kg'] = 5000, ['perm'] = 'bauhp.permissao', logs = "https://discord.com/api/webhooks/1026206412147277826/niaWy_-j1zWT1sXkylb5Y9A2zvW0bWK31fO8P3mCf0zjFT2QRiyFh_eQe4DILVeNNuxa"},
    ['Mecanico'] = { ['x'] = -203.75, ['y'] = -1330.97, ['z'] = 34.9, ['kg'] = 5000, ['perm'] = 'baumec.permissao', logs = "https://discord.com/api/webhooks/1026206493667766352/UXRBG3bM_Y2tLne1w_wHDs3E1rwk6QGFsjy-lSk06M1tI1Tvebm3u633XIs4IoVRbtXG"},
    ---------------------------------------------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------------------------------------------

    ---------------------------------------------------------------------------------------------------------------------------------------
    ------------------------------------------------------- [ DROGAS ] --------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------------------------------------------
    ['Vermelhos'] = { ['x'] = 1270.63, ['y'] = -126.29, ['z'] = 87.64, ['kg'] = 5000, ['perm'] = 'bauvermelhos.permissao', logs = "https://discord.com/api/webhooks/1026206604514836490/Ey1gKdKRzNhsrNKtK5jdUFcbVUHKHHnNrKFT2jF8X0L58D-fyT453MyK5CIk8wjC2Crf"}, -- Fábrica de maconha
    ['Verdes'] = { ['x'] = 799.54, ['y'] = -293.78, ['z'] = 69.47, ['kg'] = 5000, ['perm'] = 'bauverdes.permissao', logs = "https://discord.com/api/webhooks/1026206657828630578/nta_lOmCfz2jyhOqRvElk2-gJvyOOxMLooongTJbs5GWu5xr8kinDzqJsJSN8QQUKnhN"}, -- Fábrica de meta
    ['Roxos'] = { ['x'] = 2037.89, ['y'] = 479.88, ['z'] = 170.98, ['kg'] = 5000, ['perm'] = 'bauroxos.permissao', logs = "https://discord.com/api/webhooks/1026206729865801820/BOe250CGfZoXC3aOIPMfyg1J01XnTFTRj6lczZbJytzsilymKU7f9RxD065ju-xxUNyw"},  -- Fábrica de Cocaína 
    ['Azuis'] = { ['x'] = 824.66, ['y'] = 1061.16, ['z'] = 292.59, ['kg'] = 5000, ['perm'] = 'bauazuis.permissao', logs = "https://discord.com/api/webhooks/1026206810841038990/3dBVPF3y72mWFVZH1VFDp1Vax_6eW6A9bApTVTsVhVivcMalEosrt1mQkpkuZ-zlxmDg"},  -- Fábrica de LSD
    ---------------------------------------------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------------------------------------------
    
    ---------------------------------------------------------------------------------------------------------------------------------------
    ------------------------------------------------------- [ DESMANCHE ] -----------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------------------------------------------
    ['TheLost'] = { ['x'] = 977.2, ['y'] = -104.05, ['z'] = 74.85, ['kg'] = 5000, ['perm'] = 'bauthelost.permissao', logs = "https://discord.com/api/webhooks/1026206921608396870/2xdAtuO66xh6-cUBimoCpaSAxw6Umx_Xo1fEf4XwkQG8uyGCJ-T3kToGVPmoJYeQftxP"}, -- Fábrica de Lockpick, Placa e Desmanche
    ['Laranjas'] = { ['x'] = 965.51, ['y'] = -1853.43, ['z'] = 31.27, ['kg'] = 5000, ['perm'] = 'baularanjas.permissao', logs = "https://discord.com/api/webhooks/1026207016491950162/jLyM-NyNVV8-R_8tur0MtrLtUOgpFyvLSi_xOoB4VoRGaJlfSgAHbVzDasY27TUeXP88"}, -- Fábrica de Lockpick, Placa e Desmanche
    ---------------------------------------------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------------------------------------------
    
    ---------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------- [ ARMAS ] -------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------------------------------------------
    ['Vagos'] = { ['x'] = 2037.89, ['y'] = 479.88, ['z'] = 170.98, ['kg'] = 5000, ['perm'] = 'bauvagos.permissao', logs = "https://discord.com/api/webhooks/1026207276278751244/iAfp6gWIZV75Q-GjtPl40eaaP-LyZd_q1K7MU-c49b7l0z2ziTIbfRCfih2nhkxxcI4B"},  -- Fábrica de Cocaína 
    ['Mafia'] = {  ['x'] = 1403.82, ['y'] = 1139.64, ['z'] = 109.75, ['kg'] = 5000, ['perm'] = 'baumafia.permissao', logs = "https://discord.com/api/webhooks/1026207412165812285/F_imsA5GoR3UY6VnlW1p1kZkatHLA4PfxWbrFGxYRh34bKAjVT9Umrddl54a0-F5573D"},  -- Fábrica de Munição
    ['PlayBoy'] = { ['x'] = -1547.17, ['y'] = 138.97, ['z'] = 55.66, ['kg'] = 5000, ['perm'] = 'bauplayboy.permissao', logs = "https://discord.com/api/webhooks/1026207608681549944/9WIqNkxrMTbBzFePhKNLHtFFJmcIh9WwY6H_qRWDpd9tPnFcFo0Ias_uN0VmxpqUIo7y"}, -- Fábrica de armas
    ---------------------------------------------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------------------------------------------
    
    ['Cartel'] = { ['x'] = -1886.5, ['y'] = 2062.4, ['z'] = 140.99, ['kg'] = 5000, ['perm'] = 'baucartel.permissao', logs = "https://discord.com/api/webhooks/1026207720371654767/UcndfUz3_eDEmwEXlpejDwIpeyLCUbeNRBTjLgCq7CPE9yUv6JJH-R5yzT-e3pzb3AAZ"},-- Lavagem e energético
    
    ['Mw'] = { ['x'] = 1.44, ['y'] = 529.78, ['z'] = 170.62, ['kg'] = 5000, ['perm'] = 'baumw.permissao', logs = "https://discord.com/api/webhooks/1026207894120693821/EnKKJEjGhNavEssbjof0nydToteA54ZgP1JeMDhJSbH6xBBipEnqSKUKoKalVKwKih6o"}, -- Fábrica de Munição
    ---------------------------------------------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------------------------------------------

    ---------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------- [ BARES ] -------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------------------------------------------
    ['Vanilla'] = { ['x'] = 93.89, ['y'] = -1291.0, ['z'] = 29.27, ['kg'] = 5000, ['perm'] = 'bauvanilla.permissao', logs = "https://discord.com/api/webhooks/1026207967575560234/Km72Z7POiJP3gs4QcHvU-lk_IuTqF2nZsmTg6JJ4vR_iHm-ZufiqgiqsGV-ZTF1X3ad_"}, -- Fabrica de energético e Lavagem
    ['Bahamas'] = { ['x'] = -1369.15, ['y'] = -624.32, ['z'] = 30.32, ['kg'] = 5000, ['perm'] = 'baubahamas.permissao', logs = "https://discord.com/api/webhooks/1026208103030587433/ZAqXZIdlwsiwZsyFngJulBnBbB__34jMbiWtU7WYMSw1O7OToex_chWvQwBaQf3GJ3eT"}, -- Fabrica de energético e Lavagem
    ---------------------------------------------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------------------------------------------
    ['Confeitaria'] = { ['x'] = 705.55, ['y'] = -960.58, ['z'] = 30.4, ['kg'] = 5000, ['perm'] = 'bauconfeitaria.permissao', logs = "https://discord.com/api/webhooks/1026208256483397662/yN5QvpNCPtuR0wwcsGRU9KzfrOMFd6PLn_udH1Qo7Cd59REh5aR3UMTqcBDb2qIqo-5a"}, -- Fábrica de Silenciador, Pente, empunhadura, Mira, Lanterna e Skin

    ['Cafeteria'] = { ['x'] = 262.96, ['y'] = -819.58, ['z'] = 29.44, ['kg'] = 5000, ['perm'] = 'bauconfeitaria.permissao', logs = "https://discord.com/api/webhooks/1026208718129483876/mti1wvTByZEkbuzKk7sqZkManrXvE6eQmaJHNKrAEY_ZHvXllzKnZE6f9pyufKQhG7ds"}, -- Cafe

}

