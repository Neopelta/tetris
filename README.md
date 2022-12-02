# Tetris Project
TETRIS game - Student project 

This project was realized within the framework of the teaching unit Complementary programming proposed to the students of 1st year of Licence Informatique at the Faculty of Sciences of the University of Poitiers.

## Information

- LANGUAGE : OCAML
- VERSION : 22W17C
- GROUP : Radiator
- STUDENTS : Ronan PLUTA FONTAINE | Lucas V.
- YEAR : 2022

## Presentation of the project

We were asked to work in groups and to create a software using our knowledge acquired so far. It is a video game inspired by Tetris. Tetris is a puzzle game designed by Alekseï PAJITNOV in 1984. The goal is to align different shapes in order to complete lines and thus have the best score. With 496.4 million sales worldwide, Tetris is the second best-selling license in history.

## How to play?

To launch the Tetris game, you just have to use a compiler compatible with OCAML.

If you don't have an OCAML compatible compiler, I suggest you to use **emacs** (provided in the project folder) : 
1. Open emacs via the root "star_emacs.Ink" or directly ".\emacs\start_emacs.bat"
2. In the "file" menu, click on "Open File...", then select the "game_tetris.ml" file
3. Compile the program with the following manipulation : ctrl + c, ctrl + b and Enter


## The orders (AZERTY)

- Right : Q
- Left: D
- Right rotation : Z
- Left rotation : S
- As low as possible: A 

### To change the keys ? 
Go to the "move" function and change only the corresponding letters. 

### To change the background color ? 
Go to the function "init_param" and modify the attribute background_color
