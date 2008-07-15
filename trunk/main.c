/* ------------------------------ main.c-----------------------------------
*
*
*       The main file will contain the main stepping for the game.
*       The functions in here will be High level, and very abstract.
*
*--------------------------------------------------------------------------*/
//===================Includes
#include "myLib.h"
#include "hardware.h"
#include "data.h"
#include "user.h"
#include "sprites.h"
#include "background.h"


//===================Globals
volatile u16 *scanLineCounter = (volatile u16 *) 0x4000006;
volatile u16 *buttons = (volatile u16 *) 0x4000130;
SWITCH_STATE sw_state[] = {0,0,0,0,0,0,0,0,0,0};
u16 *videoBuffer = (u16 *) 0x6000000;
u16 *FrontBuffer = (u16 *) 0x6000000;
u16 *BackBuffer = (u16 *) 0x600A000;
const u16 *spriteTiles = spritesTiles;
const u16 *spritePalette = spritesPal;
#define SPEED 2;

	
//=====================Main
int backColor[] = {
        0x001F,
        31 << 10 | 31 << 5,
        31 << 10 | 15 << 5,
        31 << 10 | 31,
        31 << 10 | 15};
        
int main(void) {
    int i;
    int hoff=0;
    int voff=0;
    
    
    //sets the BG0 vertical and horz offsets to 0
    REG_BG2HOFS=0;
    REG_BG2VOFS=0;

    while(1) {
        
        
        //MAP and background
    //loads all the tiles and collision map
    
    for(i=0;i<backgroundTilesLen/2;i++)
        charbase[0].tileimg[i]=backgroundTiles[i];

    

    //loads the map
    for(i=0;i<1024;i++)
        screenbase[31].tilemap[i]=backgroundMap[i];
    
    //loads the picture pallet
    for(i=0;i<backgroundPalLen/2;i++)
        PALETTE_MEM[i]=backgroundPal[i];

   
    //tells the Background 0 control register
    //where the screen map is, the tiles, the color, and size0=256x256
    //background 1 is the collision map
    REG_BG2CNT= SBB(31) | CBB(0) | COLOR256 | BG_SIZE0;

    //initializeGBA(MODE_0 | OBJ_ENABLE );
    REG_DISPCNT = BG2_ENABLE | MODE_0;
	
    //setPalette(RED_LOCATION, backColor[0]);
    //PALETTE_MEM[2] = backColor[0];
    
    // these keys move the background around the screen
        if(KEY_DOWN_NOW(BUTTON_LEFT))
            hoff=hoff-SPEED;
        if(KEY_DOWN_NOW(BUTTON_RIGHT))
            hoff+=SPEED;
        if(KEY_DOWN_NOW(BUTTON_UP))
            voff=voff-SPEED;
        if(KEY_DOWN_NOW(BUTTON_DOWN))
            voff+=SPEED;
    
    waitForVBlank();
    

        REG_BG2HOFS=hoff;
        REG_BG2VOFS=voff;
    //fillScreen(RED);

    
    
    }
 return 0;
}
