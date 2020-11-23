
//{{BLOCK(pauseBG)

//======================================================================
//
//	pauseBG, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 374 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 11968 + 4096 = 16576
//
//	Time-stamp: 2020-11-14, 00:05:14
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSEBG_H
#define GRIT_PAUSEBG_H

#define pauseBGTilesLen 11968
extern const unsigned short pauseBGTiles[5984];

#define pauseBGMapLen 4096
extern const unsigned short pauseBGMap[2048];

#define pauseBGPalLen 512
extern const unsigned short pauseBGPal[256];

#endif // GRIT_PAUSEBG_H

//}}BLOCK(pauseBG)
