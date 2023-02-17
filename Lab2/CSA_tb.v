`timescale 1ns/100ps

module CSA_tb();

	reg[7:0] A,B;
	wire [7:0]	result;
	wire ovflow;
	reg sign;

	CSA CCC (A, B, sign, result, ovflow);

	
	
	initial begin
		//case unsigned no ovflow
		$display("unsigned case, no overflow");
		A = 8'b00011000;
		B = 8'b00001001;
		sign = 0;
		$dumpfile("CSA_tb.vcd");
		$dumpvars(0,CSA_tb);
		
		#20
		$display("A = %x, B = %x, RESULT = %b, Ovflow = %x",A,B,result,ovflow);
		$display("Ans should be RESULT = 11011000, Ovflow = 0");


		//case unsigned no ovflow
		$display("unsigned case, no overflow");
		A = 8'b00001100;
		B = 8'b00001101;
		sign = 0;
		
		#20
		$display("A = %x, B = %x, RESULT = %b, Ovflow = %x",A,B,result,ovflow);
		$display("Ans should be RESULT = 10011100, Ovflow = 0");

		
		//case unsigned with ovflow
		$display("unsigned case, with overflow");
		A = 8'b00011000;
		B = 8'b00001101;
		sign = 0;	
		
		#20
		$display("A = %x, B = %x, RESULT = %b, Ovflow = %x",A,B,result,ovflow);
		$display("Ans should be RESULT = 100111000, Ovflow = 1");

		//case signed no overflow, positive pair
		$display("signed case, no overflow, both positive");
		A = 8'b00001001;
		B = 8'b00001101;
		sign = 1;
		
		#20
		$display("A = %x, B = %x, RESULT = %b, Ovflow = %x",A,B,result,ovflow);
		$display("Ans should be RESULT = 01110101, Ovflow = 0");

		//case signed no overflow, positive and negative
		$display("signed case, no overflow, positive * negative");
		A = 8'b00001001;
		B = 8'b11110011;
		sign = 1;

		
		#20
		$display("A = %x, B = %x, RESULT = %b, Ovflow = %x",A,B,result,ovflow);
		$display("Ans should be RESULT = 10001011, Ovflow = 0");

		//case signed no overflow, negative and positive
		$display("signed case, no overflow, negative * positive");
		A = 8'b11110011;
		B = 8'b00001001;
		sign = 1;

		
		#20
		$display("A = %x, B = %x, RESULT = %b, Ovflow = %x",A,B,result,ovflow);
		$display("Ans should be RESULT = 10001011, Ovflow = 0");


		//case signed no overflow, both negative
		$display("signed case, no overflow, both negative");
		A = 8'b11110011;
		B = 8'b11110111;
		sign = 1;

		
		#20
		$display("A = %x, B = %x, RESULT = %b, Ovflow = %x",A,B,result,ovflow);
		$display("Ans should be RESULT = 01110101, Ovflow = 0");


		//case signed overflow, same sign
		$display("signed case, with overflow, same sign");
		A = 8'b00010111;
		B = 8'b00011110;
		sign = 1;

		
		#20
		$display("A = %x, B = %x, RESULT = %b, Ovflow = %x",A,B,result,ovflow);
		$display("Ans should be RESULT = 10110010, Ovflow = 1");

		//case signed overflow, opposite sign
		$display("signed case, with overflow, opposite sign");
		A = 8'b00010111;
		B = 8'b11100010;
		sign = 1;

		
		#20
		$display("A = %x, B = %x, RESULT = %b, Ovflow = %x",A,B,result,ovflow);
		$display("Ans should be RESULT = 01001110, Ovflow = 1");
		
		
	end
endmodule