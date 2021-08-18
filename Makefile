EMSCRIPTEN_ENV := $(shell command -v em++ 2> /dev/null)

native: Point-native.o
	g++ test.cpp Point-native.o -o out
	./out

Point-native.o:
	g++ -c Point.cpp -o Point-native.o

Point-wasm.o:
ifndef EMSCRIPTEN_ENV
	$(error "em++ is not available, activate the emscripten env first")
endif
	em++ -c Point.cpp -o Point-wasm.o



out-web.mjs out-web.wasm: binding.cpp Point-wasm.o
	em++\
		-s EXPORT_ES6=1\
		--bind\
		--no-entry\
		binding.cpp\
		Point-wasm.o\
		-o out-web.mjs

# EXPORT_ES6 doesn't work with node, see https://github.com/emscripten-core/emscripten/issues/11792
# To get around this, pre_js.js contains a custom locateFile method
# and post_compile_mjs changes requires to imports
# and removes the node env detection check for a 'require' function.
out-node.mjs out-node.wasm: Point-wasm.o
	em++\
		-s EXPORT_ES6=1\
		--pre-js pre_js.js\
		--bind\
		--no-entry\
		binding.cpp\
		Point-wasm.o\
		-o out-node.mjs
	./post_compile_mjs $@

web: example.html out-web.mjs
	emrun --serve_after_close --serve_after_exit --browser firefox --private_browsing example.html

node: example.mjs out-node.mjs
	node example.mjs

node-repro: example-repro.mjs out-web.mjs
	node example-repro.mjs

clean:
	rm -rf Point-native.o
	rm -rf Point-wasm.o
	rm -rf out-node.mjs out-node.wasm
	rm -rf out-webm.js out-web.wasm
	rm -rf out
