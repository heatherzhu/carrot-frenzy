/* M04
 * Added sounds!
 * The menu and instructions have their own song, the game has its own song,
 * the pause state has its own song, and both of the win and lose states
 * have their own song. There are also sound effects! Throwing a shoe, hitting
 * a coyote, feeding a bunny, and picking up a carrot/shoe now makes sound.
 * 
 * More in README.txt!
 */

#include "myLib.h"
#include "menu.h"
#include "sound.h"
#include "instructions1.h"
#include "instructions2.h"
#include "gameBGLevel1.h"
#include "gameBGLevel2.h"
#include "gameBGLevel3.h"
#include "pause.h"
#include "win.h"
#include "lose.h"
#include "pauseBG.h"
#include "clouds.h"
#include "transitionLevel2.h"
#include "transitionLevel3.h"
#include "menuSong.h"
#include "gameSong.h"
#include "pauseSong.h"
#include "winSong.h"
#include "loseSong.h"

void initialize();
void goToMenu();
void menu();
void goToInstructions();
void instructions();
void goToInstructions2();
void instructions2();
void goToGame1();
void game1();
void goToTransition1();
void transition1();
void goToGame2();
void game2();
void goToTransition2();
void transition2();
void goToGame3();
void game3();
void goToPause1();
void pause1();
void goToPause2();
void pause2();
void goToPause3();
void pause3();
void goToWin();
void win();
void goToLose();
void lose();

enum {MENU, INSTRUCTIONS, INSTRUCTIONS2, GAME1, TRANSITION1, GAME2, TRANSITION2, GAME3, PAUSE1, PAUSE2, PAUSE3, WIN, LOSE};
int state;

unsigned short buttons;
unsigned short oldButtons;

unsigned short hOff;

OBJ_ATTR shadowOAM[128];

int seed;

int main() {
    initialize();

    while(1) {
        oldButtons = buttons;
        buttons = BUTTONS;

        switch (state){
        case MENU:
            menu();
            break;
        case INSTRUCTIONS:
            instructions();
            break;
        case INSTRUCTIONS2:
            instructions2();
            break;
        case GAME1:
            game1();
            break;
        case TRANSITION1:
            transition1();
            break;
        case GAME2:
            game2();
            break;
        case TRANSITION2:
            transition2();
            break;
        case GAME3:
            game3();
            break;
        case PAUSE1:
            pause1();
            break;
        case PAUSE2:
            pause2();
            break;
        case PAUSE3:
            pause3();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        }
    }
}

void initialize() {

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE | BG1_ENABLE | BG2_ENABLE;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    buttons = BUTTONS;
    oldButtons = 0;

    hOff = 0;

    setupSounds();
    setupInterrupts();

    goToMenu();
}

void goToMenu() {
    state = MENU;

    REG_DISPCTL = MODE0 | BG0_ENABLE;

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;

    DMANow(3, menuPal, PALETTE, 256);
    DMANow(3, menuTiles, &CHARBLOCK[0], menuTilesLen / 2);
    DMANow(3, menuMap, &SCREENBLOCK[28], menuMapLen / 2);

    stopSound();
    playSoundA(menuSong_data, menuSong_length, 1);
}

void menu() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions();
    }
}

void goToInstructions() {
    state = INSTRUCTIONS;

    REG_DISPCTL = MODE0 | BG0_ENABLE;

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;

    DMANow(3, instructions1Pal, PALETTE, 256);
    DMANow(3, instructions1Tiles, &CHARBLOCK[0], instructions1TilesLen / 2);
    DMANow(3, instructions1Map, &SCREENBLOCK[28], instructions1MapLen / 2);
}

void instructions() {
    seed++;
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions2();
    }
}

void goToInstructions2() {
    state = INSTRUCTIONS2;

    REG_DISPCTL = MODE0 | BG0_ENABLE;

    seed = 0;

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;

    DMANow(3, instructions2Pal, PALETTE, 256);
    DMANow(3, instructions2Tiles, &CHARBLOCK[0], instructions2TilesLen/ 2);
    DMANow(3, instructions2Map, &SCREENBLOCK[28], instructions2MapLen / 2);
}

void instructions2() {
    seed++;
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSoundA();
        playSoundA(gameSong_data, gameSong_length, 1);

        goToGame1();
        initializeGame(1);
        srand(seed);
    }
}

void goToGame1() {
    state = GAME1;
    
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, gameBGLevel1Pal, PALETTE, 256);
    DMANow(3, gameBGLevel1Tiles, &CHARBLOCK[0], gameBGLevel1TilesLen / 2);
    DMANow(3, gameBGLevel1Map, &SCREENBLOCK[28], gameBGLevel1MapLen / 2);
}

void game1() {
    updateGame();
    waitForVBlank();
    drawGame();
    if (BUTTON_PRESSED(BUTTON_START)) {
        pauseSoundA();
        playSoundB(pauseSong_data, pauseSong_length - 100, 1);
        goToPause1();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        stopSound();
        playSoundA(menuSong_data, menuSong_length, 1);
        goToMenu();
    }
}

void goToTransition1() {
    state = TRANSITION1;
    
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, transitionLevel2Pal, PALETTE, 256);
    DMANow(3, transitionLevel2Tiles, &CHARBLOCK[0], transitionLevel2TilesLen/ 2);
    DMANow(3, transitionLevel2Map, &SCREENBLOCK[28], transitionLevel2MapLen / 2);
}

void transition1() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame2();
        initializeGame(2);
    }
}

void goToGame2() {
    state = GAME2;

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, gameBGLevel2Pal, PALETTE, 256);
    DMANow(3, gameBGLevel2Tiles, &CHARBLOCK[0], gameBGLevel2TilesLen / 2);
    DMANow(3, gameBGLevel2Map, &SCREENBLOCK[28], gameBGLevel2MapLen / 2);
}

void game2() {
    updateGame();
    waitForVBlank();
    drawGame();
    if (BUTTON_PRESSED(BUTTON_START)) {
        pauseSoundA();
        playSoundB(pauseSong_data, pauseSong_length - 100, 1);
        goToPause2();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        stopSound();
        playSoundA(menuSong_data, menuSong_length, 1);
        goToMenu();
    }
}

void goToTransition2() {
    state = TRANSITION2;

    REG_DISPCTL = MODE0 | BG0_ENABLE;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, transitionLevel3Pal, PALETTE, 256);
    DMANow(3, transitionLevel3Tiles, &CHARBLOCK[0], transitionLevel3TilesLen/ 2);
    DMANow(3, transitionLevel3Map, &SCREENBLOCK[28], transitionLevel3MapLen / 2);
}

void transition2() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame3();
        initializeGame(3);
    }
}

void goToGame3() {
    state = GAME3;

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, gameBGLevel3Pal, PALETTE, 256);
    DMANow(3, gameBGLevel3Tiles, &CHARBLOCK[0], gameBGLevel3TilesLen / 2);
    DMANow(3, gameBGLevel3Map, &SCREENBLOCK[28], gameBGLevel3MapLen / 2);
}

void game3() {
    updateGame();
    waitForVBlank();
    drawGame();
    if (BUTTON_PRESSED(BUTTON_START)) {
        pauseSoundA();
        playSoundB(pauseSong_data, pauseSong_length - 100, 1);
        goToPause3();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        stopSound();
        playSoundA(menuSong_data, menuSong_length, 1);
        goToMenu();
    }
}

void goToPause1() {
    state = PAUSE1;

    REG_DISPCTL = MODE0 | BG1_ENABLE | BG2_ENABLE;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    REG_BG2CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_WIDE;
    REG_BG1CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(31) | BG_4BPP | BG_SIZE_SMALL;
    

    DMANow(3, pauseBGPal, PALETTE, 256);
    DMANow(3, pauseBGTiles, &CHARBLOCK[1], pauseBGTilesLen / 2);
    DMANow(3, pauseBGMap, &SCREENBLOCK[28], pauseBGMapLen / 2);

    DMANow(3, cloudsTiles, &CHARBLOCK[2], cloudsTilesLen / 2);
    DMANow(3, cloudsMap, &SCREENBLOCK[31], cloudsMapLen / 2);
}

void pause1() {
    hOff++;
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSoundB();
        unpauseSoundA();
        goToGame1();
    }
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
    REG_BG1HOFF = hOff / 8;
    REG_BG2HOFF = hOff / 4;
}

void goToPause2() {
    state = PAUSE2;

    REG_DISPCTL = MODE0 | BG1_ENABLE | BG2_ENABLE;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    REG_BG2CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_WIDE;
    REG_BG1CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(31) | BG_4BPP | BG_SIZE_SMALL;
    

    DMANow(3, pauseBGPal, PALETTE, 256);
    DMANow(3, pauseBGTiles, &CHARBLOCK[1], pauseBGTilesLen / 2);
    DMANow(3, pauseBGMap, &SCREENBLOCK[28], pauseBGMapLen / 2);

    DMANow(3, cloudsTiles, &CHARBLOCK[2], cloudsTilesLen / 2);
    DMANow(3, cloudsMap, &SCREENBLOCK[31], cloudsMapLen / 2);
}

void pause2() {
    hOff++;
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSoundB();
        unpauseSoundA();
        goToGame2();
    }
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
    REG_BG1HOFF = hOff / 8;
    REG_BG2HOFF = hOff / 4;
}

void goToPause3() {
    state = PAUSE3;

    REG_DISPCTL = MODE0 | BG1_ENABLE | BG2_ENABLE;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    REG_BG2CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_WIDE;
    REG_BG1CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(31) | BG_4BPP | BG_SIZE_SMALL;
    

    DMANow(3, pauseBGPal, PALETTE, 256);
    DMANow(3, pauseBGTiles, &CHARBLOCK[1], pauseBGTilesLen / 2);
    DMANow(3, pauseBGMap, &SCREENBLOCK[28], pauseBGMapLen / 2);

    DMANow(3, cloudsTiles, &CHARBLOCK[2], cloudsTilesLen / 2);
    DMANow(3, cloudsMap, &SCREENBLOCK[31], cloudsMapLen / 2);
}

void pause3() {
    hOff++;
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSoundB();
        unpauseSoundA();
        goToGame3();
    }
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
    REG_BG1HOFF = hOff / 8;
    REG_BG2HOFF = hOff / 4;
}

void goToWin() {
    state = WIN;

    REG_DISPCTL = MODE0 | BG0_ENABLE;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;

    DMANow(3, winPal, PALETTE, 256);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[28], winMapLen / 2);
}

void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToMenu();
    }
}

void goToLose() {
    state = LOSE;

    REG_DISPCTL = MODE0 | BG0_ENABLE;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP | BG_SIZE_SMALL;

    DMANow(3, losePal, PALETTE, 256);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[28], loseMapLen / 2);
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToMenu();
    }
}