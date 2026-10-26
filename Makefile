# Makefile - lab manuals for GPU Programming (GP26)
#
# Builds Lab_N/manual.md into pdf/<name>.pdf with pandoc + xelatex, using
# template/gp26-template.tex (same design as the Introduktion till IT
# worksheets: Fira Sans, course name in the header, date on the right, page
# number in the footer).
#
# Usage:
#   make            build all manuals into pdf/
#   make publish    build, then copy the PDFs into the Moodle content tree
#                   (COURSE/sections/..., the names that the activities attach)
#   make clean      remove pdf/ and stray LaTeX aux files
#
# Requirements: pandoc, xelatex (/Library/TeX/texbin), the Fira Sans font.
# Code blocks are plain: syntax highlighting needs the LaTeX package `framed`
# (sudo tlmgr install framed) - then drop --syntax-highlighting=none.

COURSE   ?= /Users/jolilius/home/doc/teaching/GPU26
SECTIONS := $(COURSE)/sections
DATE     ?= Fall 2026

export PATH := /Library/TeX/texbin:$(PATH)

# lab folder -> PDF name (as attached in the Moodle content tree) : section folder
LABS := Lab_1:lab-1-manual:02-lecture-1-introduction \
        Lab_2:lab-2-manual:04-lecture-3-multi-dimensional-grids \
        Lab_3.1:lab-3-1-manual:10-lab-3 \
        Lab_3.2:lab-3-2-manual:10-lab-3 \
        Lab_4:lab-4-manual:12-lab-4

PANDOC_OPTS := --template=template/gp26-template.tex \
               --pdf-engine=xelatex \
               --syntax-highlighting=none \
               -V mainfont="Fira Sans" -V monofont="Menlo" \
               -M date="$(DATE)"

.PHONY: all publish clean

all:
	@mkdir -p pdf
	@for e in $(LABS); do \
		dir=$${e%%:*}; rest=$${e#*:}; name=$${rest%%:*}; \
		echo "pandoc $$dir/manual.md -> pdf/$$name.pdf"; \
		pandoc $(PANDOC_OPTS) -f gfm -o "pdf/$$name.pdf" "$$dir/manual.md" || exit 1; \
	done

publish: all
	@for e in $(LABS); do \
		rest=$${e#*:}; name=$${rest%%:*}; sec=$${rest#*:}; \
		echo "pdf/$$name.pdf -> $(SECTIONS)/$$sec/"; \
		cp "pdf/$$name.pdf" "$(SECTIONS)/$$sec/" || exit 1; \
	done

clean:
	rm -rf pdf *.aux *.log *.out
