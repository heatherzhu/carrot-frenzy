
//{{BLOCK(menu)

//======================================================================
//
//	menu, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 527 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 33728 + 2048 = 36288
//
//	Time-stamp: 2020-11-13, 13:58:10
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MENU_H
#define GRIT_MENU_H

#define menuTilesLen 33728
extern const unsigned short menuTiles[16864];

#define menuMapLen 2048
extern const unsigned short menuMap[1024];

#define menuPalLen 512
extern const unsigned short menuPal[256];

#endif // GRIT_MENU_H

//}}BLOCK(menu)
