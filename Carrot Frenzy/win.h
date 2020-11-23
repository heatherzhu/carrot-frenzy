
//{{BLOCK(win)

//======================================================================
//
//	win, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 484 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 30976 + 2048 = 33536
//
//	Time-stamp: 2020-11-14, 13:10:28
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WIN_H
#define GRIT_WIN_H

#define winTilesLen 30976
extern const unsigned short winTiles[15488];

#define winMapLen 2048
extern const unsigned short winMap[1024];

#define winPalLen 512
extern const unsigned short winPal[256];

#endif // GRIT_WIN_H

//}}BLOCK(win)
