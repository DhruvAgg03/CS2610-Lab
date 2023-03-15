`timescale 1ns/100ps

module MUX_tb();

	reg[7:0] inp;
    reg[2:0] sel;
	wire result;

    MUX8 M(result, sel, inp);
	
	initial begin
		
		inp = 8'b11101010;
		sel = 3'b000;

		$dumpfile("MUX_tb.vcd");
		$dumpvars(0, MUX_tb);
        #161
        $finish;
		
	end

    always begin
            
            #20
		    $display("inp = %b, sel = %b, result = %b", inp, sel, result);
			sel = sel+1;

    end

endmodule