TARGET := solution_018.native

.PHONY: all build clean run

all:
	@$(MAKE) -s clean
	@$(MAKE) -s build
	@$(MAKE) -s run

build:
	@ocamlbuild -cflags '-w A' $(TARGET)

run:
	@./$(TARGET) problem_018.dat

clean:
	@ocamlbuild -clean
