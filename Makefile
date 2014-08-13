GENERATED_FILES = \
	scrabble.js \
	scrabble.min.js \
	bower.json \
	component.json

all: $(GENERATED_FILES)

.PHONY: clean all test

test:
	@npm test

src/start.js: package.json bin/start
	bin/start > $@

scrabble.js: $(shell node_modules/.bin/smash --ignore-missing --list src/scrabble.js) package.json
	@rm -f $@
	node_modules/.bin/smash src/scrabble.js | node_modules/.bin/uglifyjs - -b indent-level=2 -o $@
	@chmod a-w $@

scrabble.min.js: scrabble.js bin/uglify
	@rm -f $@
	bin/uglify $< > $@

%.json: bin/% package.json
	@rm -f $@
	bin/$* > $@
	@chmod a-w $@

clean:
	rm -f -- $(GENERATED_FILES)
