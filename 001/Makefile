EXECUTABLES := solution_001_rs solution_001_rs_test

.PHONY: build clean rebuild
rebuild: clean
	$(MAKE) build

build: $(EXECUTABLES)
clean:
	rm -f $(EXECUTABLES)

solution_001_rs:
	rustc solution_001_rs.rs

solution_001_rs_test:
	rustc solution_001_rs.rs --test -o $@
