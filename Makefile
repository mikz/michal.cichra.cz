NODE_MODULES := node_modules/.bin
NODE_BINARIES := resume js-beautify
RESUME := $(NODE_MODULES)/resume
BEAUTIFY := $(NODE_MODULES)/js-beautify

PATH := $(PATH):$(NODE_MODULES)

default: generate

.PHONY: install beautify

path:
	@echo $(PATH)
	env

generate: $(RESUME) index.html

install:
	npm install

$(NODE_MODULES)% :
	$(MAKE) install

test : $(RESUME)
	$(RESUME) test

beautify: $(BEAUTIFY)
	$(BEAUTIFY) --replace resume.json

index.html : resume.json
	$(RESUME) export --format html index

clean:
	- rm index.html
	- rm -rf node_modules
