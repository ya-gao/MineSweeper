// SEASHELL_READONLY

#ifndef GAME_CORE_H
#define GAME_CORE_H

#include <stdbool.h>

/*
 * UNKNOWN represents a square that the player has neither marked nor stepped on
 */
extern const int UNKNOWN;

/*
 * MARKED represents a square that the player has marked
 */
extern const int MARKED;

/*
 * MINE represents a square that contains a mine
 */
extern const int MINE;

/*
 * map points to the first field of the Minesweeper board. The board is stored
 *   as a (flat) 1D-array with width * height elements. Squares are stored in
 *   the following order (column,row):
 * [0,0], [1,0], [2,0], ..., [width-1,0], [0,1], [1,1], ..., [width-1,height-1]
 */
extern int *map;

/*
 * mine_at(c, r) returns true if there is a mine at ([c]olumn,[r]ow), and false
 *   otherwise. The function also returns false if ([c],[r]) is outside of the
 *   board.
 */
bool mine_at(const int c, const int r);

/*
 * all_marked() returns true if all squares with mines are marked and all
 *   marked squares contain mines, and false otherwise.
 */
bool all_marked(void);

/*
 * init(w, h) creates a randomly generated board as well as an empty map, both
 *   with given [w]idth and [h]eight. All squares in map are initizlized to
 *   UNKNOWN.
 */
void init(const int w, const int h);

/*
 * init_d(w, h, seed) creates a randomly generated board as well as an empty
 *   map, both with given [w]idth and [h]eight. All squares in map are
 *   initizlized to UNKNOWN. Using the same parameters [w], [h], and [seed]
 *   guarantees creation of the same board.
 */
void init_d(const int w, const int h, const int seed);

/*
 * shutdown() removes the board and the map from memory.
 */
void shutdown(void);

#endif // GAME_CORE_H