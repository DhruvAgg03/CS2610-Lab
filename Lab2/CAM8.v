`timescale 1ns/100ps
`include "BasicAdder.v"

module CAM_unsigned (
    input wire [7:0] X, Y,
    output wire [7:0] P,
    output wire overflow
);
    wire [15:0] PP [7:0];
    wire xy [7:0] [7:0];
    genvar i, j;
    for(i = 0; i <= 7; i = i + 1)
        for(j = 0; j <= 7; j = j + 1)
            and (xy[i][j], X[i], Y[j]);
    for(i = 0; i < 8; i = i + 1)
        for(j = 0; j < 16; j = j + 1)
            pulldown (PP[i][j]);
endmodule

