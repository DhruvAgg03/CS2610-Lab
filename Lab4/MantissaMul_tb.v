`timescale 1ns/1ns

`include "MantissaMultiplier.v"

module ManMul_tb ();
    reg [6:0] Xe, Ye;
    wire [6:0] Ze;
    wire PM15;

    ManMul M (Ze, PM15, Xe, Ye);

    initial begin

        $dumpfile("ManMul_tb.vcd");
        $dumpvars(0, ManMul_tb);

        Xe = 7'b0000000;
        Ye = 7'b0000000;

        #20
        
        Xe = 7'b0100000;
        Ye = 7'b0000000;

        #20
        
        Xe = 7'b1100000;
        Ye = 7'b0100000;

        #20
        
        Xe = 7'b1111000;
        Ye = 7'b1100000;

        #20

        $finish;
    end

endmodule