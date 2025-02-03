	db DEX_MUK ; pokedex id

	db 105, 105,  75,  50,  85
	;   hp  atk  def  spd  spc

	db POISON, ROCK ; type
	db 75 ; catch rate
	db 157 ; base exp

	INCBIN "gfx/pokemon/front/muk.pic", 0, 1 ; sprite dimensions
	dw MukPicFront, MukPicBack

	db POUND, DISABLE, POISON_GAS, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SLUDGE_BOMB,  TOXIC,        BODY_SLAM,    HYPER_BEAM,   RAGE,         GIGA_DRAIN,   \
	     THUNDERBOLT,  THUNDER,      MIMIC,        DOUBLE_TEAM,  FLAMETHROWER, \
	     SELFDESTRUCT, FIRE_BLAST,   REST,         SHADOW_BALL,  EXPLOSION,    ROCK_SLIDE,   SUBSTITUTE
	; end

	db 0 ; padding
