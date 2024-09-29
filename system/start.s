.section.text
.global _start
_start:
    # 设置mstatus寄存器，启用全局中断等（这里简单初始化）
    li t0, 0x0
    csrw mstatus, t0

    # 设置堆栈指针，假设堆栈位于内存地址0x80000000开始处
    li sp, 0x80000000

    # 假设应用程序存放在内存地址0x1000开始处，我们要将它复制到0x8000处（假设的运行地址）
    la t0, 0x1000  # 源地址
    la t1, 0x8000  # 目标地址
    li t2, 1024    # 假设应用程序大小为1024字节

copy_loop:
    lw t3, (t0)
    sw t3, (t1)
    addi t0, t0, 4
    addi t1, t1, 4
    addi t2, t2, -4
    bnez t2, copy_loop

    # 跳转到应用程序入口点（0x8000）
    jalr zero, 0x8000