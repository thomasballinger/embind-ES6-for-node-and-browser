#ifndef POINT_H_
#define POINT_H_

class Point {
public:
	Point();
	Point(double x, double y);
	void Set(double x, double y);
	double Xval() const;
	double Yval() const;

private:
	double x;
	double y;
};

#endif
