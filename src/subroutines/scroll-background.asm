; Steps:
; increase VAR_SCREEN_SCROLL_X
; if VAR_SCREEN_SCROLL_X reach the end
SCROLLING_BACKGROUND:
  ; clear the carry to fix FE+02=01
  CLC
  LDA VAR_SCREEN_SCROLL_X
  ADC #DINO_INIT_WALK_SPEED
  STA VAR_SCREEN_SCROLL_X

NAMETABLE_SWAP_CHECK:
  ; check if the nametable should be swapped
  BCC NAMETABLE_SWAP_END

NAMETABLE_SWAP:
  ; scroll is overflowed swap the nametable
  LDA VAR_NAMETABLE_MASK
  EOR #$01
  STA VAR_NAMETABLE_MASK

  ASL A
  CMP #$00
  BNE NAMETABLE_SWAP_TO_0
  ; set to nametable 1
  LDA #$26
  JMP SET_BG_HIGH
NAMETABLE_SWAP_TO_0:
  ; set to nametable 0
  LDA #$22

SET_BG_HIGH:
  ; set nametable high
  STA VAR_BG_HIGH

  lda VAR_NAMETABLE_MASK
  ror a
  and #%10000000


; clear obstacle slots
  ldx #$00
.Loop
  cpx #$05
  beq NAMETABLE_SWAP_END
  and VAR_OBSTRACLE_SLOT, x
  cmp VAR_OBSTRACLE_SLOT, x
  inx
  bne .Loop
  lda #$00
  sta VAR_OBSTRACLE_SLOT,x
  inx
  jmp .Loop

NAMETABLE_SWAP_END:
  lda VAR_SCREEN_SCROLL_X
  sta PPU_SCROLL
  lda #$00
  sta PPU_SCROLL

  LDA #INIT_PPU_CTRL
  ORA VAR_NAMETABLE_MASK
  STA PPU_CTRL
  rts

