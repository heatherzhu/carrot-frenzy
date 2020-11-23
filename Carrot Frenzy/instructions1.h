
//{{BLOCK(instructions1)

//======================================================================
//
//	instructions1, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 600 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 38400 + 2048 = 40960
//
//	Time-stamp: 2020-11-13, 16:04:35
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONS1_H
#define GRIT_INSTRUCTIONS1_H

#define instructions1TilesLen 38400
extern const unsigned short instructions1Tiles[19200];

#define instructions1MapLen 2048
extern const unsigned short instructions1Map[1024];

#define instructions1PalLen 512
extern const unsigned short instructions1Pal[256];

#endif // GRIT_INSTRUCTIONS1_H

//}}BLOCK(instructions1)
