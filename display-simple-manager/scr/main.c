/*
 * File name   : main.c
 *
 * Author	   : Fábio Pacheco
 *
 * Description : Being able to change the brightness, gamma and color temperature of the display(s), 
 *				 all in the terminal, using linux tools.
 */

#include <stdlib.h>                               /* Library used to manage bash comands and files         */
#include <stdio.h>                                /* Library used to print information                     */
#include <ncurses.h>                              /* Library used to change the look of terminal           */
#include <string.h>                               /* Library used to manage strings                        */
#include <stdbool.h>                              /* Library used to bolean variables                      */
#include <unistd.h>                               /* Library used to the sleep function                    */

#include "display.h"                              
#include "system.h"                               
#include "printing.h"                             
#include "settings.h"                             

#define delay               1                     /* Definition of the amount of time in seconds of delay  */ 

#define maxValueBrightness  100                   /* Definition of the max value that brightness can take  */
#define minValueBrightness  0                     /* Definition of the min value that brightness can take  */

#define maxVibrantHue       180                   /* Definition of the max value that vibranthue can take  */ 
#define minVibrantHue       0                     /* Definition of the max value that vibranthue can take  */ 

#define maxColorVibrance    200                   /* Definition of the max value that color...   can take  */
#define minColorVibrance    0                     /* Definition of the max value that color...   can take  */

#define maxGamma            10                    /* Definition of the max value that gamma can take       */
#define minGamma            0                     /* Definition of the max value that gamma can take       */

int main (void)
{
	initDisplay();                                /* Initialize the ncurses app                            */

	int rowsBefore    = LINES;                    /* Variable storing the number of lines of the window    */
	int columnsBefore = COLS ;                    /* Variable storing the number of columns of the window  */

	WINDOW*  bottomWindow = NULL;                 /* Variable of the bottom window presenting the keys     */
	WINDOW*     topWindow = NULL;                 /* Variable preseting the version and name of the pr     */
	WINDOW*    mainWindow = NULL;                 /* Variable of the complete window, prints the loop      */

	FILE * bashOutput     = NULL;                 /* Variable storing the output of each comand            */
	char buffer[ BUFFER_SIZE ] ;                  /* Variable storing a string buffer                      */

	MONITOR realMonitors    [ MAXMONITORS ];      /* Variable that will get constantly the values          */
	MONITOR setMonitors     [ MAXMONITORS ];      /* Variable that will get the set values by user to appy */
	MONITOR defaultMonitors [ MAXMONITORS ];      /* Variable storing the default values when app opened   */

	int monitorCount;                             /* Variable that counts the number of monitors active    */
	int monitorSelected = 1;                      /* Variable that represents the selection of monitor     */
	bool leave  = false;                          /* Variable necessary to leave the program               */
	bool change = false;                          /* Variable to know if the user changed something        */
	bool firstTime = true;                        /* Variable that represents the first loop               */
	int keyPressed;                               /* Variable that stores the pressed key by the user      */

	while( !leave )
	{
		if( windowSizeChanges(&columnsBefore,&rowsBefore) || firstTime )
		{
			clear();

			bottomWindow = NULL;
			topWindow 	 = NULL;
			mainWindow   = NULL;

			showDisplay( &bottomWindow , &topWindow , &mainWindow );
			showVersion( &topWindow );
			showKeys   ( &bottomWindow);
		}	

		if( !change )
		{
			if( !(bool)getMonitors( realMonitors , &monitorCount , bashOutput , buffer ) )
			{
		        fprintf(stderr, "Error retrieving monitor information.\n");
				exitDisplay();
				exit(EXIT_FAILURE);	
			}

			if( !(bool)getData( realMonitors , &monitorCount , bashOutput , buffer) )
			{
		        fprintf(stderr, "Error retrieving monitor information.\n");
				exitDisplay();
				exit(EXIT_FAILURE);	
			}

		    printInformation( realMonitors , monitorCount , &mainWindow , monitorSelected); 
			copyData( realMonitors , setMonitors , monitorCount);

			if( firstTime )
			{
				copyData( realMonitors , defaultMonitors , monitorCount);	
				firstTime = false;
			}
		}
		else
		    printInformation( setMonitors , monitorCount , &mainWindow , monitorSelected); 

		keyPressed = getch();
		if ( keyPressed != ERR )
			switch ( keyPressed )
			{
				default:
					mvprintw( LINES-1 , 1 , "No function to that key, acknowledge <any key>");

				    nodelay(stdscr, FALSE );
					getch();
				    nodelay(stdscr, TRUE);

					break;
			
				case 'Q':
				case 'q':
					leave = true;
					break;

				case 'B':
				case 'b': //TODO
					change = setValues( setMonitors , &mainWindow , monitorSelected , 1 , minValueBrightness , maxValueBrightness );
					break;

				case 'G':
				case 'g':
					change = setValues( setMonitors , &mainWindow , monitorSelected , 2 , minGamma , maxGamma );
					break;

				case 'C':
				case 'c':
					change = setValues( setMonitors , &mainWindow , monitorSelected , 3 , minColorVibrance , maxColorVibrance );
					break;

				case 'V':
				case 'v':
					change = setValues( setMonitors , &mainWindow , monitorSelected , 4 , minVibrantHue , maxVibrantHue );
					break;


				case KEY_UP:
				case KEY_DOWN:
					(void)selectMonitor( monitorCount , &monitorSelected , keyPressed ); // 0 represents UP
					break;

				case 'A':
				case 'a':
					applyValues( setMonitors , defaultMonitors , monitorCount , bashOutput );
					change = false;
					break;

				case 'D':
				case 'd':
					change = true;
					copyData( defaultMonitors , setMonitors , monitorCount );
					break;
			}
			
		sleep( delay );
		clearLine( LINES-1 );
	}
	exitDisplay();

	return 0;
}
