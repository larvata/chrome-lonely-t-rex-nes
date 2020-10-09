AABB_DETECTION:
  lda #GAME_STATUS_RUN
  sta VAR_COLLISION_RESULT
  ldx #$FF

; simply logic because after a game reset the VAR_OBSTRACLE_SLOT is no need to maintaine
.Loop
  inx
  ; check index out of bounds
  cpx #$04
  beq AABB_SKIP
  ; not out of bounds, check value
  lda VAR_OBSTRACLE_SLOT,x
  cmp #$00
  ; no collision, check next
  beq .Loop
  dec VAR_OBSTRACLE_SLOT,x
  lda VAR_OBSTRACLE_SLOT,x
  cmp #$00
  bne .Loop
  ; collision, goto dead check
  ; test dino y pos
  lda SPRITE_DINO
  cmp #$6A
  bcc .Loop
  ; lda #Zero_Value
  ; sta VAR_GAME_STATUS
  lda #GAME_STATUS_OVER
  sta VAR_COLLISION_RESULT
  jmp .Loop


AABB_SKIP:
  lda VAR_COLLISION_RESULT
  ; tODO temporary disabled for scrolling fix
  sta VAR_GAME_STATUS
  rts
