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

#define BUNNYCOUNT 9
#define COYOTECOUNT 8
#define CARROTCOUNT 10
#define SHOECOUNT 20

PLAYER player;
BUNNY bunnies[BUNNYCOUNT];
COYOTE coyotes[COYOTECOUNT];
CARROT carrots[CARROTCOUNT];
SHOE shoes[SHOECOUNT];
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