.PHONY: build run clean docker docker-run fmt vet

ifeq ($(OS),Windows_NT)
    EXE := .exe
else
    EXE :=
endif

BINARY_NAME := sentinel2-scraper
BINARY := $(BINARY_NAME)$(EXE)
OUTPUT := sentinel2_data

build:
	go build -o $(BINARY) .

run: build
ifeq ($(OS),Windows_NT)
	$(BINARY)
else
	./$(BINARY)
endif

clean:
ifeq ($(OS),Windows_NT)
	-if exist $(BINARY) del /Q $(BINARY)
	-if exist $(OUTPUT) rmdir /S /Q $(OUTPUT)
else
	rm -rf $(BINARY) $(OUTPUT)
endif

docker:
	docker build -t $(BINARY_NAME) .

docker-run: docker
	docker run --rm -v $$(pwd)/$(OUTPUT):/app/$(OUTPUT) $(BINARY_NAME)

fmt:
	go fmt ./...

vet:
	go vet ./...
