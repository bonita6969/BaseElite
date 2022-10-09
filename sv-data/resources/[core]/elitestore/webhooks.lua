---------------------------------------------------------------------------------------------------------
---------------------------------------- [ LOGS GERAIS ] ------------------------------------------------
---------------------------------------------------------------------------------------------------------
webh = {}

webh.img = 'https://cdn.discordapp.com/attachments/1027610888884199504/1027610978206093403/icon.png'
webh.text = 'Sistema de Logs [Wave]'
webh.webhookColor = ''

------------ BANCO -----------------

webh.multas = 'https://discord.com/api/webhooks/1026147793808654487/g_91Sn-s3CHx79c7g-bvvcmq-IfzECDVM5PTVnVvIYqkn-rblhGuuGbEuKzZLft6B-2x' -- Log do pagamento de MULTAS
webh.sacar = 'https://discord.com/api/webhooks/1026147722945904730/LV5jxgzCNDXVvif9GE6_u6VEOkcArAvy_Wzd6-ee0_0UR3LiIpeWHbkUV-TII8L6MNPu' -- Log dos saques feitos no banco
webh.deposito = 'https://discord.com/api/webhooks/1026147869507461130/8bPR3YmcEtHaxgtLO2mgBS7tnJE8mXaQO1OAmaRk-K3vBhcOQ221gkFXmT05Et4YckFP' -- Log dos depositos feitos no banco
webh.trasnferbank = 'https://discord.com/api/webhooks/1026147950902120581/a0jwuVcz-RzBMPw_fMeyj_Ve1Xtxr2BnZ9CHjp--eXJndOnI7eUqROsPMk-_yTqRKrGy' -- Log de trasnferência do banco

------------ STAFF PARTs -----------------

webh.adv = 'https://discord.com/api/webhooks/1026198351575797901/iy6Hes-ObpE5_eEN_b0asueOyDJMPMiWPMcVne1X0ckVeNkSSFaeqeDZ-Fy_y-BmSbhD' -- Log de /adv (Aplicada em players)
webh.acao = 'https://discord.com/api/webhooks/1027625426991988847/avJ9_2JQwuvjx1n38c-XPgIP4Q56Y5uZKrjVw9OYFVBsh6-X3Fab2uLffYJ4PwQ68KhN' -- Envia no CHAT escolhido a ação do /acao (Para policiais aceitarem ou recusarem)
webh.staffadv = 'https://discord.com/api/webhooks/1026197761290416218/1myTB9Q8zX5ab3_hQvuY-c_HcRheUHKoXtZv2XEgA_CA105jJ0n7QnsBcHARdmZ7Jig1' -- Log de /advdeus (Aplicada em STAFFs) recomendado por em um canal apenas de staff

------------ POLICIAL PARTs -----------------

webh.multar = 'https://discord.com/api/webhooks/1026121554632904805/mGX-QErxysRu7u3XJi4BTx_IX9h2nuSChImQeBF6PX95Q7LKp2zdzpO4MXq6dDQio3kv' -- Log de multas
webh.prender = 'https://discord.com/api/webhooks/1026121859059699784/MoVLqcRRdHsnZfFGI7u55bTeVMP04jQTK-V78tAqPmkYPjLPrQG4qr6PiY3bQx7BjoKS' -- Log de prisões
webh.detido = 'https://discord.com/api/webhooks/1026150298772840540/zwrVtoRZmcvv4KrqjwWmQOxwr7cXqd3TS0QOqMQGtjGi5r9xqH3oERj8ablJXwvoeRwk' -- Log de veículos detidos
webh.desmanche = 'https://discord.com/api/webhooks/1026153121245839410/53xjSLEDs5Du4IvfOY56TMMQPMkSLmP4RmdN5CkOSim3j1kRVmm3f_bjqe_nNaXVJm2j' -- Log de veículos desmanchados

------------ ELITE CL -----------------

webh.mortes = 'https://discord.com/api/webhooks/1026144244827689031/WHpFePWqqvSeftBhLx0fsQaLx-zGHyY4eAndLfFyRL0Bsz49Fl75DxIZ827pZOx-_u4-' -- Log de Kill (Quem MATA, quem MORRE e SUICÍDIO)

------------ ELITE CL -----------------

webh.cl = 'https://discord.com/api/webhooks/1026148705742626906/Kn8TN27085lhNCTiIilYufcSmGCpJHH_R4bhP9AokVj4zpgD87t3pluedVR98g6uqmg2' -- Log de cada player que saiu com a CDS e o MOTIVO

------------ ELITE SCREENDEATH --------------

webh.socorro = 'https://discord.com/api/webhooks/1026150013736321115/GeAGhzfl7Ks4RDJRvXz6DKejiVxJs0MiSZJlSpktB0lzyIYeAGnsCNGc60xXqkTJjjSB' -- Log do uso do /sos

------------ GARAGES --------------------

webh.spawnvehicle = 'https://discord.com/api/webhooks/1026144124010762322/0W_JAE4qGwfFAmLHHETjlwfz5Zz2--qo2MN_I9RNyYn6ECPwDvOe9_bEX1SoboVukA_E' -- Log de spawn de carros

------------ MISC --------------------

webh.logEntrada = 'https://discord.com/api/webhooks/1026149357772349500/6UQ4gY7eZr-8kbIdh1vSgpVZXxf-E69pkyuBW-Cxbv3DiL3lk_AW9LLbvx4K74Gav__m' -- Log de Entrada
webh.logSaida = 'https://discord.com/api/webhooks/1026148705742626906/Kn8TN27085lhNCTiIilYufcSmGCpJHH_R4bhP9AokVj4zpgD87t3pluedVR98g6uqmg2' -- Log de Saída

------------ BAUS --------------------

webh.logchest = 'https://discord.com/api/webhooks/1026143979907076096/p33oOxMfj_QpMEqfYRAg92lKp-K6i_jKyAfNQpQPNFe-6IwSftJtDoCZn7zHafl8ZLpZ' -- Log global dos Baús
webh.loghchest = 'https://discord.com/api/webhooks/1026198705356947606/F4tZi434dxqn6GwaAw6fEM9gFg4rZ5PygxXVNxvqQttun4DYRvKAm_fJJ-iI7Tcxjhsy' -- Log das casas
webh.logtchest = 'https://discord.com/api/webhooks/1026210705566879785/dKuUtHuAs5cEiOqjVE0UgL-e3n56Cr8aPlJshQiKKRDLglz_v9bAHUTG89U0JmTWleQZ' -- Log de carros

---------------------- INVENTARIO ----------------------------------

webh.logitemdrop = 'https://discord.com/api/webhooks/1026143580529643602/MeigflCCj2Ylvj6O_LMw6SxlSB-PR3y7GWVTXQWLb8U2Cq90oDX9FCqdbu0dgLgomeez' -- Log de Drop de itens
webh.loggarmas = 'https://discord.com/api/webhooks/1026143524195926157/uLKXTeocsUy5yC5CR5W8YxqyxdfMh6MyEICsWelWuhG-M0SDtTddBrs1jyN7KcJ2FlaG' -- Log de /garmas
webh.logitemdropPolicia = 'https://discord.com/api/webhooks/1026199735557701633/Zgkp7aOZJ6kERbE_78ZsWSInBEUJo35wwAn6iRzKGnCGwuBV8OU5Nvtf04lCP4R3wGMY' -- Log de drop da policia
webh.logitemsend = 'https://discord.com/api/webhooks/1026143406872862720/Mm8NE4pDdafl1UE1tQhnUCN5VSOIzBgTXWQiDqh2baO_8FKV96OCwBk1w6sNMTjfh683' -- Log de envio de itens
webh.inspect = 'https://discord.com/api/webhooks/1027629101185499176/gkuE2oYsCQoxoHcg4p9qM7RLghxHmm0NHTMDkJqmjRu5sGtbgqMmbFfoeox112wbWPd_' -- Log do inspect /revistar

-------------- Bate Papo (CHAT) -----------------

webh.twitter = 'https://discord.com/api/webhooks/1026142033506750585/q1eoAk99_pU5KCzqG8HPEZadG-swDhMNgrOJddyekGiohxGA8S-iRte1IY74SfcQ1ChW' -- Log do CHAT Twitter
webh.ilegal = 'https://discord.com/api/webhooks/1026140379499741275/xCstSYd9qvzmLkHVNtziiAlWw_auUjDOApeAlozB9clx-vyH-_eyNul-ezJahMNhg3cq' -- Log do CHAT Ilegal
webh.ml = 'https://discord.com/api/webhooks/1026142369315311636/HxzGXFsOWKhWktDiG9uAqbprfBDiN1S58-EfGHiRqHDFoEkobbTStnmKyXTeYoGscAJE' -- Log do CHAT ML
webh.chat190 = 'https://discord.com/api/webhooks/1026141900589248542/cNJzTCRd3L-hjTUaHoTfubw3JqVHoka1y9YuY-FgqD63j8DsYX_qH46T50B_eDwXhpcs' -- Log do CHAT 190
webh.chatmec = 'https://discord.com/api/webhooks/1026141762256912474/0sTFEYHHTjeYW7LGs-GRLmOkL5q8VtXj3tKFG_XjX9OyWfhnIzsa1HtZn9TnHY8DiRX2' -- Log do CHAT Mecanico
webh.chat192 = 'https://discord.com/api/webhooks/1026140441659330570/aH-ncbrmniRwjGqqv556YyM5lT-J1_dGyZ80pOKfCa-F-s7Nq4dky403a9sz4j7B_4va' -- Log do CHAT Paramédico
webh.chatadmin = 'https://discord.com/api/webhooks/1026142212825808967/6d5uYijVI-9wxorrRhG-b31_ows_pN8BsXTe42-m8mExSE-9x6l9zrt1MpR2loSwxSau' -- Log do CHAT Admin
webh.chamados = 'https://discord.com/api/webhooks/1026200490884730930/jY_QRY8uBiZw10pbjb_r8mKJ-Clld1Kr7arCn0oSCdikCz3WQD238P6bnmAr271Mq4--' -- Log de CHAMADOS em geral

-------------- EMPREGOS -----------------

webh.emplog = 'https://discord.com/api/webhooks/1026200864957923499/AmA_8yEFRNSRtS441sQovdql027AeUOeetFKO_Jit2BC_smlxei9g8Rrosw0DzMANDAR'
webh.emplog1 = 'https://discord.com/api/webhooks/1026200992208916562/5n53QgEH68KzSsjXgrhFLMi7111jy1MYC9uT0qIEuVpOcO3uO7--aLmNAG-YUDzxYlKC'
webh.emplogban = 'https://discord.com/api/webhooks/1026201134517456947/Lp65qDWNj0uapOVbV9e0SEJnKL6yHY6J79z32kCp7sdHOK68BeQ8xWzSNMmljrbu1thB'

-------------- BANCO -----------------

webh.webhookBanco = 'https://discord.com/api/webhooks/1026140113098522755/jhNOnGi5WsqDttPL5c36rpyCmvVN8_38wyQKH3HniRTT0zieEEj5wsbBszU9ANyiyc6I' -- Log de Banco

-------------- CONCE -----------------

webh.webconce = 'https://discord.com/api/webhooks/1026201628019277947/Y_eXycACnRWCCSB_MTmLk0yt9OljBm2zZu28WcHVIioJbUYdzcnP5fAf1tRctQQtNcna' -- Log da concessionária
webh.webvip = 'https://discord.com/api/webhooks/1026201559564038214/ZPFDr8p117BPhSY7gwmq-hfywA270RuHNqQXM5JO_V6eWe-a58tUkszqVO2pl_FSh6Ox' -- Log de compra de carros com coins

-------------- ROTA DROGAS -----------------

webh.rotadrogas = 'https://discord.com/api/webhooks/1026201980974141512/mBr2u_hc_rldpgSoh-fMQrM5EH2ABnXGIFW5mV2HiaHjqQpC5WcICO2k96-H8bMExicl' 

-------------- /VEHS -----------------

webh.webhookvehs = 'https://discord.com/api/webhooks/1027632761730777118/OpwPhLCD-IqzPW3jziW_E5m0L3nd7fyr2ghGNFGifQWEQob5iJcNLcT97dLPEkvRVze2' -- Log de venda de carros pra players

-------------- ADMIN ---------------------

webh.logAdminWhitelist = 'https://discord.com/api/webhooks/1026122341094273154/pL7-aQi3xV_tsMXPbBVoOrXeKZkK14GJQKkP6ahZ6XCzlYLLc_m27x2UYk7oUqgsQGzi' -- Log de /wl
webh.logAdminUnWhitelist = 'https://discord.com/api/webhooks/1026122420677001220/gESj6WvESbsyc2WxVAtf7igB1VA2NC-WczfqfHwYJKhEFGtYRluknbBS0CNLWFrD87kG' -- Log de /unwl
webh.logAdminBanchar = 'https://discord.com/api/webhooks/1027633821623013397/Fr-z__0m4a7UlH6x28jrGh8GN4qj0NAkM1xcM2uTanwJ53L0tE1ic5pAU6ZEvUtalWKW' -- Log de Ban em personagem
webh.logAdminUnBanchar = 'https://discord.com/api/webhooks/1027634007334199386/zQt0gP0o9MmlKOpti20Dyatqu4PcfJKd5FcpxgMfEK-dOsX1FD6FeMnyOZcapZfxU0Pp' -- Log de unban em personagem
webh.logAdminBan = 'https://discord.com/api/webhooks/1026122608653123704/q_NJj7CrPQWZ0-q6fh2cTm4M5atvwIGQDsL_Z1eRFhKDMM-rQnEhVJ_qbYiyu-7ecCJ3' -- Log de Ban
webh.logAdminUnBan = 'https://discord.com/api/webhooks/1026122754669412494/M2IH_mupU_gD29brM2kB7WbfS23HXDHYV3BbyH5ZRJ5F87mjMopIsc1wxEd43jbBj-EX' -- Log de unban
webh.logAdminRenomear = 'https://discord.com/api/webhooks/1026124888349626378/onv9YxbyqFe86U_rvJd2eR1HjHf0S_rIq1aMx8eWtn70vZOJX11PxN5qhQyJFqv2jzco' -- Log de /renomear
webh.logAdminAnuncio = 'https://discord.com/api/webhooks/1026124949611618324/FYlts7TWc2iGvPtf7yoKhkDf7Hnc_DXeGgkQCibwkq_fO6Fy4FwZiwh6E5MFpcOuKv2G' -- Log de anúncio
webh.logAdminAddcar = 'https://discord.com/api/webhooks/1026123170530463836/72BjoESBKirgnnzdCi4GEjPg5khWhInUxgJlv1yAvRoEQ2WHn53MnXeNn6agWKAc4TQS' -- Log de Adição de carros
webh.logAdminRemcar = 'https://discord.com/api/webhooks/1026123229191995432/_JxoY1iCKzB84qsNzKWSGmOLrg3GCNX6DJDqPAstFUJWtLcKOzzIxwaLv1U4mN0GGg_V' -- Log de Remoção de carros
webh.logAdminMoney = 'https://discord.com/api/webhooks/1026123318216097842/WyARLMttdSk9L6Hu-ZSbJfn5S_k7Hevz8-MYLsG9RVk2ERL4w1ElM0cIe9qIeKIvQ4VQ' -- Log de sapwn de dinheiro
webh.logAdminReviver = 'https://discord.com/api/webhooks/1027636236761968781/skZbfcdwaXndrnbzmQmOWi4pQvXPScqkZJMbutbGj6QGferOJeq9rNbIWWBH26x03Hov' -- Log de Reviver
webh.logAdminKick = 'https://discord.com/api/webhooks/1026123469999570950/5PM69SG6F8SUAIuAg0JDx2o3fVtHrT5koQKqtXyh1hX-mBz4w02dlwpH-RqjwzbK4-nt' -- Log de /kick
webh.fix = 'https://discord.com/api/webhooks/1026123538358349836/dbl-iGnVHULsqj4eQ-srknPtJLSIqHLnPxaKdLAOPN05ISJFcqHTlGwfrGyZLk9orz0W' -- Log de FIX
webh.logAdminNc = 'https://discord.com/api/webhooks/1026123776024387614/fv7252PAL3koRoBWQPQrQU71eo8Ss0Tq2UcIFmepnvXvroSckg5BaIy5XpGXYlnXHYiu' -- Log de Noclip
webh.logAdminTps = 'https://discord.com/api/webhooks/1026123982329622588/WBi_2BnmnAqVrnIKCdCR4E3f-3RYxBkbkDY2l36LDDokzP9_2Hj1QFXKWpdq3FePAKTv' -- Log de Teleports
webh.logGroup = 'https://discord.com/api/webhooks/1026124099937910854/DOw9C6edLB59LMOLilD6IJrSuZHO-N9laJAxv356qqbfV0hN4k37H1jhwUUgmYfFX5x2' -- Log de setagens ADMIN
webh.logunGroup = 'https://discord.com/api/webhooks/1026124178966982696/cD1D7lBB0jrSvH5UZUbYgWuXABkvf9Lecd-ul7-VnBMB9eBVp2JTKdd6snKvM_4hUrQA' -- Log de setagens ADMIN
webh.webhgodcmd = 'https://discord.com/api/webhooks/1026124268108521533/Nyv2ripl9iNvc_1R7aYtWh0DZeB6HOy4nEa1C6Rq9JGeOuulP6jASVbQgv0_FX9zaTcR' -- Log de God Por cmd
webh.logsetcmd = 'https://discord.com/api/webhooks/1026124644048179342/48AD6CISX3sQJqNiTIC1jRIs9A0Ea9pMlZ4HIrCLK_0sF2skJDg-aMKbeQumOMPnfQ9H' -- Log de setagem por CMD
webh.webhooksuspeito= 'https://discord.com/api/webhooks/1026124712381780038/zbieAi8qr7-LkCa_MOdAlfdboT8saD04tA9rjEI13KUbDR6ZrMIWVXUV7cnJrVWB0paN' -- Log de SUSPEITOS HACK
webh.logAdminItem = 'https://discord.com/api/webhooks/1026208996102779043/rLvuzrQeImAMOhV8j0YbNrxmcYRD42pjVORpPBb-dW1QhShYodTJuaoST0l2NmpiroDy' -- Log de spawn de Itens
webh.dv = 'https://discord.com/api/webhooks/1026125034873442364/HxGtNKyBU7ISU_9Wk-E48PSMiEJIyQ1Ew3OUR3BQ_mMP04Zwh5Bi6Q5RRSGNKGmsWVCi' -- Log de DV
webh.vehs = 'https://discord.com/api/webhooks/1026133986004717588/8oj6rnFXwEfHdaSOPO4HTm_D7ulEHG3yBBYk8HSAMIDAdBDi5u88yrPOz3zyRk70wxKM' -- Log de vehs (venda de veículos de players para players)
webh.logkill = 'https://discord.com/api/webhooks/1027640983107678280/W3naRN1dhj4_FgwNbWrvt1rkxYB_ZL2v1UQyc9-5Der-SsyXWGckZ0Vl4LusTEdm-zOl' -- Log de /kill
webh.resetarperson = 'https://discord.com/api/webhooks/1026133306691039364/Mbz7iyswvMMLIjKrfmTZKMaAY923WO1QRHBjOR9UgS-_7rvSxICWmWlQyVysrGqaAjGa' -- LOG de reset de personagens
webh.carcolor = 'https://discord.com/api/webhooks/1026202486584922133/cfeXmvdbV94h1eyHTB9ww_VgW-KtfvuqKLaX1suUbHUCtO7KsOktclQDEbmmdlYb4sxh' -- Log de car color

---------------------- LOG DE PONTO ----------------------------

webh.logPonto = 'https://discord.com/api/webhooks/1026202677396381706/1TbwjQOt4gRJKGPIzjoRmrchkKDE1kuAXziEI0FR5CgbI5SkFwzzWlVOXzXJnxOvW3Y_' -- Log de ponto Legal
webh.logPontoStaff = 'https://discord.com/api/webhooks/1026132110660083823/pagbGbRdgS-i7STKK3E0772QGeuiEBJuBxdZeRcnVum2wlmiPgkmDy5BDGModmV-KZ2D' -- Log de ponto Staff

---------------------- PLAYER ----------------------------------

webh.logPegaTroxa = 'https://discord.com/api/webhooks/1026132277639512146/X9eRRl7uU3olCIpV4uFUBNj6J6eZTfi8B_2WFSRluiHCcZn3EtGr1oDiKurOsh7NWpB0' -- Log de BAN em quem tentar dupar salário
webh.logPegarItem = 'https://discord.com/api/webhooks/1026202907311354006/aBsjzxiZk7ZQtoNAhb9cSZbDF1G9cS_S3JF0HAEsftrQh66h0MVnEDDmNvy5TyTEOpAJ' -- Log de pegar item no chão


webh.logsalario = 'https://discord.com/api/webhooks/1026132478383108206/JWdofuvNa6myWjJWLyhHAerTThHE5JjwDR6x0AlPgb9wJab_vEFknzc9Z7EsVmqUIKdJ' -- Log de salário
webh.logeconomia = 'https://discord.com/api/webhooks/1026203142372724736/Gggtpgp3NYhD8J_MG-zlfUzypGxQMv7S3IBazxc7r5vpFJKiDRZqEEws2-GFDN8Xw_mH' -- Log de tentativa de DUMP
webh.logarmaspawnada = 'https://discord.com/api/webhooks/1026133202810720308/ulM-wD6P72AvVVrsDFZQBAaYMWa1MT3NSLSPrYCj-BMuMr_C160RYEMY0NgSi-D9WXW3' -- Log de HACK de ARMAS
webh.logprender = 'https://discord.com/api/webhooks/1026121859059699784/MoVLqcRRdHsnZfFGI7u55bTeVMP04jQTK-V78tAqPmkYPjLPrQG4qr6PiY3bQx7BjoKS' -- Log de prender POLICIA
webh.carregar = 'https://discord.com/api/webhooks/1026203208684671057/kF4jnvmDXDKqHqBrvGugcI4jjMolLWeYuc08x-CR6Q2pXNllzO7SuBWF-pzVUkXzTCau' -- Log de /carregar
webh.bvida = 'https://discord.com/api/webhooks/1026122080938381323/m6w-nbbQetlZVErhjkesyvlO4yZPMrSyNNBm6SiKk_jLr5mpg4K2pD0wc5NmADYw63WC' -- Log de bvida