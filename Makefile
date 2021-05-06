all: clean concat minify

concat: $(OBJC)
	@if [ -f style.concat.css ]; then rm -Rdf style.concat.css; fi;
	touch style.concat.css
	cat ./public/fonts.css >> style.concat.css
	cat ./public/standard.css >> style.concat.css
	cat ./public/wordpress.css >> style.concat.css
	cat ./public/aemi.css >> style.concat.css

minify:
	@if [ -d "node_modules" ]; then "node_modules"/clean-css-cli/bin/cleancss ./style.concat.css -o ./style.min.css; fi;
	@rm -Rdf style.concat.css

clean:
	@if [ -f style.concat.css ]; then rm -Rdf style.concat.css; fi;
	@if [ -f style.min.css ]; then rm -Rdf style.min.css; fi;
