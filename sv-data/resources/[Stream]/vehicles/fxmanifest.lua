client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version 'adamant'
game 'gta5'
 
files {
    'data/**/*.meta'
}

data_file 'HANDLING_FILE' 'data/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/**/vehiclelayouts.meta'

client_script 'flatbed.lua'



-- files {
--   'audio/audioconfig/lambov10_game.dat151.rel',
--   'audio/audioconfig/lambov10_sounds.dat54.rel',
--   'audio/sfx/dlc_lambov10/lambov10.awc',
--   'audio/sfx/dlc_lambov10/lambov10_npc.awc',
--   'audio/audioconfig/musv8_game.dat151.rel',
--   'audio/audioconfig/musv8_sounds.dat54.rel',
--   'audio/sfx/dlc_musv8/musv8.awc',
--   'audio/sfx/dlc_musv8/musv8_npc.awc',
--   'audio/audioconfig/brabus850_game.dat151.rel',
--   'audio/audioconfig/brabus850_sounds.dat54.rel',
--   'audio/sfx/dlc_brabus850/brabus850.awc',
--   'audio/sfx/dlc_brabus850/brabus850_npc.awc',
--   'audio/audioconfig/shonen_game.dat151.rel',
--   'audio/audioconfig/shonen_sounds.dat54.rel',
--   'audio/sfx/dlc_shonen/shonen.awc',
--   'audio/sfx/dlc_shonen/shonen_npc.awc',
--   'audio/audioconfig/toysupmk4_game.dat151.nametable',
--   'audio/audioconfig/toysupmk4_game.dat151.rel',
--   'audio/audioconfig/toysupmk4_sounds.dat54.nametable',
--   'audio/audioconfig/toysupmk4_sounds.dat54.rel',
--   'audio/sfx/dlc_toysupmk4/toysupmk4.awc',
--   'audio/sfx/dlc_toysupmk4/toysupmk4_npc.awc',
--   'audio/audioconfig/rb26dett_amp.dat10.rel',
--   'audio/audioconfig/rb26dett_game.dat151.rel',
--   'audio/audioconfig/rb26dett_sounds.dat54.rel',
--   'audio/sfx/dlc_rb26dett/rb26dett.awc',
--   'audio/sfx/dlc_rb26dett/rb26dett_npc.awc',
--   'audio/audioconfig/rotary7_game.dat151.rel',
--   'audio/audioconfig/rotary7_sounds.dat54.rel',
--   'audio/sfx/dlc_rotary7/rotary7.awc',
--   'audio/sfx/dlc_rotary7/rotary7_npc.awc',
--   'audio/audioconfig/m297zonda_amp.dat10.nametable',
--   'audio/audioconfig/m297zonda_amp.dat10.rel',
--   'audio/audioconfig/m297zonda_game.dat151.nametable',
--   'audio/audioconfig/m297zonda_game.dat151.rel',
--   'audio/audioconfig/m297zonda_sounds.dat54.nametable',
--   'audio/audioconfig/m297zonda_sounds.dat54.rel',
--   'audio/sfx/dlc_m297zonda/m297zonda.awc',
--   'audio/sfx/dlc_m297zonda/m297zonda_npc.awc',
--   'audio/audioconfig/m158huayra_amp.dat10.nametable',
--   'audio/audioconfig/m158huayra_amp.dat10.rel',
--   'audio/audioconfig/m158huayra_game.dat151.nametable',
--   'audio/audioconfig/m158huayra_game.dat151.rel',
--   'audio/audioconfig/m158huayra_sounds.dat54.nametable',
--   'audio/audioconfig/m158huayra_sounds.dat54.rel',
--   'audio/sfx/dlc_m158huayra/m158huayra.awc',
--   'audio/sfx/dlc_m158huayra/m158huayra_npc.awc',
--   'audio/audioconfig/k20a_amp.dat10.nametable',
--   'audio/audioconfig/k20a_amp.dat10.rel',
--   'audio/audioconfig/k20a_game.dat151.nametable',
--   'audio/audioconfig/k20a_game.dat151.rel',
--   'audio/audioconfig/k20a_sounds.dat54.nametable',
--   'audio/audioconfig/k20a_sounds.dat54.rel',
--   'audio/sfx/dlc_k20a/k20a.awc',
--   'audio/sfx/dlc_k20a/k20a_npc.awc',
--   'audio/audioconfig/gt3flat6_amp.dat10.nametable',
--   'audio/audioconfig/gt3flat6_amp.dat10.rel',
--   'audio/audioconfig/gt3flat6_game.dat151.nametable',
--   'audio/audioconfig/gt3flat6_game.dat151.rel',
--   'audio/audioconfig/gt3flat6_sounds.dat54.nametable',
--   'audio/audioconfig/gt3flat6_sounds.dat54.rel',
--   'audio/sfx/dlc_gt3flat6/gt3flat6.awc',
--   'audio/sfx/dlc_gt3flat6/gt3flat6_npc.awc',
--   'audio/audioconfig/predatorv8_amp.dat10.nametable',
--   'audio/audioconfig/predatorv8_amp.dat10.rel',
--   'audio/audioconfig/predatorv8_game.dat151.nametable',
--   'audio/audioconfig/predatorv8_game.dat151.rel',
--   'audio/audioconfig/predatorv8_sounds.dat54.nametable',
--   'audio/audioconfig/predatorv8_sounds.dat54.rel',
--   'audio/sfx/dlc_predatorv8/predatorv8.awc',
--   'audio/sfx/dlc_predatorv8/predatorv8_npc.awc',
--   'audio/audioconfig/p60b40_amp.dat10.nametable',
--   'audio/audioconfig/p60b40_amp.dat10.rel',
--   'audio/audioconfig/p60b40_game.dat151.nametable',
--   'audio/audioconfig/p60b40_game.dat151.rel',
--   'audio/audioconfig/p60b40_sounds.dat54.nametable',
--   'audio/audioconfig/p60b40_sounds.dat54.rel',
--   'audio/sfx/dlc_p60b40/p60b40.awc',
--   'audio/sfx/dlc_p60b40/p60b40_npc.awc',
--   'audio/audioconfig/m5cracklemod_game.dat151.rel',
-- 	'audio/audioconfig/m5cracklemod_sounds.dat54.rel',
-- 	'audio/sfx/dlc_m5cracklemod/m5cracklemod.awc',
-- 	'audio/sfx/dlc_m5cracklemod/m5cracklemod_npc.awc',
-- 	'audio/audioconfig/r35sound_game.dat151.rel',
-- 	'audio/audioconfig/r35sound_sounds.dat54.rel',
-- 	'audio/sfx/dlc_r35sound/r35sound.awc',
-- 	'audio/sfx/dlc_r35sound/r35sound_npc.awc',
-- 	'audio/audioconfig/aventadorv12_game.dat151.rel',
-- 	'audio/audioconfig/aventadorv12_sounds.dat54.rel',
-- 	'audio/sfx/dlc_aventadorv12/aventadorv12.awc',
-- 	'audio/sfx/dlc_aventadorv12/aventadorv12_npc.awc',
	
--   'audio/audioconfig/porschema2_game.dat151.rel',
--   'audio/audioconfig/porschema2_sounds.dat54.rel',
--   'audio/sfx/dlc_porschema2/porschema2.awc',
--   'audio/sfx/dlc_porschema2/porschema2_npc.awc',
  
--   -- 'audio/audioconfig/b58b30_game.dat151.rel',
--   -- 'audio/audioconfig/b58b30_sounds.dat54.rel',
--   -- 'audio/sfx/dlc_b58b30/b58b30.awc',
--   -- 'audio/sfx/dlc_b58b30/b58b30_npc.awc',
	
-- }

-- -- data_file 'AUDIO_GAMEDATA' 'audio/audioconfig/b58b30_game.dat'
-- -- data_file 'AUDIO_SOUNDDATA' 'audio/audioconfig/b58b30_sounds.dat'
-- -- data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_b58b30'

-- data_file 'AUDIO_GAMEDATA' 'audio/audioconfig/porschema2_game.dat'
-- data_file 'AUDIO_SOUNDDATA' 'audio/audioconfig/porschema2_sounds.dat'
-- data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_porschema2'

-- data_file 'AUDIO_GAMEDATA' 'audio/audioconfig/lambov10_game.dat'
-- data_file 'AUDIO_SOUNDDATA' 'audio/audioconfig/lambov10_sounds.dat'
-- data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_lambov10'
-- data_file 'AUDIO_GAMEDATA' 'audio/audioconfig/musv8_game.dat'
-- data_file 'AUDIO_SOUNDDATA' 'audio/audioconfig/musv8_sounds.dat'
-- data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_musv8'
-- data_file 'AUDIO_GAMEDATA' 'audio/audioconfig/brabus850_game.dat'
-- data_file 'AUDIO_SOUNDDATA' 'audio/audioconfig/brabus850_sounds.dat'
-- data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_brabus850'
-- data_file 'AUDIO_GAMEDATA' 'audio/audioconfig/shonen_game.dat'
-- data_file 'AUDIO_SOUNDDATA' 'audio/audioconfig/shonen_sounds.dat'
-- data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_shonen'
-- data_file 'AUDIO_GAMEDATA' 'audio/audioconfig/toysupmk4_game.dat'
-- data_file 'AUDIO_SOUNDDATA' 'audio/audioconfig/toysupmk4_sounds.dat'
-- data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_toysupmk4'
-- data_file 'AUDIO_SYNTHDATA' 'audio/audioconfig/rb26dett_amp.dat'
-- data_file 'AUDIO_GAMEDATA' 'audio/audioconfig/rb26dett_game.dat'
-- data_file 'AUDIO_SOUNDDATA' 'audio/audioconfig/rb26dett_sounds.dat'
-- data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_rb26dett'
-- data_file 'AUDIO_GAMEDATA' 'audio/audioconfig/rotary7_game.dat'
-- data_file 'AUDIO_SOUNDDATA' 'audio/audioconfig/rotary7_sounds.dat'
-- data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_rotary7'
-- data_file 'AUDIO_SYNTHDATA' 'audio/audioconfig/m297zonda_amp.dat'
-- data_file 'AUDIO_GAMEDATA' 'audio/audioconfig/m297zonda_game.dat'
-- data_file 'AUDIO_SOUNDDATA' 'audio/audioconfig/m297zonda_sounds.dat'
-- data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_m297zonda'
-- data_file 'AUDIO_SYNTHDATA' 'audio/audioconfig/m158huayra_amp.dat'
-- data_file 'AUDIO_GAMEDATA' 'audio/audioconfig/m158huayra_game.dat'
-- data_file 'AUDIO_SOUNDDATA' 'audio/audioconfig/m158huayra_sounds.dat'
-- data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_m158huayra'
-- data_file 'AUDIO_SYNTHDATA' 'audio/audioconfig/k20a_amp.dat'
-- data_file 'AUDIO_GAMEDATA' 'audio/audioconfig/k20a_game.dat'
-- data_file 'AUDIO_SOUNDDATA' 'audio/audioconfig/k20a_sounds.dat'
-- data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_k20a'
-- data_file 'AUDIO_SYNTHDATA' 'audio/audioconfig/gt3flat6_amp.dat'
-- data_file 'AUDIO_GAMEDATA' 'audio/audioconfig/gt3flat6_game.dat'
-- data_file 'AUDIO_SOUNDDATA' 'audio/audioconfig/gt3flat6_sounds.dat'
-- data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_gt3flat6'
-- data_file 'AUDIO_SYNTHDATA' 'audio/audioconfig/predatorv8_amp.dat'
-- data_file 'AUDIO_GAMEDATA' 'audio/audioconfig/predatorv8_game.dat'
-- data_file 'AUDIO_SOUNDDATA' 'audio/audioconfig/predatorv8_sounds.dat'
-- data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_predatorv8'
-- data_file 'AUDIO_SYNTHDATA' 'audio/audioconfig/p60b40_amp.dat'
-- data_file 'AUDIO_GAMEDATA' 'audio/audioconfig/p60b40_game.dat'
-- data_file 'AUDIO_SOUNDDATA' 'audio/audioconfig/p60b40_sounds.dat'
-- data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_p60b40'
-- data_file 'AUDIO_GAMEDATA' 'audio/audioconfig/m5cracklemod_game.dat'
-- data_file 'AUDIO_SOUNDDATA' 'audio/audioconfig/m5cracklemod_sounds.dat'
-- data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_m5cracklemod'
-- data_file 'AUDIO_GAMEDATA' 'audio/audioconfig/r35sound_game.dat'
-- data_file 'AUDIO_SOUNDDATA' 'audio/audioconfig/r35sound_sounds.dat'
-- data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_r35sound'
-- data_file 'AUDIO_GAMEDATA' 'audio/audioconfig/aventadorv12_game.dat'
-- data_file 'AUDIO_SOUNDDATA' 'audio/audioconfig/aventadorv12_sounds.dat'
-- data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_aventadorv12'
                            