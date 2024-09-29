# Bootloader需要做什么
1.初始化系统寄存器
2.设置异常向量表
3.初始化栈和堆
4.检查和初始化外设
5.初始化内存管理、开启mmu和cache
6. ......

# 文件结构
bootloader
├── Riscv_g_test
│   ├── Riscv_g_test.s
│   ├── link.lds
│   ├── Makefile
│   ├── your_testcode.s
│   └── thumb_test.inc
├── Riscv_v_test
│   ├── Riscv_v_test.s
│   ├── link.lds
│   ├── Makefile
│   └── your_testcode.s
├── Riscv_p_test
│   ├── Riscv_p_test.s
│   ├── link.lds
│   ├── Makefile
│   └── your_testcode.s
├── link.lds
├── Makefile
├── Makefile.def
└── system
    ├── asmlib.inc
    ├── evt.inc
    ├── Makefile
    ├── start.s
    └── sysregs_init.inc

整个代码环境分为三个部分：System、Riscv_g test、Riscv_v test、 Riscv_p test。
System：整个程序执行流程的控制。
Riscv_g test: riscv通用指令的测试程序
Riscv_v test: riscv向量指令的测试程序
Riscv_p test: riscvSIMD指令的测试程序

# System
## start.s
start.s主程序，也是整个程序的入口，主要功能是整个程序执行流程的控制，执行流程如下：


# 参考资料
https://www.wenhui.space/docs/09-arm/bootloader/
