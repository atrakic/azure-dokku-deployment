MAKEFLAGS += --silent

BASEDIR=$(shell git rev-parse --show-toplevel)

.PHONY: all clean

all:
	pushd $(BASEDIR)/infra; make all; popd
	$(BASEDIR)/scripts/configure.sh
	$(BASEDIR)/scripts/deploy.sh

clean:
	$(BASEDIR)/scripts/clean.sh
	pushd $(BASEDIR)/infra; make clean; popd
