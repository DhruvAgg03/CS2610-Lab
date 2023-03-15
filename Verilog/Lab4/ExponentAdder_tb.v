`timescale 1ns/1ns

`include "ExponentAdder.v"

module ExpAdder_tb ();
    reg [3:0] Xe, Ye;
    wire [3:0] Ze;
    wire overflow;
    reg PM15;

    ExpAdder E (Ze, overflow, Xe, Ye, PM15);

    initial begin

        $dumpfile("ExponentAdder_tb.vcd");
        $dumpvars(0, ExpAdder_tb);

        Xe = 4'b0111;
        Ye = 4'b0001;
        PM15 = 0;

        #20
        
        Xe = 4'b0111;
        Ye = 4'b0001;
        PM15 = 1;

        #20
        
        Xe = 4'b1111;
        Ye = 4'b1111;
        PM15 = 0;

        #20
        
        Xe = 4'b0000;
        Ye = 4'b0000;
        PM15 = 0;

        #20

        $finish;
    end

endmodule