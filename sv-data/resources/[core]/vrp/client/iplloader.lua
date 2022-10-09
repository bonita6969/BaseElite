

Citizen.CreateThread(function()
RequestIpl("gabz_pillbox_milo_")
	local interiorID = GetInteriorAtCoords(311.2546, -592.4204, 42.32737)
	local int = {
		"rc12b_fixed",
		"rc12b_destroyed",
		"rc12b_default",
		"rc12b_hospitalinterior_lod",
		"rc12b_hospitalinterior"
	}
	Wait(10000)
	for i = 1, #int, 1 do
		if IsIplActive(int[i]) then
			RemoveIpl(int[i])
		end
	end
	RefreshInterior(interiorID)
	LoadInterior(interiorID)
end)

Citizen.CreateThread(function()
	LoadMpDlcMaps()
	EnableMpDlcMaps(true)

	RequestIpl("rcustoms_milo")

	RequestIpl("coronertrash")
	RequestIpl("Coroner_Int_On")
	RequestIpl("chop_props")
	RemoveIpl("hei_bi_hw1_13_door")
	RequestIpl("v_rockclub")
	
	RemoveIpl("rc12b_default")
	RemoveIpl("rc12b_destroyed")

	RemoveIpl("v_carshowroom")
	RemoveIpl("shutter_open")
	RemoveIpl("shutter_closed")
	RemoveIpl("shr_int")
	RemoveIpl("csr_inMission")
	RequestIpl("v_carshowroom")
	RequestIpl("shr_int")
	RequestIpl("shutter_closed")
	RequestIpl("FINBANK")
	RemoveIpl("facelobbyfake")
	RequestIpl("facelobby")
	RemoveIpl("CS1_02_cf_offmission")
	RequestIpl("CS1_02_cf_onmission1")
	RequestIpl("CS1_02_cf_onmission2")
	RequestIpl("CS1_02_cf_onmission3")
	RequestIpl("CS1_02_cf_onmission4")
	RequestIpl("des_farmhouse")
	RequestIpl("des_farmhs_endimap")
	RequestIpl("des_farmhs_end_occl")
	RequestIpl("des_farmhs_startimap")
	RequestIpl("des_farmhs_start_occl")
	RequestIpl("farm")
	RequestIpl("farmint")
	RequestIpl("farm_props")
	RequestIpl("farmint_cap")
	RemoveIpl("farm_burnt")
	RemoveIpl("farm_burnt_props")
	RequestIpl("FIBlobby")
	RemoveIpl("FIBlobbyfake")
	RequestIpl("FBI_colPLUG")
	RequestIpl("FBI_repair")
	RemoveIpl("id2_14_during_door")
	RemoveIpl("id2_14_during2")
	RemoveIpl("id2_14_on_fire")
	RemoveIpl("id2_14_post_no_int")
	RemoveIpl("id2_14_pre_no_int")
	RequestIpl("id2_14_during1")
	RequestIpl("TrevorsMP")
	RequestIpl("TrevorsTrailer")
	RequestIpl("TrevorsTrailerTidy")
	RequestIpl("TrevorsTrailerTrash")
	RemoveIpl("DT1_03_Gr_Closed")
	RemoveIpl("DT1_03_Shutter")
	RequestIpl("yogagame")
	RequestIpl("v_tunnel_hole")
	RequestIpl("V_Michael")
	RequestIpl("V_Michael_Garage")
	RequestIpl("V_Michael_FameShame")
	RequestIpl("V_Michael_JewelHeist")
	RequestIpl("V_Michael_plane_ticket")
	RequestIpl("V_Michael_Scuba")
	RemoveIpl("smboat")
	RequestIpl("hei_yacht_heist")
	RequestIpl("hei_yacht_heist_Bar")
	RequestIpl("hei_yacht_heist_Bedrm")
	RequestIpl("hei_yacht_heist_Bridge")
	RequestIpl("hei_yacht_heist_DistantLights")
	RequestIpl("hei_yacht_heist_enginrm")
	RequestIpl("hei_yacht_heist_LODLights")
	RequestIpl("hei_yacht_heist_Lounge")
	RequestIpl("cargoship")
	RemoveIpl("sp1_10_fake_interior")
	RemoveIpl("sp1_10_fake_interior_lod")
	RequestIpl("railing_start")
	RequestIpl("railing_end")
	RequestIpl("SC1_01_NewBill")
	RequestIpl("hw1_02_newbill")
	RequestIpl("hw1_emissive_newbill")
	RequestIpl("sc1_14_newbill")
	RequestIpl("dt1_17_newbill")
	RequestIpl("SC1_01_OldBill")
	RequestIpl("SC1_30_Keep_Closed")
	RequestIpl("refit_unload")
	RequestIpl("post_hiest_unload")
	RequestIpl("occl_meth_grp1")
	RequestIpl("Michael_premier")
	RemoveIpl("DT1_05_HC_REMOVE")
	RequestIpl("DT1_05_HC_REQ")
	RequestIpl("DT1_05_REQUEST")
	RemoveIpl("jewel2fake")
	RemoveIpl("bh1_16_refurb")
	RemoveIpl("ch1_02_closed")
	RemoveIpl("scafstartimap")
	RequestIpl("scafendimap")
	RemoveIpl("bh1_16_doors_shut")
	RequestIpl("ferris_finale_Anim")
	RequestIpl("des_stilthouse_rebuild")
	RequestIpl("CS2_06_TriAf02")
	--RequestIpl("cs3_07_mpgates")
	RequestIpl("CS4_08_TriAf02")
	RequestIpl("CS4_04_TriAf03")
	RequestIpl("AP1_04_TriAf01")
	RequestIpl("gr_case0_bunkerclosed")
	RequestIpl("gr_case1_bunkerclosed")
	RequestIpl("gr_case2_bunkerclosed")
	RequestIpl("gr_case3_bunkerclosed")
	RequestIpl("gr_case4_bunkerclosed")
	RequestIpl("gr_case5_bunkerclosed")
	RequestIpl("gr_case6_bunkerclosed")
	RequestIpl("gr_case7_bunkerclosed")
	RequestIpl("gr_case9_bunkerclosed")
	RequestIpl("gr_case10_bunkerclosed")
	RequestIpl("gr_case11_bunkerclosed")
	RequestIpl("cs5_4_trains")
	RequestIpl("chophillskennel")
	RequestIpl("bnkheist_apt_dest")
	RequestIpl("bnkheist_apt_norm")
	RemoveIpl("redcarpet")
	RequestIpl("hei_sm_16_interior_v_bahama_milo_")
	RequestIpl("cs3_05_water_grp1")
	RequestIpl("cs3_05_water_grp1_lod")
	RequestIpl("cs3_05_water_grp2")
	RequestIpl("cs3_05_water_grp2_lod")
	RequestIpl("canyonriver01")
	RequestIpl("canyonriver01_lod")
	RequestIpl("bh1_47_joshhse_unburnt")
	RequestIpl("bh1_47_joshhse_unburnt_lod")
	RequestIpl("bkr_bi_hw1_13_int")
	RequestIpl("CanyonRvrShallow")
	RequestIpl("methtrailer_grp1")
	RequestIpl("lr_cs6_08_grave_closed")
	RequestIpl("bkr_bi_id1_23_door")
	RequestIpl("ch1_02_open")
	RequestIpl("sp1_10_real_interior")
	RequestIpl("sp1_10_real_interior_lod")
	RequestIpl("Carwash_with_spinners")
	RequestIpl("apa_v_mp_h_01_a")
	RequestIpl("apa_v_mp_h_06_b")
	RequestIpl("apa_v_mp_h_08_c")
	RequestIpl("ex_dt1_02_office_01c")
	RequestIpl("ex_dt1_11_office_01b")
	RequestIpl("ex_sm_13_office_01a")
	RequestIpl("ex_sm_15_office_02b")
	RequestIpl("bkr_biker_interior_placement_interior_0_biker_dlc_int_01_milo")
	RequestIpl("bkr_biker_interior_placement_interior_1_biker_dlc_int_02_milo")
	RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo")
	RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware02_milo")
	RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware03_milo")
	RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware04_milo")
	RequestIpl("bkr_biker_interior_placement_interior_2_biker_dlc_int_ware05_milo")
	RequestIpl("bkr_biker_interior_placement_interior_3_biker_dlc_int_ware02_milo")
	RequestIpl("bkr_biker_interior_placement_interior_4_biker_dlc_int_ware03_milo")
	RequestIpl("bkr_biker_interior_placement_interior_5_biker_dlc_int_ware04_milo")
	RequestIpl("bkr_biker_interior_placement_interior_6_biker_dlc_int_ware05_milo")
	RequestIpl("ex_exec_warehouse_placement_interior_1_int_warehouse_s_dlc_milo")
	RequestIpl("ex_exec_warehouse_placement_interior_0_int_warehouse_m_dlc_milo")
	RequestIpl("ex_exec_warehouse_placement_interior_2_int_warehouse_l_dlc_milo")
	RequestIpl("imp_impexp_interior_placement")
	RequestIpl("imp_impexp_interior_placement_interior_0_impexp_int_01_milo_")
	RequestIpl("imp_impexp_interior_placement_interior_1_impexp_intwaremed_milo_")
	RequestIpl("imp_impexp_interior_placement_interior_2_imptexp_mod_int_01_milo_")
	RequestIpl("imp_impexp_interior_placement_interior_3_impexp_int_02_milo_")
	RequestIpl("gr_case0_bunkerclosed")
	RequestIpl("gr_case1_bunkerclosed")
	RequestIpl("gr_case2_bunkerclosed")
	RequestIpl("gr_case3_bunkerclosed")
	RequestIpl("gr_case4_bunkerclosed")
	RequestIpl("gr_case5_bunkerclosed")
	RequestIpl("gr_case6_bunkerclosed")
	RequestIpl("gr_case7_bunkerclosed")
	RequestIpl("gr_case9_bunkerclosed")
	RequestIpl("gr_case10_bunkerclosed")
	RequestIpl("gr_case11_bunkerclosed")
	RequestIpl("gr_entrance_placement")
	RequestIpl("gr_grdlc_interior_placement")
	RequestIpl("gr_grdlc_interior_placement_interior_0_grdlc_int_01_milo_")
	RequestIpl("gr_grdlc_interior_placement_interior_1_grdlc_int_02_milo_")
	RequestIpl("ch3_rd2_bishopschickengraffiti")
	RequestIpl("cs5_04_mazebillboardgraffiti")
	RequestIpl("cs5_roads_ronoilgraffiti")
	RequestIpl("ba_barriers_case0")
	RequestIpl("ba_case0_forsale")
	RequestIpl("ba_case0_dixon")
	RequestIpl("ba_case0_madonna")
	RequestIpl("ba_case0_solomun")
	RequestIpl("ba_case0_taleofus")
	RequestIpl("ba_barriers_case1")
	RequestIpl("ba_case1_forsale")
	RequestIpl("ba_case1_dixon")
	RequestIpl("ba_case1_madonna")
	RequestIpl("ba_case1_solomun")
	RequestIpl("ba_case1_taleofus")
	RequestIpl("ba_barriers_case2")
	RequestIpl("ba_case2_forsale")
	RequestIpl("ba_case2_dixon")
	RequestIpl("ba_case2_madonna")
	RequestIpl("ba_case2_solomun")
	RequestIpl("ba_case2_taleofus")
	RequestIpl("ba_barriers_case3")
	RequestIpl("ba_case3_forsale")
	RequestIpl("ba_case3_dixon")
	RequestIpl("ba_case3_madonna")
	RequestIpl("ba_case3_solomun")
	RequestIpl("ba_case3_taleofus")
	RequestIpl("ba_barriers_case4")
	RequestIpl("ba_case4_forsale")
	RequestIpl("ba_case4_dixon")
	RequestIpl("ba_case4_madonna")
	RequestIpl("ba_case4_solomun")
	RequestIpl("ba_case4_taleofus")
	RequestIpl("ba_barriers_case5")
	RequestIpl("ba_case5_forsale")
	RequestIpl("ba_case5_dixon")
	RequestIpl("ba_case5_madonna")
	RequestIpl("ba_case5_solomun")
	RequestIpl("ba_case5_taleofus")
	RequestIpl("ba_barriers_case6")
	RequestIpl("ba_case6_forsale")
	RequestIpl("ba_case6_dixon")
	RequestIpl("ba_case6_madonna")
	RequestIpl("ba_case6_solomun")
	RequestIpl("ba_case6_taleofus")
	RequestIpl("ba_barriers_case7")
	RequestIpl("ba_case7_forsale")
	RequestIpl("ba_case7_dixon")
	RequestIpl("ba_case7_madonna")
	RequestIpl("ba_case7_solomun")
	RequestIpl("ba_case7_taleofus")
	RequestIpl("ba_barriers_case8")
	RequestIpl("ba_case8_forsale")
	RequestIpl("ba_case8_dixon")
	RequestIpl("ba_case8_madonna")
	RequestIpl("ba_case8_solomun")
	RequestIpl("ba_case8_taleofus")
	RequestIpl("ba_barriers_case9")
	RequestIpl("ba_case9_forsale")
	RequestIpl("ba_case9_dixon")
	RequestIpl("ba_case9_madonna")
	RequestIpl("ba_case9_solomun")
	RequestIpl("ba_case9_taleofus")
	RequestIpl("gr_grdlc_yacht_lod")
	RequestIpl("gr_grdlc_yacht_placement")
	RequestIpl("gr_heist_yacht2")
	RequestIpl("gr_heist_yacht2_bar")
	RequestIpl("gr_heist_yacht2_bar_lod")
	RequestIpl("gr_heist_yacht2_bedrm")
	RequestIpl("gr_heist_yacht2_bedrm_lod")
	RequestIpl("gr_heist_yacht2_bridge")
	RequestIpl("gr_heist_yacht2_bridge_lod")
	RequestIpl("gr_heist_yacht2_enginrm")
	RequestIpl("gr_heist_yacht2_enginrm_lod")
	RequestIpl("gr_heist_yacht2_lod")
	RequestIpl("gr_heist_yacht2_lounge")
	RequestIpl("gr_heist_yacht2_lounge_lod")
	RequestIpl("gr_heist_yacht2_slod")
end)
local EntitySetsTuner = {
	['entity_set_bedroom'] = true,
	['entity_set_bedroom_empty'] = true,
	['entity_set_bombs'] = true,
	['entity_set_box_clutter'] = false,
	['entity_set_cabinets'] = true,
	['entity_set_car_lift_cutscene'] = true,
	['entity_set_car_lift_default'] = true,
	['entity_set_car_lift_purchase'] = true,
	['entity_set_chalkboard'] = true,
	['entity_set_container'] = true,
	['entity_set_cut_seats'] = true,
	['entity_set_def_table'] = true,
	['entity_set_drive'] = true,
	['entity_set_ecu'] = true,
	['entity_set_IAA'] = true,
	['entity_set_jammers'] = true,
	['entity_set_laptop'] = true,
	['entity_set_lightbox'] = true,
	['entity_set_methLab'] = true,
	['entity_set_plate'] = true,
	['entity_set_scope'] = true,
	['entity_set_style_1'] = true,
	['entity_set_style_2'] = false,
	['entity_set_style_3'] = false,
	['entity_set_style_4'] = false,
	['entity_set_style_5'] = false,
	['entity_set_style_6'] = false,
	['entity_set_style_7'] = false,
	['entity_set_style_8'] = false,
	['entity_set_style_9'] = false,
	['entity_set_table'] = true,
	['entity_set_thermal'] = true,
	['entity_set_tints'] = true,
	['entity_set_train'] = true,
	['entity_set_virus'] = true,
}	
local entitySetsMeet = {
['entity_set_meet_crew'] = true,
['entity_set_meet_lights'] = true,
['entity_set_meet_lights_cheap'] = true,
['entity_set_player'] = true,
['entity_set_test_crew'] = true,
['entity_set_test_lights'] = true,
['entity_set_test_lights_cheap'] = true,
['entity_set_time_trial'] = true,
}	
local EntitySetMeth = {
	['tintable_walls'] = true,
}	  
Citizen.CreateThread(function()
	local tuna_interior_id = GetInteriorAtCoords(vector3(-1350.0, 160.0, -100.0))
	local meetup_interior_id = GetInteriorAtCoords(vector3(-2000.0, 1113.211, -25.36243))
	local methlab_interior_id = GetInteriorAtCoords(vector3(981.9999, -143.0, -50.0))
	RequestIpl('tr_tuner_meetup')
	RequestIpl('tr_tuner_race_line')
	RequestIpl('tr_tuner_shop_burton')
	RequestIpl('tr_tuner_shop_mesa' )
	RequestIpl('tr_tuner_shop_mission' )
	RequestIpl('tr_tuner_shop_rancho')
	RequestIpl('tr_tuner_shop_strawberry')		
	if IsValidInterior(tuna_interior_id) then
	  RefreshInterior(tuna_interior_id)
	end	
	if IsValidInterior(meetup_interior_id) then
		RefreshInterior(meetup_interior_id)
	end	
	if IsValidInterior(methlab_interior_id) then
		RefreshInterior(methlab_interior_id)
	end	
	for k, v in pairs(EntitySetsTuner) do
		if v then
			ActivateInteriorEntitySet(
				tuna_interior_id , 
				k 
			)
		else
			DeactivateInteriorEntitySet(
				tuna_interior_id , 
				k
			)
		end	
	end

	for k, v in pairs(entitySetsMeet) do
		if v then
			ActivateInteriorEntitySet(
				meetup_interior_id , 
				k 
			)
		else
			DeactivateInteriorEntitySet(
				meetup_interior_id , 
				k 
			)
		end
	end
	for k, v in pairs(EntitySetMeth) do
		if v then
			ActivateInteriorEntitySet(
				methlab_interior_id , 
				k 
			)
		else
			DeactivateInteriorEntitySet(
				methlab_interior_id , 
				k 
			)
		end
	end	
	SetInteriorEntitySetColor(284673, "tintable_walls", 2)
end)	

local requestedIpl = {"h4_islandairstrip", "h4_islandairstrip_props", "h4_islandx_mansion", "h4_islandx_mansion_props", "h4_islandx_props", "h4_islandxdock", "h4_islandxdock_props", "h4_islandxdock_props_2", "h4_islandxtower", "h4_islandx_maindock", "h4_islandx_maindock_props", "h4_islandx_maindock_props_2", "h4_IslandX_Mansion_Vault", "h4_islandairstrip_propsb", "h4_beach", "h4_beach_props", "h4_beach_bar_props", "h4_islandx_barrack_props", "h4_islandx_checkpoint", "h4_islandx_checkpoint_props", "h4_islandx_Mansion_Office", "h4_islandx_Mansion_LockUp_01", "h4_islandx_Mansion_LockUp_02", "h4_islandx_Mansion_LockUp_03", "h4_islandairstrip_hangar_props", "h4_IslandX_Mansion_B", "h4_islandairstrip_doorsclosed", "h4_Underwater_Gate_Closed", "h4_mansion_gate_closed", "h4_aa_guns", "h4_IslandX_Mansion_GuardFence", "h4_IslandX_Mansion_Entrance_Fence", "h4_IslandX_Mansion_B_Side_Fence", "h4_IslandX_Mansion_Lights", "h4_islandxcanal_props", "h4_beach_props_party", "h4_islandX_Terrain_props_06_a", "h4_islandX_Terrain_props_06_b", "h4_islandX_Terrain_props_06_c", "h4_islandX_Terrain_props_05_a", "h4_islandX_Terrain_props_05_b", "h4_islandX_Terrain_props_05_c", "h4_islandX_Terrain_props_05_d", "h4_islandX_Terrain_props_05_e", "h4_islandX_Terrain_props_05_f", "H4_islandx_terrain_01", "H4_islandx_terrain_02", "H4_islandx_terrain_03", "H4_islandx_terrain_04", "H4_islandx_terrain_05", "H4_islandx_terrain_06", "h4_ne_ipl_00", "h4_ne_ipl_01", "h4_ne_ipl_02", "h4_ne_ipl_03", "h4_ne_ipl_04", "h4_ne_ipl_05", "h4_ne_ipl_06", "h4_ne_ipl_07", "h4_ne_ipl_08", "h4_ne_ipl_09", "h4_nw_ipl_00", "h4_nw_ipl_01", "h4_nw_ipl_02", "h4_nw_ipl_03", "h4_nw_ipl_04", "h4_nw_ipl_05", "h4_nw_ipl_06", "h4_nw_ipl_07", "h4_nw_ipl_08", "h4_nw_ipl_09", "h4_se_ipl_00", "h4_se_ipl_01", "h4_se_ipl_02", "h4_se_ipl_03", "h4_se_ipl_04", "h4_se_ipl_05", "h4_se_ipl_06", "h4_se_ipl_07", "h4_se_ipl_08", "h4_se_ipl_09", "h4_sw_ipl_00", "h4_sw_ipl_01", "h4_sw_ipl_02", "h4_sw_ipl_03", "h4_sw_ipl_04", "h4_sw_ipl_05", "h4_sw_ipl_06", "h4_sw_ipl_07", "h4_sw_ipl_08", "h4_sw_ipl_09", "h4_islandx_mansion", "h4_islandxtower_veg", "h4_islandx_sea_mines", "h4_islandx", "h4_islandx_barrack_hatch", "h4_islandxdock_water_hatch", "h4_beach_party"}

CreateThread(function()
	for i = #requestedIpl, 1, -1 do
		RequestIpl(requestedIpl[i])
		requestedIpl[i] = nil
	end
	requestedIpl = nil
end)

CreateThread(function()
	while true do
		SetRadarAsExteriorThisFrame()
		SetRadarAsInteriorThisFrame(`h4_fake_islandx`, vec(4700.0, -5145.0), 0, 0)
		Wait(0)
	end
end)

CreateThread(function()
	Wait(2500)
	local islandLoaded = false
	local islandCoords = vector3(4840.571, -5174.425, 2.0)
	SetDeepOceanScaler(0.0)
	while true do
		local pCoords = GetEntityCoords(PlayerPedId())
		if #(pCoords - islandCoords) < 2000.0 then
			if not islandLoaded then
				islandLoaded = true
				Citizen.InvokeNative(0xF74B1FFA4A15FBEA, 1)
			end
		else
			if islandLoaded then
				islandLoaded = false
				Citizen.InvokeNative(0xF74B1FFA4A15FBEA, 0)
			end
		end
		Wait(5000)
	end
end)