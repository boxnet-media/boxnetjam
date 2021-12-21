PROJECTNAME="Boxnet"

platform=linux

build-godot-project:
	@mkdir -p build/$(platform)
	@godot --export $(platform) build/$(PROJECTNAME)

## build: Exports Godot project can use `make build platform=win64` for windows
build: build-godot-project

## lint: Runs GDScript Toolkit's linter
lint:
	@find . -name '*.gd' | xargs gdlint

## format: Runs GDScript Toolkit's formatter
format:
	@find . -name '*.gd' | xargs gdformat

## clean: Removes all build related files
clean:
	@echo "  >  Cleaning project..."
	@rm -rf build

## help: Displays help text for make commands
.DEFAULT_GOAL := help
all: help
help: Makefile
	@echo " Choose a command run in "$(PROJECTNAME)":"
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'