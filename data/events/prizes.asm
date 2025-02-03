PrizeDifferentMenuPtrs:
	dw PrizeMenuMon1Entries, PrizeMenuMon1Cost
	dw PrizeMenuMon2Entries, PrizeMenuMon2Cost
	dw PrizeMenuTMsEntries,  PrizeMenuTMsCost

NoThanksText:
	db "NO THANKS@"

PrizeMenuMon1Entries:
	db ABRA
	db CLEFAIRY
IF DEF(_RED)
	db NIDORINA
ENDC
IF DEF(_BLUE)
	db NIDORINO
ENDC
	db "@"

PrizeMenuMon1Cost:
	bcd2 150
	bcd2 675
	bcd2 1200
	db "@"

PrizeMenuMon2Entries:
IF DEF(_RED)
	db SCYTHER
ENDC
IF DEF(_BLUE)
	db PINSIR
ENDC
	db PORYGON
	db DRATINI
	db "@"

PrizeMenuMon2Cost:
	bcd2 3000
	bcd2 5000
	bcd2 7770
	db "@"

PrizeMenuTMsEntries:
	db TM_SUBSTITUTE
	db TM_TRI_ATTACK
	db TM_HYPER_BEAM
	db "@"

PrizeMenuTMsCost:
	bcd2 3500
	bcd2 5500
	bcd2 8500
	db "@"
