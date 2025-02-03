PrintStatusAilment::
	ld a, [de]
	bit PSN, a
	jr nz, .psn
	bit BRN, a
	jr nz, .brn
	bit FRZ, a
	jr nz, .frz
	bit PAR, a
	jr nz, .par
	and SLP_MASK
	ret z
	ld a, "<SLP1>"
	ld [hli], a
	ld [hl], "<SLP2>"
	ret
.psn
	ld a, "<PSN1>"
	ld [hli], a
	ld [hl], "<PSN2>"
	ret
.brn
	ld a, "<BRN1>"
	ld [hli], a
	ld [hl], "<BRN2>"
	ret
.frz
	ld a, "<FRZ1>"
	ld [hli], a
	ld [hl], "<FRZ2>"
	ret
.par
	ld a, "<PAR1>"
	ld [hli], a
	ld [hl], "<PAR2>"
	ret
