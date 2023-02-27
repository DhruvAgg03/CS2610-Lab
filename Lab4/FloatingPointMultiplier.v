`timescale 1ns/100ps

module FloatingPointMultiplier(A,B,result);

    input[11:0] A,B;
    output[11:0] result;
    
    xor x1(result[11], A[11], B[11]);

    wire PM15;

    ManMul M1(result[0:6], PM15, A[7:10], B[7:10]);
    ExpAdder E1(result[7:10], A[7:10], B[7:10], PM15);
    

endmodule

