const isNodeJS =
  typeof process === "object" &&
  Object.prototype.toString.call(process) === "[object process]";
if (isNodeJS) {
  Module.instantiateWasm = function (imports, receiveInstance) {
    var bytes = getBinary(wasmBinaryFile);
    var mod = new WebAssembly.Module(bytes);
    var instance = new WebAssembly.Instance(mod, imports);

    receiveInstance(instance, mod);
    return instance.exports;
  };
}

Module.locateFile = function (pth) {
  const url = new URL(`./${pth}`, import.meta.url);
  return url.toString().replace("file://", "");
};
