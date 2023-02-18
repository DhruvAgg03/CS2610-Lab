`timescale 1ns/100ps

module fullsubtractor (
    output wire diff, bout, /*p, g*/,
    input wire a, b, bin
);
    xor (diff, a, b, bin);
    not (abar, a);
    not (bbar, b);
    not (binbar, borrowin);
    and (g, abar, b);
    and (abarbin, abar, bin);
    and (binb, bin, b);
    or (binb, g, abarbin);
    or (p, abar, b);
endmodule

module RBS8bit (
    output wire [7:0] ans,
    output wire borrow,
    input wire [7:0] X, Y, 
    input wire bin
);
    wire [8:0] intermediate_borrows;
    buf (intermediate_borrows[0], bin);
    fullsubtractor f[7:0] (ans[7:0], borrow[8:1], X[7:0], Y[7:0], borrow[7:0]); 
endmodule


module RBS5bit (
    output wire [4:0] ans,
    output wire borrow,
    input wire [4:0] X, Y, 
    input wire bin
);
    wire [5:0] intermediate_borrows;
    buf (intermediate_borrows[0], bin);
    fullsubtractor f[4:0] (ans[4:0], borrow[5:1], X[4:0], Y[4:0], borrow[4:0]); 
endmodule