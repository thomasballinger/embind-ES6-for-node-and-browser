#include <emscripten/bind.h>

#include "./Point.h"

using namespace emscripten;

// Point
EMSCRIPTEN_BINDINGS(Point) {
  class_<Point>("Point")
    .constructor<double, double>()
    .function("X", &Point::Xval)
    .function("Y", &Point::Yval)
    .function("Set", &Point::Set)
    ;
  register_vector<Point>("PointVec");
}
