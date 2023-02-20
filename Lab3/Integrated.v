`timescale 1ns/100ps

`include "ZandMASGenerator.v"
`include "ExponentDiffGen.v"
`include "MantissaAlign.v"
`include "MantissaAdder.v"
`include "NormandExpGen.v"

module integrated(
  input wire[11:0] x,
  input wire[11:0] y,
  input wire sub,
  output wire[11:0] result
);

  wire XeLTYe;
  wire [3:0] XeminusYe;
  ExpDiff DifferenceExponent(XeLTYe,XeminusYe,x[5:1],y[5:1]);

  wire Zs,MAS;
  ZandMASgen GenerateZMAS(result[0],MAS,XeLTYe,x[0],y[0],sub);

  wire[7:0]Pm;
  wire[7:0]Qm;
  MantissaAlign AlignMantissas(x[11:5],y[11:5],XeminusYe,XeLTYe,Pm,Qm);

  wire[8:0] Sm;
  MantissaAdder MA(Pm,Qm,MAS,Sm);

  NormandExpGen Final(result[4:1],result[11:5],XeLTYe,x[4:1],y[4:1],Sm);

endmodule
  
  