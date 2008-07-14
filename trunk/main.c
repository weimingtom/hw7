/* ------------------------------ main.c-----------------------------------
*
*
*       The main file will contain the main stepping for the game.
*       The functions in here will be High level, and very abstract.
*
*--------------------------------------------------------------------------*/
//===================Includes
#include "main.h"
#include "hardware.h"
#include "data.h"
#include "user.h"
#include "sprites.h"

//===================Globals
volatile u16 *scanLineCounter = (volatile u16 *) 0x4000006;
volatile u16 *buttons = (volatile u16 *) 0x4000130;
SWITCH_STATE sw_state[] = {0,0,0,0,0,0,0,0,0,0};
u16 *videoBuffer = (u16 *) 0x6000000;
u16 *FrontBuffer = (u16 *) 0x6000000;
u16 *BackBuffer = (u16 *) 0x600A000;
const u16 *spriteTiles = spritesTiles;
const u16 *spritePalette = spritesPal;

	
//=====================Main
int backColor[] = {
        0x001F,
        31 << 10 | 31 << 5,
        31 << 10 | 15 << 5,
        31 << 10 | 31,
        31 << 10 | 15};
        
int main(void) {
    while(1) {

    //initializeGBA(MODE_0 | OBJ_ENABLE );
    REG_DISPCNT = BG2_ENABLE | MODE_0;
	
    //setPalette(RED_LOCATION, backColor[0]);
    PALETTE_MEM[2] = backColor[0];
    

    fillScreen(RED);
    waitForVBlank();
    
    
    }
 return 0;
}
