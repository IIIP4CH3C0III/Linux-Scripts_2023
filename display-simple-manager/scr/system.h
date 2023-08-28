#ifndef SYSTEM_H
#define SYSTEM_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <ncurses.h>

#define listDevices 				"xrandr --listactivemonitors"
#define stringFormatlistDevices 	"%*d: +%s %*sx%*s/%*s %*s\n"

#define BUFFER_SIZE					1024
#define MAXMONITORS					10

typedef struct
{
	float r,g,b;
}
GAMMA;

typedef struct
{
	char  name		[ BUFFER_SIZE ];
	float brightness  ;
	GAMMA gamma       ;
	int   color       ;
	int   hue         ;
}
MONITOR;

bool getMonitors( MONITOR * monitors , int *monitorCount , FILE *output , char buffer[] );
bool getData( MONITOR * monitors , int * monitorCount , FILE *output , char buffer[] );

int selectMonitor( int monitorCount , int *monitorSelected , int key );

#endif
