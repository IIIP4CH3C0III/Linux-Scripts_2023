/*
 * File name   : display.c
 *
 * Author	   : Fábio Pacheco
 *
 * Description : Functions that play with Ncurses library, and do most of the functions necessary.
 *               There is the possibility of changing the color pair in here.
 */


#include "display.h"

void initDisplay (void)
{
	initscr();
	start_color();

	cbreak();	// Disable the buffer in line;
	noecho();
	keypad(stdscr, TRUE);
	
	nodelay(stdscr, TRUE); // Don't wait for a input after a certain time

	use_default_colors();
}

void exitDisplay (void)
{
	endwin();
}

WINDOW *createNewWindow( int height, int width, int startY, int startX , int color )
{
	WINDOW *localWin;

	localWin = newwin( height , width , startY , startX );

	wrefresh( localWin );

	wbkgd ( localWin , COLOR_PAIR(color) );

	return localWin;		
}


void showDisplay ( WINDOW **bottomWindow , WINDOW **topWindow , WINDOW **mainWindow )
{
	init_pair( 1 , COLOR_BLACK , COLOR_WHITE );
	init_pair( 2 , COLOR_WHITE , COLOR_BLACK );

	*mainWindow   = createNewWindow( 0, 0, 0	  , 0 , 2);
	*topWindow    = createNewWindow( 1, 0, 1	  , 0 , 1);
	*bottomWindow = createNewWindow( 2, 0, LINES-3, 0 , 1);

	refresh();
	
	wrefresh ( *mainWindow );
	wrefresh ( *bottomWindow );
	wrefresh ( *topWindow );
}

bool windowSizeChanges( int * columnsBefore , int * rowsBefore )
{
	if( *columnsBefore != COLS || *rowsBefore != LINES )
	{
		*columnsBefore = COLS;
		*rowsBefore = LINES;
		return true;
	}
	return false;
}

void clearLine( int line )
{
	for( int i = 0 ; i < COLS ; i++ )
		mvprintw( line , i , " ");
}

