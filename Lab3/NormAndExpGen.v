`timescale 1ns/100ps
`include "Multiplexer.v"
`include "Subtractor.v"

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
    // supply0 __low;
    // buf (high, __high);
    // buf (low, __low);
    // RCA8bit r (GePlus, temp_cout, Ge, low, high);

    wire [2:0] LDZshift;
    wire [7:0] BarrelOut;
    PEncoder P (sum[7:0], LDZshift);
    BarrelShift BB(BarrelOut, sum[7:0], LDZshift);

    MUX m [6:0] (Zm, sum[8], BarrelOut[6:0], sum[6:0]);

    RBS4bit BB (ans, temp_borrow, Ge, LDZshift);
endmodule