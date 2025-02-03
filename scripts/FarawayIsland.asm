FarawayIsland_Script:
	call EnableAutoTextBoxDrawing
	ld hl, FarawayIslandTrainerHeaders
	ld de, FarawayIsland_ScriptPointers
	ld a, [wFarawayIslandCurScript]
	call ExecuteCurMapScriptInTable
	ld [wFarawayIslandCurScript], a
	ret

FarawayIslandSetDefaultScript:
	xor a
	ld [wJoyIgnore], a
	ld [wFarawayIslandCurScript], a
	ld [wCurMapScript], a
	ret

FarawayIsland_ScriptPointers:
	def_script_pointers
	dw_const FarawayIslandSetDefaultScript,	   		SCRIPT_FARAWAYISLAND_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_FARAWAYISLAND_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_FARAWAYISLAND_END_BATTLE
	dw_const FarawayIslandSailBackToVermilion, 		SCRIPT_FARAWAYISLAND_SAIL_BACK_TO_VERMILION

FarawayIsland_TextPointers:
	def_text_pointers
	dw_const FarawayIslandSailorText, TEXT_FARAWAYISLAND_SAILOR
	dw_const FarawayIslandMewText,	  TEXT_FARAWAYISLAND_MEW

FarawayIslandSailorText:
	text_asm
	ld hl, .ReadyToLeaveText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	ld hl, .LeavingText
	call PrintText
	ld a, SCRIPT_FARAWAYISLAND_SAIL_BACK_TO_VERMILION
	ld [wFarawayIslandCurScript], a
	ld [wCurMapScript], a
	jr .done
.refused
	ld hl, .RefusedText
	call PrintText
.done
	jp TextScriptEnd

.ReadyToLeaveText:
	text_far _FarawayIslandSailorReadyToLeaveText
	text_end
.RefusedText:
	text_far _FarawayIslandSailorRefusedText
	text_end
.LeavingText:
	text_far _FarawayIslandSailorLeavingText
	text_end

FarawayIslandSailBackToVermilion:
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	ld a, SPRITE_FACING_LEFT
	ld [wSpritePlayerStateData1FacingDirection], a
	ld a, VERMILION_CITY
	ldh [hWarpDestinationMap], a
	ld a, $9
	ld [wDestinationWarpID], a
	ld a, FARAWAY_ISLAND
	ld [wLastMap], a
	ld hl, wStatusFlags3
	set BIT_WARP_FROM_CUR_SCRIPT, [hl] 
	ld a, SCRIPT_FARAWAYISLAND_DEFAULT
	ld [wFarawayIslandCurScript], a
	ld [wCurMapScript], a
	ret

FarawayIslandTrainerHeaders:
	def_trainers
MewTrainerHeader:
	trainer EVENT_BEAT_MEW, 0, MewBattleText, MewBattleText, MewBattleText
	db -1 ; end

FarawayIslandMewText:
	text_asm
	ld hl, MewTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

MewBattleText:
	text_far _FarawayIslandMewText
	text_asm
	ld a, MEW
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd
