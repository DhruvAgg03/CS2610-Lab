`timescale 1ns/100ps

module MUX (
    output wire res, 
    input wire s0, s1, sel
);
    not (selbar, sel);
    and (t0, s0, selbar);
    and (t1, s1, sel);
    or (res, t0, t1);
endmodule