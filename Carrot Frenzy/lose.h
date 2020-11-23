
//{{BLOCK(lose)

//======================================================================
//
//	lose, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 580 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 37120 + 2048 = 39680
//
//	Time-stamp: 2020-11-13, 12:03:15
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSE_H
#define GRIT_LOSE_H

#define loseTilesLen 37120
extern const unsigned short loseTiles[18560];

#define loseMapLen 2048
extern const unsigned short loseMap[1024];

#define losePalLen 512
extern const unsigned short losePal[256];

#endif // GRIT_LOSE_H

//}}BLOCK(lose)
