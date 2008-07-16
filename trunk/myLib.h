/* ------------------------------ myLib.h-----------------------------------
*
*   This file has the main types, math includes, and external variables
*
*
*
*--------------------------------------------------------------------------*/
//======================Includes
#include <math.h>
#include <stdlib.h>
#include <malloc.h>


//======================Types
typedef unsigned short u16;
typedef unsigned long  u32;
typedef signed short s16;
typedef signed long s32;
typedef unsigned char bool;
typedef u16 COLOR;

typedef struct {
    u16 tileimg[8192];
} charblock;

typedef struct {
    u16 tilemap[1024];
} screenblock;

//======================Logic
#define FALSE 0
#define TRUE 1
#define null 0


//======================Globals
extern volatile u16 *scanLineCounter;
extern volatile u16 *buttons;
extern u16 *videoBuffer;
extern u16 *FrontBuffer;
extern u16 *BackBuffer;
extern const u16 *spritePalette;
extern const u16 *spriteTiles;
extern screenblock *screenbase;
extern charblock *charbase;

#define COLOR256 1 << 7
#define BG_SIZE0 0<<14      // 32 x 32 tiles
#define BG_SIZE1 1<<14      // 64 x 32
#define BG_SIZE2 2<<14      // 32 x 64
#define BG_SIZE3 3<<14      // 64 x 64



//=================Common Colors
#define COLOR(r, g, b) ((r) | (g) << 5 | (b) << 10)
#define BLACK COLOR(0,0,0)
#define WHITE COLOR(31,31,31)
#define RED   COLOR(31,0,0)


