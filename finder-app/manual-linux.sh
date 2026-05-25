#!/bin/bash
# Fixed version: always use ${HOME}/aeld as OUTDIR

OUTDIR=${HOME}/aeld
KERNEL_REPO=${OUTDIR}/linux-stable
ROOTFS=${OUTDIR}/rootfs

echo "Using OUTDIR = ${OUTDIR}"

mkdir -p ${OUTDIR}
mkdir -p ${ROOTFS}

# Build kernel
if [ ! -d ${KERNEL_REPO} ]; then
    git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git ${KERNEL_REPO}
fi

cd ${KERNEL_REPO}
git checkout v5.1.10

make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- mrproper
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
make -j4 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-

cp arch/arm64/boot/Image ${OUTDIR}/Image

# Build initramfs
cd ${ROOTFS}
find . | cpio -H newc -ov --owner root:root > ${OUTDIR}/initramfs.cpio
gzip -f ${OUTDIR}/initramfs.cpio

echo "Kernel and initramfs built in ${OUTDIR}"
