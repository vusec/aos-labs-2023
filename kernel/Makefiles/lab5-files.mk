# LAB 5 code
KERNEL_SRCFILES += \
	kernel/rtc.c \
	kernel/acpi/acpi.c \
	kernel/acpi/hpet.c \
	kernel/acpi/lapic.c \
	kernel/acpi/madt.c \
	kernel/mem/copy.c \
	kernel/sched/fork.c \
	kernel/sched/sched.c \
	kernel/sched/wait.c \
	lib/time.c

# LAB 5 binaries
KERNEL_BINFILES += \
	user/basicfork \
	user/cowfork \
	user/evilchild \
	user/reaper \
	user/wait \
	user/waitnone \
	user/waitself \
	user/yield
