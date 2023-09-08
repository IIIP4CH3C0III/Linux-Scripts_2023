/*
 * File name   : system.c
 *
 * Author	   : Fábio Pacheco
 *
 * Description : Functions to get information of the computer, or the program it self, like selecting the monitor.
 *
 */

#include "system.h"

bool getMonitors( MONITOR * monitors , int *monitorCount , FILE *output , char buffer[])
{
	if ( (output = (FILE *)popen( listDevices , "r" )) == NULL )
		return false;
		 
	*monitorCount = 0;
	
	while( fgets( buffer , BUFFER_SIZE , output )  != NULL )
		if( sscanf(buffer ,stringFormatlistDevices , monitors[*monitorCount].name) )
			(*monitorCount)++;

	pclose( output );
	return true;
}

char format[4][ BUFFER_SIZE ] = { 
					"\t Brightness: %f", 
					"\t Gamma: %f:%f:%f", 
					"\t color vibrance: %d", 
					"\t vibrant hue: %d"
				  };

char retrive[4][ BUFFER_SIZE ] = { 
					"xrandr --verbose | grep -i brightness", 
					"xrandr --verbose | grep -i gamma", 
					"xrandr --verbose | grep -i color", 
					"xrandr --verbose | grep -i hue"
				  };

bool getData( MONITOR * monitors , int * monitorCount , FILE *output , char buffer[] )
{
	for( int x = 0  ; x < 4 ; x++ )
	{
		if ( (output = (FILE *)popen( retrive[x] , "r" )) == NULL )
			return false;
		
		for( int i = *monitorCount-1 ; i >= 0 ; i-- )
		{
			fgets( buffer , BUFFER_SIZE , output );
			//if( sscanf(buffer ,  , &monitors[i].brightness ) != 1 )
			if( x == 0 )
				if( sscanf(buffer , format[ x ] , &monitors[i].brightness ) != 1 )
				{
					printf("Error001: Can't retrive brightness value\n");
					return false;
				}

			if( x == 1 )
				if( sscanf(buffer , format[ x ] , &monitors[i].gamma.r, &monitors[i].gamma.g , &monitors[i].gamma.b ) != 3 )
				{
					printf("Error002: Can't retrive gamma value\n");
					return false;
				}


			if( x == 2 )
				if( sscanf(buffer , format[ x ] , &monitors[i].color ) != 1 )
				{
					printf("Error003: Can't retrive color value\n");
					return false;
				}

			if( x == 3 )
				if( sscanf(buffer , format[ x ] , &monitors[i].hue ) != 1 )
				{
					printf("Error004: Can't retrive hue value\n");
					return false;
				}
		}

	}
	return true;
}

int selectMonitor( int monitorCount , int *monitorSelected , int key )
{
	if( key == KEY_UP )
	{
		*monitorSelected = *monitorSelected - 1 ;		
		if( (*monitorSelected) > 0 )
			return *monitorSelected;
		else
		{
			*monitorSelected = *monitorSelected + 1 ;			
			return *monitorSelected;
		}
	}
			
	if( key == KEY_DOWN )
	{
		*monitorSelected = *monitorSelected + 1 ;		
		if( (*monitorSelected) <= monitorCount )
			return *monitorSelected;
		else
		{
			*monitorSelected = *monitorSelected - 1 ;		
			return *monitorSelected;
		}
	}

	return 0;
}
