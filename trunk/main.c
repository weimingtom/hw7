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
#include "background0.h"
#include "background1.h"
#include "background2.h"
#include "characterSprites.h"

#define SPRITEOFFSET(r,c) (r)*512+(32)       //used to index the sprite array
#define NUMSPRITES 6                         //total number of sprites
#define WALKINGROW (11*8)                    //the height at which the person walks
#define JUMPHT 20                            //how high he jumps
#define STANDING (0,0)                       //the spriteoffset for standing



//===================Globals
volatile u16 *scanLineCounter = (volatile u16 *) 0x4000006;
screenblock *screenbase = (screenblock *)0x6000000;
charblock *charbase = (charblock *)0x6000000;
volatile u16 *buttons = (volatile u16 *) 0x4000130;
SWITCH_STATE sw_state[] = {0,0,0,0,0,0,0,0,0,0};
u16 *videoBuffer = (u16 *) 0x6000000;
u16 *FrontBuffer = (u16 *) 0x6000000;
u16 *BackBuffer = (u16 *) 0x600A000;
const u16 *spriteTiles = characterSpritesTiles;


	
//=====================Main
int main(void) {
    //Set Video Control
    REG_DISPCNT = BG2_ENABLE | BG1_ENABLE | BG0_ENABLE | MODE_0 | OBJ_ENABLE;
    
    //tells the Background 0 control register
    //where the screen map is, the tiles, the color, and size0=256x256
    //background 1 is the collision map
    REG_BG0CNT=  CBB(0) | SBB(8) | COLOR16 | BG_SIZE0;
    REG_BG1CNT=  CBB(2) | SBB(10) | COLOR16 | BG_SIZE2;
    REG_BG2CNT=  CBB(3) | SBB(12) | COLOR16 | BG_SIZE2;
    
    //sets the BG's vertical and horz offsets to 0
    REG_BG0HOFS=0;
    REG_BG0VOFS=20;
    REG_BG1HOFS=0;
    REG_BG1VOFS=0;
    REG_BG2HOFS=0;
    REG_BG2VOFS=0;

    int i;
    int speed=3;
    int hoff=0;
    int voff=0;
    
     //loads the picture pallet
     //This is the same for all backgrounds
     for(i=0;i<background0PalLen/2;i++)
        PALETTE_MEM[i]=background0Pal[i];
    
    //===========================================Sprites
    ObjAttr shadowOAM[128];

    //defining sprites with room for more
    Sprite spriteArray[NUMSPRITES]={
        {WALKINGROW, 16, SPRITEOFFSET16(0,0), ATTR0_TALL, ATTR1_SIZE64, 32, 64, TRUE}
        }
        
typedef struct {
    int printRow;
    int printCol;
    int arrayLocation;
    int shape;
    int size;
    int height;
    int width;
    int active;
} Sprite;

    //Loads sprite tiles
    for(i=0; i<characterSpritesTilesLen/2; i++)
        charbase[4].tileimg[i] = characterSpritesTiles[i];

    //set attributes of the sprite in the duplicate mem
    for(i=0; i<NUMSPRITES; i++)
    {
        shadowOAM[i].attr0 = spriteArray[i].row | ATTR0_4BPP | spriteArray[i].shape;
        shadowOAM[i].attr1 = spriteArray[i].col | spriteArray[i].size;
        shadowOAM[i].attr2 = spriteArray[i].start | ATTR2_PALETTE_BANK(0);
    }

    //hides all sprites except for main guy
    for(i=0; i<128; i++)
    {
        if(!spriteArray[i].active)
            shadowOAM[i].attr0 = ATTR0_HIDE;
    }

    waitForVblank();

    // Copy shadow into real
    for(i=0; i<128; i++)
    {
        SPRITEMEM[i] = shadowOAM[i];
    }
    
    while(1) {
        //LOADS BACKGROUND 0
        //loads all the tiles and collision map
        for(i=0;i<background0TilesLen/2;i++)
            charbase[3].tileimg[i]=background0Tiles[i];
        //loads the map
        for(i=0;i<background0MapLen/2;i++)
            screenbase[12].tilemap[i]=background0Map[i];

        //LOADS BACKGROUND 1
        //loads all the tiles and collision map
        for(i=0;i<background1TilesLen/2;i++)
            charbase[2].tileimg[i]=background1Tiles[i];
        //loads the map
        for(i=0;i<background1MapLen/2;i++)
            screenbase[10].tilemap[i]=background1Map[i];

        //LOADS BACKGROUND 2
        //loads all the tiles and collision map
        for(i=0;i<background2TilesLen/2;i++)
            charbase[0].tileimg[i]=background2Tiles[i];
        //loads the map
        for(i=0;i<background2MapLen/2;i++)
            screenbase[8].tilemap[i]=background2Map[i];
        
        // these keys move the background around the screen
        if(KEY_DOWN_NOW(BUTTON_RIGHT))hoff+=speed;
        if(KEY_DOWN_NOW(BUTTON_LEFT))hoff-=speed;
        if(KEY_DOWN_NOW(BUTTON_UP))voff-=speed;
        if(KEY_DOWN_NOW(BUTTON_DOWN))voff+=speed;
        
        REG_BG0HOFS=hoff;
        //REG_BG0VOFS=voff;
        REG_BG1HOFS=hoff/20;
        //REG_BG1VOFS=voff/20;
        
        waitForVBlank();
    }
 return 0;
}
