MIGRATE_TO_32BIT equ 0
MAGIC         equ 0x1BADB002
FLAGS         equ (1<<0 | 1<<1)
CHECKSUM      equ -(MAGIC + FLAGS)

section .multiboot
align 4
    dd MAGIC
    dd FLAGS
    dd CHECKSUM

section .text
global start
extern kernel_main

start:
    cli
    mov esp, stack_top
    call kernel_main
    hlt

section .bss
align 16
stack_bottom:
resb 16384
stack_top: