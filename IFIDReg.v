module IFIDReg(
	input clk,
	input[1:0] bubble,
	input[31:0] PC_in,
	input[31:0] inst_in,
	
	output reg[31:0] inst,
	output reg[31:0] PC
    );
	 

	 always @(posedge clk)
	 begin
		if(bubble == 2'b00)
		begin
		inst = inst_in;
		PC = PC_in;
		end
	 end
endmodule
