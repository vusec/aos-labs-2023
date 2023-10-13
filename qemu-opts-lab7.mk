# LAB 7 QEMUOPTS

QEMUOPTS += -machine q35
QEMUOPTS += -device ich9-ahci,id=ahci

QEMUOPTS += -drive id=disk0,format=raw,file=$(OBJDIR)/kernel/kernel.img,if=none
# For QEMU < 4.2 use this instead
#QEMUOPTS += -device ide-drive,drive=disk0,bus=ahci.0
QEMUOPTS += -device ide-hd,drive=disk0,bus=ahci.0

QEMUOPTS += -drive id=disk1,format=raw,file=$(OBJDIR)/kernel/swap.img,if=none
# For QEMU < 4.2 use this instead
#QEMUOPTS += -device ide-drive,drive=disk1,bus=ahci.1
QEMUOPTS += -device ide-hd,drive=disk1,bus=ahci.1

QEMUOPTS += -serial mon:stdio -gdb tcp::$(GDBPORT)
QEMUOPTS += $(shell if $(QEMU) -nographic -help | grep -q '^-D '; then echo '-D qemu.log'; fi)
QEMUOPTS += -no-reboot -D /dev/stdout
QEMUOPTS += -smp $(CPUS)
QEMUOPTS += $(QEMUEXTRA)

IMAGES += $(OBJDIR)/kernel/kernel.img
IMAGES += $(OBJDIR)/kernel/swap.img
