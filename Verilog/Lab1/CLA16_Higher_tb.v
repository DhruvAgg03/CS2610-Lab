`timescale 1ns/100ps

module CLA16_tb ();
    
    reg [15:0] A, B;
    reg subtract;   //  equals 1 for subtraction
    reg sign;       // equals 1 for signed
    wire [15:0] res;
    wire ovflow;

    CLA16_higher _C (res, ovflow, A, B, subtract, sign);

    initial begin

        // unsigned case 1 no carry
        $display("unsigned case 1 no carry");
        A = 16'h0123;
        B = 16'h0345;
        subtract = 0;
        sign = 0;

        $dumpfile("CLA16_tb.vcd");
        $dumpvars(0, CLA16_tb);

        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b", A, B, res, ovflow);
        $display("Ans should be RESULT = 0468, OvFlow = 0\n");


        // unsigned case 2 carry
        $display("unsigned case 2 carry");
        A = 16'hF123;
        B = 16'h1345;
        subtract = 0;
        sign = 0;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b", A, B, res, ovflow);
        $display("Ans should be RESULT = 0468, OvFlow = 1\n");

        // unsigned case 3 subtraction
        $display("unsigned case 3 subtraction");
        A = 16'hF123;
        B = 16'h1345;
        subtract = 1;
        sign = 0;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b", A, B, res, ovflow);
        $display("Ans should be RESULT = DDDE, OvFlow = 0\n");

        // signed case 1 no overflow, positive
        $display("signed case 1 no overflow, positive");
        A = 16'h0123;
        B = 16'h0345;
        subtract = 0;
        sign = 1;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b", A, B, res, ovflow);
        $display("Ans should be RESULT = 0468, OvFlow = 0\n");

        // signed case 2  overflow, positive
        $display("signed case 2  overflow, positive");
        A = 16'h7123;
        B = 16'h7345;
        subtract = 0;
<<<<<<< HEAD:Lab1/CLA16_Higher_tb.v
        sign = 1;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b", A, B, res, ovflow);
        $display("Ans should be RESULT = E468, OvFlow = 0\n");
=======
        sign = 1
        ;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b", A, B, res, ovflow);
        $display("Ans should be RESULT = E468, OvFlow = 1\n");
>>>>>>> ffdd508211399c14b9863fee29f63d8f550e877f:CLA16_Higher_tb.v

        // signed case 3 no overflow, negative
        $display("signed case 3 no overflow, negative");
        A = 16'hF123;
        B = 16'hF345;
        subtract = 0;
        sign = 1;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b", A, B, res, ovflow);
        $display("Ans should be RESULT = E468, OvFlow = 0\n");

        // signed case 4 overflow, negative
        A = 16'hA123;
        B = 16'hA345;
        subtract = 0;
        sign = 1;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b", A, B, res, ovflow);
        $display("Ans should be RESULT = 4468, OvFlow = 1\n");

        // signed case 5 addition of opposite signs
        A = 16'hF123;
        B = 16'h1345;
        subtract = 0;
        sign = 1;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b", A, B, res, ovflow);
        $display("Ans should be RESULT = 0468, OvFlow = 0\n");

        // signed case 6 subtraction of opposite signs without overflow
        A = 16'h2123;
        B = 16'hF345;
        subtract = 1;
        sign = 1;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b\n", A, B, res, ovflow);
        $display("Ans should be RESULT = 2DDE, OvFlow = 0\n");

        // signed case 7 subtraction of opposite signs with overflow
        A = 16'h7123;
        B = 16'hA345;
        subtract = 1;
        sign = 1;
        #20
        $display("A = %x, B = %x, RESULT = %x, OvFlow = %b\n", A, B, res, ovflow);
        $display("Ans should be RESULT = CDDE, OvFlow = 1\n");

    end

endmodule