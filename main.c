#include "cs136.h"
#include "game.h"

/*
 * DO NOT CHANGE THE MAIN FUNCTION
 */
int main(void) {
  char input;
  int width = 0, height = 0;
  do {
    scanf(" %c", &input);
    if (input == 'I' || input == 'i') {
      scanf(" %d", &width);
      scanf(" %d", &height);
      init(width, height);
      print(width, height);
    } else if (input == 'D' || input == 'd'){
      scanf(" %d", &width);
      scanf(" %d", &height);
      int seed = 0;
      scanf(" %d", &seed);
      init_d(width, height, seed);
      print(width, height);
    } else if (input == 'S' || input == 's') {
      int c = -1, r = -1;
      scanf(" %d", &c);
      scanf(" %d", &r);
      bool mine = step(c, r, width, height);
      print(width, height);
      if (mine) {
        printf("You stepped on a mine. Game over!\n");
        shutdown();
        input = EOF;
      }
    } else if (input == 'A' || input == 'a') {
      int c = -1, r = -1;
      scanf(" %d", &c);
      scanf(" %d", &r);
      bool mine = step_adv(c, r, width, height);
      print(width, height);
      if (mine) {
        printf("You stepped on a mine. Game over!\n");
        shutdown();
        input = EOF;
      }
    } else if (input == 'M' || input == 'm') {
      int c = -1, r = -1;
      scanf(" %d", &c);
      scanf(" %d", &r);
      bool finished = mark(c, r, width, height);
      print(width, height);
      if (finished) {
        printf("You marked all mines. Congratulations, well done!\n");
        shutdown();
        input = EOF;
      }
    } else if (input == 'P' || input == 'p') {
      print(width, height);
    } else if (input == 'Q' || input == 'q') {
      printf("Thanks for playing. See you soon!\n");
      shutdown();
      input = EOF;
    }
  } while (input != EOF);
}