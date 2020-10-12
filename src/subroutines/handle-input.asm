HANDLE_INPUT:
  LDA #$01
  STA NES_CONTROLLER_0
  LDA #$00
  STA NES_CONTROLLER_0

INPUT_READ_A:
  ; Player 1 - A
  LDA NES_CONTROLLER_0
  AND #%00000001
  STA VAR_LAST_A_0
  BEQ HANDLE_INPUT_END


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
