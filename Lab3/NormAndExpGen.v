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
    wire [3:0] Ge, GePlus;
    MUX m[3:0] (Ge, XeLTYe, Xe, Ye);

    supply1 __high;
    supply0 __low;
    buf (high, __high);
    buf (low, __low);
    RCA8bit r (GePlus, temp_cout, Ge, low, high);

    wire [3:0] LDZshift
    PEncoder P (sum[7:0], LDZshift);
    BarrelShift BB
endmodule