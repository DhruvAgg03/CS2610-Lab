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