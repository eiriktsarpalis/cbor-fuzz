DOTNET_RUNTIME_ID = linux-x64
AFL_ADDITIONAL_ARGS ?=

build:
	dotnet publish -c Release -r $(DOTNET_RUNTIME_ID) -p:PublishReadyToRun=true -p:PublishSingleFile=true -o app/

fuzz:
	afl-fuzz -n -i inputs/ -o findings/ $(AFL_ADDITIONAL_ARGS) app/cbor-fuzz @@

fuzz-qemu:
	afl-fuzz -Q -i inputs/ -o findings/ $(AFL_ADDITIONAL_ARGS) app/cbor-fuzz @@


.DEFAULT_GOAL := build
