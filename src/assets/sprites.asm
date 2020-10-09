; layout in total.chr
; 00 head-1 common
; 01 head-2 common mouth opened
; 02 body-1 normal
; 03 body-2 hand down
; 04 foot-1 stand
; 05 foot-2 stand
; 06 head-1 eye closed
; 07 tail normal
; 08 foot-2 left up
; 09 foot-1 right up
; 0A foot-2 right up
; 0B head-1 eye stare
; 0C head-2 common mouth closed
; ....


; Begin of Sprite Dino

  ; normal dino sprite usage
  ; +---+---+---+
  ; | ✕ | ○ | ○ |
  ; +---+---+---+
  ; | ○ | ○ | ○ |
  ; +---+---+---+
  ; | ○ | ○ | ✕ |
  ; +---+---+---+

  ; TODO speedup dino sprite
  ; +---+---+---+---+
  ; | ○ | ○ | ○ | ○ |
  ; +---+---+---+---+
  ; | ○ | ○ | ○ | ○ |
  ; +---+---+---+---+


  ;    Y, tile, attr, X

  ; row 0
  .db (GRD_POS_Y + NES_TILE_SIZE * 0), DINO_TILE_HEAD_COMMON_1, $00, (GRD_POS_X + NES_TILE_SIZE * 1)
  .db (GRD_POS_Y + NES_TILE_SIZE * 0), DINO_TILE_HEAD_COMMON_2, $00, (GRD_POS_X + NES_TILE_SIZE * 2)
  ; row 1
  .db (GRD_POS_Y + NES_TILE_SIZE * 1), DINO_TILE_BODY_COMMON_1, $00, (GRD_POS_X + NES_TILE_SIZE * 0)
  .db (GRD_POS_Y + NES_TILE_SIZE * 1), DINO_TILE_BODY_COMMON_2, $00, (GRD_POS_X + NES_TILE_SIZE * 1)
  .db (GRD_POS_Y + NES_TILE_SIZE * 1), DINO_TILE_BODY_COMMON_3, $00, (GRD_POS_X + NES_TILE_SIZE * 2)
  ; row 2
  .db (GRD_POS_Y + NES_TILE_SIZE * 2), DINO_TILE_FOOT_COMMON_1, $00, (GRD_POS_X + NES_TILE_SIZE * 0)
  .db (GRD_POS_Y + NES_TILE_SIZE * 2), DINO_TILE_FOOT_COMMON_2, $00, (GRD_POS_X + NES_TILE_SIZE * 1)

; End of Sprite Dino
