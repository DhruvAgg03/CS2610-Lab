`timescale 1ns/1ns
`include "RegisterFile.v"
`include "ALU.v"

module CPU(
    input wire [11:0] instruction
);
    reg clk;
    reg [2:0] read1Addr;
    reg [2:0] read2Addr;
    reg [2:0] writeAddr;
    reg [11:0] writeData;
    wire [11:0] readData1;
    wire [11:0] readData2;
    Registers r(clk, read1Addr, read2Addr, writeAddr, writeData, readData1, readData2);
    wire [2:0] opcode = instruction[11:9];
    wire [11:0] result;
    ALU a(opcode, readData1, readData2, result);
    always @(instruction)
        begin
            clk = 0;
            writeAddr = instruction[8:6];
            read1Addr = instruction[5:3];
            read2Addr = instruction[2:0];
            // #1
            clk = 1;
            // #1
            // operand1 = readData1;
            // operand2 = readData2;
            // #1
            writeData = result;
            // #1
            clk = 0;
            // #1
            clk = 1;            
        end
endmodule