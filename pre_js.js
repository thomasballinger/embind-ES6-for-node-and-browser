Module.locateFile = function (pth) {
  const url = new URL(`./${pth}`, import.meta.url);
  return url.toString().replace("file://", "");
};
