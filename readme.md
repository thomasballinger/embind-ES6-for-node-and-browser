# Embind example ES6 module for web and node

Until https://github.com/emscripten-core/emscripten/issues/11792 is fixed, there are a few steps to getting an ES6 module working in node and in the browser. This workaround builds two separate sets of files, out-node.{mjs,wasm} and out-web.{js,wasm}.

---

First you'll need to [install Emscripten](https://emscripten.org/docs/getting_started/downloads.html) and make the em++ etc. commands available in your shell.

To build for web, use `make web` and look at example.html.

To build for node, use `make node` and look at example.mjs along with pre_js.js and post_compile_mjs.

Thanks to https://github.com/lucydsl/liblucy which was helpful in figuring out this workaround.
