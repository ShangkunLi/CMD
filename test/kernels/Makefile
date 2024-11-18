SHELL := /bin/bash
CLANG_FLAGS := -emit-llvm -O3 -fno-unroll-loops -fno-vectorize
LLVM_DIS_FLAGS := -o

all: check_scripts compile run

check_scripts:
	@for dir in */ ; do \
		if [ ! -f "$${dir}run.sh" ]; then \
			echo "Error: $$dir is missing run.sh"; \
			exit 1; \
		fi; \
		if [ ! -f "$${dir}compile.sh" ]; then \
			echo "Error: $$dir is missing compile.sh"; \
			exit 1; \
		fi; \
	done
	@echo "All required scripts are present."

compile:
	for dir in */ ; do \
		cd $${dir}; \
		${SHELL} compile.sh; \
		cd ..; \
	done

run:
	for dir in */ ; do \
		cd $${dir}; \
		${SHELL} run.sh; \
		cd ..; \
	done

clean:
	@for dir in */ ; do \
		rm -f $${dir}*.ll $${dir}*.dot $${dir}*.bc $${dir}*.txt $${dir}config.json $${dir}mrrg.json $${dir}increMapInput.json; \
	done
	@echo "Cleaned up."