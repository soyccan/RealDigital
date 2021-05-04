// 8-bit adder-subtractor
module AddSub(
    input [7:0] A_in,
    input [7:0] B_in,
    input sub,
    output [7:0] S_out,
    output overflow,
    output neg
);

//////// Parameter ////////

//////// Reg & Wire Declaration ////////
wire [7:0] A, B;
wire [8:0] S;

//////// Submodule Instantiation ////////

//////// Finite-State Machine ////////

//////// Combinational Logic ////////
assign A = A_in;
assign B = sub ? B_in : ~B_in + 1;
// if(sub) B = B_in; else B = ~B_in + 1;

Input 8-bit
11111111

BCD 12-bit:
    2      5    5
   0001 0101 0101


 00000001
+00000010
---------
 00000011

 00000001
+11111110
---------
 11111111

// signed extension
// sign bit
// 0010 -> 00010
// 1100 -> 11100
assign S = {A[7], A} + {B[7], B};

// overflow detect
assign overflow = S[8] ^ S[7];

// negative
// sign bit
assign neg = S[7];

assign S_out = S[7:0];

//////// Sequential Logic ////////

A - B
= A + 2's complement of B

-1 = 2's complement of 1
= 2's complemente of 00000001
= 11111110 + 1
= 11111111
= 255

// unsigned (only positive)
11111111 = 255

// signed
11111111 = -1

signed addition or unsigned addition

B = 0010 = 2
B' = 1101 + 1 = 1110 = -2

A = 0100 = 4
B = 0010 = 2
B' = 1110 = -2

A - B = A + B'

 0100
+1110
 ----
10010
=> 0010 = 2

xxxx10000000

// 4-bit signed int: -8 ~ 7

// signed not overflow
A = 1110 = -2
B = 1010 = (0110)' = -6

1110
 1110
+1010
 ----
11000
=> 1000 = (1000)' = -8


// overflow
A = 0110 = 6
B = 0010 = 4
0110
 0110
+0010
-----
01000
=> -8

endmodule

