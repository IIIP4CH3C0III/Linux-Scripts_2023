/*
 * File name   : main.c
 *
 * Author	   : Fábio Pacheco
 *
 * Description : Main file for the program, most of the usefull values are defined here, so as the shortkeys.
 *
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
#include "resources.h"

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

	init_pair( COLOR_BACKGROUND , COLOR_WHITE , COLOR_BLACK );
	init_pair( COLOR_FOREGROUND , COLOR_BLACK , COLOR_WHITE );
	init_pair( COLOR_WARNING    , COLOR_RED   , COLOR_BLACK );

	DETAILS * details [ nWindows ] ;
	for ( int i = 0 ; i < nWindows ; i++ ) 
	{
		details [ i ] = NULL ;
	    details [ i ] = ( DETAILS * ) loadResources ( i );		
	}

	WINDOW * windows [ nWindows ] ; 
	for ( int i = 0 ; i < nWindows ; i++ ) 
		windows [ i ] = NULL ;

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

	while( !leave )                               /* Main loop, if leave becomes true the program is over  */
	{
		if( firstTime ||  windowSizeChanges( &columnsBefore, &rowsBefore) )
		{                                         /* Be prepared to react if the window size is changed    */                           
			clear();                              /* Clear the screen as the name says                     */
                                                  /* Initialize the windows and present the version & keys */
			for ( int i = 0 ; i < nWindows ; i++ )
			{
				windows [ i ] = NULL ;
				windows [ i ] = (WINDOW *) createNewWindow( details[ i ] );  
			}
				
			printTXT ( &windows[ TOP_BAR ] , details [ TOP_BAR ] , "Brightness/Gamma Manager V0.2" , "Fabio Pacheco" , SPACE_BETWEEN , 0 );
			printTXT ( &windows[ BOT_BAR ] , details [ BOT_BAR ] , "<B> brightness | <G> gamma | <C> color | <V> vibrance", "", CENTER , 0 );
			printTXT ( &windows[ BOT_BAR ] , details [ BOT_BAR ] , "<Q> quit | <arrows> move | <A> apply | <D> default", "", CENTER , 1 );

			refresh();
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

		  	printInformation( realMonitors , monitorCount , &windows[ BACKGROUND ] , monitorSelected); 
			copyData( realMonitors , setMonitors , monitorCount);

			if( firstTime )
			{
				copyData( realMonitors , defaultMonitors , monitorCount);	
				firstTime = false;
			}
		}
		else
		    printInformation( setMonitors , monitorCount , &windows[ BACKGROUND ] , monitorSelected); 

		keyPressed = getch();
		if ( keyPressed != ERR )
			switch ( keyPressed )
			{
				default:
					printTXT( &windows[ BACKGROUND ], details[ BACKGROUND ] , "No function to that key, acknowledge <any key>" , "" , START , LINES-1 );
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
					change = setValues( setMonitors , &windows[ BACKGROUND ] , monitorSelected , 1 , minValueBrightness , maxValueBrightness );
					break;

				case 'G':
				case 'g':
					change = setValues( setMonitors , &windows[ BACKGROUND ] , monitorSelected , 2 , minGamma , maxGamma );
					break;

				case 'C':
				case 'c':
					change = setValues( setMonitors , &windows[ BACKGROUND ] , monitorSelected , 3 , minColorVibrance , maxColorVibrance );
					break;

				case 'V':
				case 'v':
					change = setValues( setMonitors , &windows[ BACKGROUND ] , monitorSelected , 4 , minVibrantHue , maxVibrantHue );
					break;


				case KEY_UP:
				case KEY_DOWN:
					(void)selectMonitor( monitorCount , &monitorSelected , keyPressed ); // 0 represents UP
					break;

				case 'A':
				case 'a':
					clearWline( &windows[ BACKGROUND ] , details[ BACKGROUND ] , LINES - 1 );
					applyValues( setMonitors , defaultMonitors , monitorCount , bashOutput , buffer , &windows[ BACKGROUND ] , details[ BACKGROUND ]);
					change = false;
					break;

				case 'D':
				case 'd':
					change = true;
					copyData( defaultMonitors , setMonitors , monitorCount );
					break;
			}
		sleep( delay );
		clearWline( &windows[ BACKGROUND ] , details[ BACKGROUND ] , LINES - 1 );
	}
	exitDisplay();

	for( int i = 0 ; i < nWindows; i++ ) 
		if ( details[ i ] != NULL ) {
			free( details[i] );
			details[i] = NULL ;
		}
	bashOutput = NULL ;
	
	return 0;
}
