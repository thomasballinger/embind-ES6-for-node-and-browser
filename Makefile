



main-native:
	g++ -c Point.cpp -o Point-native.o
	g++ test.cpp Point-native.o -o out
	./out

simple-html: example-web.html quick_example_browser.js
	emrun --serve_after_close --serve_after_exit --browser firefox --private_browsing simple.html

simple-node: example.js quick_example_node.js
	node example.js

clean:
	rm -rf Point-native.o
	rm -rf out
