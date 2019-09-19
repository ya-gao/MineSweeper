# MineSweeper
Minesweeper is a single-player puzzle computer game. The objective of the game is to clear a rectangular board containing hidden "mines" or bombs without detonating any of them, with help from clues about the number of neighboring mines in each field. 

In this progect, the Minesweeper voard is stored as a a (flat) 1D-array with width * height elements. Squares are stored in the following order (column,row): [0,0], [1,0], [2,0], ..., [width-1,0], [0,1], [1,1], ..., [width-1,height-1]. A pointer called map points to the first field of the Minesweeper board. Users can step or mark the square by inputing the coordination of the square via keyboard. If the steped square is not next to a mine, it reveales also all adjacent fields. Users can call print function to print the current map to the console. Unexplored squares are represented by '_ ', marked squares by 'P ', and mines by 'X '. If a mine is stepped on, "You stepped on a mine. Game over!" will be printed. If all the mines are marked, "You marked all mines. Congratulations, well done!" will be printed. 

For detailed documentation for each function, please see header files. 
