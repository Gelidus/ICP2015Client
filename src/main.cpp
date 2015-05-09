#include <QtWidgets/QApplication>

#include "Game.h"

int main (int argc, char *argv[])
{
	QApplication application{argc, argv};

	int playgroundSize = 7;
	srand(time(NULL)); //seed for pseudo random number generating

	GUIView view{playgroundSize};
	//CLIView view{playgroundSize};

	Game game{&view};
	game.run();

	return application.exec();
}