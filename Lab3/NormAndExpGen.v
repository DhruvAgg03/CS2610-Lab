`timescale 1ns/100ps
`include "Multiplexer.v"
`include "Subtractor.v"
`include "pEncoder.v"
`include "BarrelShift.v"
`include "BasicAdder.v"

module NormandExpGen (
    output wire [3:0] Ze,
    output wire [6:0] Zm,
    input wire XeLTYe,
    input wire [3:0] Xe, Ye,
    input wire [8:0] sum
);
    wire [3:0] Ge/*, GePlus*/;
    MUX m[3:0] (Ge, XeLTYe, Xe, Ye);

    // supply1 __high;
    supply0 __low;
    // buf (high, __high);
    buf (low, __low);
    RCA8bit r (GePlus, temp_cout, Ge, low, sum[8]);

    wire [3:0] LDZshift;
    buf (LDZshift[3], low);
    wire [7:0] BarrelOut;
    PEncoder P (sum[7:0], LDZshift[2:0]);

    BarrelShift BB(BarrelOut, sum[7:0], LDZshift[2:0]);

    MUX mm [6:0] (Zm, sum[8], BarrelOut[6:0], sum[6:0]);

    RBS4bit RR (Ze, temp_borrow, Ge, LDZshift, low);
endmodule