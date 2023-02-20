`timescale 1ns/100ps

module Integrated_tb();

	reg[11:0] x,y;
    reg sub;
    wire[11:0] result;

    integrated I (x, y, sub, result);
	
	initial begin
		
        $dumpfile("Integrated_tb.vcd");
		$dumpvars(0, Integrated_tb);
        sub = 1'b0;

        //Case 1 : Sum of aligned mantissas greater than 2.0
		x = 12'b010111000000;
        y = 12'b010101000000;

        #20
        $display("x = %b, y = %b\n       result = %b", x, y, result);
        $display("Ans should be 011000010000\n");

        //Case 2 : Sum of aligned mantissas greater than 2.0
		x = 12'b010111100000;
        y = 12'b010111000000;

        #20
        $display("x = %b, y = %b, result = %b", x, y, result);
        $display("Ans should be \n");

        //Case 3 : Sum of aligned mantissas less than 2.0
		x = 12'b010111100000;
        y = 12'b010111000000;

        #20
        $display("x = %b, y = %b, result = %b", x, y, result);
        $display("Ans should be \n");

        //Case 4 : Sum of aligned mantissas less than 2.0
		x = 12'b010111100000;
        y = 12'b010111000000;

        #20
        $display("x = %b, y = %b, result = %b", x, y, result);
        $display("Ans should be \n");

        //Case 5 : Xe - Ye < 8
		x = 12'b010111100000;
        y = 12'b010111000000;

        #20
        $display("x = %b, y = %b, result = %b", x, y, result);
        $display("Ans should be \n");

        //Case 6 : Xe - Ye >= 8
		x = 12'b010111100000;
        y = 12'b010111000000;

        #20
        $display("x = %b, y = %b, result = %b", x, y, result);
        $display("Ans should be \n");

		
	end

endmodule