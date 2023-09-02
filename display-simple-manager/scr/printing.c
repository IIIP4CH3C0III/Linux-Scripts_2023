/*
 * File name   : printing.c
 *
 * Author	   : Fábio Pacheco
 *
 * Description : Functions that print most of the information present in program
 *
 */

#include "printing.h"

void showVersion( WINDOW **topWindow )
{
	mvwprintw( *topWindow , 0,0, " Brightness/Gamma Manager V0.1");

	char str[] = {"Fabio Pacheco"};
	int size   = strlen(str);
	mvwprintw( *topWindow , 0, COLS - size - 1 , "%s", str);
	mvwprintw( *topWindow , 0, COLS / 2  , "|");
	
	wrefresh ( *topWindow );
}

void showKeys   ( WINDOW **bottomWindow)
{
	char str[] = {" <B> brightness | <G> gamma | <C> color | <V> vibrance"};
	int size   = strlen(str); 
		
	mvwprintw( *bottomWindow , 0, COLS/2 - size/2 , "%s", str); 

	strcpy(str," <Q> quit | <arrows> move | <A> apply | <D> default ");
	size = strlen( str );

	mvwprintw( *bottomWindow , 1, COLS/2 - size/2 , "%s" , str);
			  			   
	wrefresh ( *bottomWindow );
}

void printInformation( MONITOR * monitors , int monitorCount , WINDOW **mainWindow , int monitorSelected ) 
{
	wmove(*mainWindow,3,0);

	bool flag = false;
	
	// Choose number 7, because the prints start in Line 3, and then 
	// the sum of the 5 options including the monitor name make it 7
	// and multipling by i+1 means we are depending in the monitor number
	// Lines - 3 is to keey the under instructions visible

	// 36 is the better number for cols 
	if( COLS > 44 )
	    for ( int i = 0 ; i < monitorCount; i++) 
			if( linesOfTextOcupied * (i+1) < LINES - 4 )
			{
				if( monitorSelected == (i+1) )
				{
	                wattron(*mainWindow, A_STANDOUT);  // Apply standout mode
	        		wprintw( *mainWindow,  " Monitor %d: %s\n", i+1 , monitors[i].name );
	                wattroff(*mainWindow, A_STANDOUT);  // Turn off standout mode
				}else
		      		wprintw( *mainWindow,  " Monitor %d: %s\n", i+1 , monitors[i].name );

				wprintw( *mainWindow,  "\tBrightness     : %3.0f \n",	monitors[i].brightness * 100 );

				//Need to change afterwards, jst looks good for now
				wprintw( *mainWindow,  "\tGamma          : %3.0f,%3.0f,%3.0f (r,g,b)%% \n", monitors[i].gamma.r * 10 , monitors[i].gamma.g * 10 , monitors[i].gamma.b * 10 );
				wprintw( *mainWindow,  "\tColor vibrance : %3d \n",	            monitors[i].color );
				wprintw( *mainWindow,  "\tVibrant hue    : %3d \n\n",	        monitors[i].hue   );
			}
			else
			{
				if ( !flag )
				{
					wprintw( *mainWindow,  "\tMore down...\n" );
					flag = true;
				}
			}
	else
		wprintw( *mainWindow,  " Need a larger window!\n" );
		

	wrefresh( *mainWindow );
}

