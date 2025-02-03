	db DEX_MAGMAR ; pokedex id

	db  65,  95,  55,  95,  85
	;   hp  atk  def  spd  spc

	db FIRE, GHOST ; type
	db 45 ; catch rate
	db 167 ; base exp

	INCBIN "gfx/pokemon/front/magmar.pic", 0, 1 ; sprite dimensions
	dw MagmarPicFront, MagmarPicBack

	db EMBER, ASTONISH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  CROSS_CHOP,   HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         PSYCHIC_M,    TELEPORT,     MIMIC,        DOUBLE_TEAM,  \
	     FLAMETHROWER, METRONOME,    FIRE_BLAST,   SKULL_BASH,   REST,         \
	     SHADOW_BALL,  SUBSTITUTE,   STRENGTH
	; end

	db 0 ; padding
