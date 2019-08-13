module multiply(
input mult,
input [31:0] mult_op1,
input [31:0] mult_op2,
output reg [63:0] mult_result);
	always @(*)
	begin
   if(mult)
	begin
		mult_result = mult_op1 * mult_op2;
	end
	end
endmodule

