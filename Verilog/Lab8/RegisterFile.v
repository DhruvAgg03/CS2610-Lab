`timescale 1ns/1ns
`include "Multiplexer.v"
`include "Demux.v"
module Registers (
    input wire clk,
    input [2:0] read1Addr,
    input [2:0] read2Addr,
    input [2:0] writeAddr,
    input [11:0] writeData,
    output wire [11:0] readData1,
    output wire [11:0] readData2
);
    reg [11:0] myreg [7:0];
    initial 
        begin
            myreg[0] = 30;
            myreg[1] = 40;
            myreg[5] = 12'b010111000000;
            myreg[6] = 12'b001111000000;
            // 010111001100 is the result
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

//  d flip flop
module DFF (
    input wire clk,
    input wire d,
    output reg q
);
    always @(posedge clk) 
        begin
            q <= d;
        end
    
    always @(negedge clk)
        begin
            q <= q;
        end
endmodule

module Register (
    input wire clk,
    input wire we,
    input wire [11:0] data,
    output wire [11:0] out
);
    wire myclk;
    and (myclk, clk, we);
    DFF d  [11:0] (myclk, data, out);
endmodule

module RegisterFile (
    input wire clk,
    input wire we,
    input [2:0] read1Addr,
    input [2:0] read2Addr,
    input [2:0] writeAddr,
    input [11:0] writeData,
    output wire [11:0] readData1,
    output wire [11:0] readData2
);
    wire [7:0] we_all;

    Demux d (writeAddr, we, we_all);

    wire [11:0][7:0] val;
    Register myreg [7:0] (clk, we_all, writeData, val);

    MUX8 m1 [11:0] (readData1, read1Addr, val);
    MUX8 m2 [11:0] (readData2, read2Addr, val);
endmodule

// 12 bit register
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

// register file with 8 registers, 2 read port, and 1 write port
// module Registers (
//     input wire clk,
//     input [2:0] read1Addr,
//     input [2:0] read2Addr,
//     input [2:0] writeAddr,
//     input [11:0] writeData,
//     output wire [11:0] readData1,
//     output wire [11:0] readData2
// );
//     reg [7:0] myreg;
//     initial 
//         begin
//             myreg[0] = 12'b000000000000;
//             myreg[1] = 12'b000000000001;
//             myreg[2] = 12'b000000000010;
//             myreg[3] = 12'b000000000011;
//             myreg[4] = 12'b000000000100;
//             myreg[5] = 12'b000000000101;
//             myreg[6] = 12'b000000000110;
//             myreg[7] = 12'b000000000111;
//         end
    


//     MUX8 [7:0] mux1(
//         .res(readData1),
//         .sel(read1Addr),
//         .in(myreg)
//     );

//     MUX8 [7:0] mux2(
//         .res(readData2),
//         .sel(read2Addr),
//         .in(myreg)
//     );

//     always @(posedge clk)
//         begin
//             myreg[writeAddr] <= writeData;
//         end
// endmodule
