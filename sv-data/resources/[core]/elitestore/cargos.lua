---------------------------------------------------------------------------------------------------------
---------------------------------------- [ ELITESTORE ] -------------------------------------------------
---------------------------------------------------------------------------------------------------------
salarios = {}


salarios.values = {
	------------------------------ [ STAFF ] -----------------------------------

	{ ['permissao'] = "manager.permissao", ['nome'] = "Ademirzao", ['payment'] = 2500 },
	{ ['permissao'] = "administrador.permissao", ['nome'] = "Ademir Medio", ['payment'] = 2000 },
	{ ['permissao'] = "moderador.permissao", ['nome'] = "Ademir Junior", ['payment'] = 1000 },
	{ ['permissao'] = "suporte.permissao", ['nome'] = "Ademir Mirim", ['payment'] = 800 },

	---------------------------------- [ POLICIA ] ----------------------------

	{ ['permissao'] = "recruta.permissao", ['nome'] = "Recruta", ['payment'] = 1500 },
	{ ['permissao'] = "soldado.permissao", ['nome'] = "Soldado", ['payment'] = 3000 },
	{ ['permissao'] = "cabo.permissao", ['nome'] = "Cabo", ['payment'] = 3400 },
	{ ['permissao'] = "3sargento.permissao", ['nome'] = "3° Sargento", ['payment'] = 3600 },
	{ ['permissao'] = "2sargento.permissao", ['nome'] = "2° Sargento", ['payment'] = 3800 },
	{ ['permissao'] = "1sargento.permissao", ['nome'] = "1° Sargento", ['payment'] = 4000 },
	{ ['permissao'] = "subtenente.permissao", ['nome'] = "Subtenente", ['payment'] = 4200 },
	{ ['permissao'] = "tenente.permissao", ['nome'] = "Tenente", ['payment'] = 4400 },
	{ ['permissao'] = "caputao.permissao", ['nome'] = "Capitão", ['payment'] = 4600 },
	{ ['permissao'] = "major.permissao", ['nome'] = "Major", ['payment'] = 4800 },
	{ ['permissao'] = "tcel.permissao", ['nome'] = "Tenente Coronel", ['payment'] = 5000 },
	{ ['permissao'] = "coronel.permissao", ['nome'] = "Coronel", ['payment'] = 5200 },
	{ ['permissao'] = "subcomandante.permissao", ['nome'] = "SubComandante", ['payment'] = 5400 },
	{ ['permissao'] = "comandante.permissao", ['nome'] = "Comandante", ['payment'] = 6000 },
	{ ['permissao'] = "comandanteAP.permissao", ['nome'] = "Comandante Paisana", ['payment'] = 3200 },

	---------------------------------- [ HOSPITAL ] ----------------------------

	{ ['permissao'] = "enfermeiroems.permissao", ['nome'] = "Enfermeiro", ['payment'] = 5000 },
	{ ['permissao'] = "medicoems.permissao", ['nome'] = "Médico", ['payment'] = 6000 },
	{ ['permissao'] = "paramedicoems.permissao", ['nome'] = "Paramédico", ['payment'] = 5000 },
	{ ['permissao'] = "vicediretorems.permissao", ['nome'] = "ViceDiretor", ['payment'] = 7000 },
	{ ['permissao'] = "diretorems.permissao", ['nome'] = "Diretor", ['payment'] = 8000 },

	---------------------------------- [ MECANICO ] ----------------------------

	{ ['permissao'] = "mecanico1.permissao", ['nome'] = "Mecanico", ['payment'] = 800 },
	{ ['permissao'] = "estagiomec.permissao", ['nome'] = "Mecanico Estagiário", ['payment'] = 500 },
	{ ['permissao'] = "gerentemec.permissao", ['nome'] = "Mecanico Gerente", ['payment'] = 1000 },
	{ ['permissao'] = "lidermec.permissao", ['nome'] = "Mecanico Chefe", ['payment'] = 2000 },

	---------------------------------- [ CONFEITARIA ] ----------------------------

	{ ['permissao'] = "atendenteconfeitaria.permissao", ['nome'] = "Mecanico", ['payment'] = 3000 },
	{ ['permissao'] = "funcconfeitaria.permissao", ['nome'] = "Mecanico Estagiário", ['payment'] = 2500 },
	{ ['permissao'] = "gerenteconfeitaria.permissao", ['nome'] = "Mecanico Gerente", ['payment'] = 4000 },
	{ ['permissao'] = "liderconfeitaria.permissao", ['nome'] = "Mecanico Chefe", ['payment'] = 5000 },

		---------------------------------- [ Cafeteria ] ----------------------------

	{ ['permissao'] = "cafeteria1.permissao", ['nome'] = "Cafeteria", ['payment'] = 3000 },
	{ ['permissao'] = "estagiariocafe.permissao", ['nome'] = "Cafeteria Estagiário", ['payment'] = 2500 },
	{ ['permissao'] = "gerentecafe.permissao", ['nome'] = "Cafeteria Gerente", ['payment'] = 4000 },
	{ ['permissao'] = "lidercafe.permissao", ['nome'] = "Cafeteria Chefe", ['payment'] = 5000 },
	
	----------------------------------------- [ VIPS ] ------------------------------

	{ ['permissao'] = "bronze.permissao", ['nome'] = "VIP Ouro", ['payment'] = 400 },
	{ ['permissao'] = "prata.permissao", ['nome'] = "VIP Ouro", ['payment'] = 600 },
	{ ['permissao'] = "ouro.permissao", ['nome'] = "VIP Ouro", ['payment'] = 800 },
	{ ['permissao'] = "platina.permissao", ['nome'] = "VIP Platina", ['payment'] = 1000 },
	{ ['permissao'] = "diamante.permissao", ['nome'] = "VIP Diamante", ['payment'] = 1400},
	{ ['permissao'] = "ultimate.permissao", ['nome'] = "VIP Ultimate", ['payment'] = 1800 },
	{ ['permissao'] = "sua.permissao", ['nome'] = "VIP Seu", ['payment'] = 2400 },

	----------------------------------------- [ JURÍDICO ] ------------------------------

	{ ['permissao'] = "advogado.permissao", ['nome'] = "Advogado", ['payment'] = 800 },
	{ ['permissao'] = "ministrostj.permissao", ['nome'] = "Ministro da Justiça", ['payment'] = 2000 },
	{ ['permissao'] = "ministrostf.permissao", ['nome'] = "Ministro da Justiça", ['payment'] = 3000 },
	{ ['permissao'] = "juiz.permissao", ['nome'] = "Juiz", ['payment'] = 2000},
}

cargos = {}

cargos.toogle = {
	-------------------------------------------------- [ POLICIA ] ---------------------------------------------------------- 

	{ ['ingroup'] = 'Recruta', ['inperm'] = 'recruta.permissao', ['outgroup'] = 'RecrutaAP', ['outperm'] = 'recrutaAP.permissao' },
	{ ['ingroup'] = 'Soldado', ['inperm'] = 'soldado.permissao', ['outgroup'] = 'SoldadoAP', ['outperm'] = 'soldadoAP.permissao' },
	{ ['ingroup'] = 'Cabo', ['inperm'] = 'cabo.permissao', ['outgroup'] = 'CaboAP', ['outperm'] = 'caboAP.permissao' },
	{ ['ingroup'] = '3Sargento', ['inperm'] = '3sargento.permissao', ['outgroup'] = '3SargentoAP', ['outperm'] = '3sargentoAP.permissao' },
	{ ['ingroup'] = '2Sargento', ['inperm'] = '2sargento.permissao', ['outgroup'] = '2SargentoAP', ['outperm'] = '2sargentoAP.permissao' },
	{ ['ingroup'] = '1Sargento', ['inperm'] = '1sargento.permissao', ['outgroup'] = '1SargentoAP', ['outperm'] = '1sargentoAP.permissao' },
	{ ['ingroup'] = 'Subtenente', ['inperm'] = 'subtenente.permissao', ['outgroup'] = 'SubtenenteAP', ['outperm'] = 'subtenenteAP.permissao' },
	{ ['ingroup'] = 'Tenente', ['inperm'] = 'tenente.permissao', ['outgroup'] = 'TenenteAP', ['outperm'] = 'tenenteAP.permissao' },
	{ ['ingroup'] = 'Capitao', ['inperm'] = 'capitao.permissao', ['outgroup'] = 'CapitaoAP', ['outperm'] = 'capitaoAP.permissao' },
	{ ['ingroup'] = 'Major', ['inperm'] = 'major.permissao', ['outgroup'] = 'MajorAP', ['outperm'] = 'majorAP.permissao' },
	{ ['ingroup'] = 'Tencoronel', ['inperm'] = 'tcel.permissao', ['outgroup'] = 'TencoronelAP', ['outperm'] = 'tcelAP.permissao' },
	{ ['ingroup'] = 'Coronel', ['inperm'] = 'coronel.permissao', ['outgroup'] = 'CoronelAP', ['outperm'] = 'coronelAP.permissao' },
	{ ['ingroup'] = 'Subcomandante', ['inperm'] = 'subcomandante.permissao', ['outgroup'] = 'SubcomandanteAP', ['outperm'] = 'subcomandanteAP.permissao' },
	{ ['ingroup'] = 'Comandante', ['inperm'] = 'comandante.permissao', ['outgroup'] = 'ComandanteAP', ['outperm'] = 'comandanteAP.permissao' },
	-------------------------------------------------- [ MECANICA ] ---------------------------------------------------------- 

	{ ['ingroup'] = 'Mecanico', ['inperm'] = 'funcionariomec.permissao', ['outgroup'] = 'MecanicoAP', ['outperm'] = 'mecanicoAP.permissao' },
	{ ['ingroup'] = 'Estagiariomec', ['inperm'] = 'estagiomec.permissao', ['outgroup'] = 'EstagiariomecAP', ['outperm'] = 'estagiariomecAP.permissao' },
	{ ['ingroup'] = 'Gerentemec', ['inperm'] = 'gerentemec.permissao', ['outgroup'] = 'GerentemecAP', ['outperm'] = 'gerentemecAP.permissao' },
	{ ['ingroup'] = 'Lidermec', ['inperm'] = 'lidermec.permissao', ['outgroup'] = 'LidermecAP', ['outperm'] = 'lidermecanicoAP.permissao' },
		-------------------------------------------------- [ CAFETERIA ] ---------------------------------------------------------- 

	{ ['ingroup'] = 'Cafeteria', ['inperm'] = 'cafeatendente.permissao', ['outgroup'] = 'CafeteriaAp', ['outperm'] = 'cafeatendenteap.permissao' },
	{ ['ingroup'] = 'Estagiariocafe', ['inperm'] = 'estagiariocafe.permissao', ['outgroup'] = 'EstagiariocafeAp', ['outperm'] = 'estagiariocafeap.permissao' },
	{ ['ingroup'] = 'Gerentecafeteria', ['inperm'] = 'gerentecafe.permissao', ['outgroup'] = 'GerentecafeteriaAp', ['outperm'] = 'gerentecafeap.permissao' },
	{ ['ingroup'] = 'Lidercafeteria', ['inperm'] = 'lidercafe.permissao', ['outgroup'] = 'LidercafeteriaAp', ['outperm'] = 'lidercafeap.permissao' },
		-------------------------------------------------- [ CONFEITARIA ] ---------------------------------------------------------- 

	{ ['ingroup'] = 'Atendenteconfeitaria', ['inperm'] = 'atendenteconfeitaria.permissao', ['outgroup'] = 'AtendenteconfeitariaAP', ['outperm'] = 'atendenteconfeitariaAP.permissao' },
	{ ['ingroup'] = 'Confeitaria', ['inperm'] = 'funcconfeitaria.permissao', ['outgroup'] = 'ConfeitariaAP', ['outperm'] = 'funcconfeitariaAP.permissao' },
	{ ['ingroup'] = 'Gerenteconfeitaria', ['inperm'] = 'gerenteconfeitaria.permissao', ['outgroup'] = 'GerenteconfeitariaAP', ['outperm'] = 'gerenteconfeitariaAP.permissao' },
	{ ['ingroup'] = 'Liderconfeitaria', ['inperm'] = 'liderconfeitaria.permissao', ['outgroup'] = 'LiderconfeitariaAP', ['outperm'] = 'liderconfeitariaAP.permissao' },
	-------------------------------------------------- [ HOSPITAL ] ---------------------------------------------------------- 
	
	{ ['ingroup'] = 'Enfermeiroems', ['inperm'] = 'enfermeiroems.permissao', ['outgroup'] = 'EnfermeiroemsAP', ['outperm'] = 'enfermeiroemsAP.permissao' },
	{ ['ingroup'] = 'Medicoems', ['inperm'] = 'medicoems.permissao', ['outgroup'] = 'MedicoemsAP', ['outperm'] = 'medicoemsAP.permissao' },
	{ ['ingroup'] = 'Paramedicoems', ['inperm'] = 'paramedicoems.permissao', ['outgroup'] = 'ParamedicoemsAP', ['outperm'] = 'paramedicoemsAP.permissao' },
	{ ['ingroup'] = 'Vicediretorems', ['inperm'] = 'vicediretorems.permissao', ['outgroup'] = 'VicediretoremsAP', ['outperm'] = 'vicediretoremsAP.permissao' },
	{ ['ingroup'] = 'Diretorems', ['inperm'] = 'diretorems.permissao', ['outgroup'] = 'DiretoremsAP', ['outperm'] = 'diretoremsAP.permissao' },

}

cargos.tooglestaff = {

	{ ['ingroups'] = 'Manager', ['inperms'] = 'managersrv.permissao', ['outgroups'] = 'ManagerAP', ['outperms'] = 'managerp.permissao' },
	{ ['ingroups'] = 'Administrador', ['inperms'] = 'administradorsrv.permissao', ['outgroups'] = 'AdministradorAP', ['outperms'] = 'administradorp.permissao' },
	{ ['ingroups'] = 'Moderador', ['inperms'] = 'moderadorsrv.permissao', ['outgroups'] = 'ModeradorAP', ['outperms'] = 'moderadorp.permissao' },
	{ ['ingroups'] = 'Suporte', ['inperms'] = 'suportesrv.permissao', ['outgroups'] = 'SuporteAP', ['outperms'] = 'suportep.permissao' },

}