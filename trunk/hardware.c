/* ------------------------------ hardware.c-----------------------------------
*
*
*       The main file will contain the main stepping for the game.
*       The functions in here will be High level, and very abstract.
*
*--------------------------------------------------------------------------*/

//=====================Includes
#include "myLib.h"
#include "hardware.h"


//=====================Functions
void waitForVBlank() {
    while( *scanLineCounter > 159) {}; //Start Display
    while( *scanLineCounter < 160) {}; //Finish Display
}

void rectangleDMA(int x, int y, int w, int h, volatile u16 color) {
    int r;
    for(r = 0; r < h; r++) {
        DMA_MEMFILL3_SHRT( (videoBuffer+OFFSET(x,y+r)), &color, w );
    }
}

void pause() {
	while(KEY_DOWN_NOW(BUTTON_START));
	while(!KEY_DOWN_NOW(BUTTON_START));
	while(KEY_DOWN_NOW(BUTTON_START));
}

void fillScreen(volatile u16 color) {
	DMA_MEMFILL3_SHRT(videoBuffer, &color , 160*240);
}

