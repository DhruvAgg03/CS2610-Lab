`timescale 1ns/1ns

module BarrelShift(result, inp, diff);

    input wire[7:0] inp;
    input wire[2:0] diff;
    output wire[7:0] result;
    supply1 one;
    supply0 zero;


    wire[7:0] mint[7:0];

    buf b5[7:0] (mint[0], inp);

    buf b19(mint[1][7], zero);
    buf b6[6:0] (mint[1][6:0], inp[6:1]);

    buf b7[1:0] (mint[2][7:6], zero);
    buf b8[5:0] (mint[2][5:0], inp[7:2]);

    buf b9[2:0] (mint[3][7:5], zero);
    buf b10[4:0] (mint[3][4:0], inp[7:3]);

    buf b11[3:0] (mint[4][7:4], zero);
    buf b12[3:0] (mint[4][3:0], inp[7:4]);

    buf b13[4:0] (mint[5][7:3], zero);
    buf b14[2:0] (mint[5][2:0], inp[7:5]);

    buf b15[5:0] (mint[6][7:2], zero);
    buf b16[1:0] (mint[6][1:0], inp[7:6]);

    buf b17[6:0] (mint[7][7:1], zero);
    buf b18[0:0] (mint[7][0:0], inp[7:7]);

    MUX8 m3[7:0] (result[7:0], diff[2:0] ,mint[7:0][7:0]);


endmodule

module MantissaAlign(Xm, Ym, diff, LT, Pm, Qm);

    input[6:0] Xm, Ym;
    input[3:0] diff;
    input LT;
    output[7:0] Pm, Qm;

    supply1 one;
    supply0 zero;

    buf b1(Pm[7], one);

    MUX m1[6:0] (Pm[6:0], Xm[6:0], Ym[6:0], LT);

    wire[7:0] t1,t2;
    buf b20 (t1[7], one);
    buf b21 (t2[7], one);

    buf b3[6:0] (t1[6:0], Xm[6:0]);
    buf b4[6:0] (t2[6:0], Ym[6:0]);

    wire[7:0] t3;
    MUX m2[7:0] (t3[7:0], t2[7:0], t1[7:0], LT);

endmodule