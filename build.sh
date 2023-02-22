if [ "$BUILD_DIR" == "" ] 
then
	export BASE_BUILD_DIR=build
else
	export BASE_BUILD_DIR=$BUILD_DIR
	unset $BUILD_DIR
fi

BOOTSTRAP_BUILD_DIR=$BASE_BUILD_DIR/bootstrap
KERNEL_BUILD_DIR=$BASE_BUILD_DIR/kernel

mkdir -p $KERNEL_BUILD_DIR
mkdir -p $BOOTSTRAP_BUILD_DIR

BUILD_DIR=$BOOTSTRAP_BUILD_DIR make -f subprojects/bootstrap/makefile all
BUILD_DIR=$KERNEL_BUILD_DIR make -f subprojects/kernel/makefile all


export BUILD_DIR=$BASE_BUILD_DIR
unset $BASE_BUILD_DIR
