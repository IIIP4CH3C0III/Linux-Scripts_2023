/*
 * File name   : display.h
 *
 * Author	   : Fábio Pacheco
 *
 */

#ifndef DISPLAY_H
#define DISPLAY_H

void initDisplay (void);
void exitDisplay (void);

#include <ncurses.h>
#include <stdbool.h>

/* Theme Colors */
#define COLOR_BACKGROUND     1
#define COLOR_FOREGROUND     2
#define COLOR_WARNING        3

#define NO_BOX				 0
#define BOX					 1 

typedef struct{
	int height; 
	int width ; 
	int startY; 
	int startX; 
	int color ; 
	int box   ;
} DETAILS ;

WINDOW *createNewWindow( DETAILS * details );
bool windowSizeChanges( int * columnsBefore , int * rowsBefore );

#endif 
