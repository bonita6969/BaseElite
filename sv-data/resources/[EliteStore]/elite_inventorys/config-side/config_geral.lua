---------------------------------------------------------------------------------------------------------
---------------------------------------- [ WEBHOOKS GERAIS ] --------------------------------------------
---------------------------------------------------------------------------------------------------------
local config = {}

webh = {}
-- config = {}

webh.img = 'https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png'
webh.text = 'Wave'
webh.webhookColor = ''


config.permbau = "policia.permissao" -- Permissão para acessar os baús dos carros, mesmo com o carro trancado

------------ BAUS --------------------

webh.homeschest = 'https://discord.com/api/webhooks/1026211040725303456/czte76sliQ3G0d-kWJJ_NaNg06DdhhEXH0p065bFx87KK_OcVUlQJudACiWmP42oJyJa' -- Log das casas
webh.trunkchest = 'https://discord.com/api/webhooks/1026210705566879785/dKuUtHuAs5cEiOqjVE0UgL-e3n56Cr8aPlJshQiKKRDLglz_v9bAHUTG89U0JmTWleQZ' -- Log de carros

---------------------- INVENTARIO ----------------------------------
webh.webvip = 'https://discord.com/api/webhooks/1026201559564038214/ZPFDr8p117BPhSY7gwmq-hfywA270RuHNqQXM5JO_V6eWe-a58tUkszqVO2pl_FSh6Ox' -- Log de compra de carros com coins
webh.revistar = "https://discord.com/api/webhooks/1027629101185499176/gkuE2oYsCQoxoHcg4p9qM7RLghxHmm0NHTMDkJqmjRu5sGtbgqMmbFfoeox112wbWPd_" -- Log de revistas/roubos/saques
webh.loggarmas = 'https://discord.com/api/webhooks/1026143524195926157/uLKXTeocsUy5yC5CR5W8YxqyxdfMh6MyEICsWelWuhG-M0SDtTddBrs1jyN7KcJ2FlaG' -- Log de /garmas
webh.apreendidos = "https://discord.com/api/webhooks/1026209773659635782/qVxLmgxrd1Y9a4D1GH_OmXQV80ZvNhyueveGBFBQkPmCBEKoDbQ20RWmHlL6zoWgklcD" -- Log de /apreender
webh.logitemdrop = 'https://discord.com/api/webhooks/1026143580529643602/MeigflCCj2Ylvj6O_LMw6SxlSB-PR3y7GWVTXQWLb8U2Cq90oDX9FCqdbu0dgLgomeez' -- Log de Drop de itens
webh.logitemsend = 'https://discord.com/api/webhooks/1026143406872862720/Mm8NE4pDdafl1UE1tQhnUCN5VSOIzBgTXWQiDqh2baO_8FKV96OCwBk1w6sNMTjfh683' -- Log de envio de itens
webh.logitemdropPolicia = 'https://discord.com/api/webhooks/1026199735557701633/Zgkp7aOZJ6kERbE_78ZsWSInBEUJo35wwAn6iRzKGnCGwuBV8OU5Nvtf04lCP4R3wGMY' -- Log de drop da policia

-------------- ROTA DROGAS -----------------

webh.rotadrogas = 'https://discord.com/api/webhooks/1027652898655567963/qUrqQKba8r9lt05gTfddFuA0C0WOB-4fGYVE0vIMsz_urcKRKzXdjqaHbCFy7MYz6Z8W'  -- Log que mostra as entregas de drogas
webh.logAdminItem = 'https://discord.com/api/webhooks/1026208996102779043/rLvuzrQeImAMOhV8j0YbNrxmcYRD42pjVORpPBb-dW1QhShYodTJuaoST0l2NmpiroDy' -- Log de spawn de Itens
