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
	HalfAdder h1(carry1_temp, sum_temp, a, b);
	HalfAdder h2(carry2_temp, sum, sum_temp, c);
	or #1 (carry, carry1_temp, carry2_temp);
endmodule