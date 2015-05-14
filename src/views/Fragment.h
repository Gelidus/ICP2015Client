/**
 * @brief ICP project 2015 (Maze game)
 * @authors xmalin26, xmasek15
 */

#ifndef ICP2015CLIENT_FRAGMENT_H
#define ICP2015CLIENT_FRAGMENT_H

#include <algorithm>
#include "../math/Vector2.h"

enum class FragmentType: int {
	L = 0, T = 1, I = 2, N = 3, Player = 4, Card = 5
};

enum class FragmentRotation: int {
	Normal = 0, Right = 1, Flip = 2, Left = 3
};

class Fragment: public Vector2 {

public:
	const FragmentType Type;

private:
	FragmentRotation rotation;

public:
	Fragment(int x, int y, FragmentType type, FragmentRotation rotation);

	virtual ~Fragment();

	FragmentRotation getRotation() const;

	int getX() const;

	int getY() const;

	bool isOpenUp() const;

	bool isOpenDown() const;

	bool isOpenRight() const;

	bool isOpenLeft() const;

	virtual void rotate(FragmentRotation rotation);
};

class FragmentFactory {

public:
	static Fragment *create(int x, int y, FragmentType type, FragmentRotation rot = FragmentRotation::Normal)
	{
		return new Fragment(x, y, type, rot);
	}

	static Fragment *createRandom(int x, int y)
	{

		FragmentType type = static_cast<FragmentType>(rand() % 3);
		FragmentRotation rot = static_cast<FragmentRotation>(rand() % 4);

		return new Fragment(x, y, type, rot);
	}
};


#endif //ICP2015CLIENT_FRAGMENT_H
