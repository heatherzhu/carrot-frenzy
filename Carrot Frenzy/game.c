#include "game.h"
#include "myLib.h"
#include "sound.h"
#include "player.h"
#include "spritesheet.h"
#include "gameBGLevel1_collision.h"
#include "gameBGLevel2_collision.h"
#include "gameBGLevel3_collision.h"
#include "winSong.h"
#include "loseSong.h"
#include "collect.h"
#include "feedBunny.h"
#include "shoeThrow.h"
#include "shoeImpact.h"

PLAYER player;
BUNNY bunnies[BUNNYCOUNT];
COYOTE coyotes[COYOTECOUNT];
CARROT carrots[CARROTCOUNT];
BUNNIESTEXT bunniesText;
CARROTSTEXT carrotsText;
SHOESTEXT shoesText;
COUNTTEXTBUNNIES countTextBunnies;
COUNTTEXTCARROTS countTextCarrots;
COUNTTEXTSHOES countTextShoes;

//player
enum {SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};
//Coyote
enum {SPRITEUP, SPRITEDOWN, SPRITELEFT1, SPRITERIGHT1};
//Numbers
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

    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    hideSprites();

    REG_DISPCTL = MODE0 | SPRITE_ENABLE | BG0_ENABLE;

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

    for (int i = 0; i < COYOTECOUNT; i++) {
        updateCoyote(&coyotes[i]);
    }

    for (int i = 0; i < CARROTCOUNT; i++) {
        updateCarrot(&carrots[i]);
    }

    for (int i = 0; i < SHOECOUNT; i++) {
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

    //Spawn a coyote into the game
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

    DMANow(3, shadowOAM, OAM, 512);
}

void drawGame() {
    drawPlayer();

    for (int i = 0; i < bunniesNum; i++) {
        drawBunny(&bunnies[i], i);
    }

    for (int i = 0; i < COYOTECOUNT; i++) {
        drawCoyote(&coyotes[i], i);
    }

    for (int i = 0; i < CARROTCOUNT; i++) {
        drawCarrot(&carrots[i], i);
    }

    for (int i = 0; i < SHOECOUNT; i++) {
        drawShoe(&shoes[i], i);
    }

    drawBunniesText();
    drawCarrotsText();
    drawShoesText();
    drawCountBunnies();
    drawCountCarrots();
    drawCountShoes();

    DMANow(3, shadowOAM, OAM, 512);
}


//initialize functions
void initializePlayer() {
    player.col = SCREENWIDTH / 2;
    player.row = SCREENHEIGHT / 2 - 50;
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
        if (level == 1) { //4 bunnies
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
    for (int i = 0; i < COYOTECOUNT; i++) {
        coyotes[i].width = 16;
        coyotes[i].height = 16;
        if (level == 1) { //Coyotes only come from the left
            coyotes[i].col = 0 - coyotes[i].width;
            coyotes[i].row = rand() % (96 + 1 - 64) + 64;
            coyotes[i].direction = 'l';
            coyotes[i].aniState = SPRITELEFT1;
        } else if (level == 2) { //Coyotes come from left and right
            int random;
            random = rand() % 2;
            if (random == 0) { //Left
                coyotes[i].col = 0 - coyotes[i].width;
                coyotes[i].row = rand() % (96 + 1 - 64) + 64;
                coyotes[i].direction = 'l';
                coyotes[i].aniState = SPRITELEFT1;
            } else if (random == 1) { //Right
                coyotes[i].col = SCREENWIDTH + coyotes[i].width;
                coyotes[i].row = rand() % (96 + 1 - 64) + 64;
                coyotes[i].direction = 'r';
                coyotes[i].aniState = SPRITERIGHT1;
            }
        } else if (level == 3) {
            int random;
            random = rand() % 4;
            if (random == 0) { //Left
                coyotes[i].col = 0 - coyotes[i].width;
                coyotes[i].row = rand() % (96 + 1 - 64) + 64;
                coyotes[i].direction = 'l';
                coyotes[i].aniState = SPRITELEFT1;
            } else if (random == 1) { //Right
                coyotes[i].col = SCREENWIDTH + coyotes[i].width;
                coyotes[i].row = rand() % (96 + 1 - 64) + 64;
                coyotes[i].direction = 'r';
                coyotes[i].aniState = SPRITERIGHT1;
            } else if (random == 2) { //Top
                coyotes[i].col = rand() % (124 + 1 - 96) + 96;
                coyotes[i].row = 0 - coyotes[i].height;
                coyotes[i].direction = 'u';
                coyotes[i].aniState = SPRITEUP;
            } else if (random == 3) {
                coyotes[i].col = rand() % (124 + 1 - 96) + 96;
                coyotes[i].row = SCREENHEIGHT + coyotes[i].height;
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
    for (int i = 0; i < CARROTCOUNT; i++) {
        if (level == 1) {
            int random = rand() % 2;
            if (random) {
                carrots[i].col = rand() % (88 + 1 - 0) + 0;
            } else {
                carrots[i].col = rand() % ((SCREENWIDTH - 16) + 1 - 144) + 144;
            }
            int random2 = rand() % 2; 
            if (random2) {
                carrots[i].row = rand() % (48 + 1 - 0) + 0;
            } else {
                carrots[i].row = rand() % ((SCREENHEIGHT - 16) + 1 - 104) + 104;
            }
        } else if (level == 2) {
            int random = rand() % 2;
            if (random) {
                carrots[i].col = rand() % (80 + 1 - 0) + 0;
            } else {
                carrots[i].col = rand() % ((SCREENWIDTH - 16) + 1 - 152) + 152;
            }
            int random2 = rand() % 2; 
            if (random2) {
                carrots[i].row = rand() % (48 + 1 - 0) + 0;
            } else {
                carrots[i].row = rand() % ((SCREENHEIGHT - 16) + 1 - 104) + 104;
            }
        } else if (level == 3) {
            int random = rand() % 2;
            if (random) {
                carrots[i].col = rand() % (80 + 1 - 0) + 0;
            } else {
                carrots[i].col = rand() % ((SCREENWIDTH - 16) + 1 - 152) + 152;
            }
            int random2 = rand() % 2; 
            if (random2) {
                carrots[i].row = rand() % (40 + 1 - 0) + 0;
            } else {
                carrots[i].row = rand() % ((SCREENHEIGHT - 16) + 1 - 112) + 112;
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
    for (int i = 0; i < SHOECOUNT; i++) {
        if (level == 1) {
            int random = rand() % 2;
            if (random) {
                shoes[i].col = rand() % (88 + 1 - 0) + 0;
            } else {
                shoes[i].col = rand() % ((SCREENWIDTH - 16) + 1 - 144) + 144;
            }
            int random2 = rand() % 2; 
            if (random2) {
                shoes[i].row = rand() % (48 + 1 - 0) + 0;
            } else {
                shoes[i].row = rand() % ((SCREENHEIGHT - 16) + 1 - 104) + 104;
            }
        } else if (level == 2) {
            int random = rand() % 2;
            if (random) {
                shoes[i].col = rand() % (80 + 1 - 0) + 0;
            } else {
                shoes[i].col = rand() % ((SCREENWIDTH - 16) + 1 - 152) + 152;
            }
            int random2 = rand() % 2; 
            if (random2) {
                shoes[i].row = rand() % (48 + 1 - 0) + 0;
            } else {
                shoes[i].row = rand() % ((SCREENHEIGHT - 16) + 1 - 104) + 104;
            }
        } else if (level == 3) {
            int random = rand() % 2;
            if (random) {
                shoes[i].col = rand() % (80 + 1 - 0) + 0;
            } else {
                shoes[i].col = rand() % ((SCREENWIDTH - 16) + 1 - 152) + 152;
            }
            int random2 = rand() % 2; 
            if (random2) {
                shoes[i].row = rand() % (34 + 1 - 0) + 0;
            } else {
                shoes[i].row = rand() % ((SCREENHEIGHT - 16) + 1 - 112) + 112;
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
    carrotsText.col = SCREENWIDTH - 50;
    carrotsText.row = 5;
    carrotsText.width = 32;
    carrotsText.height = 16;
    carrotsText.aniState = SPRITEFRONT;
    carrotsText.curFrame = 0;
    carrotsText.numFrames = 0;
}

void initializeShoesText() {
    shoesText.col = SCREENWIDTH - 50;
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


//update functions
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

    if (BUTTON_HELD(BUTTON_UP)) {
        player.aniState = SPRITEFRONT;
        if (level == 1) {
            //collision mapping
            if (gameBGLevel1_collisionBitmap[OFFSET(player.col, player.row, SCREENWIDTH)] && gameBGLevel1_collisionBitmap[OFFSET(player.col + player.width - 1, player.row - 1, SCREENWIDTH)]) {
                player.row--;
            }
        } else if (level == 2) {
            if (gameBGLevel2_collisionBitmap[OFFSET(player.col, player.row, SCREENWIDTH)] && gameBGLevel2_collisionBitmap[OFFSET(player.col + player.width - 1, player.row - 1, SCREENWIDTH)]) {
                player.row--;
            }
        } else if (level == 3) {
            if (gameBGLevel3_collisionBitmap[OFFSET(player.col, player.row, SCREENWIDTH)] && gameBGLevel3_collisionBitmap[OFFSET(player.col + player.width - 1, player.row - 1, SCREENWIDTH)]) {
                player.row--;
            }
        }
        player.lastButtonPressed = 'u';
    } else if (BUTTON_HELD(BUTTON_DOWN)) {
        player.aniState = SPRITEBACK;
        if (level == 1) {
            if (gameBGLevel1_collisionBitmap[OFFSET(player.col, player.row + player.height, SCREENWIDTH)] && gameBGLevel1_collisionBitmap[OFFSET(player.col + player.width - 1, player.row + player.height - 1, SCREENWIDTH)]) {
                player.row++;
            }
        } else if (level == 2) {
            if (gameBGLevel2_collisionBitmap[OFFSET(player.col, player.row + player.height, SCREENWIDTH)] && gameBGLevel2_collisionBitmap[OFFSET(player.col + player.width - 1, player.row + player.height - 1, SCREENWIDTH)]) {
                player.row++;
            }
        } else if (level == 3) {
            if (gameBGLevel3_collisionBitmap[OFFSET(player.col, player.row + player.height, SCREENWIDTH)] && gameBGLevel3_collisionBitmap[OFFSET(player.col + player.width - 1, player.row + player.height - 1, SCREENWIDTH)]) {
                player.row++;
            }
        }
        player.lastButtonPressed = 'd';
    } else if (BUTTON_HELD(BUTTON_RIGHT)) {
        player.aniState = SPRITERIGHT;
        if (level == 1) {
            if (gameBGLevel1_collisionBitmap[OFFSET(player.col + player.width, player.row, SCREENWIDTH)] && gameBGLevel1_collisionBitmap[OFFSET(player.col + player.width - 1, player.row + player.height - 1, SCREENWIDTH)]) {
                player.col++;
            }
        } else if (level == 2) {
            if (gameBGLevel2_collisionBitmap[OFFSET(player.col + player.width, player.row, SCREENWIDTH)] && gameBGLevel2_collisionBitmap[OFFSET(player.col + player.width - 1, player.row + player.height - 1, SCREENWIDTH)]) {
                player.col++;
            }
        } else if (level == 3) {
            if (gameBGLevel3_collisionBitmap[OFFSET(player.col + player.width, player.row, SCREENWIDTH)] && gameBGLevel3_collisionBitmap[OFFSET(player.col + player.width - 1, player.row + player.height - 1, SCREENWIDTH)]) {
                player.col++;
            }
        }
        player.lastButtonPressed = 'r';
    } else if (BUTTON_HELD(BUTTON_LEFT)) {
        player.aniState = SPRITELEFT;
        if (level == 1) {
            if (gameBGLevel1_collisionBitmap[OFFSET(player.col - 1, player.row, SCREENWIDTH)] && gameBGLevel1_collisionBitmap[OFFSET(player.col - 1, player.row + player.height - 1, SCREENWIDTH)]) {
                player.col--;
            }
        } else if (level == 2) {
            if (gameBGLevel2_collisionBitmap[OFFSET(player.col - 1, player.row, SCREENWIDTH)] && gameBGLevel2_collisionBitmap[OFFSET(player.col - 1, player.row + player.height - 1, SCREENWIDTH)]) {
                player.col--;
            }
        } else if (level == 3) {
            if (gameBGLevel3_collisionBitmap[OFFSET(player.col - 1, player.row, SCREENWIDTH)] && gameBGLevel3_collisionBitmap[OFFSET(player.col - 1, player.row + player.height - 1, SCREENWIDTH)]) {
                player.col--;
            }
        }
        player.lastButtonPressed = 'l';
    }

    //throw shoe
    if (BUTTON_PRESSED(BUTTON_A)) {
        if (shoesCollected > 0) {
            throwShoe();
        }
    }

    //CHEAT: Gain 1000 shoes.
    if (BUTTON_PRESSED(BUTTON_R)) {
        cheatOn = 1;
        shoesCollected = 1000;
    }

    if (player.aniState == SPRITEIDLE) {
        player.curFrame = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }

    //collides with the 240x160 background
    if (player.col < 0) {
        player.col = 0;
    } else if (player.col + player.width > SCREENWIDTH) {
        player.col = SCREENWIDTH - player.width;
    }
    if (player.row < 0) {
        player.row = 0;
    } else if (player.row + player.height > SCREENHEIGHT) {
        player.row = SCREENHEIGHT - player.height;
    }

    //Feed the bunnies
    if (level == 1) {
        if (collision(player.col, player.row, player.width, player.height, 100, 60, 40, 40)) {
            if (BUTTON_PRESSED(BUTTON_B)) {
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
            if (BUTTON_PRESSED(BUTTON_B)) {
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
            if (BUTTON_PRESSED(BUTTON_B)) {
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
    //Level 1: Coyote only comes from the left
    //Level 2: Coyote comes from the left and right
    //Level 3: Coyote comes from all sides
    if (c->active) {
        //if the player collides with the coyote, then go to lose state
        if (collision(c->col, c->row, c->width, c->height, player.col, player.row, player.width, player.height)) {
            stopSound();
            playSoundA(loseSong_data, loseSong_length - 200, 1);
            goToLose();
        }

        //if the coyote collides with the bunny pen, then go to lose state
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

        //if the coyote gets hit with a shoe, it runs away
        for (int i = 0; i < SHOECOUNT; i++) {
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
    //coyote runs in the opposite direction
    if (level == 1) {
        if (c->isRunningAway) { //Left
            c->aniState = SPRITERIGHT1;
            c->col -= c->cdel * 2;
            if (c->col + c->width <= 0) {
                c->isRunningAway = 0;
            }
        }
    } else if (level == 2) {
        if (c->direction == 'l') {
            if (c->isRunningAway) { //Left
                c->aniState = SPRITERIGHT1;
                c->col -= c->cdel * 2;
                if (c->col + c->width <= 0) {
                    c->isRunningAway = 0;
                }
            }
        } else if (c->direction == 'r') {
            if (c->isRunningAway) { //Right
                c->aniState = SPRITELEFT1;
                c->col += c->cdel * 2;
                if (c->col >= SCREENWIDTH) {
                    c->isRunningAway = 0;
                }
            }
        }
    } else if (level == 3) {
        if (c->direction == 'l') {
            if (c->isRunningAway) { //Left
                c->aniState = SPRITERIGHT1;
                c->col -= c->cdel * 2;
                if (c->col + c->width <= 0) {
                    c->isRunningAway = 0;
                }
            }
        } else if (c->direction == 'r') {
            if (c->isRunningAway) { //Right
                c->aniState = SPRITELEFT1;
                c->col += c->cdel * 2;
                if (c->col >= SCREENWIDTH) {
                    c->isRunningAway = 0;
                }
            }
        } else if (c->direction == 'u') {
            if (c->isRunningAway) { //Top
                c->aniState = SPRITEDOWN;
                c->row -= c->rdel * 2;
                if (c->row + c->height <= 0) {
                    c->isRunningAway = 0;
                }
            }
        } else if (c->direction == 'd') {
            if (c->isRunningAway) { //Bot
                c->aniState = SPRITEUP;
                c->row += c->rdel * 2;
                if (c->row >= SCREENHEIGHT) {
                    c->isRunningAway = 0;
                }
            }
        }
    }

    //animate the coyote
    if (c->aniCounter % 10 == 0) {
        c->curFrame++;
        if (c->curFrame > c->numFrames - 1) {
            c->curFrame = 0;
        }
    }
    c->aniCounter++;
}

void spawnCoyote() {
    for (int i = 0; i < COYOTECOUNT; i++) {
        if (!coyotes[i].active) {
            coyotes[i].active = 1;
            if (level == 1) { //Coyotes only come from the left
                coyotes[i].col = 0 - coyotes[i].width;
                coyotes[i].row = rand() % (96 + 1 - 64) + 64;
                coyotes[i].direction = 'l';
                coyotes[i].aniState = SPRITELEFT1;
            } else if (level == 2) { //Coyotes come from left and right
                int random;
                random = rand() % 2;
                if (random == 0) { //Left
                    coyotes[i].col = 0 - coyotes[i].width;
                    coyotes[i].row = rand() % (96 + 1 - 64) + 64;
                    coyotes[i].direction = 'l';
                    coyotes[i].aniState = SPRITELEFT1;
                } else if (random == 1) { //Right
                    coyotes[i].col = SCREENWIDTH + coyotes[i].width;
                    coyotes[i].row = rand() % (96 + 1 - 64) + 64;
                    coyotes[i].direction = 'r';
                    coyotes[i].aniState = SPRITERIGHT1;
                }
            } else if (level == 3) {
                int random;
                random = rand() % 4;
                if (random == 0) { //Left
                    coyotes[i].col = 0 - coyotes[i].width;
                    coyotes[i].row = rand() % (96 + 1 - 64) + 64;
                    coyotes[i].direction = 'l';
                    coyotes[i].aniState = SPRITELEFT1;
                } else if (random == 1) { //Right
                    coyotes[i].col = SCREENWIDTH + coyotes[i].width;
                    coyotes[i].row = rand() % (96 + 1 - 64) + 64;
                    coyotes[i].direction = 'r';
                    coyotes[i].aniState = SPRITERIGHT1;
                } else if (random == 2) { //Top
                    coyotes[i].col = rand() % (124 + 1 - 96) + 96;
                    coyotes[i].row = 0 - coyotes[i].height;
                    coyotes[i].direction = 'u';
                    coyotes[i].aniState = SPRITEUP;
                } else if (random == 3) {
                    coyotes[i].col = rand() % (124 + 1 - 96) + 96;
                    coyotes[i].row = SCREENHEIGHT + coyotes[i].height;
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
                    c->col = rand() % ((SCREENWIDTH - 16) + 1 - 144) + 144;
                }
                int random2 = rand() % 2; 
                if (random2) {
                    c->row = rand() % (48 + 1 - 0) + 0;
                } else {
                    c->row = rand() % ((SCREENHEIGHT - 16) + 1 - 104) + 104;
                }
            } else if (level == 2) {
                int random = rand() % 2;
                if (random) {
                    c->col = rand() % (80 + 1 - 0) + 0;
                } else {
                    c->col = rand() % ((SCREENWIDTH - 16) + 1 - 152) + 152;
                }
                int random2 = rand() % 2; 
                if (random2) {
                    c->row = rand() % (48 + 1 - 0) + 0;
                } else {
                    c->row = rand() % ((SCREENHEIGHT - 16) + 1 - 104) + 104;
                }
            } else if (level == 3) {
                int random = rand() % 2;
                if (random) {
                    c->col = rand() % (80 + 1 - 0) + 0;
                } else {
                    c->col = rand() % ((SCREENWIDTH - 16) + 1 - 152) + 152;
                }
                int random2 = rand() % 2; 
                if (random2) {
                    c->row = rand() % (40 + 1 - 0) + 0;
                } else {
                    c->row = rand() % ((SCREENHEIGHT - 16) + 1 - 112) + 112;
                }
            }
        }
    }
}

void spawnCarrot() {
    for (int i = 0; i < CARROTCOUNT; i++) {
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
                    s->col = rand() % ((SCREENWIDTH - 16) + 1 - 144) + 144;
                }
                int random2 = rand() % 2; 
                if (random2) {
                    s->row = rand() % (48 + 1 - 0) + 0;
                } else {
                    s->row = rand() % ((SCREENHEIGHT - 16) + 1 - 104) + 104;
                }
            } else if (level == 2) {
                int random = rand() % 2;
                if (random) {
                    s->col = rand() % (80 + 1 - 0) + 0;
                } else {
                    s->col = rand() % ((SCREENWIDTH - 16) + 1 - 152) + 152;
                }
                int random2 = rand() % 2; 
                if (random2) {
                    s->row = rand() % (48 + 1 - 0) + 0;
                } else {
                    s->row = rand() % ((SCREENHEIGHT - 16) + 1 - 104) + 104;
                }
            } else if (level == 3) {
                int random = rand() % 2;
                if (random) {
                    s->col = rand() % (80 + 1 - 0) + 0;
                } else {
                    s->col = rand() % ((SCREENWIDTH - 16) + 1 - 152) + 152;
                }
                int random2 = rand() % 2; 
                if (random2) {
                    s->row = rand() % (34 + 1 - 0) + 0;
                } else {
                    s->row = rand() % ((SCREENHEIGHT - 16) + 1 - 112) + 112;
                }
            }
            shoesCollected++;
            shoesSpawned--;
            playSoundB(collect_data, collect_length - 200, 0);
        }
    }
    
    //shoe moves in the direction of the player's direction when thrown
    //BUG: Can't get the shoe to be thrown beyond the screen when being thrown up and left
    //Doesn't work when I add height to the row when checking if it has reached the edge of the screen
    if (s->isThrown && !s->active) {
        if (s->direction == 'u') {
            if (s->row >= 0) {
                s->row -= 4;
            } else {
                s->isThrown = 0;
            }
        } else if (s->direction == 'd') {
            if (s->row <= SCREENHEIGHT) {
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
            if (s->col <= SCREENWIDTH) {
                s->col += 4;
            } else {
                s->isThrown = 0;
            }
        }
    }
}

void spawnShoe() {
    for (int i = 0; i < SHOECOUNT; i++) {
        if (shoes[i].active == 0 && shoes[i].isThrown == 0) {
            shoes[i].active = 1;
            shoesSpawned++;
            if (level == 1) {
                int random = rand() % 2;
                if (random) {
                    shoes[i].col = rand() % (88 + 1 - 0) + 0;
                } else {
                    shoes[i].col = rand() % ((SCREENWIDTH - 16) + 1 - 144) + 144;
                }
                int random2 = rand() % 2; 
                if (random2) {
                    shoes[i].row = rand() % (48 + 1 - 0) + 0;
                } else {
                    shoes[i].row = rand() % ((SCREENHEIGHT - 16) + 1 - 104) + 104;
                }
            } else if (level == 2) {
                int random = rand() % 2;
                if (random) {
                    shoes[i].col = rand() % (80 + 1 - 0) + 0;
                } else {
                    shoes[i].col = rand() % ((SCREENWIDTH - 16) + 1 - 152) + 152;
                }
                int random2 = rand() % 2; 
                if (random2) {
                    shoes[i].row = rand() % (48 + 1 - 0) + 0;
                } else {
                    shoes[i].row = rand() % ((SCREENHEIGHT - 16) + 1 - 104) + 104;
                }
            } else if (level == 3) {
                int random = rand() % 2;
                if (random) {
                    shoes[i].col = rand() % (80 + 1 - 0) + 0;
                } else {
                    shoes[i].col = rand() % ((SCREENWIDTH - 16) + 1 - 152) + 152;
                }
                int random2 = rand() % 2; 
                if (random2) {
                    shoes[i].row = rand() % (34 + 1 - 0) + 0;
                } else {
                    shoes[i].row = rand() % ((SCREENHEIGHT - 16) + 1 - 112) + 112;
                }
            }
            break;
        }
    }
}

void throwShoe() {
    for (int i = 0; i < SHOECOUNT; i++) {
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

//draw functions
void drawPlayer() {
    shadowOAM[0].attr0 = (player.row & ROWMASK)| ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (player.col & COLMASK)| ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniState * 2, player.curFrame * 2);
}

void drawBunny(BUNNY* b, int i) {
    if (b->active && !(b->isFull)) {
        shadowOAM[1 + i].attr0 = (b->row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[1 + i].attr1 = (b->col & COLMASK) | ATTR1_SMALL;
        shadowOAM[1 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((b->aniState * 2) + 8, b->curFrame * 2);
    } else {
        shadowOAM[1 + i].attr0 = ATTR0_HIDE; //If bunny is not active, hide it
    }
}

void drawCoyote(COYOTE* c, int i) {
    if (c->active || c->isRunningAway) {
        shadowOAM[76 + i].attr0 = (c->row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[76 + i].attr1 = (c->col & COLMASK) | ATTR1_SMALL;
        shadowOAM[76 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((c->aniState * 2) + 10, c->curFrame * 2);
    } else {
        shadowOAM[76 + i].attr0 = ATTR0_HIDE; //If coyote is not active, hide it
    }
}

void drawCarrot(CARROT* c, int i) {
    if (c->active) {
        shadowOAM[20 + i].attr0 = (c->row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[20 + i].attr1 = (c->col & COLMASK) | ATTR1_SMALL;
        shadowOAM[20 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(c->aniState, c->curFrame + 16);
    } else {
        shadowOAM[20 + i].attr0 = ATTR0_HIDE; //If carrot is not active, hid it.
    }
}

void drawShoe(SHOE* s, int i) {
    if (s->active || s->isThrown) {
        shadowOAM[44 + i].attr0 = (s->row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[44 + i].attr1 = (s->col & COLMASK) | ATTR1_SMALL;
        shadowOAM[44 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(s->aniState + 2, s->curFrame + 16);
    } else {
        shadowOAM[44 + i].attr0 = ATTR0_HIDE; //If shoe is not active, hide it
    }
}

void drawBunniesText() {
    shadowOAM[70].attr0 = bunniesText.row | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[70].attr1 = bunniesText.col | ATTR1_MEDIUM;
    shadowOAM[70].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(bunniesText.aniState, bunniesText.curFrame + 20);
}

void drawCarrotsText() {
    shadowOAM[71].attr0 = carrotsText.row| ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[71].attr1 = carrotsText.col | ATTR1_MEDIUM;
    shadowOAM[71].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(carrotsText.aniState, carrotsText.curFrame + 18);
}

void drawShoesText() {
    shadowOAM[72].attr0 = shoesText.row| ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[72].attr1 = shoesText.col | ATTR1_MEDIUM;
    shadowOAM[72].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(shoesText.aniState, shoesText.curFrame + 22);
}

void drawCountBunnies() {
    shadowOAM[73].attr0 = countTextBunnies.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[73].attr1 = countTextBunnies.col | ATTR1_SMALL;
    shadowOAM[73].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(countTextBunnies.aniState * 2, countTextBunnies.curFrame + 24);
}

void drawCountCarrots() {
    shadowOAM[74].attr0 = countTextCarrots.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[74].attr1 = countTextCarrots.col | ATTR1_SMALL;
    shadowOAM[74].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(countTextCarrots.aniState * 2, countTextCarrots.curFrame + 24);
}

void drawCountShoes() {
    shadowOAM[75].attr0 = countTextShoes.row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[75].attr1 = countTextShoes.col | ATTR1_SMALL;
    shadowOAM[75].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(countTextShoes.aniState * 2, countTextShoes.curFrame + 24);
}