	db DEX_RATICATE ; pokedex id

	db  55,  90,  70, 100,  50
	;   hp  atk  def  spd  spc

	db NORMAL, GROUND ; type
	db 90 ; catch rate
	db 116 ; base exp

	INCBIN "gfx/pokemon/front/raticate.pic", 0, 1 ; sprite dimensions
	dw RaticatePicFront, RaticatePicBack

	db TACKLE, TAIL_WHIP, QUICK_ATTACK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   SUBMISSION,   RAGE,         \
	     THUNDERBOLT,  THUNDER,      EARTHQUAKE,   DIG,          MIMIC,        DOUBLE_TEAM,  \
	     SWIFT,        SKULL_BASH,   REST,         SHADOW_BALL,  SUBSTITUTE
	; end

	db 0 ; padding
