`timescale 1ns/100ps

`include "NormAndExpGen.v"

module NormAndExpGen ();
    wire [3:0] Ze;
    wire [6:0] Zm;
    reg XeLTYe;
    reg [3:0] Xe, Ye;
    reg [8:0] sum;
    NormAndExpGen N (Ze, Zm, XeLTYe, Xe, Ye, sum);

    initial begin
        $dumpfile("Norm.vcd");
        $dumpvars(0, NormAndExpGen);
        Xe = 4'b0101;
        Ye = 4'b1010;
        sum = 9'b010000000;
        XeLTYe = 1'b1;
        #100
        $finish;
    end
endmodule