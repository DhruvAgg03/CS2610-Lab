`timescale 1ns/100ps

module Subtractor_tb();

	reg[7:0] A,B;
    reg bin ;
	wire[7:0] result;
    wire borrow;

    RBS8bit R(result, borrow, A, B, bin);
	
	initial begin
		
		A = 8'b11101010;
        B = 8'b00011111;
        bin = 0;

		$dumpfile("Subtractor_tb.vcd");
		$dumpvars(0, Subtractor_tb);

        #20
        $display("A = %b, B = %b, bin = %b, result = %b, borrow = %b", A, B, bin, result, borrow);
		
	end

endmodule