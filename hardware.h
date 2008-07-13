/* ------------------------------ hardware.h-----------------------------------
*
*   This includes all registries specific to the GBA.
*
*
*--------------------------------------------------------------------------*/
//=================Includes
#include <malloc.h>
#include <stdio.h>
#include <math.h>

//================Registries
#define REG_DISPCTL *(u16 *) 0X4000000
#define PALETTE_MEM ((u16 *)0x5000000)
#define REG_DM3SAD *(volatile u32 *) 0x40000D4	     //DMA
#define REG_DM3DAD *(volatile u32 *) 0x40000D8	     //DMA
#define REG_DM3CNT *(volatile u32 *) 0x40000DC       //DMA
#define DMA_ON 			1<<31                        //DMA
#define DMA_SRC_FIXED 	2<<23                        //DMA
#define BG2_ENABLE 1 << 10
#define MODE_3 3
#define MODE_4 4
#define BACKBUFFER 0x10
#define OFFSET(X, Y) ((Y)*240 + (X))
#define COLOR(r, g, b) ((r) | (g) << 5 | (b) << 10)

//=================Buttons
#define KEY_DOWN_NOW(key) (~(*buttons) & key)
#define BUTTON_A 		1<<0
#define BUTTON_B 		1<<1
#define BUTTON_SELECT   1<<2
#define BUTTON_START 	1<<3
#define BUTTON_RIGHT 	1<<4
#define BUTTON_LEFT 	1<<5
#define BUTTON_UP 		1<<6
#define BUTTON_DOWN 	1<<7
#define BUTTON_L        1<<8
#define BUTTON_R        1<<9

//================Sprites

//================DMA
#define DMA_MEMFILL3_SHRT( _dst, _src, _cnt )           \
do {                                                    \
        REG_DM3CNT = 0;                                 \
        REG_DM3SAD = (int) (_src);                      \
        REG_DM3DAD = (int) (_dst);                      \
        REG_DM3CNT = (_cnt) | DMA_ON | DMA_SRC_FIXED;   \
} while(0)

#define DMA_MEMCOPY3_SHRT( _dst, _src, _cnt )           \
do {                                                    \
        REG_DM3CNT = 0;                                 \
        REG_DM3SAD = (int) (_src);                      \
        REG_DM3DAD = (int) (_dst);                      \
        REG_DM3CNT = (_cnt) | DMA_ON;                   \
} while(0)


//=================Prototypes


