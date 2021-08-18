#include "Point.h"

#include <iostream>
using namespace std;

int main() {
  Point p = Point(1, 2);
  cout << "Point x:" << p.Xval() << "\n";
  cout << "Point y:"<< p.Yval() << "\n";
}
