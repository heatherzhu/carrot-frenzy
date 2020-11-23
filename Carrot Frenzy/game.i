# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1
typedef struct {
    int col;
    int row;
    int cdel;
    int rdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    unsigned char lastButtonPressed;
} PLAYER;

typedef struct {
    int col;
    int row;
    int width;
    int height;
    int active;
    int isFull;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} BUNNY;

typedef struct {
    int col;
    int row;
    int width;
    int height;
    int cdel;
    int rdel;
    int active;
    int isRunningAway;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    unsigned char direction;
} COYOTE;

typedef struct {
    int col;
    int row;
    int width;
    int height;
    int active;
    int aniState;
    int curFrame;
    int numFrames;
} CARROT;

typedef struct {
    int col;
    int row;
    int width;
    int height;
    int active;
    int isThrown;
    int aniState;
    int curFrame;
    int numFrames;
    unsigned char direction;
} SHOE;

typedef struct {
    int col;
    int row;
    int width;
    int height;
    int aniState;
    int curFrame;
    int numFrames;
} BUNNIESTEXT;

typedef struct {
    int col;
    int row;
    int width;
    int height;
    int aniState;
    int curFrame;
    int numFrames;
} CARROTSTEXT;

typedef struct {
    int col;
    int row;
    int width;
    int height;
    int aniState;
    int curFrame;
    int numFrames;
} SHOESTEXT;

typedef struct {
    int col;
    int row;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} COUNTTEXTBUNNIES;

typedef struct {
    int col;
    int row;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} COUNTTEXTCARROTS;

typedef struct {
    int col;
    int row;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} COUNTTEXTSHOES;

extern int carrotsCollected;
extern int shoesCollected;
extern int shoesSpawned;
extern int bunniesToBeFed;
extern int time;
extern int count;
extern int count2;
extern int level;
extern int cheatOn;






PLAYER player;
BUNNY bunnies[9];
COYOTE coyotes[8];
CARROT carrots[10];
SHOE shoes[20];
BUNNIESTEXT bunniesText;
CARROTSTEXT carrotsText;
SHOESTEXT shoesText;
COUNTTEXTBUNNIES countTextBunnies;
COUNTTEXTCARROTS countTextCarrots;
COUNTTEXTSHOES countTextShoes;

void initializeGame(int level1);
void updateGame();
void drawGame();

void initializePlayer();
void initializeBunny(int count, int count2);
void initializeCoyote();
void initializeCarrot();
void initializeShoe();
void initializeBunniesText();
void initializeCarrotsText();
void initializeCountBunnies();
void initializeCountCarrots();
void initializeCountShoes();

void updatePlayer();
void updateBunny(BUNNY* b);
void updateCoyote(COYOTE* c);
void spawnCoyote();
void updateCarrot(CARROT* c);
void spawnCarrot();
void updateShoe(SHOE* s);
void spawnShoe();
void throwShoe();
void updateBunniesText();
void updateCarrotsText();
void updateCountBunnies();
void updateCountCarrots();
void updateCountShoes();

void drawPlayer();
void drawBunny(BUNNY* b, int i);
void drawCoyote(COYOTE* c, int i);
void drawCarrot(CARROT* c, int i);
void drawShoe(SHOE* s, int i);
void drawBunniesText();
void drawCarrotsText();
void drawCountBunnies();
void drawCountCarrots();
void drawCountShoes();
# 2 "game.c" 2
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
# 3 "game.c" 2
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
# 4 "game.c" 2
# 1 "player.h" 1
# 21 "player.h"
extern const unsigned short playerTiles[16384];


extern const unsigned short playerPal[256];
# 5 "game.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 6 "game.c" 2
# 1 "gameBGLevel1_collision.h" 1
# 20 "gameBGLevel1_collision.h"
extern const unsigned short gameBGLevel1_collisionBitmap[38400];
# 7 "game.c" 2
# 1 "gameBGLevel2_collision.h" 1
# 20 "gameBGLevel2_collision.h"
extern const unsigned short gameBGLevel2_collisionBitmap[38400];
# 8 "game.c" 2
# 1 "gameBGLevel3_collision.h" 1
# 20 "gameBGLevel3_collision.h"
extern const unsigned short gameBGLevel3_collisionBitmap[38400];
# 9 "game.c" 2
# 1 "winSong.h" 1


extern const unsigned int winSong_sampleRate;
extern const unsigned int winSong_length;
extern const signed char winSong_data[];
# 10 "game.c" 2
# 1 "loseSong.h" 1


extern const unsigned int loseSong_sampleRate;
extern const unsigned int loseSong_length;
extern const signed char loseSong_data[];
# 11 "game.c" 2
# 1 "collect.h" 1


extern const unsigned int collect_sampleRate;
extern const unsigned int collect_length;
extern const signed char collect_data[];
# 12 "game.c" 2
# 1 "feedBunny.h" 1


extern const unsigned int feedBunny_sampleRate;
extern const unsigned int feedBunny_length;
extern const signed char feedBunny_data[];
# 13 "game.c" 2
# 1 "shoeThrow.h" 1


extern const unsigned int shoeThrow_sampleRate;
extern const unsigned int shoeThrow_length;
extern const signed char shoeThrow_data[];
# 14 "game.c" 2
# 1 "shoeImpact.h" 1


extern const unsigned int shoeImpact_sampleRate;
extern const unsigned int shoeImpact_length;
extern const signed char shoeImpact_data[];
# 15 "game.c" 2

PLAYER player;
BUNNY bunnies[9];
COYOTE coyotes[8];
CARROT carrots[10];
BUNNIESTEXT bunniesText;
CARROTSTEXT carrotsText;
SHOESTEXT shoesText;
COUNTTEXTBUNNIES countTextBunnies;
COUNTTEXTCARROTS countTextCarrots;
COUNTTEXTSHOES countTextShoes;


enum {SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};

enum {SPRITEUP, SPRITEDOWN, SPRITELEFT1, SPRITERIGHT1};

enum {ZERO, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN};

int carrotsCollected;
int shoesCollected;
int shoesSpawned;
int bunniesNum;
int bunniesToBeFed;
int time;
int count;
int count2;
int level;
int cheatOn;

void initializeGame(int level1) {
    carrotsCollected = 0;
    shoesCollected = 0;
    shoesSpawned = 0;
    level = level1;
    if (level == 1) {
        bunniesNum = 4;
    } else if (level == 2) {
        bunniesNum = 6;
    } else if (level == 3) {
        bunniesNum = 9;
    }
    bunniesToBeFed = bunniesNum;
    time = 0;
    count = 0;
    count2 = 0;
    cheatOn = 0;

    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 256);
    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);

    hideSprites();

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<12) | (1<<8);

    initializePlayer();
    initializeBunny(count, count2);
    initializeCoyote();
    initializeCarrot();
    initializeShoe();
    initializeBunniesText();
    initializeCarrotsText();
    initializeShoesText();
    initializeCountBunnies();
    initializeCountCarrots();
    initializeCountShoes();
}

void updateGame() {
    updatePlayer();

    for (int i = 0; i < bunniesNum; i++) {
        updateBunny(&bunnies[i]);
    }

    for (int i = 0; i < 8; i++) {
        updateCoyote(&coyotes[i]);
    }

    for (int i = 0; i < 10; i++) {
        updateCarrot(&carrots[i]);
    }

    for (int i = 0; i < 20; i++) {
        updateShoe(&shoes[i]);
    }

    updateBunniesText();
    updateCarrotsText();
    updateShoesText();
    updateCountBunnies();
    updateCountCarrots();
    updateCountShoes();

    if (time == 0 || (time >= 400 && time % 400 == 0)) {
        spawnCarrot();
    }
    if (shoesSpawned <= 10) {
        if (time == 0 || (time >= 200 && time % 200 == 0)) {
            spawnShoe();
        }
    }


    if (level == 1) {
        if (time >= 500 && time % 500 == 0) {
            spawnCoyote();
        }
    } else if (level == 2) {
        if (time >= 500 && time % 400 == 0) {
            spawnCoyote();
        }
    } else if (level == 3) {
        if (time >= 500 && time % 300 == 0) {
            spawnCoyote();
        }
    }

    time++;

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}

void drawGame() {
    drawPlayer();

    for (int i = 0; i < bunniesNum; i++) {
        drawBunny(&bunnies[i], i);
    }

    for (int i = 0; i < 8; i++) {
        drawCoyote(&coyotes[i], i);
    }

    for (int i = 0; i < 10; i++) {
        drawCarrot(&carrots[i], i);
    }

    for (int i = 0; i < 20; i++) {
        drawShoe(&shoes[i], i);
    }

    drawBunniesText();
    drawCarrotsText();
    drawShoesText();
    drawCountBunnies();
    drawCountCarrots();
    drawCountShoes();

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}



void initializePlayer() {
    player.col = 240 / 2;
    player.row = 160 / 2 - 50;
    player.cdel = 1;
    player.rdel = 1;
    player.width = 16;
    player.height = 16;
    player.aniCounter = 0;
    player.aniState = SPRITEFRONT;
    player.prevAniState = 0;
    player.curFrame = 0;
    player.numFrames = 8;
    player.lastButtonPressed = 'u';
}

void initializeBunny(int count, int count2) {
    for (int i = 0; i < bunniesNum; i++) {
        if (level == 1) {
            bunnies[i].col = 104 + (16 * count2);
            count2++;
            bunnies[i].row = 64 + (16 * count);
            if (count2 == 2) {
                count++;
                count2 = 0;
            }
        } else if (level == 2) {
            bunnies[i].col = 96 + (16 * count2);
            count2++;
            bunnies[i].row = 64 + (16 * count);
            if (count2 == 3) {
                count++;
                count2 = 0;
            }
        } else if (level == 3) {
            bunnies[i].col = 96 + (16 * count2);
            count2++;
            bunnies[i].row = 56 + (16 * count);
            if (count2 == 3) {
                count++;
                count2 = 0;
            }
        }
        bunnies[i].width = 16;
        bunnies[i].height = 16;
        bunnies[i].active = 1;
        bunnies[i].isFull = 0;
        bunnies[i].aniCounter = 0;
        bunnies[i].aniState = SPRITEFRONT;
        bunnies[i].prevAniState = 0;
        bunnies[i].curFrame = 0;
        bunnies[i].numFrames = 6;
    }
}

void initializeCoyote() {
    for (int i = 0; i < 8; i++) {
        coyotes[i].width = 16;
        coyotes[i].height = 16;
        if (level == 1) {
            coyotes[i].col = 0 - coyotes[i].width;
            coyotes[i].row = rand() % (96 + 1 - 64) + 64;
            coyotes[i].direction = 'l';
            coyotes[i].aniState = SPRITELEFT1;
        } else if (level == 2) {
            int random;
            random = rand() % 2;
            if (random == 0) {
                coyotes[i].col = 0 - coyotes[i].width;
                coyotes[i].row = rand() % (96 + 1 - 64) + 64;
                coyotes[i].direction = 'l';
                coyotes[i].aniState = SPRITELEFT1;
            } else if (random == 1) {
                coyotes[i].col = 240 + coyotes[i].width;
                coyotes[i].row = rand() % (96 + 1 - 64) + 64;
                coyotes[i].direction = 'r';
                coyotes[i].aniState = SPRITERIGHT1;
            }
        } else if (level == 3) {
            int random;
            random = rand() % 4;
            if (random == 0) {
                coyotes[i].col = 0 - coyotes[i].width;
                coyotes[i].row = rand() % (96 + 1 - 64) + 64;
                coyotes[i].direction = 'l';
                coyotes[i].aniState = SPRITELEFT1;
            } else if (random == 1) {
                coyotes[i].col = 240 + coyotes[i].width;
                coyotes[i].row = rand() % (96 + 1 - 64) + 64;
                coyotes[i].direction = 'r';
                coyotes[i].aniState = SPRITERIGHT1;
            } else if (random == 2) {
                coyotes[i].col = rand() % (124 + 1 - 96) + 96;
                coyotes[i].row = 0 - coyotes[i].height;
                coyotes[i].direction = 'u';
                coyotes[i].aniState = SPRITEUP;
            } else if (random == 3) {
                coyotes[i].col = rand() % (124 + 1 - 96) + 96;
                coyotes[i].row = 160 + coyotes[i].height;
                coyotes[i].direction = 'd';
                coyotes[i].aniState = SPRITEDOWN;
            }
        }
        coyotes[i].cdel = 1;
        coyotes[i].rdel = 1;
        coyotes[i].active = 0;
        coyotes[i].isRunningAway = 0;
        coyotes[i].aniCounter = 0;
        coyotes[i].prevAniState = 0;
        coyotes[i].curFrame = 0;
        coyotes[i].numFrames = 5;
    }

}

void initializeCarrot() {
    for (int i = 0; i < 10; i++) {
        if (level == 1) {
            int random = rand() % 2;
            if (random) {
                carrots[i].col = rand() % (88 + 1 - 0) + 0;
            } else {
                carrots[i].col = rand() % ((240 - 16) + 1 - 144) + 144;
            }
            int random2 = rand() % 2;
            if (random2) {
                carrots[i].row = rand() % (48 + 1 - 0) + 0;
            } else {
                carrots[i].row = rand() % ((160 - 16) + 1 - 104) + 104;
            }
        } else if (level == 2) {
            int random = rand() % 2;
            if (random) {
                carrots[i].col = rand() % (80 + 1 - 0) + 0;
            } else {
                carrots[i].col = rand() % ((240 - 16) + 1 - 152) + 152;
            }
            int random2 = rand() % 2;
            if (random2) {
                carrots[i].row = rand() % (48 + 1 - 0) + 0;
            } else {
                carrots[i].row = rand() % ((160 - 16) + 1 - 104) + 104;
            }
        } else if (level == 3) {
            int random = rand() % 2;
            if (random) {
                carrots[i].col = rand() % (80 + 1 - 0) + 0;
            } else {
                carrots[i].col = rand() % ((240 - 16) + 1 - 152) + 152;
            }
            int random2 = rand() % 2;
            if (random2) {
                carrots[i].row = rand() % (40 + 1 - 0) + 0;
            } else {
                carrots[i].row = rand() % ((160 - 16) + 1 - 112) + 112;
            }
        }
        carrots[i].width = 16;
        carrots[i].height = 16;
        carrots[i].active = 0;
        carrots[i].aniState = SPRITEFRONT;
        carrots[i].curFrame = 0;
        carrots[i].numFrames = 0;
    }
}

void initializeShoe() {
    for (int i = 0; i < 20; i++) {
        if (level == 1) {
            int random = rand() % 2;
            if (random) {
                shoes[i].col = rand() % (88 + 1 - 0) + 0;
            } else {
                shoes[i].col = rand() % ((240 - 16) + 1 - 144) + 144;
            }
            int random2 = rand() % 2;
            if (random2) {
                shoes[i].row = rand() % (48 + 1 - 0) + 0;
            } else {
                shoes[i].row = rand() % ((160 - 16) + 1 - 104) + 104;
            }
        } else if (level == 2) {
            int random = rand() % 2;
            if (random) {
                shoes[i].col = rand() % (80 + 1 - 0) + 0;
            } else {
                shoes[i].col = rand() % ((240 - 16) + 1 - 152) + 152;
            }
            int random2 = rand() % 2;
            if (random2) {
                shoes[i].row = rand() % (48 + 1 - 0) + 0;
            } else {
                shoes[i].row = rand() % ((160 - 16) + 1 - 104) + 104;
            }
        } else if (level == 3) {
            int random = rand() % 2;
            if (random) {
                shoes[i].col = rand() % (80 + 1 - 0) + 0;
            } else {
                shoes[i].col = rand() % ((240 - 16) + 1 - 152) + 152;
            }
            int random2 = rand() % 2;
            if (random2) {
                shoes[i].row = rand() % (34 + 1 - 0) + 0;
            } else {
                shoes[i].row = rand() % ((160 - 16) + 1 - 112) + 112;
            }
        }
        shoes[i].width = 16;
        shoes[i].height = 16;
        shoes[i].active = 0;
        shoes[i].isThrown = 0;
        shoes[i].aniState = SPRITEFRONT;
        shoes[i].curFrame = 0;
        shoes[i].numFrames = 0;
        shoes[i].direction = 'u';
    }
}

void initializeBunniesText() {
    bunniesText.col = 5;
    bunniesText.row = 5;
    bunniesText.width = 32;
    bunniesText.height = 16;
    bunniesText.aniState = SPRITEFRONT;
    bunniesText.curFrame = 0;
    bunniesText.numFrames = 0;
}

void initializeCarrotsText() {
    carrotsText.col = 240 - 50;
    carrotsText.row = 5;
    carrotsText.width = 32;
    carrotsText.height = 16;
    carrotsText.aniState = SPRITEFRONT;
    carrotsText.curFrame = 0;
    carrotsText.numFrames = 0;
}

void initializeShoesText() {
    shoesText.col = 240 - 50;
    shoesText.row = 26;
    shoesText.width = 32;
    shoesText.height = 16;
    shoesText.aniState = SPRITEFRONT;
    shoesText.curFrame = 0;
    shoesText.numFrames = 0;
}

void initializeCountBunnies() {
    countTextBunnies.col = bunniesText.col + bunniesText.width + 4;
    countTextBunnies.row = bunniesText.row;
    countTextBunnies.width = 16;
    countTextBunnies.height = 16;
    countTextBunnies.aniCounter = 0;
    countTextBunnies.aniState = ZERO;
    countTextBunnies.prevAniState = 0;
    countTextBunnies.curFrame = 0;
    countTextBunnies.numFrames = 0;
}

void initializeCountCarrots() {
    countTextCarrots.col = carrotsText.col + carrotsText.width + 4;
    countTextCarrots.row = carrotsText.row;
    countTextCarrots.width = 16;
    countTextCarrots.height = 16;
    countTextCarrots.aniCounter = 0;
    countTextCarrots.aniState = ZERO;
    countTextCarrots.prevAniState = 0;
    countTextCarrots.curFrame = 0;
    countTextCarrots.numFrames = 0;
}

void initializeCountShoes() {
    countTextShoes.col = shoesText.col + shoesText.width + 4;
    countTextShoes.row = shoesText.row;
    countTextShoes.width = 16;
    countTextShoes.height = 16;
    countTextShoes.aniCounter = 0;
    countTextShoes.aniState = ZERO;
    countTextShoes.prevAniState = 0;
    countTextShoes.curFrame = 0;
    countTextShoes.numFrames = 0;
}



void updatePlayer() {
    if (!(player.aniState == SPRITEIDLE)) {
        player.prevAniState = player.aniState;
        player.aniState = SPRITEIDLE;
    }

    if (player.aniCounter % 5 == 0) {
        player.curFrame++;
        if (player.curFrame > player.numFrames - 1) {
            player.curFrame = 0;
        }
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        player.aniState = SPRITEFRONT;
        if (level == 1) {

            if (gameBGLevel1_collisionBitmap[((player.row)*(240)+(player.col))] && gameBGLevel1_collisionBitmap[((player.row - 1)*(240)+(player.col + player.width - 1))]) {
                player.row--;
            }
        } else if (level == 2) {
            if (gameBGLevel2_collisionBitmap[((player.row)*(240)+(player.col))] && gameBGLevel2_collisionBitmap[((player.row - 1)*(240)+(player.col + player.width - 1))]) {
                player.row--;
            }
        } else if (level == 3) {
            if (gameBGLevel3_collisionBitmap[((player.row)*(240)+(player.col))] && gameBGLevel3_collisionBitmap[((player.row - 1)*(240)+(player.col + player.width - 1))]) {
                player.row--;
            }
        }
        player.lastButtonPressed = 'u';
    } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        player.aniState = SPRITEBACK;
        if (level == 1) {
            if (gameBGLevel1_collisionBitmap[((player.row + player.height)*(240)+(player.col))] && gameBGLevel1_collisionBitmap[((player.row + player.height - 1)*(240)+(player.col + player.width - 1))]) {
                player.row++;
            }
        } else if (level == 2) {
            if (gameBGLevel2_collisionBitmap[((player.row + player.height)*(240)+(player.col))] && gameBGLevel2_collisionBitmap[((player.row + player.height - 1)*(240)+(player.col + player.width - 1))]) {
                player.row++;
            }
        } else if (level == 3) {
            if (gameBGLevel3_collisionBitmap[((player.row + player.height)*(240)+(player.col))] && gameBGLevel3_collisionBitmap[((player.row + player.height - 1)*(240)+(player.col + player.width - 1))]) {
                player.row++;
            }
        }
        player.lastButtonPressed = 'd';
    } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        player.aniState = SPRITERIGHT;
        if (level == 1) {
            if (gameBGLevel1_collisionBitmap[((player.row)*(240)+(player.col + player.width))] && gameBGLevel1_collisionBitmap[((player.row + player.height - 1)*(240)+(player.col + player.width - 1))]) {
                player.col++;
            }
        } else if (level == 2) {
            if (gameBGLevel2_collisionBitmap[((player.row)*(240)+(player.col + player.width))] && gameBGLevel2_collisionBitmap[((player.row + player.height - 1)*(240)+(player.col + player.width - 1))]) {
                player.col++;
            }
        } else if (level == 3) {
            if (gameBGLevel3_collisionBitmap[((player.row)*(240)+(player.col + player.width))] && gameBGLevel3_collisionBitmap[((player.row + player.height - 1)*(240)+(player.col + player.width - 1))]) {
                player.col++;
            }
        }
        player.lastButtonPressed = 'r';
    } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        player.aniState = SPRITELEFT;
        if (level == 1) {
            if (gameBGLevel1_collisionBitmap[((player.row)*(240)+(player.col - 1))] && gameBGLevel1_collisionBitmap[((player.row + player.height - 1)*(240)+(player.col - 1))]) {
                player.col--;
            }
        } else if (level == 2) {
            if (gameBGLevel2_collisionBitmap[((player.row)*(240)+(player.col - 1))] && gameBGLevel2_collisionBitmap[((player.row + player.height - 1)*(240)+(player.col - 1))]) {
                player.col--;
            }
        } else if (level == 3) {
            if (gameBGLevel3_collisionBitmap[((player.row)*(240)+(player.col - 1))] && gameBGLevel3_collisionBitmap[((player.row + player.height - 1)*(240)+(player.col - 1))]) {
                player.col--;
            }
        }
        player.lastButtonPressed = 'l';
    }


    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        if (shoesCollected > 0) {
            throwShoe();
        }
    }


    if ((!(~(oldButtons)&((1<<8))) && (~buttons & ((1<<8))))) {
        cheatOn = 1;
        shoesCollected = 1000;
    }

    if (player.aniState == SPRITEIDLE) {
        player.curFrame = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }


    if (player.col < 0) {
        player.col = 0;
    } else if (player.col + player.width > 240) {
        player.col = 240 - player.width;
    }
    if (player.row < 0) {
        player.row = 0;
    } else if (player.row + player.height > 160) {
        player.row = 160 - player.height;
    }


    if (level == 1) {
        if (collision(player.col, player.row, player.width, player.height, 100, 60, 40, 40)) {
            if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
                if (carrotsCollected > 0) {
                    for (int i = 0; i < bunniesNum; i++) {
                        if (bunnies[i].active) {
                            bunnies[i].active = 0;
                            bunnies[i].isFull = 1;
                            carrotsCollected--;
                            bunniesToBeFed--;
                            playSoundB(feedBunny_data, feedBunny_length - 200, 0);
                            break;
                        }
                    }
                }
            }
        }
    } else if (level == 2) {
        if (collision(player.col, player.row, player.width, player.height, 92, 60, 58, 44)) {
            if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
                if (carrotsCollected > 0) {
                    for (int i = 0; i < bunniesNum; i++) {
                        if (bunnies[i].active) {
                            bunnies[i].active = 0;
                            bunnies[i].isFull = 1;
                            carrotsCollected--;
                            bunniesToBeFed--;
                            playSoundB(feedBunny_data, feedBunny_length - 200, 0);
                            break;
                        }
                    }
                }
            }
        }
    } else if (level == 3) {
        if (collision(player.col, player.row, player.width, player.height, 92, 52, 58, 58)) {
            if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
                if (carrotsCollected > 0) {
                    for (int i = 0; i < bunniesNum; i++) {
                        if (bunnies[i].active) {
                            bunnies[i].active = 0;
                            bunnies[i].isFull = 1;
                            carrotsCollected--;
                            bunniesToBeFed--;
                            playSoundB(feedBunny_data, feedBunny_length - 200, 0);
                            break;
                        }
                    }
                }
            }
        }
    }
}

void updateBunny(BUNNY* b) {
    if (bunniesToBeFed == 0) {
        if (level == 1) {
            goToTransition1();
        } else if (level == 2) {
            goToTransition2();
        } else if (level == 3) {
            stopSound();
            playSoundA(winSong_data, winSong_length - 100, 1);
            goToWin();
        }
    }

    if (b->aniCounter % 20 == 0) {
        b->curFrame++;
        if (b->curFrame > b->numFrames - 1) {
   b->curFrame = 0;
  }
    }
    b->aniCounter++;
}

void updateCoyote(COYOTE* c) {



    if (c->active) {

        if (collision(c->col, c->row, c->width, c->height, player.col, player.row, player.width, player.height)) {
            stopSound();
            playSoundA(loseSong_data, loseSong_length - 200, 1);
            goToLose();
        }


        if (level == 1) {
            if (collision(c->col, c->row, c->width, c->height, 104, 64, 36, 36)) {
                stopSound();
                playSoundA(loseSong_data, loseSong_length - 200, 1);
                goToLose();
            }
            if (time % 2 == 0) {
                c->col += c->cdel;
            }
        } else if (level == 2) {
            if (collision(c->col, c->row, c->width, c->height, 96, 64, 48, 36)) {
                stopSound();
                playSoundA(loseSong_data, loseSong_length - 200, 1);
                goToLose();
            }
            if (time % 2 == 0) {
                if (c->direction == 'l') {
                    c->col += c->cdel;
                } else if (c->direction == 'r') {
                    c->col -= c->cdel;
                }
            }
        } else if (level == 3) {
            if (collision(c->col, c->row, c->width, c->height, 96, 56, 48, 48)) {
                stopSound();
                playSoundA(loseSong_data, loseSong_length - 200, 1);
                goToLose();
            }
            if (c->direction == 'l') {
                if (time % 2 == 0) {
                    c->col += c->cdel;
                }
            } else if (c->direction == 'r') {
                if (time % 2 == 0) {
                    c->col -= c->cdel;
                }
            } else if (c->direction == 'u') {
                if (time % 3 == 0) {
                    c->row += c->rdel;
                }
            } else if (c->direction == 'd') {
                if (time % 3 == 0) {
                    c->row -= c->rdel;
                }
            }
        }


        for (int i = 0; i < 20; i++) {
            if (shoes[i].isThrown) {
                if (collision(c->col, c->row, c->width, c->height, shoes[i].col, shoes[i].row, shoes[i].width, shoes[i].height)) {
                    c->active = 0;
                    c->isRunningAway = 1;
                    shoes[i].isThrown = 0;
                    playSoundB(shoeImpact_data, shoeImpact_length - 200, 0);
                }
            }
        }
    }

    if (level == 1) {
        if (c->isRunningAway) {
            c->aniState = SPRITERIGHT1;
            c->col -= c->cdel * 2;
            if (c->col + c->width <= 0) {
                c->isRunningAway = 0;
            }
        }
    } else if (level == 2) {
        if (c->direction == 'l') {
            if (c->isRunningAway) {
                c->aniState = SPRITERIGHT1;
                c->col -= c->cdel * 2;
                if (c->col + c->width <= 0) {
                    c->isRunningAway = 0;
                }
            }
        } else if (c->direction == 'r') {
            if (c->isRunningAway) {
                c->aniState = SPRITELEFT1;
                c->col += c->cdel * 2;
                if (c->col >= 240) {
                    c->isRunningAway = 0;
                }
            }
        }
    } else if (level == 3) {
        if (c->direction == 'l') {
            if (c->isRunningAway) {
                c->aniState = SPRITERIGHT1;
                c->col -= c->cdel * 2;
                if (c->col + c->width <= 0) {
                    c->isRunningAway = 0;
                }
            }
        } else if (c->direction == 'r') {
            if (c->isRunningAway) {
                c->aniState = SPRITELEFT1;
                c->col += c->cdel * 2;
                if (c->col >= 240) {
                    c->isRunningAway = 0;
                }
            }
        } else if (c->direction == 'u') {
            if (c->isRunningAway) {
                c->aniState = SPRITEDOWN;
                c->row -= c->rdel * 2;
                if (c->row + c->height <= 0) {
                    c->isRunningAway = 0;
                }
            }
        } else if (c->direction == 'd') {
            if (c->isRunningAway) {
                c->aniState = SPRITEUP;
                c->row += c->rdel * 2;
                if (c->row >= 160) {
                    c->isRunningAway = 0;
                }
            }
        }
    }


    if (c->aniCounter % 10 == 0) {
        c->curFrame++;
        if (c->curFrame > c->numFrames - 1) {
            c->curFrame = 0;
        }
    }
    c->aniCounter++;
}

void spawnCoyote() {
    for (int i = 0; i < 8; i++) {
        if (!coyotes[i].active) {
            coyotes[i].active = 1;
            if (level == 1) {
                coyotes[i].col = 0 - coyotes[i].width;
                coyotes[i].row = rand() % (96 + 1 - 64) + 64;
                coyotes[i].direction = 'l';
                coyotes[i].aniState = SPRITELEFT1;
            } else if (level == 2) {
                int random;
                random = rand() % 2;
                if (random == 0) {
                    coyotes[i].col = 0 - coyotes[i].width;
                    coyotes[i].row = rand() % (96 + 1 - 64) + 64;
                    coyotes[i].direction = 'l';
                    coyotes[i].aniState = SPRITELEFT1;
                } else if (random == 1) {
                    coyotes[i].col = 240 + coyotes[i].width;
                    coyotes[i].row = rand() % (96 + 1 - 64) + 64;
                    coyotes[i].direction = 'r';
                    coyotes[i].aniState = SPRITERIGHT1;
                }
            } else if (level == 3) {
                int random;
                random = rand() % 4;
                if (random == 0) {
                    coyotes[i].col = 0 - coyotes[i].width;
                    coyotes[i].row = rand() % (96 + 1 - 64) + 64;
                    coyotes[i].direction = 'l';
                    coyotes[i].aniState = SPRITELEFT1;
                } else if (random == 1) {
                    coyotes[i].col = 240 + coyotes[i].width;
                    coyotes[i].row = rand() % (96 + 1 - 64) + 64;
                    coyotes[i].direction = 'r';
                    coyotes[i].aniState = SPRITERIGHT1;
                } else if (random == 2) {
                    coyotes[i].col = rand() % (124 + 1 - 96) + 96;
                    coyotes[i].row = 0 - coyotes[i].height;
                    coyotes[i].direction = 'u';
                    coyotes[i].aniState = SPRITEUP;
                } else if (random == 3) {
                    coyotes[i].col = rand() % (124 + 1 - 96) + 96;
                    coyotes[i].row = 160 + coyotes[i].height;
                    coyotes[i].direction = 'd';
                    coyotes[i].aniState = SPRITEDOWN;
                }
            }
            break;
        }
    }
}

void updateCarrot(CARROT* c) {
    if (carrotsCollected < 10 && c->active) {
        if (collision(player.col, player.row, player.width, player.height, c->col, c->row, c->width, c->height)) {
            c->active = 0;
            carrotsCollected++;
            playSoundB(collect_data, collect_length - 200, 0);
            if (level == 1) {
                int random = rand() % 2;
                if (random) {
                    c->col = rand() % (88 + 1 - 0) + 0;
                } else {
                    c->col = rand() % ((240 - 16) + 1 - 144) + 144;
                }
                int random2 = rand() % 2;
                if (random2) {
                    c->row = rand() % (48 + 1 - 0) + 0;
                } else {
                    c->row = rand() % ((160 - 16) + 1 - 104) + 104;
                }
            } else if (level == 2) {
                int random = rand() % 2;
                if (random) {
                    c->col = rand() % (80 + 1 - 0) + 0;
                } else {
                    c->col = rand() % ((240 - 16) + 1 - 152) + 152;
                }
                int random2 = rand() % 2;
                if (random2) {
                    c->row = rand() % (48 + 1 - 0) + 0;
                } else {
                    c->row = rand() % ((160 - 16) + 1 - 104) + 104;
                }
            } else if (level == 3) {
                int random = rand() % 2;
                if (random) {
                    c->col = rand() % (80 + 1 - 0) + 0;
                } else {
                    c->col = rand() % ((240 - 16) + 1 - 152) + 152;
                }
                int random2 = rand() % 2;
                if (random2) {
                    c->row = rand() % (40 + 1 - 0) + 0;
                } else {
                    c->row = rand() % ((160 - 16) + 1 - 112) + 112;
                }
            }
        }
    }
}

void spawnCarrot() {
    for (int i = 0; i < 10; i++) {
        if (!carrots[i].active) {
            carrots[i].active = 1;
            break;
        }
    }
}

void updateShoe(SHOE* s) {
    if (shoesCollected < 10 && s->active) {
        if (collision(player.col, player.row, player.width, player.height, s->col, s->row, s->width, s->height)) {
            s->active = 0;
            if (level == 1) {
                int random = rand() % 2;
                if (random) {
                    s->col = rand() % (88 + 1 - 0) + 0;
                } else {
                    s->col = rand() % ((240 - 16) + 1 - 144) + 144;
                }
                int random2 = rand() % 2;
                if (random2) {
                    s->row = rand() % (48 + 1 - 0) + 0;
                } else {
                    s->row = rand() % ((160 - 16) + 1 - 104) + 104;
                }
            } else if (level == 2) {
                int random = rand() % 2;
                if (random) {
                    s->col = rand() % (80 + 1 - 0) + 0;
                } else {
                    s->col = rand() % ((240 - 16) + 1 - 152) + 152;
                }
                int random2 = rand() % 2;
                if (random2) {
                    s->row = rand() % (48 + 1 - 0) + 0;
                } else {
                    s->row = rand() % ((160 - 16) + 1 - 104) + 104;
                }
            } else if (level == 3) {
                int random = rand() % 2;
                if (random) {
                    s->col = rand() % (80 + 1 - 0) + 0;
                } else {
                    s->col = rand() % ((240 - 16) + 1 - 152) + 152;
                }
                int random2 = rand() % 2;
                if (random2) {
                    s->row = rand() % (34 + 1 - 0) + 0;
                } else {
                    s->row = rand() % ((160 - 16) + 1 - 112) + 112;
                }
            }
            shoesCollected++;
            shoesSpawned--;
            playSoundB(collect_data, collect_length - 200, 0);
        }
    }




    if (s->isThrown && !s->active) {
        if (s->direction == 'u') {
            if (s->row >= 0) {
                s->row -= 4;
            } else {
                s->isThrown = 0;
            }
        } else if (s->direction == 'd') {
            if (s->row <= 160) {
                s->row += 4;
            } else {
                s->isThrown = 0;
            }
        } else if (s->direction == 'l') {
            if (s->col >= 0) {
                s->col -= 4;
            } else {
                s->isThrown = 0;
            }
        } else if (s->direction == 'r') {
            if (s->col <= 240) {
                s->col += 4;
            } else {
                s->isThrown = 0;
            }
        }
    }
}

void spawnShoe() {
    for (int i = 0; i < 20; i++) {
        if (shoes[i].active == 0 && shoes[i].isThrown == 0) {
            shoes[i].active = 1;
            shoesSpawned++;
            if (level == 1) {
                int random = rand() % 2;
                if (random) {
                    shoes[i].col = rand() % (88 + 1 - 0) + 0;
                } else {
                    shoes[i].col = rand() % ((240 - 16) + 1 - 144) + 144;
                }
                int random2 = rand() % 2;
                if (random2) {
                    shoes[i].row = rand() % (48 + 1 - 0) + 0;
                } else {
                    shoes[i].row = rand() % ((160 - 16) + 1 - 104) + 104;
                }
            } else if (level == 2) {
                int random = rand() % 2;
                if (random) {
                    shoes[i].col = rand() % (80 + 1 - 0) + 0;
                } else {
                    shoes[i].col = rand() % ((240 - 16) + 1 - 152) + 152;
                }
                int random2 = rand() % 2;
                if (random2) {
                    shoes[i].row = rand() % (48 + 1 - 0) + 0;
                } else {
                    shoes[i].row = rand() % ((160 - 16) + 1 - 104) + 104;
                }
            } else if (level == 3) {
                int random = rand() % 2;
                if (random) {
                    shoes[i].col = rand() % (80 + 1 - 0) + 0;
                } else {
                    shoes[i].col = rand() % ((240 - 16) + 1 - 152) + 152;
                }
                int random2 = rand() % 2;
                if (random2) {
                    shoes[i].row = rand() % (34 + 1 - 0) + 0;
                } else {
                    shoes[i].row = rand() % ((160 - 16) + 1 - 112) + 112;
                }
            }
            break;
        }
    }
}

void throwShoe() {
    for (int i = 0; i < 20; i++) {
        if (!shoes[i].isThrown && !shoes[i].active) {
            shoes[i].col = player.col;
            shoes[i].row = player.row;
            shoes[i].isThrown = 1;
            shoes[i].direction = player.lastButtonPressed;
            shoesCollected--;
            playSoundB(shoeThrow_data, shoeThrow_length - 200, 0);
            break;
        }
    }
}

void updateBunniesText() {

}

void updateCarrotsText() {

}

void updateShoesText() {

}

void updateCountBunnies() {
    if (bunniesToBeFed == 0) {
        countTextBunnies.aniState = ZERO;
    } else if (bunniesToBeFed == 1) {
        countTextBunnies.aniState = ONE;
    } else if (bunniesToBeFed == 2) {
        countTextBunnies.aniState = TWO;
    } else if (bunniesToBeFed == 3) {
        countTextBunnies.aniState = THREE;
    } else if (bunniesToBeFed == 4) {
        countTextBunnies.aniState = FOUR;
    } else if (bunniesToBeFed == 5) {
        countTextBunnies.aniState = FIVE;
    } else if (bunniesToBeFed == 6) {
        countTextBunnies.aniState = SIX;
    } else if (bunniesToBeFed == 7) {
        countTextBunnies.aniState = SEVEN;
    } else if (bunniesToBeFed == 8) {
        countTextBunnies.aniState = EIGHT;
    } else if (bunniesToBeFed == 9) {
        countTextBunnies.aniState = NINE;
    }
}

void updateCountCarrots(){
    if (carrotsCollected == 0) {
        countTextCarrots.aniState = ZERO;
    } else if (carrotsCollected == 1) {
        countTextCarrots.aniState = ONE;
    } else if (carrotsCollected == 2) {
        countTextCarrots.aniState = TWO;
    } else if (carrotsCollected == 3) {
        countTextCarrots.aniState = THREE;
    } else if (carrotsCollected == 4) {
        countTextCarrots.aniState = FOUR;
    } else if (carrotsCollected == 5) {
        countTextCarrots.aniState = FIVE;
    } else if (carrotsCollected == 6) {
        countTextCarrots.aniState = SIX;
    } else if (carrotsCollected == 7) {
        countTextCarrots.aniState = SEVEN;
    } else if (carrotsCollected == 8) {
        countTextCarrots.aniState = EIGHT;
    } else if (carrotsCollected == 9) {
        countTextCarrots.aniState = NINE;
    } else if (carrotsCollected == 10) {
        countTextCarrots.aniState = TEN;
    }
}

void updateCountShoes() {
    if (shoesCollected == 0) {
        countTextShoes.aniState = ZERO;
    } else if (shoesCollected == 1) {
        countTextShoes.aniState = ONE;
    } else if (shoesCollected == 2) {
        countTextShoes.aniState = TWO;
    } else if (shoesCollected == 3) {
        countTextShoes.aniState = THREE;
    } else if (shoesCollected == 4) {
        countTextShoes.aniState = FOUR;
    } else if (shoesCollected == 5) {
        countTextShoes.aniState = FIVE;
    } else if (shoesCollected == 6) {
        countTextShoes.aniState = SIX;
    } else if (shoesCollected == 7) {
        countTextShoes.aniState = SEVEN;
    } else if (shoesCollected == 8) {
        countTextShoes.aniState = EIGHT;
    } else if (shoesCollected == 9) {
        countTextShoes.aniState = NINE;
    } else if (shoesCollected == 10) {
        countTextShoes.aniState = TEN;
    } else if (shoesCollected > 10) {
        countTextShoes.aniState = TEN;
    }
}


void drawPlayer() {
    shadowOAM[0].attr0 = (player.row & 0xFF)| (0<<13) | (0<<14);
    shadowOAM[0].attr1 = (player.col & 0x1FF)| (1<<14);
    shadowOAM[0].attr2 = ((0)<<12) | ((player.curFrame * 2)*32+(player.aniState * 2));
}

void drawBunny(BUNNY* b, int i) {
    if (b->active && !(b->isFull)) {
        shadowOAM[1 + i].attr0 = (b->row & 0xFF) | (0<<13) | (0<<14);
        shadowOAM[1 + i].attr1 = (b->col & 0x1FF) | (1<<14);
        shadowOAM[1 + i].attr2 = ((0)<<12) | ((b->curFrame * 2)*32+((b->aniState * 2) + 8));
    } else {
        shadowOAM[1 + i].attr0 = (2<<8);
    }
}

void drawCoyote(COYOTE* c, int i) {
    if (c->active || c->isRunningAway) {
        shadowOAM[76 + i].attr0 = (c->row & 0xFF) | (0<<13) | (0<<14);
        shadowOAM[76 + i].attr1 = (c->col & 0x1FF) | (1<<14);
        shadowOAM[76 + i].attr2 = ((0)<<12) | ((c->curFrame * 2)*32+((c->aniState * 2) + 10));
    } else {
        shadowOAM[76 + i].attr0 = (2<<8);
    }
}

void drawCarrot(CARROT* c, int i) {
    if (c->active) {
        shadowOAM[20 + i].attr0 = (c->row & 0xFF) | (0<<13) | (0<<14);
        shadowOAM[20 + i].attr1 = (c->col & 0x1FF) | (1<<14);
        shadowOAM[20 + i].attr2 = ((0)<<12) | ((c->curFrame + 16)*32+(c->aniState));
    } else {
        shadowOAM[20 + i].attr0 = (2<<8);
    }
}

void drawShoe(SHOE* s, int i) {
    if (s->active || s->isThrown) {
        shadowOAM[44 + i].attr0 = (s->row & 0xFF) | (0<<13) | (0<<14);
        shadowOAM[44 + i].attr1 = (s->col & 0x1FF) | (1<<14);
        shadowOAM[44 + i].attr2 = ((0)<<12) | ((s->curFrame + 16)*32+(s->aniState + 2));
    } else {
        shadowOAM[44 + i].attr0 = (2<<8);
    }
}

void drawBunniesText() {
    shadowOAM[70].attr0 = bunniesText.row | (0<<13) | (1<<14);
    shadowOAM[70].attr1 = bunniesText.col | (2<<14);
    shadowOAM[70].attr2 = ((0)<<12) | ((bunniesText.curFrame + 20)*32+(bunniesText.aniState));
}

void drawCarrotsText() {
    shadowOAM[71].attr0 = carrotsText.row| (0<<13) | (1<<14);
    shadowOAM[71].attr1 = carrotsText.col | (2<<14);
    shadowOAM[71].attr2 = ((0)<<12) | ((carrotsText.curFrame + 18)*32+(carrotsText.aniState));
}

void drawShoesText() {
    shadowOAM[72].attr0 = shoesText.row| (0<<13) | (1<<14);
    shadowOAM[72].attr1 = shoesText.col | (2<<14);
    shadowOAM[72].attr2 = ((0)<<12) | ((shoesText.curFrame + 22)*32+(shoesText.aniState));
}

void drawCountBunnies() {
    shadowOAM[73].attr0 = countTextBunnies.row | (0<<13) | (0<<14);
    shadowOAM[73].attr1 = countTextBunnies.col | (1<<14);
    shadowOAM[73].attr2 = ((0)<<12) | ((countTextBunnies.curFrame + 24)*32+(countTextBunnies.aniState * 2));
}

void drawCountCarrots() {
    shadowOAM[74].attr0 = countTextCarrots.row | (0<<13) | (0<<14);
    shadowOAM[74].attr1 = countTextCarrots.col | (1<<14);
    shadowOAM[74].attr2 = ((0)<<12) | ((countTextCarrots.curFrame + 24)*32+(countTextCarrots.aniState * 2));
}

void drawCountShoes() {
    shadowOAM[75].attr0 = countTextShoes.row | (0<<13) | (0<<14);
    shadowOAM[75].attr1 = countTextShoes.col | (1<<14);
    shadowOAM[75].attr2 = ((0)<<12) | ((countTextShoes.curFrame + 24)*32+(countTextShoes.aniState * 2));
}
