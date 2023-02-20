module integrated(
  input wire[11:0] x,
  input wire[11:0] y,
  input wire sub,
  output wire[11:0] result
);

  wire XeLTYe;
  wire [3:0] XeminusYe;
  ExpDiff DifferenceExponent(XeLTYe,XeminusYe,x[10:7],y[10:7]);

  wire Zs,MAS;
  ZandMASgen GenerateZMAS(result[11],MAS,XeLTYe,x[11],y[11],sub);

  wire[7:0]Pm;
  wire[7:0]Qm;
  MantissaAlign AlignMantissas(x[6:0],y[6:0],XeminusYe,XeLTYe,Pm,Qm);

  wire[8:0] Sm;
  MantissaAdder MA(Pm,Qm,MAS,Sm);

  NormandExpGen Final(result[10:7],result[6:0],XeLTYe,x[10:7],y[10:7],Sm);

endmodule
  
  
