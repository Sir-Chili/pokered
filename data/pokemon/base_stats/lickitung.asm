	db DEX_LICKITUNG ; pokedex id

	db  90,  75,  85,  30,  75
	;   hp  atk  def  spd  spc

	db NORMAL, WATER ; type
	db 45 ; catch rate
	db 127 ; base exp

	INCBIN "gfx/pokemon/front/lickitung.pic", 0, 1 ; sprite dimensions
	dw LickitungPicFront, LickitungPicBack

	db WRAP, SUPERSONIC, LICK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   SWORDS_DANCE, MEGA_KICK,    TOXIC,        BODY_SLAM,    \
	     TAKE_DOWN,    DOUBLE_EDGE,  BUBBLEBEAM,   ICE_BEAM,     \
	     BLIZZARD,     HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         THUNDERBOLT,  THUNDER,      EARTHQUAKE,   FISSURE,      \
	     MIMIC,        DOUBLE_TEAM,  FLAMETHROWER, SELFDESTRUCT, FIRE_BLAST,   \
		 SKULL_BASH,   REST,         SHADOW_BALL,  EXPLOSION,    ROCK_SLIDE,   \
		 SUBSTITUTE,   CUT,          SURF,         STRENGTH
	; end

	db 0 ; padding
