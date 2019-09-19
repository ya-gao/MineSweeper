/////////////////////////////////////////////////////////////////////////////
// INTEGRITY INSTRUCTIONS

// Explicitly state the level of collaboration on this question
// Examples:
//   * I discussed ideas with classmate(s) [include name(s)]
//   * I worked together with classmate(s) in the lab [include name(s)]
//   * Classmate [include name] helped me debug my code
//   * I consulted website [include url]
//   * None
// A "None" indicates you completed this question entirely by yourself
// (or with assistance from course staff)
/////////////////////////////////////////////////////////////////////////////
// INTEGRITY STATEMENT:
// I received help from the following sources:



// Name: Ya Gao
// login ID: y347gao
/////////////////////////////////////////////////////////////////////////////

#include <stdbool.h>
#include <stdio.h>
#include "game_core.h"

// see header file for details
bool step(const int c, const int r, const int width, const int height) {
  map = map + r * width + c;
  if (*map != UNKNOWN) { // if has been stepped on before
    map = map - r * width - c;
    return false;
  } else if (mine_at(c, r)) { // if it is a mine, mark as MINE
    *map = MINE;
    map = map - r * width - c;
    return true;
  } else { // if it is safe, check surroundings
    int count = 0;
    if (mine_at(c - 1, r - 1)) {
      ++count;
    }
    if (mine_at(c, r - 1)) {
      ++count;
    }
    if (mine_at(c + 1, r - 1)) {
      ++count;
    }
    if (mine_at(c - 1, r)) {
      ++count;
    }
    if (mine_at(c + 1, r)) {
      ++count;
    }
    if (mine_at(c - 1, r + 1)) {
      ++count;
    }
    if (mine_at(c, r + 1)) {
      ++count;
    }
    if (mine_at(c + 1, r + 1)) {
      ++count;
    }
    *map = count;
    map = map - r * width - c;
    return false;
  }
}

static bool valid_coordinate(const int c, const int r, 
                             const int width, const int height){
  if (c >= 0 && c < width && r >= 0 && r < height) {
    return true;
  } else {
    return false;
  }
}

// see header file for details
bool step_adv(const int c, const int r, const int width, const int height) {
  map = map + r * width + c;
  if (*map != UNKNOWN) { // if it has been stepped on before
    map = map - r * width - c;
    return false;
  } else if (mine_at(c, r)) { // if it is a mine, set as MINE
    *map = MINE;
    map = map - r * width - c;
    return true;
  } else { // if it is safe, check surroundings
    int count = 0;
    if (mine_at(c - 1, r - 1)) {
      ++count;
    }
    if (mine_at(c, r - 1)) {
      ++count;
    }
    if (mine_at(c + 1, r - 1)) {
      ++count;
    }
    if (mine_at(c - 1, r)) {
      ++count;
    }
    if (mine_at(c + 1, r)) {
      ++count;
    }
    if (mine_at(c - 1, r + 1)) {
      ++count;
    }
    if (mine_at(c, r + 1)) {
      ++count;
    }
    if (mine_at(c + 1, r + 1)) {
      ++count;
    }
    *map = count;
    map = map - r * width - c;
    if (count == 0) {
      if (valid_coordinate(c - 1, r - 1, width, height)) {
        step_adv(c - 1, r - 1, width, height);
      }
      if (valid_coordinate(c, r - 1, width, height)){
        step_adv(c, r - 1, width, height);
      }
      if (valid_coordinate(c + 1, r - 1, width, height)){
        step_adv(c + 1, r - 1, width, height);
      }
      if (valid_coordinate(c - 1, r, width, height)){
        step_adv(c - 1, r, width, height);
      }
      if (valid_coordinate(c + 1, r, width, height)){
        step_adv(c + 1, r, width, height);
      }
      if (valid_coordinate(c - 1, r + 1, width, height)){
        step_adv(c - 1, r + 1, width, height);
      }
      if (valid_coordinate(c, r + 1, width, height)){
        step_adv(c, r + 1, width, height);
      }
      if (valid_coordinate(c + 1, r + 1, width, height)){
        step_adv(c + 1, r + 1, width, height);
      }
    }
    return false;
  }
}

// see header file for details
bool mark(const int c, const int r, int width, int height) {
  map = map + r * width + c;
  if (*map == MARKED) {
    *map = UNKNOWN;
  } else if (*map == UNKNOWN) {
    *map = MARKED;
  }
  map = map - r * width - c;
  return all_marked();
}

// see header file for details
void print(int width, int height) {
  int count_height = height;
  while (count_height > 0) {
    int count_width = width;
    while (count_width > 0) {
      if (*map == UNKNOWN) {
        printf("_");
      } else if (*map == MARKED) {
        printf("P");
      } else if (*map == MINE) {
        printf("X");
      } else {
        printf("%d", *map);
      }
      --count_width;
      if (count_width != 0) {
        printf(" ");
        ++map;
      } else {
        printf("\n");
      }
    }
    --count_height;
    if (count_height != 0) {
      ++map;
    } else {
      map = map + 1 - width * height;
    }
  }
  
}
