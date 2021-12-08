.PHONY: install

PUG := node_modules/.bin/pug

install:
	brew install pug-cli


%.html: %.pug
	$(PUG) $<


all: OleksandrTykhonruk.en.html
