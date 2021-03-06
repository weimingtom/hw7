/* ------------------------------ hardware.h-----------------------------------
*
*   This includes all registries specific to the GBA.
*   Also:
*   Sprites, DMA, and Tiles
*--------------------------------------------------------------------------*/

//================Video
#define REG_DISPCTL *(u16 *) 0X4000000
#define PALETTE_MEM ((u16 *)0x5000000)
#define OFFSET(X, Y) ((Y)*240 + (X))
#define BG0_ENABLE 1 << 8
#define BG1_ENABLE 1 << 9
#define BG2_ENABLE 1 << 10
#define BG3_ENABLE 1 << 11
#define BACKBUFFER 0x10
#define MODE_0 0
#define MODE_1 1
#define MODE_2 2
#define MODE_3 3
#define MODE_4 4

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


//#define KEY_DOWN_NOW(key)  (~(*BUTTONS) & key)


//================DMA
#define REG_DM3SAD *(volatile u32 *) 0x40000D4
#define REG_DM3DAD *(volatile u32 *) 0x40000D8
#define REG_DM3CNT *(volatile u32 *) 0x40000DC
#define DMA_ON 			1<<31
#define DMA_SRC_FIXED 	2<<23

#define DMA_MEMFILL3_SHRT(dst, src, cnt)                \
do {                                                    \
        REG_DM3CNT = 0;                                 \
        REG_DM3SAD = (int) (src);                       \
        REG_DM3DAD = (int) (dst);                       \
        REG_DM3CNT = (cnt) | DMA_ON | DMA_SRC_FIXED;    \
} while(0)

#define DMA_MEMCOPY3_SHRT(dst, src, cnt)                 \
do {                                                     \
        REG_DM3CNT = 0;                                  \
        REG_DM3SAD = (int) (src);                        \
        REG_DM3DAD = (int) (dst);                        \
        REG_DM3CNT = (cnt) | DMA_ON;                     \
} while(0)



//================Sprites
#define SPRITEMEM ((ObjAttr *) 0x7000000)       // where to put OAM
#define SPRITEDATA ((u16 *) (0x6010000))        // Where to put sprite images
#define SPRITEPAL ((u16 *) (0x5000200))         // Where to put the sprite palette
#define ATTR0_HIDE (2<<8)
#define ATTR0_4BPP  0
#define ATTR0_SQUARE (0<<14)
#define ATTR0_WIDE   (1<<14)
#define ATTR0_TALL   (2<<14)
#define ATTR1_NOFLIP (0<<12)
#define ATTR2_PALETTE_BANK(pbn) ((pbn)<<12)
        /*----------------------------------------------------------
         *          size           8       16       32      64
         *                        00       01       02      03
         *         shape
         *        Square  00     8x8    16x16    32x32   64x64
         *          Wide  01    16x8     32x8    32x16   64x32
         *          Tall  02    8x16     8x32    16x32   32x64
         */
#define ATTR1_SIZE8  (0<<14)
#define ATTR1_SIZE16 (1<<14)
#define ATTR1_SIZE32 (2<<14)
#define ATTR1_SIZE64 (3<<14)
#define OBJ_ENABLE 0x1000       // To enable sprites in REG_DISPCNT
#define MODE1D (1<<6)           //Sprite mode is 1-D
#define TOTALSPRITES 128


typedef struct {
    int row;
    int col;
    int start;
    int shape;
    int size;
    int height;
    int width;
    int rdel;
    int cdel;
    int active;
    int flip;
} Sprite;



typedef struct {
    int x;      // horizontal location (pixels)
    int y;      // vertical location (pixels)
    int start;  // tile offset
    int shape;  // attr0 shape
    int size;   // attr1 size
} SPRITE;

//===================Tiles
#define REG_BG0HOFS *(volatile unsigned short *)0x04000010
#define REG_BG1HOFS *(volatile unsigned short *)0x04000014
#define REG_BG2HOFS *(volatile unsigned short *)0x04000018
#define REG_BG3HOFS *(volatile unsigned short *)0x0400001C
#define REG_BG0VOFS *(volatile unsigned short *)0x04000012
#define REG_BG1VOFS *(volatile unsigned short *)0x04000016
#define REG_BG2VOFS *(volatile unsigned short *)0x0400001A
#define REG_BG3VOFS *(volatile unsigned short *)0x0400001E
#define REG_BG0CNT *(volatile unsigned short*)0x4000008
#define REG_BG1CNT *(volatile unsigned short*)0x400000A
#define REG_BG2CNT *(volatile unsigned short*)0x400000C
#define REG_BG3CNT *(volatile unsigned short*)0x400000E
#define REG_DISPCNT *(u16 *) 0X4000000
#define BG_COLOR(num) (num & 1) << 7
#define BG_SIZE(num) (num & 3) << 14
#define SBB(num) (num & 31) << 8
#define CBB(num) (num & 3) << 2
#define COLOR16  0 << 7
#define COLOR256 1 << 7
#define BG_SIZE0 0<<14      // 32 x 32 tiles
#define BG_SIZE1 1<<14      // 64 x 32
#define BG_SIZE2 2<<14      // 32 x 64
#define BG_SIZE3 3<<14      // 64 x 64

typedef struct {
    u16 tileimg[8192];
} charblock;

typedef struct {
    u16 tilemap[1024];
} screenblock;

//=================Prototypes
void pause();
void waitForVBlank();
void fillScreen(volatile u16 color);
void rectangleDMA(int x, int y, int w, int h, volatile u16 color);




