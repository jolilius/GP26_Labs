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
#                   (COURSE/files/labs/, the names that the activities attach)
#   make clean      remove pdf/ and stray LaTeX aux files
#
# Requirements: pandoc, xelatex (/Library/TeX/texbin), the Fira Sans font.
# Code blocks are plain: syntax highlighting needs the LaTeX package `framed`
# (sudo tlmgr install framed) - then drop --syntax-highlighting=none.

COURSE   ?= /Users/jolilius/home/doc/teaching/GPU26
FILES    := $(COURSE)/files/labs
DATE     ?= Fall 2026

export PATH := /Library/TeX/texbin:$(PATH)

# lab folder : PDF name (as attached in the Moodle content tree)
LABS := Lab_1:lab-1-manual \
        Lab_2:lab-2-manual \
        Lab_3.1:lab-3-1-manual \
        Lab_3.2:lab-3-2-manual \
        Lab_4:lab-4-manual

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
		name=$${e#*:}; \
		echo "pdf/$$name.pdf -> $(FILES)/"; \
		mkdir -p "$(FILES)"; cp "pdf/$$name.pdf" "$(FILES)/" || exit 1; \
	done

clean:
	rm -rf pdf *.aux *.log *.out
