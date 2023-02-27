`timescale 1ns/100ps

module FloatingMultiplier_tb();

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
        $display("x = %b, y = %b\n     result = %b", x, y, result);
        $display("Ans should be 011000010000\n");

        //Case 2 : Sum of aligned mantissas greater than 2.0
		x = 12'b010011000000;
        y = 12'b010001000000;

        #20
        $display("x = %b, y = %b\n     result = %b", x, y, result);
        $display("Ans should be 010100010000\n");

        //Case 3 : Sum of aligned mantissas less than 2.0
		x = 12'b010111000000;
        y = 12'b001111000000;

        #20
        $display("x = %b, y = %b\n     result = %b", x, y, result);
        $display("Ans should be 010111001100\n");

        //Case 4 : Sum of aligned mantissas less than 2.0
		x = 12'b010010010000;
        y = 12'b010001000000;

        #20
        $display("x = %b, y = %b\n     result = %b", x, y, result);
        $display("Ans should be 010011110000\n");

        //Case 5 : Xe - Ye < 8
		x = 12'b011010100000;
        y = 12'b010011000000;

        #20
        $display("x = %b, y = %b\n     result = %b", x, y, result);
        $display("Ans should be 011010101100\n");

        //Case 6 : Xe - Ye >= 8
		x = 12'b011110101000;
        y = 12'b000100000001;

        #20
        $display("x = %b, y = %b\n     result = %b", x, y, result);
        $display("Ans should be 011110101000\n");

		
	end

endmodule