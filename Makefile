.phony: all

all: clean concat minify

concat: $(OBJC)
	@if [ ! -d "min" ]; then mkdir min; fi;
	@if [ -f "./min/style.concat.css" ]; then rm -Rdf ./min/style.concat.css; fi;
	@touch ./min/style.concat.css
	@cat ./public/fonts.css >> ./min/style.concat.css
	@cat ./public/standard.css >> ./min/style.concat.css
	@cat ./public/wordpress.css >> ./min/style.concat.css
	@cat ./public/aemi.css >> ./min/style.concat.css

minify:
	@if [ ! -d "min" ]; then mkdir min; fi;
	@if [ -d "node_modules" ]; then "node_modules"/clean-css-cli/bin/cleancss ./min/style.concat.css -o ./style.min.css; fi;
	@if [ -d "node_modules" ]; then "node_modules"/clean-css-cli/bin/cleancss ./public/fonts.css -o ./min/fonts.css; fi;
	@if [ -d "node_modules" ]; then "node_modules"/clean-css-cli/bin/cleancss ./public/standard.css -o ./min/standard.css; fi;
	@if [ -d "node_modules" ]; then "node_modules"/clean-css-cli/bin/cleancss ./public/wordpress.css -o ./min/wordpress.css; fi;
	@if [ -d "node_modules" ]; then "node_modules"/clean-css-cli/bin/cleancss ./public/aemi.css -o ./min/aemi.css; fi;
	@if [ -f "./min/style.concat.css" ]; then rm -Rdf ./min/style.concat.css; fi;

clean:
	@if [ -f "./min/style.concat.css" ]; then rm -Rdf ./min/style.concat.css; fi;
	@if [ -f "./min/style.min.css" ]; then rm -Rdf ./min/style.min.css; fi;
	@if [ -d "min" ]; then rm -Rdf min; fi;
