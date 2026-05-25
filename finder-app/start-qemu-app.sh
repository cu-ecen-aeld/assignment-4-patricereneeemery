#!/bin/bash
# Fixed version: always use ${HOME}/aeld as OUTDIR

OUTDIR=${HOME}/aeld
KERNEL_IMAGE=${OUTDIR}/Image
INITRD_IMAGE=${OUTDIR}/initramfs.cpio.gz

echo "Using OUTDIR = ${OUTDIR}"
echo "Kernel      = ${KERNEL_IMAGE}"
echo "Initramfs   = ${INITRD_IMAGE}"

if [ ! -e ${KERNEL_IMAGE} ]; then
    echo "Missing kernel image at ${KERNEL_IMAGE}"
    exit 1
fi

if [ ! -e ${INITRD_IMAGE} ]; then
    echo "Missing initrd image at ${INITRD_IMAGE}"
    exit 1
fi

qemu-system-aarch64 \
    -M virt \
    -cpu cortex-a53 \
    -nographic \
    -smp 1 \
    -m 1024 \
    -kernel ${KERNEL_IMAGE} \
    -initrd ${INITRD_IMAGE} \
    -append "console=ttyAMA0"
