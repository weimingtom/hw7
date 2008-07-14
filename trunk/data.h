/* ------------------------------ data.h-----------------------------------
*
*
*       The main file will contain the main stepping for the game.
*       The functions in here will be High level, and very abstract.
*
*--------------------------------------------------------------------------*/

//=====================Typedefs
typedef enum {OFF, PRESSED, ON, RELEASED} SWITCH_STATE;

typedef struct vector_t {
    int length;
    int *data;
} VECTOR;

typedef struct {
    float x, y;
} COORD;



