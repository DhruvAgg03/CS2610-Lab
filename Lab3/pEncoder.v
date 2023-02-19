module PEncoder (
  input wire[7:0] s,
  output wire[2:0] l
);
  
  not(s1bar,s[1]);
  not(s2bar,s[2]);
  not(s3bar,s[3]);
  not(s5bar,s[5]);
  or(l[2],s[3],s[2],s[1],s[0]);

  or(s45,s[5],s[4]);
  and(m1,s45,s3bar,s2bar);
  or(l[1],m1,s[1],s[0]);

  and(m2,s3bar,s5bar,s[6]);
  and(m3,s3bar,s[4]);
  or(m4,m2,m3,s[2]);
  and(m5,m4,s1bar);
  or(l[0],m5,s[0]);
endmodule
