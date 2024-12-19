# AES-Decryption
**1. Overview**

This project implements the decryption operation of the Advanced Encryption Standard (AES) on a Basys3 FPGA board. The decrypted plaintext is displayed on the seven-segment display of the board. The primary focus is to design and test individual components for AES decryption, including memory elements, compute units, and controllers.

**2. Problem Description**

The AES decryption process involves the following:

-   **Input:** Ciphertext and keys provided in a COE file, stored in block RAM.
-   **Output:** Decrypted plaintext displayed on a seven-segment display.
-   **Steps:** The decryption mirrors AES encryption but uses inverse transformations. Operations include InvShiftRows, InvSubBytes, InvMixColumns, and AddRoundKey.

**Key Features:**

1.  Ciphertext and round keys are stored in memory.
2.  Inverse operations for AES decryption are implemented.
3.  Final output is converted to ASCII characters and displayed cyclically on the Basys3 seven-segment display.

**3. Solution Approach**

The project is divided into several subcomponents to ensure modular design and implementation.

**Step 1: Memory Components**

-   **RAM:** Stores the output during the decryption process.
-   **ROM:** Holds the ciphertext and round keys for decryption.

**Step 2: Compute Unit**

The compute unit implements the following operations:

1.  **InvMixColumns:** Reverses the mixing of bytes using Galois Field (GF(2\^8)) arithmetic.
2.  **InvShiftRows:** Reverses the row-wise byte shifting.
3.  **InvSubBytes:** Uses a lookup table (inverse S-box) for non-linear substitution.
4.  **AddRoundKey:** XORs the state with the appropriate round key.

**Step 3: Controller Design**

The controller coordinates:

-   Reading inputs from memory.
-   Performing the compute operations.
-   Writing results back to memory.

**Step 4: Display Logic**

-   Converts the final plaintext to ASCII using the ASCII table.
-   Displays characters cyclically on the seven-segment display.
-   Displays - for unsupported characters.

**4. Input/Output Description**

**Inputs:**

1.  Ciphertext and round keys in a COE file.
2.  Memory initialization using Vivado's Distributed Memory Generator.

**Outputs:**

1.  Plaintext displayed cyclically on the Basys3 seven-segment display.
2.  Default - displayed for unsupported characters.

**5. Component Design**

**1. Memory:**

-   RAM: Stores intermediate decryption results.
-   ROM: Holds the input ciphertext and keys.

**2. Compute Unit:**

-   **InvMixColumns:** Multiplies each column of the state matrix by the inverse MixColumns matrix using GF(2\^8) arithmetic.
-   **InvShiftRows:** Shifts rows of the state matrix right by specified positions.
-   **InvSubBytes:** Substitutes each byte using an inverse S-box.
-   **AddRoundKey:** XORs the current state with the round key.

**3. Controller:**

-   Coordinates read/write operations and controls the compute unit.

**4. Display Logic:**

-   Converts decrypted values to ASCII.
-   Displays four characters at a time on the Basys3 display.
-   Cycles through the entire plaintext continuously.

**6. Example**

**Input COE File:**

Ciphertext and round keys stored in the following format:

memory_initialization_radix=16;

memory_initialization_vector=

C0DEFEEDBADC0FFEE...

**Output:**

Plaintext displayed as:

A B C D

E F G H

**7. Tools and Resources**

1.  **Vivado IDE:** Used for synthesis, simulation, and FPGA implementation.
2.  **Basys3 Board:** Displays the output plaintext using its seven-segment display.
3.  **VHDL Modules:** Designed for decryption operations.

This modular design ensures that each component can be developed, tested, and integrated systematically to achieve the final objective.
