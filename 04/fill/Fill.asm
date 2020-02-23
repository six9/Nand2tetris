// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// Have to check the memory for >0 if
// then black or else white.
// Might have to go to a for loop for writing black
// for every pixel.

@SCREEN
D=A
@Position //save initial position
M=D-1


(CHECK) //checks if key is pressed
@KBD
D=M
@BLACK
D;JGT //jump greater than 0,to black
@WHITE
0;JMP //else jump unconditionally

(BLACK)
@24576 //end of screen 16384+32*256
D=M
@Position
D=D-M //checks whether we are at end of screen
@CHECK
D;JEQ //jump to check if nothing needs to be done

//if not there is still white
@Position
A=M
M=-1 //making the position black

//going forward
@Position
D=M+1
@Position
M=D  //saving the current position

//checking whether user still holds the key
@CHECK
0;JMP


(WHITE)
@SCREEN
D=A-1
@Position 
D=D-M  //if the current position is the top position
@CHECK //do nothing
D;JEQ

//else start white
@Position
A=M
M=0

//go back 
@Position
D=M-1
@Position
M=D

//check for user input
@CHECK
0;JMP




