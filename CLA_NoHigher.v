`timescale 1ns/1ns

module CLA_NoHigher(result,OF,operand1,operand2,add,sign);

    input[15:0] operand1, operand2;
    input add, sign;
    output[15:0] result;
    output OF;

    wire[15:0] operand2_bar;
    wire[3:0] carries;
    wire[3:0] c2l;

    not Not[15:0] (operand2_bar[15:0], operand2[15:0]);

    CLA c1 (result[3:0], carries[0], c2l[0], operand1[3:0], operand2[3:0], add);
    CLA c2 (result[7:4], carries[1], c2l[1], operand1[7:4], operand2[7:4], carries[0]);
    CLA c3 (result[11:8], carries[2], c2l[2], operand1[11:8], operand2[11:8], carries[1]);
    CLA c4 (result[15:12], carries[3], c2l[3], operand1[15:12], operand2[15:12], carries[2]);

    wire o1,o2;
    buf Buf1 (o1,carries[3]);
    xor Xor1 (o2, carries[3], c2l[3]);

    wire sign_bar;
    not Not1 (sign_bar,sign);

    wire mint1, mint2;
    and And1 (mint1, sign_bar, o1);
    and And2 (mint2, sing,  o2);

    or Or (OF, mint1, mint2);

endmodule