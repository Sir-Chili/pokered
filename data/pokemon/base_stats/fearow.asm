	db DEX_FEAROW ; pokedex id

	db  65,  90,  85, 100,  71
	;   hp  atk  def  spd  spc

	db FLYING, GROUND ; type
	db 90 ; catch rate
	db 162 ; base exp

	INCBIN "gfx/pokemon/front/fearow.pic", 0, 1 ; sprite dimensions
	dw FearowPicFront, FearowPicBack

	db PECK, GROWL, LEER, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm WHIRLWIND,    TOXIC,        TAKE_DOWN,    DOUBLE_EDGE,  \
	     HYPER_BEAM,   RAGE,         MIMIC,        DOUBLE_TEAM,  \
	     SWIFT,        SKY_ATTACK,   REST,         ROCK_SLIDE,   SUBSTITUTE,   FLY
	; end

	db 0 ; padding
