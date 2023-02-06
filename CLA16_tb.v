`timescale 1ns/100ps

module CLA16_tb ();
    
    reg [15:0] A, B;
    reg subtract;   //  equals 1 for subtraction
    reg sign;       // equals 1 for signed
    wire [15:0] res;
    wire ovflow;

    CLA_NoHigher __C (res, ovflow, A, B, subtract, sign);

    initial begin

        // unsigned case 1 no carry
        A = 16'h0123;
        B = 16'h0345;
        subtract = 0;
        sign = 0;

        $dumpfile("CLA16_tb.vcd");
        $dumpvars(0, CLA16_tb);

        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b\n", A, B, res, ovflow);
        $display("Ans should be RESULT = 0468, OvFlow = 0\n\n");


        // unsigned case 2 carry
        A = 16'hF123;
        B = 16'h1345;
        subtract = 0;
        sign = 0;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b\n", A, B, res, ovflow);
        $display("Ans should be RESULT = 0468, OvFlow = 1\n\n");

        // unsigned case 3 subtraction
        A = 16'hF123;
        B = 16'h1345;
        subtract = 1;
        sign = 0;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b\n", A, B, res, ovflow);
        $display("Ans should be RESULT = DDDE, OvFlow = \n\n");

        // signed case 1 no overflow, positive
        A = 16'h0123;
        B = 16'h0345;
        subtract = 0;
        sign = 0;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b\n", A, B, res, ovflow);
        $display("Ans should be RESULT = 0468, OvFlow = 0\n\n");

        // signed case 2  overflow, positive
        A = 16'h7123;
        B = 16'h7345;
        subtract = 0;
        sign = 0;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b\n", A, B, res, ovflow);
        $display("Ans should be RESULT = E468, OvFlow = 0\n\n");

        // signed case 3 no overflow, negative
        A = 16'hF123;
        B = 16'hF345;
        subtract = 0;
        sign = 0;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b\n", A, B, res, ovflow);
        $display("Ans should be RESULT = E468, OvFlow = 0\n\n");

        // signed case 4 overflow, negative
        A = 16'hA123;
        B = 16'hA345;
        subtract = 0;
        sign = 0;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b\n", A, B, res, ovflow);
        $display("Ans should be RESULT = 4468, OvFlow = 1\n\n");

        // signed case 5 addition of opposite signs
        A = 16'hF123;
        B = 16'h1345;
        subtract = 0;
        sign = 1;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b\n", A, B, res, ovflow);
        $display("Ans should be RESULT = 0468, OvFlow = 0\n\n");

        // signed case 6 subtraction of opposite signs without overflow
        A = 16'h2123;
        B = 16'hF345;
        subtract = 1;
        sign = 1;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b\n\n", A, B, res, ovflow);
        $display("Ans should be RESULT = 2DDE, OvFlow = 0\n\n");

        // signed case 7 subtraction of opposite signs with overflow
        A = 16'h7123;
        B = 16'hA345;
        subtract = 1;
        sign = 1;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b\n\n", A, B, res, ovflow);
        $display("Ans should be RESULT = CDDE, OvFlow = 1\n\n");

    end

endmodule