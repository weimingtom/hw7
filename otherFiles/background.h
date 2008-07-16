
//{{BLOCK(background)

//======================================================================
//
//	background, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 81 tiles (t|f reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 5184 + 2048 = 7744
//
//	Time-stamp: 2008-07-14, 21:55:14
//	Exported by Cearn's GBA Image Transmogrifier
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef __BACKGROUND__
#define __BACKGROUND__

#define backgroundTilesLen 5184
extern const unsigned short backgroundTiles[2592];

#define backgroundMapLen 2048
extern const unsigned short backgroundMap[1024];

#define backgroundPalLen 512
extern const unsigned short backgroundPal[256];

#endif // __BACKGROUND__

//}}BLOCK(background)
