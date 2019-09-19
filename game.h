//SEASHELL_READONLY

#ifndef GAME_H
#define GAME_H

#include <stdbool.h>
#include "game_core.h"

/*
 * step(c, r, width, heigth) reveales the content of a square with the
 *   coordinates ([c]olumn,[r]ow). The function returns false if the square does
 *   not contain a mine or if ([c],[r]) has been stepped on before.
 * effects: sets map at ([c],[r]) accordingly.
 */
bool step(const int c, const int r, const int width, const int height);

/*
 * step_adv(c, r, width, heigth) reveales the content of a square with
 *   the coordinates ([c]olumn,[r]ow). If the revealed square is not next to a
 *   mine, it reveales also all adjacent fields. The function returns false if
 *   the square does not contain a mine or if ([c],[r]) has been stepped on
 *   before.
 * effects: sets map at ([c],[r]) accordingly.
 */
bool step_adv(const int c, const int r, const int width, const int height);

/*
 * mark(c, r, width, heigth) marks or unmarks the square with coordinates
 *   ([c]olumn,[r]ow), i.e., it signals weather this square contains a mine or
 *   not. The function returns true if all squares with mines are marked and
 *   all marked squares contain mines, and false otherwise.
 * effects: sets map at ([c],[r]) accordingly.
 */
bool mark(const int c, const int r, const int width, const int height);

/*
 * print(width, height) prints the current map to the console. Unexplored
 *   squares are represented by '_ ', marked squares by 'P ', and mines by 'X '.
 * effects: writes to the console
 */
void print(const int width, const int height);

#endif // GAME_H