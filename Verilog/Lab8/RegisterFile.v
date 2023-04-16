`timescale 1ns/1ns

module Registers (
    input wire clk,
    input [2:0] read1Addr,
    input [2:0] read2Addr,
    input [2:0] writeAddr,
    input [11:0] writeData,
    output wire [11:0] readData1,
    output wire [11:0] readData2
);
    reg [7:0] myreg [11:0];
    initial 
        begin
            myreg[0] = 30;
            myreg[1] = 40;
            myreg[5] = 2;
            myreg[6] = 3;
        end
    reg [11:0] tempReadData1;
    reg [11:0] tempReadData2;
    always @(posedge clk)
        begin
            myreg[writeAddr] <= writeData;
            tempReadData1 <= myreg[read1Addr];
            tempReadData2 <= myreg[read2Addr];
        end
    assign readData1 = tempReadData1;
    assign readData2 = tempReadData2;
endmodule

// // make d flip flop
// module DFF (
//     input wire clk,
//     input wire d,
//     output reg q
// );
//     always @(posedge clk) begin
//         q <= d;
//     end
// endmodule

// // make 12 bit register
// module Register12 (
//     input wire clk,
//     input wire [11:0] d,
//     output reg [11:0] q
// );
//     DFF dff1(clk, d[0], q[0]);
//     DFF dff2(clk, d[1], q[1]);
//     DFF dff3(clk, d[2], q[2]);
//     DFF dff4(clk, d[3], q[3]);
//     DFF dff5(clk, d[4], q[4]);
//     DFF dff6(clk, d[5], q[5]);
//     DFF dff7(clk, d[6], q[6]);
//     DFF dff8(clk, d[7], q[7]);
//     DFF dff9(clk, d[8], q[8]);
//     DFF dff10(clk, d[9], q[9]);
//     DFF dff11(clk, d[10], q[10]);
//     DFF dff12(clk, d[11], q[11]);
// endmodule

// // make register file of 8 registers and 2 read ports and 1 write port
// module RegisterFile(
//     input wire clk,
//     input wire [2:0] read1Addr,
//     input wire [2:0] read2Addr,
//     input wire [2:0] writeAddr,
//     input wire [11:0] writeData,
//     output reg [11:0] readData1,
//     output reg [11:0] readData2
//     input Register12 [7:0] myreg
// )

// endmodule
