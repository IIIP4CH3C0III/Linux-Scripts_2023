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

WINDOW *createNewWindow( int height , 
						 int width  , 
						 int startY , 
						 int startX , 
						 int color 
						 );

void showDisplay ( WINDOW **bottomWindow , WINDOW **topWindow , WINDOW **mainWindow );

bool windowSizeChanges( int * columnsBefore , int * rowsBefore );

void clearLine( int line );

#endif 
