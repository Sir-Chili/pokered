MoveKidsHouse_Script:
	jp EnableAutoTextBoxDrawing

MoveKidsHouse_TextPointers:
	def_text_pointers
	dw_const MoveDeleterText1, TEXT_MOVEKIDSHOUSE_MOVE_DELETER
	dw_const MoveRelearnerText1, TEXT_MOVEKIDSHOUSE_MOVE_RELEARNER
	dw_const MoveKidsHouseMoveKidsMomText, TEXT_MOVEKIDSHOUSE_MOVE_KIDS_MOM

MoveKidsHouseMoveKidsMomText:
	text "These kids are"
	line "such a handful..."
	done
	text_end