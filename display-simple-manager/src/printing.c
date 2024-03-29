/*
 * File name   : printing.c
 *
 * Author	   : Fábio Pacheco
 *
 * Description : Functions that print most of the information present in program
 *
 */

#include "printing.h"

void printTXT ( WINDOW ** localWindow, DETAILS * details, char str1[] , char str2[] , int startX , int startY ) {
	unsigned int position = margin;
	unsigned int lenStr1, lenStr2;
	
	switch ( startX ) {
		case CENTER:
			//strcat( str1 , str2 );
			lenStr1  = (unsigned int) strlen ( str1 ) ;
			if( details->width != 0 )
				position = details->width / 2 - lenStr1 / 2 ;
			else
			    position = COLS / 2 - lenStr1 / 2 ; 
			    
			mvwprintw( *localWindow , startY , position , "%s" , str1 )   ; 
			break;

		case START:
			mvwprintw( *localWindow , startY , position , "%s" , str1 )   ; 
			break;

		case END:
			lenStr1  = (unsigned int) strlen ( str1 ) ;
			if( details->width != 0 )
				position = details->width - lenStr1 - margin ;
			else
			    position = COLS - lenStr1 - margin ; 
			    
			mvwprintw( *localWindow , startY , position , "%s" , str1 )   ; 
			break;

		case SPACE_BETWEEN:
			lenStr1 = (unsigned int) strlen ( str1 ) ;
			lenStr2 = (unsigned int) strlen ( str2 ) ;
			unsigned int center;

			if( details->width != 0 ) {
				position = details->width - lenStr2 - margin ;
				center   = details->width / 2;
			} else {
			    position = COLS - lenStr2 - margin ; 
			    center   = COLS / 2 ; 
			}
			

			mvwprintw( *localWindow , startY , margin   , "%s" , str1 )   ; 
			mvwprintw( *localWindow , startY , position , "%s" , str2 )   ; 
			mvwprintw( *localWindow , startY , center   , "|" )   ; 
			
			break;
	}	
	wrefresh( *localWindow );
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

void clearWline( WINDOW ** localWindow , DETAILS * details , int line )
{
	int lineSize = details->width - margin ;
	if ( lineSize <= 0 )
		lineSize = COLS;

    for ( int i = margin ; i < lineSize ; i++ )
    	// mvwprintw ( *localWindow , line , i , "%d,%d | " , margin , lineSize );
    	mvwprintw ( *localWindow , line , i , " " );
	
    wrefresh( *localWindow );	
}
