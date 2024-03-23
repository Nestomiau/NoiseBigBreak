live_auto_call

global.musics = ds_list_create()
global.rmTrigger = ds_list_create()


scr_music_addSong(mu_ntest2_start,harroz_1,-10,[mu_ntest2_start,mu_ntest2_loop])
scr_music_addSong(mu_ntest2_loop,-10,-10,[mu_ntest2_loop,mu_ntest2_start])
scr_music_addSong(mu_nOTest1cNoi_start,testroom_1,-11,[mu_nOTest1cNoi_start,mu_nOTest1cNoi_loop])
scr_music_addSong(mu_nOTest1cNoi_loop,-11,-11,[mu_nOTest1cNoi_start,mu_nOTest1cNoi_loop])
//scr_music_addSong()


endTrigger = -4
playSong = -4