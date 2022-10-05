#pragma once
#include <cstdint>

template <class T>
struct Vector2
{
	Vector2() 
	 : x(0), y(0) {}


	Vector2(T x, T y)
	 : x(x), y(y) {}


	Vector2& operator+=(Vector2 a) {
		this->x += a.x;
		this->y += a.y;
		return *this;
	}

	Vector2& operator-=(Vector2 a) {
		this->x -= a.x;
		this->y -= a.y;
		return *this;
	}


	friend Vector2 operator+(Vector2 a, Vector2 b) {
		a += b;
		return a;
	}

	friend Vector2 operator-(Vector2 a, Vector2 b) {
		a -= b;
		return a;
	}

	friend T operator*(Vector2 a, Vector2 b) {
		return a.x*b.x + a.y*b.y;
	}
/*
	T getLength() {
		return math::sqrt(this->x*this->x + this->y*this->y);
	}*/



	T x;
	T y;
};

