	db DEX_PORYGON ; pokedex id

	db  85,  80,  90,  60,  95
	;   hp  atk  def  spd  spc

	db NORMAL, ELECTRIC ; type
	db 45 ; catch rate
	db 130 ; base exp

	INCBIN "gfx/pokemon/front/porygon.pic", 0, 1 ; sprite dimensions
	dw PorygonPicFront, PorygonPicBack

	db TACKLE, SHARPEN, CONVERSION, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   RAGE,         THUNDERBOLT,  THUNDER,      PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     SWIFT,        SKULL_BASH,   REST,         THUNDER_WAVE, SHADOW_BALL,  \
	     TRI_ATTACK,   SUBSTITUTE,   FLASH
	; end

	db 0 ; padding
