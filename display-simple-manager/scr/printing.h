#ifndef PRINTING_H
#define PRINTING_H

#include <ncurses.h>
#include "system.h"

void showVersion( WINDOW **topWindow );
void showKeys   ( WINDOW **bottomWindow);

#define linesOfTextOcupied	7
void printInformation( MONITOR * monitors , int monitorCount , WINDOW **mainWindow , int monitorSelected ); 


#endif
