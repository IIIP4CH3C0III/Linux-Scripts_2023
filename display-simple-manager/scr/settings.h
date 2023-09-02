/*
 * File name   : settings.h
 *
 * Author	   : Fábio Pacheco
 *
 */
 
#ifndef SETTINGS_H
#define SETTINGS_H

#include <ncurses.h>
#include "system.h"

#define whereToStartInserting	25

bool setValues( MONITOR * monitor , WINDOW **mainWindow , int monitorSelected , int line , int vMin , int vMax  );
void copyData ( MONITOR * a1 , MONITOR * a2 , int c );

bool applyValues( MONITOR * set , MONITOR * reset , int c , FILE * output );
char * createCommand ( MONITOR * set , int i );

float map( float value, float xmin , float xmax , float ymin , float ymax );

#endif
