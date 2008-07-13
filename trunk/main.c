/* ------------------------------ main.c-----------------------------------
*
*
*       The main file will contain the main stepping for the game.
*       The functions in here will be High level, and very abstract.
*
*--------------------------------------------------------------------------*/
//===================Includes


//===================Globals
volatile u16 *scanlineCounter = (volatile u16 *) 0x4000006;
volatile u16 *buttons = (volatile u16 *) 0x4000130;
         u16 *frontBuffer = (unsigned short*)0x6000000;
         u16 *backBuffer = (unsigned short*)0x600A000;
		 u16 *videoBuffer = (u16 *) 0x6000000;
		 
		 
//=====================Main
#include "main.h"

int main() {

    while(0) {

    }

 return 0;
 
}
