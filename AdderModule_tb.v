`timescale 1ns/100ps

module AdderModule_tb();
	reg a, b, carry_in;
	wire half_carry, half_sum, full_carry, full_sum;

	HalfAdder __h (half_carry, half_sum, a, b);
	FullAdder __f (full_carry, full_sum, a, b, carry_in);

	initial begin
		a = 0;
		b = 0;
		carry_in = 0;

		$dumpfile("AdderModule.vcd");
		$dumpvars(0, AdderModule_tb);

		#80

		$finish;
	end

	always
		#10 a = ~a;

	always
		#20 b = ~b;

	always
		#40 carry_in = ~carry_in;

endmodule
