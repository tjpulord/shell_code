SHELL = /bin/sh
#MAKEFLAGS         := s
TOP               := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
PYTHON            := "/usr/local/nb/python/bin/python"

.PHONY: all

all: rpm

.PHONY: rpm
rpm: BUILD_NUMBER
	@echo $(TOP)



.PHONY: BUILD_NUMBER
BUILD_NUMBER:
	@if [ -z $(PARABUILD_BUILD_NUMBER) ]; \
	then \
		if [ -w $(TOP)/$@ ]; \
		then \
			echo "$$(($$(cat $(TOP)/$@) + 1))" > $@; \
		else \
			echo 1 > $(TOP)/$@; \
		fi \
	else \
		echo "$(PARABUILD_BUILD_NUMBER)" > $@; \
	fi;
	@echo "$$(($$(cat $(TOP)/$@) + 1))"