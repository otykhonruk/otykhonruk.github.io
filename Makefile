.PHONY: all install install-cv cv pdf

VENV ?= .venv
RENDERCV ?= $(VENV)/bin/rendercv
PUG := node_modules/.bin/pug

install-cv:
	python3 -m venv $(VENV)
	$(VENV)/bin/pip install "rendercv[full]"

install-pug:
	npm install pug-cli

%.pdf: %.yaml
	$(RENDERCV) render $<

%.html: %.pug
	$(PUG) $<

all: index.html OleksandrTykhonruk.en.html
