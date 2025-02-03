	db DEX_PRIMEAPE ; pokedex id

	db  65, 105,  60, 100,  60
	;   hp  atk  def  spd  spc

	db FIGHTING, GHOST ; type
	db 75 ; catch rate
	db 149 ; base exp

	INCBIN "gfx/pokemon/front/primeape.pic", 0, 1 ; sprite dimensions
	dw PrimeapePicFront, PrimeapePicBack

	db SCRATCH, LEER, KARATE_CHOP, FURY_SWIPES ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  CROSS_CHOP,   HYPER_BEAM,   PAY_DAY,      SUBMISSION,   COUNTER,      \
	     SEISMIC_TOSS, RAGE,         THUNDERBOLT,  THUNDER,      DIG,          \
	     MIMIC,        DOUBLE_TEAM,  METRONOME,    SWIFT,        \
	     SKULL_BASH,   REST,         SHADOW_BALL,  ROCK_SLIDE,   SUBSTITUTE,   STRENGTH
	; end

	db 0 ; padding
