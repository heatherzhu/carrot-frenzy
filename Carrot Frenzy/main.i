# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 13 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();






typedef struct {
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 198 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 209 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 249 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 285 "myLib.h"
typedef void (*ihp)(void);
# 305 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 14 "main.c" 2
# 1 "menu.h" 1
# 22 "menu.h"
extern const unsigned short menuTiles[16864];


extern const unsigned short menuMap[1024];


extern const unsigned short menuPal[256];
# 15 "main.c" 2
# 1 "sound.h" 1
void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSoundA();
void pauseSoundB();
void unpauseSoundA();
void unpauseSoundB();
void stopSound();
void stopSoundA();
void stopSoundB();
# 53 "sound.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 16 "main.c" 2
# 1 "instructions1.h" 1
# 22 "instructions1.h"
extern const unsigned short instructions1Tiles[19200];


extern const unsigned short instructions1Map[1024];


extern const unsigned short instructions1Pal[256];
# 17 "main.c" 2
# 1 "instructions2.h" 1
# 22 "instructions2.h"
extern const unsigned short instructions2Tiles[19104];


extern const unsigned short instructions2Map[1024];


extern const unsigned short instructions2Pal[256];
# 18 "main.c" 2
# 1 "gameBGLevel1.h" 1
# 22 "gameBGLevel1.h"
extern const unsigned short gameBGLevel1Tiles[1280];


extern const unsigned short gameBGLevel1Map[1024];


extern const unsigned short gameBGLevel1Pal[256];
# 19 "main.c" 2
# 1 "gameBGLevel2.h" 1
# 22 "gameBGLevel2.h"
extern const unsigned short gameBGLevel2Tiles[1312];


extern const unsigned short gameBGLevel2Map[1024];


extern const unsigned short gameBGLevel2Pal[256];
# 20 "main.c" 2
# 1 "gameBGLevel3.h" 1
# 22 "gameBGLevel3.h"
extern const unsigned short gameBGLevel3Tiles[1360];


extern const unsigned short gameBGLevel3Map[1024];


extern const unsigned short gameBGLevel3Pal[256];
# 21 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[512];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 22 "main.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[15488];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[256];
# 23 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[18560];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 24 "main.c" 2
# 1 "pauseBG.h" 1
# 22 "pauseBG.h"
extern const unsigned short pauseBGTiles[5984];


extern const unsigned short pauseBGMap[2048];


extern const unsigned short pauseBGPal[256];
# 25 "main.c" 2
# 1 "clouds.h" 1
# 22 "clouds.h"
extern const unsigned short cloudsTiles[1008];


extern const unsigned short cloudsMap[1024];


extern const unsigned short cloudsPal[256];
# 26 "main.c" 2
# 1 "transitionLevel2.h" 1
# 22 "transitionLevel2.h"
extern const unsigned short transitionLevel2Tiles[5024];


extern const unsigned short transitionLevel2Map[1024];


extern const unsigned short transitionLevel2Pal[256];
# 27 "main.c" 2
# 1 "transitionLevel3.h" 1
# 22 "transitionLevel3.h"
extern const unsigned short transitionLevel3Tiles[5008];


extern const unsigned short transitionLevel3Map[1024];


extern const unsigned short transitionLevel3Pal[256];
# 28 "main.c" 2
# 1 "menuSong.h" 1


extern const unsigned int menuSong_sampleRate;
extern const unsigned int menuSong_length;
extern const signed char menuSong_data[];
# 29 "main.c" 2
# 1 "gameSong.h" 1


extern const unsigned int gameSong_sampleRate;
extern const unsigned int gameSong_length;
extern const signed char gameSong_data[];
# 30 "main.c" 2
# 1 "pauseSong.h" 1


extern const unsigned int pauseSong_sampleRate;
extern const unsigned int pauseSong_length;
extern const signed char pauseSong_data[];
# 31 "main.c" 2
# 1 "winSong.h" 1


extern const unsigned int winSong_sampleRate;
extern const unsigned int winSong_length;
extern const signed char winSong_data[];
# 32 "main.c" 2
# 1 "loseSong.h" 1


extern const unsigned int loseSong_sampleRate;
extern const unsigned int loseSong_length;
extern const signed char loseSong_data[];
# 33 "main.c" 2

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
        buttons = (*(volatile unsigned short *)0x04000130);

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

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12) | (1<<9) | (1<<10);

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    buttons = (*(volatile unsigned short *)0x04000130);
    oldButtons = 0;

    hOff = 0;

    setupSounds();
    setupInterrupts();

    goToMenu();
}

void goToMenu() {
    state = MENU;

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8);

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (1<<7) | (0<<14);

    DMANow(3, menuPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, menuTiles, &((charblock *)0x6000000)[0], 33728 / 2);
    DMANow(3, menuMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    stopSound();
    playSoundA(menuSong_data, menuSong_length, 1);
}

void menu() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToInstructions();
    }
}

void goToInstructions() {
    state = INSTRUCTIONS;

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8);

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (1<<7) | (0<<14);

    DMANow(3, instructions1Pal, ((unsigned short *)0x5000000), 256);
    DMANow(3, instructions1Tiles, &((charblock *)0x6000000)[0], 38400 / 2);
    DMANow(3, instructions1Map, &((screenblock *)0x6000000)[28], 2048 / 2);
}

void instructions() {
    seed++;
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToInstructions2();
    }
}

void goToInstructions2() {
    state = INSTRUCTIONS2;

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8);

    seed = 0;

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (1<<7) | (0<<14);

    DMANow(3, instructions2Pal, ((unsigned short *)0x5000000), 256);
    DMANow(3, instructions2Tiles, &((charblock *)0x6000000)[0], 38208/ 2);
    DMANow(3, instructions2Map, &((screenblock *)0x6000000)[28], 2048 / 2);
}

void instructions2() {
    seed++;
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        stopSoundA();
        playSoundA(gameSong_data, gameSong_length, 1);

        goToGame1();
        initializeGame(1);
        srand(seed);
    }
}

void goToGame1() {
    state = GAME1;

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (0<<14);

    DMANow(3, gameBGLevel1Pal, ((unsigned short *)0x5000000), 256);
    DMANow(3, gameBGLevel1Tiles, &((charblock *)0x6000000)[0], 2560 / 2);
    DMANow(3, gameBGLevel1Map, &((screenblock *)0x6000000)[28], 2048 / 2);
}

void game1() {
    updateGame();
    waitForVBlank();
    drawGame();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        pauseSoundA();
        playSoundB(pauseSong_data, pauseSong_length - 100, 1);
        goToPause1();
    } else if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        stopSound();
        playSoundA(menuSong_data, menuSong_length, 1);
        goToMenu();
    }
}

void goToTransition1() {
    state = TRANSITION1;

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8);

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (0<<14);

    DMANow(3, transitionLevel2Pal, ((unsigned short *)0x5000000), 256);
    DMANow(3, transitionLevel2Tiles, &((charblock *)0x6000000)[0], 10048/ 2);
    DMANow(3, transitionLevel2Map, &((screenblock *)0x6000000)[28], 2048 / 2);
}

void transition1() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame2();
        initializeGame(2);
    }
}

void goToGame2() {
    state = GAME2;

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (0<<14);

    DMANow(3, gameBGLevel2Pal, ((unsigned short *)0x5000000), 256);
    DMANow(3, gameBGLevel2Tiles, &((charblock *)0x6000000)[0], 2624 / 2);
    DMANow(3, gameBGLevel2Map, &((screenblock *)0x6000000)[28], 2048 / 2);
}

void game2() {
    updateGame();
    waitForVBlank();
    drawGame();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        pauseSoundA();
        playSoundB(pauseSong_data, pauseSong_length - 100, 1);
        goToPause2();
    } else if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        stopSound();
        playSoundA(menuSong_data, menuSong_length, 1);
        goToMenu();
    }
}

void goToTransition2() {
    state = TRANSITION2;

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8);

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (0<<14);

    DMANow(3, transitionLevel3Pal, ((unsigned short *)0x5000000), 256);
    DMANow(3, transitionLevel3Tiles, &((charblock *)0x6000000)[0], 10016/ 2);
    DMANow(3, transitionLevel3Map, &((screenblock *)0x6000000)[28], 2048 / 2);
}

void transition2() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame3();
        initializeGame(3);
    }
}

void goToGame3() {
    state = GAME3;

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (0<<14);

    DMANow(3, gameBGLevel3Pal, ((unsigned short *)0x5000000), 256);
    DMANow(3, gameBGLevel3Tiles, &((charblock *)0x6000000)[0], 2720 / 2);
    DMANow(3, gameBGLevel3Map, &((screenblock *)0x6000000)[28], 2048 / 2);
}

void game3() {
    updateGame();
    waitForVBlank();
    drawGame();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        pauseSoundA();
        playSoundB(pauseSong_data, pauseSong_length - 100, 1);
        goToPause3();
    } else if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        stopSound();
        playSoundA(menuSong_data, menuSong_length, 1);
        goToMenu();
    }
}

void goToPause1() {
    state = PAUSE1;

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<9) | (1<<10);

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short*)0x400000C) = ((1)<<2) | ((28)<<8) | (0<<7) | (1<<14);
    (*(volatile unsigned short*)0x400000A) = ((2)<<2) | ((31)<<8) | (0<<7) | (0<<14);


    DMANow(3, pauseBGPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, pauseBGTiles, &((charblock *)0x6000000)[1], 11968 / 2);
    DMANow(3, pauseBGMap, &((screenblock *)0x6000000)[28], 4096 / 2);

    DMANow(3, cloudsTiles, &((charblock *)0x6000000)[2], 2016 / 2);
    DMANow(3, cloudsMap, &((screenblock *)0x6000000)[31], 2048 / 2);
}

void pause1() {
    hOff++;
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        stopSoundB();
        unpauseSoundA();
        goToGame1();
    }
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    (*(volatile unsigned short *)0x04000014) = hOff / 8;
    (*(volatile unsigned short *)0x04000018) = hOff / 4;
}

void goToPause2() {
    state = PAUSE2;

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<9) | (1<<10);

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short*)0x400000C) = ((1)<<2) | ((28)<<8) | (0<<7) | (1<<14);
    (*(volatile unsigned short*)0x400000A) = ((2)<<2) | ((31)<<8) | (0<<7) | (0<<14);


    DMANow(3, pauseBGPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, pauseBGTiles, &((charblock *)0x6000000)[1], 11968 / 2);
    DMANow(3, pauseBGMap, &((screenblock *)0x6000000)[28], 4096 / 2);

    DMANow(3, cloudsTiles, &((charblock *)0x6000000)[2], 2016 / 2);
    DMANow(3, cloudsMap, &((screenblock *)0x6000000)[31], 2048 / 2);
}

void pause2() {
    hOff++;
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        stopSoundB();
        unpauseSoundA();
        goToGame2();
    }
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    (*(volatile unsigned short *)0x04000014) = hOff / 8;
    (*(volatile unsigned short *)0x04000018) = hOff / 4;
}

void goToPause3() {
    state = PAUSE3;

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<9) | (1<<10);

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short*)0x400000C) = ((1)<<2) | ((28)<<8) | (0<<7) | (1<<14);
    (*(volatile unsigned short*)0x400000A) = ((2)<<2) | ((31)<<8) | (0<<7) | (0<<14);


    DMANow(3, pauseBGPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, pauseBGTiles, &((charblock *)0x6000000)[1], 11968 / 2);
    DMANow(3, pauseBGMap, &((screenblock *)0x6000000)[28], 4096 / 2);

    DMANow(3, cloudsTiles, &((charblock *)0x6000000)[2], 2016 / 2);
    DMANow(3, cloudsMap, &((screenblock *)0x6000000)[31], 2048 / 2);
}

void pause3() {
    hOff++;
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        stopSoundB();
        unpauseSoundA();
        goToGame3();
    }
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    (*(volatile unsigned short *)0x04000014) = hOff / 8;
    (*(volatile unsigned short *)0x04000018) = hOff / 4;
}

void goToWin() {
    state = WIN;

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8);

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (1<<7) | (0<<14);

    DMANow(3, winPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, winTiles, &((charblock *)0x6000000)[0], 30976 / 2);
    DMANow(3, winMap, &((screenblock *)0x6000000)[28], 2048 / 2);
}

void win() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToMenu();
    }
}

void goToLose() {
    state = LOSE;

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8);

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (1<<7) | (0<<14);

    DMANow(3, losePal, ((unsigned short *)0x5000000), 256);
    DMANow(3, loseTiles, &((charblock *)0x6000000)[0], 37120 / 2);
    DMANow(3, loseMap, &((screenblock *)0x6000000)[28], 2048 / 2);
}

void lose() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToMenu();
    }
}
