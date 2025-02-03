	db DEX_RATTATA ; pokedex id

	db  30,  60,  40,  80,  25
	;   hp  atk  def  spd  spc

	db NORMAL, GROUND ; type
	db 255 ; catch rate
	db 57 ; base exp

	INCBIN "gfx/pokemon/front/rattata.pic", 0, 1 ; sprite dimensions
	dw RattataPicFront, RattataPicBack

	db TACKLE, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   \
	     BLIZZARD,     RAGE,         THUNDERBOLT,  THUNDER,      EARTHQUAKE,   \
	     DIG,          MIMIC,        DOUBLE_TEAM,  SWIFT,        \
	     SKULL_BASH,   REST,         SHADOW_BALL,  SUBSTITUTE
	; end

	db 0 ; padding
