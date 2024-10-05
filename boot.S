.option norvc

.section .data

welcome: .ascii "Welcome to my OS\n\0"
iamhart: .ascii "I am HART    \0"
newLine: .ascii "\n\0"


_SimpleRam:
    .skip 1024

.section .text.init
.global _start

_start:
    csrr t0, mhartid
    bnez t0, _wait
    call _setup_uart
    la a0, welcome
    call _write_uart
    la a0, iamhart
    call _write_uart

    # Get the Mhart Id
    csrr t0, mhartid
    # Add 0x30 to Get the ASCII Value
    li t1, 0x30
    add t0, t1, t0
    # Loading our simple Ram into a0
    la a0, _SimpleRam
    # Storing the ASCII 0  Value into RAM
    sb t2, 0(a0)
    call _write_uart

    la a0, newLine
    call _write_uart

    wfi

_setup_uart:
    # Disable the Intrupts
    li t1, 0x10000001
    sb x0, 0(t1)
    # Write out to the UART Line Controller Register at UART+3
    li t1, 0x10000003
    li t2, 0x03 # Set Output to the 8bit
    sb t2, 0(t1)
    ret

_write_uart:
    li t1, 0x10000000 # Not changing this thing
    lb t2, 0(a0)
    beqz t2, _write_uart_end
    #sb t2, 0(t1)
    li t2, 1
    add a0, t2, a0
    j _write_uart
    
_write_uart_end:
    ret


_wait:
    wfi
