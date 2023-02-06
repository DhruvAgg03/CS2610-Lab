`timescale 1ns/1ns

module CLA_NoHigher(result,OF,operand1,operand2,sub,sign);

    input[15:0] operand1, operand2;
    input sub, sign;
    output[15:0] result;
    output OF;

    wire[15:0] operand2_bar;
    wire[3:0] carries;
    wire[3:0] c2l;

    wire[15:0] operand3;
    xor Xors[15:0] (operand3[15:0], operand2[15:0], sub);

    not Not[15:0] (operand2_bar[15:0], operand2[15:0]);

    CLA c1 (result[3:0], carries[0], c2l[0], operand1[3:0], operand3[3:0], sub);
    CLA c2 (result[7:4], carries[1], c2l[1], operand1[7:4], operand3[7:4], carries[0]);
    CLA c3 (result[11:8], carries[2], c2l[2], operand1[11:8], operand3[11:8], carries[1]);
    CLA c4 (result[15:12], carries[3], c2l[3], operand1[15:12], operand3[15:12], carries[2]);

    wire o1,o2;
    wire x1,x2;
<<<<<<< HEAD:Lab1/CLA_NoHigher.v
    wire last_bar, c2l_bar;
    not Nott1(last_bar, carries[3]);
    not Nott2(c2l_bar, c2l[3]);

    
=======
    wire sub_bar;
    not N2(sub_bar,sub);

>>>>>>> ffdd508211399c14b9863fee29f63d8f550e877f:CLA_NoHigher.v
    buf Buf1 (o1,carries[3]);
    xor Xor1 (o2, carries[3], c2l[3]);

    wire sign_bar;
    not Not1 (sign_bar, sign); 

    wire mint1, mint2;
<<<<<<< HEAD:Lab1/CLA_NoHigher.v
    and And1 (mint1, sign_bar, o1);
    and And2 (mint2, sign,  o2);
=======
    and And1 (mint1, sign_bar, o1,sub_bar);
    and And2 (mint2, sign, o2);
>>>>>>> ffdd508211399c14b9863fee29f63d8f550e877f:CLA_NoHigher.v

    or Or (OF, mint1, mint2);

endmodule 