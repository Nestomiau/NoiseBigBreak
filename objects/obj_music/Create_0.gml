global.musics = ds_list_create()
global.rmTrigger = ds_list_create()

scr_music_addSong(mu_ntest2_start,testroom_1,-10,[mu_ntest2_start,mu_ntest2_loop])
scr_music_addSong(mu_ntest2_loop,-10,-10,[mu_ntest2_loop,mu_ntest2_start])
//scr_music_addSong()

playSong = -4
endTrigger = -4