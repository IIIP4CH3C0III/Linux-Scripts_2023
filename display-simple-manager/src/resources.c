#include "resources.h"

DETAILS * loadResources( int ArrayID ) {

	DETAILS * details = ( DETAILS * ) malloc ( sizeof( DETAILS ) );

	switch( ArrayID ) {
		case 0: // BACKGROUND 
			details->height  = 0 ;
			details->width   = 0 ;
			details->startY  = 0 ;
			details->startX  = 0 ;
			details->color   = COLOR_BACKGROUND;
			details->box     = NO_BOX;	
			break;
		case 1: // TOP_BAR
			details->height  = 1 ;
			details->width   = 0 ;
			details->startY  = 1 ;
			details->startX  = 0 ;
			details->color   = COLOR_FOREGROUND;
			details->box     = NO_BOX;	
			break;
		case 2: // BOT_BAR
			details->height  = 2 ;
			details->width   = 0 ;
			details->startY  = LINES - 3;
			details->startX  = 0 ;
			details->color   = COLOR_FOREGROUND;
			details->box     = NO_BOX;
			break;
		default:
			break;
	}
	return details;	
}
