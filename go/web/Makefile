PKG = $(shell cat go.mod | grep "^module " | sed -e "s/module //g")
NAME = $(shell basename $(PKG))
VERSION = v$(shell cat .version)
COMMIT_SHA ?= $(shell git rev-parse --short HEAD)
GOOS ?= $(shell go env GOOS)
GOARCH ?= $(shell go env GOARCH)
GOBUILD=CGO_ENABLED=0 GOOS=$(GOOS) GOARCH=$(GOARCH) go build -ldflags "-X $(PKG)/version.Version=$(NAME)@$(VERSION)+sha.$(COMMIT_SHA)"

$(info 打印信息 == name:$(NAME))

# TODO 将version的值取出来,然后再++
version:
	$(info now version:$(VERSION))

build:
	$(GOBUILD)

clean:
	rm $(NAME)
