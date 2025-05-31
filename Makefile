XCFRAMEWORK_PATH = ./macos/goswift/goswift/CalcKit.xcframework
MODULEMAP_PATH = $(XCFRAMEWORK_PATH)/macos-arm64/Headers/module.modulemap

fmt:
	go fmt src/*.go

buildc-arch:
	go build -o ./include/ -buildmode=c-archive ./src/main.go

# (eoea): This is for my environemnt, but if you are also using a Linux
# container environment and need to compile for MacOS M-series machine and have
# Zig already installed, you can run this. Otherwise use the buildc-arch.
.ONESHELL:
buildc-arch-macos-arm-experimental:
	export CC="zig cc -target aarch64-macos"
	export CXX="zig c++ -target aarch64-macos"
	CGO_ENABLED=1 GOOS=darwin GOARCH=arm64 go build -o ./include/ -buildmode=c-archive ./src/main.go

create-xcframework:
	xcodebuild -create-xcframework \
  	-library include/main.a \
  	-headers ./include \
  	-output $(XCFRAMEWORK_PATH)

create-modulemap:
	@echo 'module CalcKit {' > 	$(MODULEMAP_PATH)
	@echo ' umbrella header "main.h"' >> $(MODULEMAP_PATH)
	@echo ' export *' >> $(MODULEMAP_PATH)
	@echo '}' >> $(MODULEMAP_PATH)

create-xcframework-and-modulemap: create-xcframework create-modulemap

clean:
	rm -r ./include/*.a
	rm -r $(XCFRAMEWORK_PATH)
