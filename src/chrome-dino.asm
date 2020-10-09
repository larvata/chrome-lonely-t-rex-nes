  ; 1x 16KB bank of PRG code
  .inesprg 1
  ; 1x 8KB bank of CHR data
  .ineschr 1
  ; mapper 0 = NROM, no bank swapping
  .inesmap 0
  ; background mirroring
  .inesmir 1

  .include "./constants.asm"

  .rsset MEM_LAYOUT_VAR_1
  include "./variables1.asm"
  .rsset MEM_LAYOUT_VAR_2
  include "./variables2.asm"


  ; PRG
  .bank 0
  .org MEM_LAYOUT_PRG

  ; macros
  .include "./macros/common.asm"
  .include "./macros/rendering.asm"

  ; main routine
  .include "./program.asm"

  ; subroutines
  .include "./subroutines/game-logic.asm"
  .include "./subroutines/game-score.asm"
  .include "./subroutines/load-resources.asm"
  .include "./subroutines/draw-background.asm"
  .include "./subroutines/scroll-background.asm"
  .include "./subroutines/draw-dino.asm"
  .include "./subroutines/handle-input.asm"
  .include "./subroutines/aabb-detection.asm"
  .include "./subroutines/clear-obstacle.asm"
  .include "./subroutines/draw-obstacle.asm"


BIN_BACKGROUNDS:
  .include "./assets/background.asm"

BIN_PALETTES:
  .include "./assets/palettes.asm"

BIN_ATTRIBUTES:
  .include "./assets/attributes.asm"

BIN_SPRITE_0:
  .include "./assets/sprite0.asm"

BIN_SPRITES:
  .include "./assets/sprites.asm"

BIN_OBSTACLES:
  .include "./assets/obstacles.asm"

BIN_HORIZON_LINE:
  .include "./assets/horizon-line.asm"

BIN_EMPTY:
  .include "./assets/empty.asm"


  .bank 1
  .org MEM_LAYOUT_INT
  .dw NMI
  .dw RESET
  .dw 0

  ; CHR
  .bank 2
  .org MEM_LAYOUT_CHR_MAIN
  .incbin "./assets/main.chr"

  .org MEM_LAYOUT_CHR_FONT
  .incbin "./assets/font.chr"
