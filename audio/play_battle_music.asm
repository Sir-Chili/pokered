PlayBattleMusic::
	xor a
	ld [wAudioFadeOutControl], a
	ld [wLowHealthAlarm], a
	dec a ; SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	call DelayFrame
	ld c, BANK(Music_GymLeaderBattle)
	ld a, [wGymLeaderNo]
	and a
	jr z, .notGymLeaderBattle
	ld a, MUSIC_GYM_LEADER_BATTLE
	jr .playSong
.notGymLeaderBattle
	ld a, [wCurOpponent]
	cp OPP_ID_OFFSET
	jr c, .wildBattle
	cp OPP_LORELEI
	jr z, .Elite4Battle
	cp OPP_BRUNO
	jr z, .Elite4Battle
	cp OPP_CHANNELER	; Compare if it's the last two trainers in the list
	jr c, .Elite4Battle
	cp OPP_RIVAL3
	jr z, .championBattle
	cp OPP_PROF_OAK
	jr z, .championBattle
	ld a, MUSIC_TRAINER_BATTLE
	jr .playSong
.Elite4Battle
	ld a, MUSIC_GYM_LEADER_BATTLE
	jr .playSong
.championBattle
	ld a, MUSIC_FINAL_BATTLE
	jr .playSong
.wildBattle
	ld a, MUSIC_WILD_BATTLE
.playSong
	jp PlayMusic
