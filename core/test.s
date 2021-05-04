.section .text
.global _start
.type   _start,@function
_start:
    ld  r1, [r0, 44]
    ld  r2, [r0, 44]
    add r1, r1, r2
    st  r1, [r0, 48]
    sub r1, r1, r2
    st  r1, [r0, 52]
    and r1, r1, r2
    st  r1, [r0, 56]
    ld  r3, [r0, 56]
    cmpi.eq r3, 526
    bt  _exit
_pool:
    addi r0, r0, 526
    addi r0, r0, 0
    addi r0, r0, 0
    addi r0, r0, 0
_exit:
    add r3, r3, r3
    stop
