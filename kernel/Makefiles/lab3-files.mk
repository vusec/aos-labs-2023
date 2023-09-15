# LAB 3 code
KERNEL_SRCFILES += \
	kernel/mem/kmem.c \
	kernel/mem/populate.c \
	kernel/mem/protect.c \
	kernel/mem/slab.c \
	kernel/mem/user.c \
	kernel/sched/cpu.c \
	kernel/sched/gdt.c \
	kernel/sched/idt.c \
	kernel/sched/stubs.S \
	kernel/sched/syscall.c \
	kernel/sched/task.c \
	kernel/tests/lab3.c \

# LAB 3 binaries
KERNEL_BINFILES := \
	user/badsegment \
	user/breakpoint \
	user/divzero \
	user/evilhello \
	user/faultexec \
	user/faultwrite \
	user/kernelexec \
	user/kernelread \
	user/kernelwrite \
	user/hello \
	user/nullexec \
	user/nullhello \
	user/nullread \
	user/nullwrite \
	user/overflowhello \
	user/softint \
	user/testbss \
	user/aslr
