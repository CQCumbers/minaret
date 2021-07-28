.section .reset,"ax"
.org    0x00
_reset:
; Load FAULT into r14
    mfrc r14
    andi r14, r14, 0xf00
    lsr r14, r14, 8

; If RESET jump to _start
    cmpi.eq r14, 15
    bt _start

; Hang on unhandled fault
.L1:
    bra .L1

.section .text
.global _start
.type   _start,@function
_start:	  
; Init stack/frame pointers
    movu r15, %hi(_end)
    movl r15, %lo(_end)
    mov  r14, r15

; Clear BSS
    movi r0, 0
    movu r1, %hi(__bss_start)
    movl r1, %lo(__bss_start)
    movu r2, %hi(__bss_end)
    movl r2, %lo(__bss_end)
.L2:
    st r0, [r1, 0]
    addi r1, r1, 4
    cmp.ls r1, r2
    bt .L2

; Jump to main
    movi r1, 0
    movi r2, 0
    call main

; Hang upon return
    bra .L1
