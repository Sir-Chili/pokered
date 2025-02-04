VermilionGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	push hl
	call nz, .LoadNames
	pop hl
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	call nz, VermilionGymSetDoorTile
	call EnableAutoTextBoxDrawing
	ld hl, VermilionGymTrainerHeaders
	ld de, VermilionGym_ScriptPointers
	ld a, [wVermilionGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wVermilionGymCurScript], a
	ret

.LoadNames:
	ld hl, .CityName
	ld de, .LeaderName
	jp LoadGymLeaderAndCityName

.CityName:
	db "VERMILION CITY@"

.LeaderName:
	db "LT.SURGE@"

VermilionGymSetDoorTile:
	CheckEvent EVENT_2ND_LOCK_OPENED
	jr nz, .doorsOpen
	ld a, $24 ; double door tile ID
	jr .replaceTile
.doorsOpen
	ld a, SFX_GO_INSIDE
	call PlaySound
	ld a, $5 ; clear floor tile ID
.replaceTile
	ld [wNewTileBlockID], a
	lb bc, 2, 2
	predef_jump ReplaceTileBlock

VermilionGymResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wVermilionGymCurScript], a
	ld [wCurMapScript], a
	ret

VermilionGym_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_VERMILIONGYM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_VERMILIONGYM_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_VERMILIONGYM_END_BATTLE
	dw_const VermilionGymLTSurgeAfterBattleScript,  SCRIPT_VERMILIONGYM_LT_SURGE_AFTER_BATTLE

VermilionGymLTSurgeAfterBattleScript:
	ld a, [wIsInBattle]
	cp $ff ; did we lose?
	jp z, VermilionGymResetScripts
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, [wGameStage] ; Check if player has beat the game
    and a
    jr nz, LtSurgeRematchPostBattle

VermilionGymLTSurgeReceiveTM45Script:
	ld a, TEXT_VERMILIONGYM_LT_SURGE_THUNDER_BADGE_INFO
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_LT_SURGE
	lb bc, TM_THUNDER_WAVE, 1
	call GiveItem
	jr nc, .bag_full
	ld a, TEXT_VERMILIONGYM_LT_SURGE_RECEIVED_TM45
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM45
	jr .gym_victory
.bag_full
	ld a, TEXT_VERMILIONGYM_LT_SURGE_TM45_NO_ROOM
	ldh [hTextID], a
	call DisplayTextID
.gym_victory
	ld hl, wObtainedBadges
	set BIT_THUNDERBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_THUNDERBADGE, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_VERMILION_GYM_TRAINER_0, EVENT_BEAT_VERMILION_GYM_TRAINER_2

	jp VermilionGymResetScripts

LtSurgeRematchPostBattle:
	ld a, TEXT_VERMILIONGYM_REMATCH_POST_BATTLE
	ldh [hTextID], a
	call DisplayTextID
	lb bc, TM_THUNDER_WAVE, 1
	call GiveItem
	jr nc, .BagFull
	ld a, TEXT_VERMILIONGYM_PLEASE_ACCEPT_TM
	ldh [hTextID], a
	call DisplayTextID
	ld a, TEXT_VERMILIONGYM_REMATCH_RECEIVED_TM45
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wRematchFlag
	res 2, [hl]
	jr .itemObtained
.BagFull
	ld a, TEXT_VERMILIONGYM_LT_SURGE_TM45_NO_ROOM
	ldh [hTextID], a
	call DisplayTextID
.itemObtained
	jp VermilionGymResetScripts


VermilionGym_TextPointers:
	def_text_pointers
	dw_const VermilionGymLTSurgeText,                 TEXT_VERMILIONGYM_LT_SURGE
	dw_const VermilionGymGentlemanText,               TEXT_VERMILIONGYM_GENTLEMAN
	dw_const VermilionGymSuperNerdText,               TEXT_VERMILIONGYM_SUPER_NERD
	dw_const VermilionGymSailorText,                  TEXT_VERMILIONGYM_SAILOR
	dw_const VermilionGymGymGuideText,                TEXT_VERMILIONGYM_GYM_GUIDE
	dw_const VermilionGymLTSurgeThunderBadgeInfoText, TEXT_VERMILIONGYM_LT_SURGE_THUNDER_BADGE_INFO
	dw_const VermilionGymLTSurgeReceivedTM45Text,     TEXT_VERMILIONGYM_LT_SURGE_RECEIVED_TM45
	dw_const VermilionGymLTSurgeTM45NoRoomText,       TEXT_VERMILIONGYM_LT_SURGE_TM45_NO_ROOM
	dw_const VermilionGymRematchPostBattleText, 	  TEXT_VERMILIONGYM_REMATCH_POST_BATTLE
	dw_const VermilionGymRematchPleaseAcceptTM,       TEXT_VERMILIONGYM_PLEASE_ACCEPT_TM
	dw_const VermilionGymRematchReceivedTM45Text,     TEXT_VERMILIONGYM_REMATCH_RECEIVED_TM45

VermilionGymTrainerHeaders:
	def_trainers 2
VermilionGymTrainerHeader0:
	trainer EVENT_BEAT_VERMILION_GYM_TRAINER_0, 3, VermilionGymGentlemanBattleText, VermilionGymGentlemanEndBattleText, VermilionGymGentlemanAfterBattleText
VermilionGymTrainerHeader1:
	trainer EVENT_BEAT_VERMILION_GYM_TRAINER_1, 2, VermilionGymSuperNerdBattleText, VermilionGymSuperNerdEndBattleText, VermilionGymSuperNerdAfterBattleText
VermilionGymTrainerHeader2:
	trainer EVENT_BEAT_VERMILION_GYM_TRAINER_2, 3, VermilionGymSailorBattleText, VermilionGymSailorEndBattleText, VermilionGymSailorAfterBattleText
	db -1 ; end

VermilionGymLTSurgeText:
	text_asm
	CheckEvent EVENT_BEAT_LT_SURGE
	jr z, .before_beat
	CheckEventReuseA EVENT_GOT_TM45
	jr nz, .got_TM45_already
	call z, VermilionGymLTSurgeReceiveTM45Script
	call DisableWaitingAfterTextDisplay
	jp .text_script_end
.got_TM45_already
 	ld a, [wGameStage] ; Check if player has beat the game
	and a
	jr nz, .LtSurgeRematch
	ld hl, .PostBattleAdviceText
	call PrintText
	jp .text_script_end
.before_beat
	ld hl, .PreBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, VermilionGymLTSurgeReceivedThunderBadgeText
	ld de, VermilionGymLTSurgeReceivedThunderBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $3
	ld [wGymLeaderNo], a
	xor a
	ldh [hJoyHeld], a
	jr .endBattle
.LtSurgeRematch
	ld a, [wRematchFlag] ; Check if allowed to get the TM
	and $04 			 ; Mask to only check that gym fight
	jr z, .rematchDone
	ld hl, VermilionGymRematchPreBattle1Text
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	ld hl, VermilionGymPreRematchBattle2Text
	call PrintText
	call Delay3
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, VermilionGymRematchDefeatedText
	ld de, VermilionGymRematchVictoryText
	call SaveEndBattleTextPointers
	ld a, OPP_LT_SURGE
	ld [wCurOpponent], a
	ld a, 2
	ld [wTrainerNo], a
	ld a, $4 ; new script
	ld [wPewterGymCurScript], a
	ld [wCurMapScript], a
	jr .endBattle
.refused
	ld hl, VermilionGymRematchRefusedText
	call PrintText
	jr .text_script_end
.rematchDone
	ld hl, VermilionGymRematchPostBattleText
	call PrintText
	jr .text_script_end
.endBattle
	ld a, SCRIPT_VERMILIONGYM_LT_SURGE_AFTER_BATTLE
	ld [wVermilionGymCurScript], a
	ld [wCurMapScript], a
.text_script_end
	jp TextScriptEnd

.PreBattleText:
	text_far _VermilionGymLTSurgePreBattleText
	text_end

.PostBattleAdviceText:
	text_far _VermilionGymLTSurgePostBattleAdviceText
	text_end

VermilionGymLTSurgeThunderBadgeInfoText:
	text_far _VermilionGymLTSurgeThunderBadgeInfoText
	text_end

VermilionGymLTSurgeReceivedTM45Text:
	text_far _VermilionGymLTSurgeReceivedTM45Text
	sound_get_key_item
	text_far _TM45ExplanationText
	text_end

VermilionGymLTSurgeTM45NoRoomText:
	text_far _VermilionGymLTSurgeTM45NoRoomText
	text_end

VermilionGymLTSurgeReceivedThunderBadgeText:
	text_far _VermilionGymLTSurgeReceivedThunderBadgeText
	text_end

VermilionGymGentlemanText:
	text_asm
	ld hl, VermilionGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

VermilionGymGentlemanBattleText:
	text_far _VermilionGymGentlemanBattleText
	text_end

VermilionGymGentlemanEndBattleText:
	text_far _VermilionGymGentlemanEndBattleText
	text_end

VermilionGymGentlemanAfterBattleText:
	text_far _VermilionGymGentlemanAfterBattleText
	text_end

VermilionGymSuperNerdText:
	text_asm
	ld hl, VermilionGymTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

VermilionGymSuperNerdBattleText:
	text_far _VermilionGymSuperNerdBattleText
	text_end

VermilionGymSuperNerdEndBattleText:
	text_far _VermilionGymSuperNerdEndBattleText
	text_end

VermilionGymSuperNerdAfterBattleText:
	text_far _VermilionGymSuperNerdAfterBattleText
	text_end

VermilionGymSailorText:
	text_asm
	ld hl, VermilionGymTrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

VermilionGymSailorBattleText:
	text_far _VermilionGymSailorBattleText
	text_end

VermilionGymSailorEndBattleText:
	text_far _VermilionGymSailorEndBattleText
	text_end

VermilionGymSailorAfterBattleText:
	text_far _VermilionGymSailorAfterBattleText
	text_end

VermilionGymGymGuideText:
	text_asm
	ld a, [wBeatGymFlags]
	bit BIT_THUNDERBADGE, a
	jr nz, .got_thunderbadge
	ld hl, .ChampInMakingText
	call PrintText
	jr .text_script_end
.got_thunderbadge
	ld hl, .BeatLTSurgeText
	call PrintText
.text_script_end
	jp TextScriptEnd

.ChampInMakingText:
	text_far _VermilionGymGymGuideChampInMakingText
	text_end

.BeatLTSurgeText:
	text_far _VermilionGymGymGuideBeatLTSurgeText
	text_end

VermilionGymRematchPreBattle1Text:
	text_far _VermilionGymRematchPreBattle1Text
	text_end

VermilionGymPreRematchBattle2Text:
	text_far _VermilionGymPreRematchBattle2Text
	text_end

VermilionGymRematchRefusedText:
	text_far _VermilionGymRematchRefusedText
	text_end

VermilionGymRematchDefeatedText:
	text_far _VermilionGymRematchDefeatedText
	text_end

VermilionGymRematchVictoryText:
	text_far _VermilionGymRematchVictoryText
	text_end

VermilionGymRematchPostBattleText:
	text_far _VermilionGymRematchPostBattleText
	text_end

VermilionGymRematchPleaseAcceptTM:
	text_far _VermilionGymRematchPleaseAcceptTM
	text_end

VermilionGymRematchReceivedTM45Text:
	text_far _VermilionGymLTSurgeReceivedTM45Text
	sound_get_item_1
	text_end