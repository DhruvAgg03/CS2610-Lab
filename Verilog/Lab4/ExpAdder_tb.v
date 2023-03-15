`timescale 1ns/100ps

module ExpAdder_tb ();
    reg [3:0] Xe, Ye;
    wire XeLTYe;
    wire [3:0] absDiff;

    ExpDiff E(XeLTYe, absDiff, Xe, Ye);

    initial begin
        $dumpfile("ExpDiffGen.vcd");
        $dumpvars(0, ExpDiffGen_tb);
        Xe = 4'b1111;
        Ye = 4'b1000;
        #20
        Xe = 4'b1101;
        Ye = 4'b0100;
        #20
        Xe = 4'b0111;
        Ye = 4'b1001;
        #20
        Xe = 4'b0000;
        Ye = 4'b1110;
        #20
        $finish;
    end
endmodule