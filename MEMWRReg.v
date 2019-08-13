module MEMWRReg(
		input clk,
		input MemtoReg_in,
		input RegWr_in,
		input[31:0] Dout_in,
		input[31:0] Result_in,
		input[31:0] PC_in,
		input[4:0] rw_in,
		input Overflow_in,
		input mtlo_in,
		input mthi_in,
		input mult_in,
		input[63:0] mult_result_in,
		

		output reg[31:0] Dout,
		output reg[31:0] Result,
		output reg[31:0] PC,
		output reg[4:0] rw,
		output reg Overflow,
		output reg MemtoReg,
		output reg RegWr,
		output reg mtlo,
		output reg mthi,
		output reg mult,
		output reg[63:0] mult_result
    );

	initial
	begin
	Dout = Dout_in;
	Result = Result_in;
	rw = rw_in;
	Overflow = 0;
	MemtoReg = 0;
	RegWr = 0;
	mtlo = 0;
	mthi = 0;
	mult = 0;
	PC = 0;
	end
	
	always @(posedge clk)
	begin
	Dout = Dout_in;
	Result = Result_in;
	rw = rw_in;
	Overflow = Overflow_in;
	MemtoReg = MemtoReg_in;
	RegWr = RegWr_in;
	mtlo = mtlo_in;
	mthi = mthi_in;
	PC = PC_in;
	mult_result = mult_result_in;
	mult = mult_in;
	end
	

endmodule
