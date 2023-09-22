# LAB 4 code
KERNEL_SRCFILES += \
	kernel/vma/find.c \
	kernel/vma/insert.c \
	kernel/vma/merge.c \
	kernel/vma/pfault.c \
	kernel/vma/populate.c \
	kernel/vma/protect.c \
	kernel/vma/remove.c \
	kernel/vma/show.c \
	kernel/vma/split.c \
	kernel/vma/syscall.c \
	kernel/vma/walk.c

KERNEL_BINFILES += \
	user/dontneed \
	user/evilmadvise \
	user/evilmmap \
	user/evilmprotect \
	user/evilmunmap \
	user/lazyvma \
	user/mapexec \
	user/mapfixed \
	user/mapleft \
	user/mapnone \
	user/mapnull \
	user/mapright \
	user/mapwrite \
	user/mmap \
	user/mergevma \
	user/mprotect \
	user/munmap \
	user/mustneed \
	user/persistnone \
	user/protexec \
	user/protnone \
	user/protwrite \
	user/splitvma \
	user/thp \
	user/unmapleft \
	user/unmapright \
	user/unmaptext \
	user/vma \
	user/willneed
