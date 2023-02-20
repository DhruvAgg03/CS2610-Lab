`ifndef ADDER
`define ADDER
`timescale 1ns/100ps

module HalfAdder(
	output wire carry, sum,
	input wire a, b
);
	xor (sum, a, b);
	and (carry, a, b);
endmodule

module FullAdder(
	output carry, sum,
	input a, b, c
);
	xor (sum, a, b, c);
	and (ab, a, b);
	and (bc, b, c);
	and (ca, c, a);
	or (carry, ab, bc, ca);
endmodule

module RCA8bit (
	output wire [3:0] ans,
	output wire cout,
	input wire [3:0] A, B,
	input wire cin
);
	wire [4:0] intermediate_carry;
	buf (intermediate_carry[0], cin);
	FullAdder f[3:0] (intermediate_carry[4:1], ans, A, B, intermediate_carry[3:0]);
	buf (cout, intermediate_carry[4]);
endmodule
`endif