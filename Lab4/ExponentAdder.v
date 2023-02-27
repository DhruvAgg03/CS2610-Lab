`timescale 1ns/1ns

`include "BasicAdder.v"
`include "Subtractor.v"

module ExpAdder (
    output wire [3:0] Ze,
    output wire overflow,
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
    buf (bias[4], low);
    buf (bias[3], low);
    buf (bias[2], high);
    buf (bias[1], high);
    buf (bias[0], high);

    // generating Ze
    wire [4:0] tempZe;
    RBS5bit sub1 (tempZe, borrow_out, intermediate_sum[4:0], bias[4:0], low);

    buf bb[3:0] (Ze, tempZe[3:0]);
    
    // generating overflow (when answer is negative, answer is zero or answer is greater than 4 bits)
    and (subnormal, tempZe[0], tempZe[1], tempZe[2], tempZe[3]);
    or (overflow, borrow_out, tempZe[4], subnormal);
endmodule