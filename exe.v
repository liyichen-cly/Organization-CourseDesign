module exe(
		input clk,
		input[15:0] imm16_in,
		input[31:0] busA_in,
		input[31:0] busB_in,
		input[4:0] rt_in,
		input[4:0] rd_in,
		input[25:0] target_in,
		input[31:0] Result_from_mem,
		input[31:0] Result_from_wr,
		input[31:0] pre_PC,
		input[4:0] shf,
		

		input Jump_in,
		input RegDst_in,
		input[1:0] ALUSrc_A,
		input[1:0] ALUSrc_B,
		input MemtoReg_in,
		input RegWr_in,
		input MemWr_in,
		input ExtOp_in,
		input mult_in,
		input[4:0] ALUCtr_in,
		
		output MemWr,
		output Jump,
		output MemtoReg,
		output RegWr,
		output Zero,
		output Overflow, 
		output[4:0] rw,
		output[31:0] Result,
		output[25:0] target,
		output[15:0] imm16,
		output[31:0] busB,
		output Bgez,
		output Bgtz,
		output[63:0] mult_result
    );

	 mux2 #5 mux1(rt_in, rd_in, RegDst_in, rw);
	 
	 wire[31:0] imm32;
	 ext ext(ExtOp_in, imm16_in, imm32);
	 
	 wire[31:0] A,B; 
	 mux4 mux2(busB_in, Result_from_mem, Result_from_wr, imm32, ALUSrc_B, B);
	 mux3 mux3(busA_in, Result_from_mem, Result_from_wr, ALUSrc_A, A);
	 
	 ALU ALU(ALUCtr_in, A, B, pre_PC, shf, Result, Zero, Bgez, Bgtz, mult_in, mult_result);
	 
	 assign MemWr = MemWr_in;
	 assign MemtoReg = MemtoReg_in;
	 assign RegWr = RegWr_in;
	 assign target = target_in;
	 assign imm16 = imm16_in;
	 assign busB = busB_in;
	 assign Jump = Jump_in;

endmodule
