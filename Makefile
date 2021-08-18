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

out-web.js out-web.wasm: binding.cpp Point-wasm.o
	em++\
		-s EXPORT_ES6=1\
		--bind\
		--no-entry\
		binding.cpp\
		Point-wasm.o\
		-o out-web.js


out-node.js: Point-wasm.o

web: example.html out-web.js
	emrun --serve_after_close --serve_after_exit --browser firefox --private_browsing example.html

node: example.js out-node.js
	node example.js

clean:
	rm -rf Point-native.o
	rm -rf Point-wasm.o
	rm -rf out-node.js
	rm -rf out-web.js out-web.wasm
	rm -rf out
