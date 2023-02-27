`timescale 1ns/100ps

module FloatingMultiplier_tb();

	reg[11:0] A,B;
    wire[11:0] result;

    FloatingPointMultiplier F (A, B, result);
	
	initial begin
		
        $dumpfile("FloatingMultiplier_tb.vcd");
		$dumpvars(0, FloatingMultiplier_tb);

        //Case 1 : No Overflow, Same sign, Pm greater than 2.0
		A = 12'b000101100000;
        B = 12'b010011000000;

        #20
        $display("x = %b, y = %b\n     result = %b", x, y, result);
        $display("Ans should be 011000101000\n");

        //Case 2 : No Overflow, Diff sign, Pm greater than 2.0
		A = 12'b000101100000;
        B = 12'b110011000000;

        #20
        $display("x = %b, y = %b\n     result = %b", x, y, result);
        $display("Ans should be 110100010000\n");

        //Case 3 : No Overflow, Same sign, Pm less than 2.0
		A = 12'b010101000000;
        B = 12'b000110100000;

        #20
        $display("x = %b, y = %b\n     result = %b", x, y, result);
        $display("Ans should be 011011110000\n");

        //Case 4 : No Overflow, Diff sign, Pm less than 2.0
		A = 12'b110101000000;
        B = 12'b000110100000;

        #20
        $display("x = %b, y = %b\n     result = %b", x, y, result);
        $display("Ans should be 110011110000\n");

        //Case 5 : Exponent Positive Overflow
		x = 12'b011001000000;
        y = 12'b010110100000;

        #20
        $display("x = %b, y = %b\n     result = %b", x, y, result);
        $display("Ans should be 000001110000\n");

        //Case 6 : Exponent Negative overflow
		x = 12'b100111000000;
        y = 12'b100100100000;

        #20
        $display("x = %b, y = %b\n     result = %b", x, y, result);
        $display("Ans should be 011101110000\n");

		
	end

endmodule