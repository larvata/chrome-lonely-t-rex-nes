MACRO_WAIT_FOR_VBLANK .macro
vblankwait\1:
  BIT $2002        ; bit 7 of $2002 is reset once vblank ends
  BPL vblankwait\1  ; and bit 7 is what is checked by BPL
  .endm


MACRO_WAIT_FOR_SPRITE0 .macro
; sprite 0, fixed status bar
SPRITE_0_CLEAR_WAIT:
  BIT PPU_STATUS
  BVS SPRITE_0_CLEAR_WAIT

SPRITE_0_WAIT:
  BIT PPU_STATUS
  BVC SPRITE_0_WAIT
  .endm

MACRO_INFINITE_LOOP .macro
INFINITE_LOOP:
  JMP INFINITE_LOOP
  .endm
