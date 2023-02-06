`timescale 1ns/1ns

module CLA(sum,carry,A,B,P,G);
	input wire [3:0]A;
	input wire [3:0]B;
	output wire[3:0]sum;
	output carry;
	output wire[3:0] P;
	output wire[3:0]G;
	
	assign P = p;
	assign G = g;
	wire [3:0]p;
	wire [3:0]g;
	and And[3:0](g[3:0],A[3:0],B[3:0]);
	xor Xor[3:0](p[3:0],A[3:0],B[3:0]);
	
	
	wire[3:0]c;
	
	assign c[0] = 0;
	and(p0c0,p[0],c[0]);
	or(c[1],p0c0,g[0]);
	
	and(p1p0c0,p[1],p[0],c[0]);
	and(p1g0,p[1],g[0]);
	or(c[2],p1p0c0,p1g0,g[1]);
	
	and(p2p1p0c0,p[2],p[1],p[0],c[0]);
	and(p2p1g0,p[2],p[1],g[0]);
	and(p2g1,p[2],g[1]);
	or(c[3],p2p1p0c0,p2p1g0,p2g1,g[2]);
	
	and(p3p2p1p0c0,p[3],p[2],p[1],p[0],c[0]);
	and(p3p2p1g0,p[3],p[2],p[1],g[0]);
	and(p3p2g1,p[3],p[2],g[1]);
	and(p3g2,p[3],g[2]);
	or(carry,p3p2p1p0c0,p3p2p1g0,p3p2g1,p3g2,g[3]);
	
	xor XOR[3:0](sum,p,c);
	
endmodule

/*
module CLA16(sum,carry,A,B);
	input wire[15:0]A;
	input wire [15:0]B;
	output wire[15:0] sum;
	output carry;
	
	wire carry1,carry2,carry3;
	CLA cla1(sum[3:0],carry1,A[3:0],B[3:0])
	*/
