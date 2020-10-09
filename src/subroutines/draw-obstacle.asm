DRAW_OBSTACLE:
  ; read PPU status to reset the high/low latch
  LDA PPU_STATUS

  LDA VAR_RANDOM_SEED
  ASL A
  ASL A
  CLC
  ADC VAR_RANDOM_SEED
  CLC
  ADC #03
  STA VAR_RANDOM_SEED

  cmp #$50
  bcc DRAW_OBSTACLE_DONE

  ; only begin drawing after spacing
  dec VAR_OBSTACLE_SPACING
  lda VAR_OBSTACLE_SPACING
  cmp #$00
  bne DRAW_OBSTACLE_DONE

  ; shouldn't drawing on the screen edge
  LDA VAR_COLUMN_ID
  CMP #$1F
  BEQ DRAW_OBSTACLE_DONE

  ; reset the margin value and begin to draw
  lda #INITIAL_OBSTACLE_SPACING
  sta VAR_OBSTACLE_SPACING

; begin set obstacle slot
  ldx #$00
.Loop
  lda VAR_OBSTRACLE_SLOT,x
  cmp #$00
  beq SET_OBSTACLE_SLOT
  inx
  cpx #$05
  bne .Loop
  ; shouldn't run to here,
  ; the slot is large enough for current settings
  JMP DRAW_OBSTACLE_DONE

SET_OBSTACLE_SLOT:
  lda #OBSTACLE_COLLISION_DISTANCE
  sta VAR_OBSTRACLE_SLOT,x

  ; prepare for drawing obstacle
  ldx #$00
  ldy VAR_COLUMN_ID
.Loop:
  ; read PPU status to reset the high/low latch
  LDA PPU_STATUS

  lda VAR_BG_HIGH
  sta PPU_ADDR
  sty PPU_ADDR
  lda BIN_OBSTACLES, x
  sta PPU_DATA
  inx
  lda BIN_OBSTACLES, x
  sta PPU_DATA
  inx
  cpx #$0A
  beq DRAW_OBSTACLE_DONE
  tya
  adc #$20
  tay
  jmp .Loop

DRAW_OBSTACLE_DONE:
  rts
