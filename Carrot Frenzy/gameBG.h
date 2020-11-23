
//{{BLOCK(gameBG)

//======================================================================
//
//	gameBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 66 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2112 + 2048 = 4672
//
//	Time-stamp: 2020-11-03, 14:56:50
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBG_H
#define GRIT_GAMEBG_H

#define gameBGTilesLen 2112
extern const unsigned short gameBGTiles[1056];

#define gameBGMapLen 2048
extern const unsigned short gameBGMap[1024];

#define gameBGPalLen 512
extern const unsigned short gameBGPal[256];

#endif // GRIT_GAMEBG_H

//}}BLOCK(gameBG)
