`timescale 1ns/1ns

`include "BasicAdder.v"
`include "Subtractor.v"

module ExpAdder (
    output wire [3:0] Ze,
    input wire [3:0] Xe, Ye,
    input wire PM15
);
    supply0 low;
    supply1 high;

    // adding both exponents
    wire [4:0] intermediate_sum;
    RCA4bit add1 (intermediate_sum[3:0], intermediate_sum[4], Xe, Ye, PM15);
    
    // subtracting bias
    wire [4:0] bias;
    buf (low, bias[4]);
    buf (low, bias[3]);
    buf (high, bias[2]);
    buf (high, bias[1]);
    buf (high, bias[0]);

    // generating Ze
    wire [4:0] tempZe;
    RBS5bit sub1 (tempZe, borrow_out, intermediate_sum[4:0], bias[4:0], low);

    buf bb[3:0] (Ze, tempZe[3:0]);
endmodule