./build.sh
if [ "$?" != "0" ] 
then
	exit 1
fi

if [ "$BUILD_DIR" == "" ] 
then
	export BUILD_DIR=build
fi

export CONFIG=grub.cfg
export ISO=$BUILD_DIR/myos.iso
export KERNEL_BIN=build/kernel/kernel.bin
export BOOTSTRAP_BIN=build/bootstrap/bootstrap.bin

mkdir -p $BUILD_DIR/iso/boot/grub
cp $CONFIG $BUILD_DIR/iso/boot/grub/
cp $BOOTSTRAP_BIN $BUILD_DIR/iso/boot/
cp $KERNEL_BIN $BUILD_DIR/iso/boot/
grub-mkrescue -o $ISO $BUILD_DIR/iso


QEMU_FLAGS="-enable-kvm -cpu host -cdrom $ISO"

if [ "$1" == "uefi" ]
then
	qemu-system-x86_64 $QEMU_FLAGS -bios /usr/share/ovmf/x64/OVMF_CODE.fd
else
	qemu-system-x86_64 $QEMU_FLAGS
fi
