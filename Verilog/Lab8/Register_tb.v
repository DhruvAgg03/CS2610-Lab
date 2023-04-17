`timescale 1ns/100ps

module Register_tb();

    reg clk;
    reg we;
    reg [11:0] data;
    wire [11:0] out;

    Register R (clk, we, data, out);
	
	initial begin
		
        $dumpfile("Register_tb.vcd");
        $dumpvars(0, Register_tb);

        data = 12'b001100011010;
        we = 1;
        clk = 1;
        #20
        $display("clk = %b, we = %b, data = %b\n     out = %b", clk, we, data, out);
        //$display("Ans should be 000010010101\n");

        data = 12'b001100011010;
        we = 1;
        clk = 0;
        #20
        $display("clk = %b, we = %b, data = %b\n     out = %b", clk, we, data, out);
        //$display("Ans should be 000010010101\n");

        data = 12'b001100011010;
        we = 0;
        clk = 1;
        #20
        $display("clk = %b, we = %b, data = %b\n     out = %b", clk, we, data, out);
        //$display("Ans should be 000010010101\n");

        data = 12'b001100011010;
        we = 0;
        clk = 0;
        #20
        $display("clk = %b, we = %b, data = %b\n     out = %b", clk, we, data, out);
        //$display("Ans should be 000010010101\n");

        
		
	end

endmodule