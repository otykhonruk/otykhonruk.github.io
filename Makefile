.PHONY: all install install-cv cv pdf

VENV ?= .venv
RENDERCV ?= $(shell if [ -f $(VENV)/bin/rendercv ]; then echo $(VENV)/bin/rendercv; else command -v rendercv 2>/dev/null || echo rendercv; fi)
CV_SRC ?= Oleksandr_Tykhonruk_CV.yaml
PUG := node_modules/.bin/pug

cv:
	$(RENDERCV) render $(CV_SRC)

install-cv:
	python3 -m venv $(VENV)
	$(VENV)/bin/pip install "rendercv[full]"

install-pug:
	npm install pug-cli

%.html: %.pug
	$(PUG) $<

all: index.html OleksandrTykhonruk.en.html
