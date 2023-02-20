`timescale 1ns/100ps

module MantissaAlign_tb();

	reg[6:0] Xm,Ym;
    reg[3:0] diff;
	reg LT;
    wire[7:0] Pm, Qm;

    MantissaAlign M (Xm, Ym, diff, LT, Pm, Qm);
	
	initial begin
		
		Xm = 7'b11101010;
        Ym = 7'b01011111;
        diff = 4'b0010;
        LT = 1'b0;
		$dumpfile("MantissaAlign_tb.vcd");
		$dumpvars(0, MantissaAlign_tb);

        #20
        $display("Xm = %b, Ym = %b, diff = %b, LT = %b, Pm = %b, Qm = %b", Xm, Ym, diff, result, borrow);
		
	end

endmodule