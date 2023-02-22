if [ "$BUILD_DIR" == "" ] 
then
	BUILD_DIR=build
fi

rm -rf $BUILD_DIR
rm -rf $BUILD_DIR/subprojects/bootstrap/build
rm -rf $BUILD_DIR/subprojects/kernel/build
