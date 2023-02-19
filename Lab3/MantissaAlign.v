`timescale 1ns/1ns

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