# Makefile
# authors: xmasek15 xmalin26

all:
	@if [ -a Makefile_GUI ]; then make --makefile=Makefile_GUI clean 2>/dev/null ; fi;
	qmake-qt5 icp2015cli.pro
	make --makefile=Makefile_CLI
	@chmod +x icp2015cli
	@if [ -a Makefile_CLI ]; then make --makefile=Makefile_CLI clean 2>/dev/null ; fi;
	qmake-qt5 icp2015gui.pro
	make --makefile=Makefile_GUI
	@chmod +x icp2015gui

cli:
	qmake-qt5 icp2015cli.pro
	make --makefile=Makefile_CLI
	@chmod +x icp2015cli
gui:
	qmake-qt5 icp2015gui.pro
	make --makefile=Makefile_GUI
	@chmod +x icp2015gui
	
.PHONY: clean
.PHONY: doxygen
.PHONY: pack


clean:
	@if [ -a Makefile_GUI ]; then make --makefile=Makefile_GUI clean 2>/dev/null ; fi;
	@if [ -a Makefile_CLI ]; then make --makefile=Makefile_CLI clean 2>/dev/null ; fi;
	@rm -rf doc/* Makefile_CLI Makefile_GUI xmalin26-xmasek15.zip icp2015gui icp2015cli xmalin26-xmasek15.zip 2>/dev/null

doxygen:
	@doxygen

pack:
	@mkdir xmalin26-xmasek15
	@cp Makefile xmalin26-xmasek15
	@cp README.txt xmalin26-xmasek15
	@cp README.md xmalin26-xmasek15
	@cp icp2015cli.pro xmalin26-xmasek15
	@cp icp2015gui.pro xmalin26-xmasek15
	@cp Doxyfile xmalin26-xmasek15
	@cp -r examples xmalin26-xmasek15
	@cp -r src xmalin26-xmasek15
	@cp -r graphics xmalin26-xmasek15
	@cd xmalin26-xmasek15
	@zip -r xmalin26-xmasek15.zip *
	@cd ..
	@rm -rf xmalin26-xmasek15 2>/dev/null
