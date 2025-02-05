IndigoPlateau_Script:
	call EnableAutoTextBoxDrawing
	ld hl, IndigoPlateauTrainerHeaders
	ld de, IndigoPlateau_ScriptPointers
	ld a, [wIndigoPlateauCurScript]
	call ExecuteCurMapScriptInTable
	ld [wIndigoPlateauCurScript], a
	ret

IndigoPlateau_ScriptPointers:
	def_script_pointers
	dw_const IndigoPlateauDefaultScript,			SCRIPT_INDIGOPLATEAU_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_INDIGOPLATEAU_START_BATTLE
	dw_const IndigoPlateauEndBattleScript,			SCRIPT_INDIGOPLATEAU_END_BATTLE

IndigoPlateauDefaultScript:
	CheckEvent EVENT_BEAT_MEW
	jr z, .notReady
	CheckEvent EVENT_INDIGOPLATEAU_TRAINER
	jr nz, .notReady
	ld a, [wPlayerGender]
	and a
	jr nz, .RedFight
	ld a, HS_INDIGOPLATEAU_TRAINERF
	ld [wMissableObjectIndex], a
	predef ShowObject
	jr .ready
.RedFight
	ld a, HS_INDIGOPLATEAU_TRAINERM
	ld [wMissableObjectIndex], a
	predef ShowObject
.ready
	call UpdateSprites
	jp CheckFightingMapTrainers
.notReady
	ret

IndigoPlateauEndBattleScript:
	call EndTrainerBattle
	call GBFadeOutToBlack
	ld a, HS_INDIGOPLATEAU_TRAINERM
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_INDIGOPLATEAU_TRAINERF
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_INDIGOPLATEAU_PP_UP
	ld [wMissableObjectIndex], a
	predef ShowObject
	SetEvent EVENT_INDIGOPLATEAU_TRAINER
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	ret

IndigoPlateau_TextPointers:
	def_text_pointers
	dw_const IndigoPlateauTrainerMText, TEXT_INDIGOPLATEAU_TRAINERM
	dw_const IndigoPlateauTrainerFText, TEXT_INDIGOPLATEAU_TRAINERF
	dw_const PickUpItemText, 			TEXT_INDIGOPLATEAU_PP_UP
	dw_const PickUpItemText, 			TEXT_INDIGOPLATEAU_MAX_ELIXER

IndigoPlateauTrainerHeaders:
	def_trainers
IndigoPlateauTrainerHeader0:
	trainer EVENT_BEAT_INDIGOPLATEAU_TRAINER_0, 0, IndigoPlateauBattleText, IndigoPlateauEndBattleText, IndigoPlateauAfterBattleText
IndigoPlateauTrainerHeader1:
	trainer EVENT_BEAT_INDIGOPLATEAU_TRAINER_1, 0, IndigoPlateauBattleText, IndigoPlateauEndBattleText, IndigoPlateauAfterBattleText
	db -1 ; end

IndigoPlateauTrainerMText:
	text_asm
	ld hl, IndigoPlateauTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

IndigoPlateauTrainerFText:
	text_asm
	ld hl, IndigoPlateauTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

IndigoPlateauBattleText:
	text_far _IndigoPlateauBattleText
	text_end

IndigoPlateauEndBattleText:
	text_far _IndigoPlateauEndBattleText
	text_end

IndigoPlateauAfterBattleText:
	text_far _IndigoPlateauAfterBattleText
	text_end