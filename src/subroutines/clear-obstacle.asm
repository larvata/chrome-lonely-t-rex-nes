; clear the 1*4 block at the current x column
CLEAR_OBSTACLE:
  ; read PPU status to reset the high/low latch
  LDA PPU_STATUS

  ldx VAR_BG_HIGH
  ldy VAR_COLUMN_ID

  ; clear line 0
  MACRO_OBSTACLE_CLEAR_LINE

  ; clear line 1
  MACRO_OBSTACLE_CLEAR_LINE

  ; clear line 2
  MACRO_OBSTACLE_CLEAR_LINE

  ; ; clear line 3 and draw the horizon line
  MACRO_OBSTACLE_DRAW_LINE

  ; clear line 4
  MACRO_OBSTACLE_CLEAR_LINE
  RTS

