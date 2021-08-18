#include "Point.h"

Point::Point() : x(0.), y(0.) {}
Point::Point(double x, double y) : x(x), y(y) {}

double Point::Xval() const {
	return x;
}
double Point::Yval() const {
	return y;
}
