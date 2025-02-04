	db DEX_PIDGEOT ; pokedex id

	db  83, 110,  75, 101,  70
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 172 ; base exp

	INCBIN "gfx/pokemon/front/pidgeot.pic", 0, 1 ; sprite dimensions
	dw PidgeotPicFront, PidgeotPicBack

	db SCRATCH, SAND_ATTACK, GUST, QUICK_ATTACK ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm WHIRLWIND,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     SWIFT,        SKY_ATTACK,   REST,         SHADOW_BALL,  SUBSTITUTE,   \
	     FLY
	; end

	db 0 ; padding
