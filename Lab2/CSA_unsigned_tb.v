`timescale 1ns/100ps

module CSA_tb();

	reg[7:0] A,B;
	wire [7:0]result;
	reg sign;
	wire ovflow;
	CSA_unsigned C(A,B,result,ovflow);
	
	initial begin
		//case unsigned no ovflow
		$display("unsigned case, no overflow");
		A = 8'b00011000;
		B = 8'b00001001;
		sign = 0;
		$dumpfile("CSA_multiplier_tb.vcd");
		$dumpvars(0,CSA_tb);
		
		
		
		#20
		$display("A = %x, B = %x, RESULT = %x, Ovflow = %x",A,B,result,ovflow);
		$display("Ans should be RESULT = 11011000, Ovflow = 0");
		
		//case unsigned with ovflow
		$display("unsigned case, with overflow");
		A = 8'b00011000;
		B = 8'b00001101;
		sign = 0;
		$dumpfile("CSA_multiplier_tb.v");
		$dumpvars(0,CSA_tb);
		
		
		
		#20
		$display("A = %x, B = %x, RESULT = %x, Ovflow = %x",A,B,result,ovflow);
		$display("Ans should be RESULT = 100111000, Ovflow = 1");
		
		
	end
endmodule		
