`timescale 1ns/100ps

module HalfAdder(
	output wire carry, sum,
	input wire a, b
);
	xor #2 (sum, a, b);
	and #1 (carry, a, b);
endmodule

module FullAdder(
	output carry, sum,
	input a, b, c
);
	xor #2 (sum, a, b, c);
	and #1 (ab, a, b);
	and #1 (bc, b, c);
	and #1 (ca, c, a);
	or #1 (carry, ab, bc, ca);
endmodule