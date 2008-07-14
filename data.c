/* ------------------------------ data.c-----------------------------------
*
*
*       The main file will contain the main stepping for the game.
*       The functions in here will be High level, and very abstract.
*
*--------------------------------------------------------------------------*/

//=====================Includes
#include "main.h"
#include "data.h"

//======================Globals
extern SWITCH_STATE sw_state[];

//======================Functions
SWITCH_STATE readSwitch(int num) {
    int bit = 1<<num;
    int st = (*buttons & bit);
    int isOn = (st == 0);
    switch(sw_state[num]) {
        case OFF:
            if(isOn) sw_state[num] = PRESSED;
            break;
        case PRESSED:
            if(isOn) sw_state[num] = ON;
            else sw_state[num] = OFF;
            break;
        case ON:
            if(!isOn) sw_state[num] = RELEASED;
            break;
        case RELEASED:
            if(isOn) sw_state[num] = ON;
            else sw_state[num] = OFF;
            break;
    }
    return sw_state[num];
}
