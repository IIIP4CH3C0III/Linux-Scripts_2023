/*
 * File name   : settings.c
 *
 * Author	   : Fábio Pacheco
 *
 * Description : Functions to set values, apply and some other functions to copy arrays or do some linear equations
 *
 */

#include "settings.h"
#include "display.h"
#include "printing.h"

bool setValues( MONITOR * monitors , WINDOW **mainWindow , int monitorSelected , int line , int vMin , int vMax )
{
	echo();
    nodelay(stdscr, FALSE);

	int reduction = strlen("	Brightness     : 100");

	int position  = 6 * (monitorSelected-1) + line + 3 ;

	float value  = -1.00 ;
	float valuesGamma[3] = {-1.00,-1.00,-1.00};

	mvwprintw( *mainWindow , LINES - 1 , 1 , "Values range ( 0 - 100 )%% ");
	
	if( line != 2 )
		while( value <= 0 || value > 100 )
		{
			wmove( *mainWindow ,  position , whereToStartInserting);
			for( int x = 0 ; x < COLS - reduction ; x++)
				wprintw(*mainWindow," ");

			wmove( *mainWindow , position , whereToStartInserting );
			wscanw( *mainWindow , "%f" , &value);

			if( value == -1 )
				return false;
		}
	else
		for( int i = 0 ;  i < 3 ; i++ )
			while( valuesGamma[i] <= 0 || valuesGamma[i] > 100 )
			{
				wmove( *mainWindow ,  position , whereToStartInserting + i*4 );
				for( int x = 0 ; x < 3 ; x++)
					wprintw(*mainWindow," ");

				wmove( *mainWindow ,  position , whereToStartInserting + i*4 );
				wscanw( *mainWindow , "%f" , &valuesGamma[i] );

				if( valuesGamma[i] == -1 )
					return false;
			}		

	if ( line == 1)
		monitors[ monitorSelected-1 ].brightness = value / 100.00 ;

	if ( line == 2 ) // gamma
	{
		monitors[ monitorSelected-1 ].gamma.r    = map(valuesGamma[0],0,100,vMin,vMax) ;
		monitors[ monitorSelected-1 ].gamma.b    = map(valuesGamma[1],0,100,vMin,vMax) ;
		monitors[ monitorSelected-1 ].gamma.g    = map(valuesGamma[2],0,100,vMin,vMax) ;
	}

	if ( line == 3 )
		monitors[ monitorSelected-1 ].color      = map( (int)value,0,100,vMin,vMax) ;

	if ( line == 4 )
		monitors[ monitorSelected-1 ].hue        = map( (int)value,0,100,vMin,vMax) ;

	// mvwprintw( *mainWindow , LINES-1 , 1 , "%3.2f" , monitors[ monitorSelected-1 ].brightness );

	noecho();
    nodelay(stdscr, TRUE);

    return true;
}

void copyData ( MONITOR * a1 , MONITOR * a2 , int c )
{
	for( int x = 0 ; x < c ; x++ )
	{
		strcpy( a2[x].name , a1[x].name );
		a2[x].brightness = a1[x].brightness;

		a2[x].gamma.r = a1[x].gamma.r;
		a2[x].gamma.g = a1[x].gamma.g;
		a2[x].gamma.b = a1[x].gamma.b;

		a2[x].color = a1[x].color;
		a2[x].hue = a1[x].hue;
	}
}

char options[4][ BUFFER_SIZE ] = { 
					" --brightness ",     
					" --gamma ",           
					" --set 'color vibrance' ",  
					" --set 'vibrant hue' "
				  };

bool applyValues( MONITOR * set , MONITOR * reset , int c , FILE * output , char buffer[] , WINDOW ** window , DETAILS * details )
{
	char * cmd = NULL ;
	char key ;
	
	//Function made to aply the set values	
	for( int i = 0 ; i < c ; i++ )
	{
		cmd = createCommand( set , i );
		//mvprintw(12,0,"%s",cmd);		
		if ( (output = (FILE *)popen( cmd , "r" )) == NULL )
			return false;

		printTXT ( window , details , "Confirm changes by pressing <y>, cancel <any key>." , "" , START , LINES - 1 );
		
		nodelay(stdscr, FALSE);
		key = getch();
		
		// NEED TO MAKE SURE THIS ERROR IS HANDLED 
		// When the user seams to have another display connect, but actually doens't
		// X Error of failed request:  BadMatch (invalid parameter attributes)
		// Exit the program safely!!! 

		while( fgets( buffer, BUFFER_SIZE, output ) != NULL )
			if( strcmp( buffer, "Error") == 0 )
				exit(1);

		if( key == 'y' || key == 'Y' )
		{
			clearWline( window , details , LINES - 1 );
			printTXT ( window , details , "Changes made, and confirmed, acknowledge <any key>." , "" , START , LINES - 1 );
			getch();
		}
		else
		{
			clearWline( window , details , LINES - 1 );
			cmd = createCommand( reset , i );
			if ( (output = (FILE *)popen( cmd , "r" )) == NULL )
				return false;	

			printTXT ( window , details , "Back to before, acknowledge <any key>." , "" , START , LINES - 1 );
			getch();
		}
		
	    nodelay(stdscr, TRUE);
	}

	free(cmd);
	return true;
}

char * createCommand( MONITOR * set , int i )
{
		char * cmd = malloc( BUFFER_SIZE );
		char help[ 6 ][ 20 ];
			
		strcpy( cmd , "xrandr --output " );
		strcat( cmd , set[i].name );
		strcat( cmd , options[0] );

		sprintf( help[0] , " %3.2f " , set[i].brightness );
		strcat( cmd , help[0] );

		strcat( cmd , options[1] );

		//--gamma <r>[:<g>:<b>]
		sprintf( help[1] , " %3.2f:" , set[i].gamma.r );
		sprintf( help[2] , "%3.2f:" , set[i].gamma.g );
		sprintf( help[3] , "%3.2f "  , set[i].gamma.b );

		for( int j = 1 ; j <= 3 ; j++ )
			strcat( cmd , help[j] );

		strcat( cmd , options[2] );

		sprintf( help[4] , " %3d " , set[i].color );
		strcat( cmd , help[4] );

		strcat( cmd , options[3] );

		sprintf( help[5] , " %3d " , set[i].hue );
		strcat( cmd , help[5] );

		return cmd ;
}

float map( float value, float xmin , float xmax , float ymin , float ymax )
{
	float m = (ymax - ymin) / (xmax - xmin);
	float b = ymax - m*xmax;
	float z = m*value + b;
	return z;
}

