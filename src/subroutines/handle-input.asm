HANDLE_INPUT:
  LDA #$01
  STA NES_CONTROLLER_0
  LDA #$00
  STA NES_CONTROLLER_0

INPUT_READ_A:
  ; Player 1 - A
  LDA NES_CONTROLLER_0
  AND #%00000001
  BEQ HANDLE_INPUT_END

  ; tODO temporary disabled for scrolling fix
  ; starting
  ; ; TODO extract logic and handle text <press button a to start>
  ; LDA VAR_GAME_STATUS
  ; CMP #$01
  ; BEQ HI_GAMEPLAY
  ; LDA #$01
  ; STA VAR_GAME_STATUS

; perserve
INPUT_READ_OTHERS:
  ; Player 1 - B
  LDA NES_CONTROLLER_0
  ; Player 1 - Select
  LDA NES_CONTROLLER_0
  ; Player 1 - Start
  LDA NES_CONTROLLER_0
  ; Player 1 - Up
  LDA NES_CONTROLLER_0
  ; Player 1 - Down
  LDA NES_CONTROLLER_0
  ; Player 1 - Left
  LDA NES_CONTROLLER_0
  ; Player 1 - Right
  LDA NES_CONTROLLER_0


INPUT_HANDLE_GAMEPLAY:
  LDA VAR_DINO_STATUS
  CMP #DINO_STATUS_STAND
  BNE HANDLE_INPUT_END

  ; start jump
  ; JMP MarkDinoJump
  ; TODO set jump status
  LDA #DINO_STATUS_JUMPING
  STA VAR_DINO_STATUS
  LDA #DINO_INIT_JUMP_VELOCITY
  STA VAR_DINO_VELOCITY

  ; A: add by column id for randomize the seed
  ; generate random seed
  LDA VAR_RANDOM_SEED
  ADC VAR_COLUMN_ID
  STA VAR_RANDOM_SEED

HANDLE_INPUT_END:
  RTS
