`timescale 1ns/100ps

module CLA_tb();

    reg [3:0] A, B;
    wire [3:0] sum;
    wire carry;

    CLA __c (sum, carry, A, B);

    initial begin
        A = 0;
        B = 0;

        $dumpfile("CLA.vcd");
        $dumpvars(0, CLA_tb);

        #640

        $finish;
    end

    always
        #10  A = A + 1;
    
    always
        #160 B = B + 1;

endmodule