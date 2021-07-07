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
(LOOP)
    // Reset counter to 0
    @COUNTER
    M = 0

    // Check for keyboard input
    @KBD
    D = M

    // Make pixel white
    @WHITE
    D;JEQ
    (BLACK)
        // if (COUNTER == 8192) goto LOOP
        @COUNTER
        D = M
        @8192
        D = D - A
        @LOOP
        D;JEQ

        // Set pixel to black
        @COUNTER
        D = M
        @SCREEN
        A = A + D
        M = -1

        @COUNTER
        M = M + 1

        @BLACK
        0;JMP

    // Set pixel to white
    (WHITE)
        // if (COUNTER == 8192) goto LOOP
        @COUNTER
        D = M
        @8192
        D = D - A
        @LOOP
        D;JEQ

        // Set pixel to white
        @COUNTER
        D = M
        @SCREEN
        A = A + D
        M = 0
        
        // Increase counter
        @COUNTER
        M = M + 1

        @WHITE
        0;JMP