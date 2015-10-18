# Basis #

**Game Name:** 		????

**Authors:**		Andy Givens, Novith Reddy

**Characters:**   		Stickman

**Plot:**  	Character can travel through one level. He can walk left or right, jump, and swim. He will need to jump over rocks and mines, and across canyons. He will need to swim across a river. He will need to avoid land mines on land, and in the water.

**Implementation:**	The characters motion will be accomplished with sprites. Each phase of motion will be a different sprite, and they will rotate through, similar to a flipbook. There will be three sprites for walking left, three for walking right, three for jumping and three for swimming, and one for standing still. There will be one sprite for rocks, one sprite for land mines and one for water mines. The backgrounds will be made from tiles. And will consist of two layers (for parallax scrolling). The most distant layer will be mountains, and the closest will be random trees and the ground.




# Code Organization #

**Hardware Level:**	This will be its own “c” file, and have its own header file. The c file will contain the functions to initiate the video mode, draw with DMA, organize and draw the sprites, and control the button registries.

**Data Level:**  	This layer will control the game data. It will also have its own “c” and “h” files.  This is where structures will be made to control the amount of lives left, the time, the characters location,

**User Interface Level:**