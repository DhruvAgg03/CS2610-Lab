`timescale 1ns/100ps

module HalfAdder(output carry, output sum, input a, input b)
	xor #1 (sum, a, b);
	and #1 (carry, a, b);
endmodule

module FullAdder(output carry, output sum, input a, input b, input c)
	HalfAdder h1(carry1_temp, sum_temp, a, b);
	HalfAdder h2(carry2_temp, sum, sum_temp, c);
	and(carry, carry1_temp, carry2_temp);
endmodule