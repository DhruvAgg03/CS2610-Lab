`timescale 1ns/100ps

`include "Subtractor.v"
`include "Multiplexer.v"

module ExpDiff(
    output wire XeLTYe, 
    output wire [4:0] XeminusYe,
    input wire [4:0] Xe, Ye;
);
    input wire [4:0] diff1, diff2;

    RBS5bit r1 (diff1, XeLTYe, Xe, Ye);
    RBS5bit r2 (diff2, temp, Ye, Xe);

    MUX m [4:0] (XeminusYe, Xe, Ye, XeLTYe);
endmodule

