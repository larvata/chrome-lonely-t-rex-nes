DRAW_BACKGROUND:
  ; 8 pixel mask
  lda #%00000111
  bit VAR_SCREEN_SCROLL_X
  beq GET_NEXT_COLUMN_ID

  ; skip if VAR_SCREEN_SCROLL_X cannot devide by 8
  rts

GET_NEXT_COLUMN_ID:
  ; collision detection
  jsr AABB_DETECTION

  lda VAR_SCREEN_SCROLL_X
  lsr a
  lsr a
  lsr a
  sta VAR_COLUMN_ID

DRAW_SCORE:
  LDA #$20
  STA PPU_ADDR
  LDA #$5A
  STA PPU_ADDR
  LDX #$04

.Loop
  LDA VAR_SCORE, x
  ADC #$91
  STA PPU_DATA
  DEX
  CPX #$FF
  BNE .Loop


  ; only begin drawing on the odd column
  LDA VAR_COLUMN_ID
  lsr a
  bcc CLEAN_AND_DRAW
  ; no need to redraw, early return
  rts

CLEAN_AND_DRAW:
  jsr CLEAR_OBSTACLE
  jsr DRAW_OBSTACLE
  rts
