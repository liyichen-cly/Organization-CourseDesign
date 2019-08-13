module decode(
		input clk,
		input[31:0] inst,
		input[31:0] busW,
		input[4:0] rw,
		input[4:0] rf_addr,
		input RegWr_in,
		input mtlo_in,
		input mthi_in,
		input mult_in,
		input[63:0] mult_result,
		
		output[15:0] imm16,
		output[31:0] busA,
		output[31:0] busB,
		output[4:0] rs,
		output[4:0] rt,
		output[4:0] rd,
		output[4:0] shf,
		output[25:0] target,
		
		output Branch_beq,
		output Branch_bne,
		output Jump,
		output RegDst,
		output ALUSrc,
		output MemtoReg,
		output RegWr,
		output MemWr,
		output ExtOp,
		output[4:0] ALUCtr,
		output MemRead,
		output Bgez,
		output Bgtz,
		output Blez,
		output Bltz,
		output Jalr,
		output B,
		output LB,
		output Jal,
		output mflo,
		output mfhi,
		output mtlo,
		output mthi,
		output mult,
		output[31:0] hi,
		output[31:0] lo,
		output[31:0] rf_data 
    );
	 
	 wire[5:0] op;
	 wire[5:0] func;
	 
	 assign op = inst[31:26];
	 assign rs = inst[25:21];
	 assign rt = inst[20:16];
	 assign rd = inst[15:11];
	 assign shf = inst[10:6]; 
	 assign func = inst[5:0];
	 assign imm16 = inst[15:0];
	 assign target = inst[25:0];
	 
	 regfile rf(rs,rt,rw,rf_addr,busW,clk,busA,busB,hi,lo, rf_data, RegWr_in, mflo, mfhi, mtlo_in, mthi_in, mult_in, mult_result);
	 
	 ctrl ctrl(op, func, rt, Branch_beq, Branch_bne, Jump, RegDst, ALUSrc, ALUCtr, MemtoReg, RegWr, MemWr, ExtOp, MemRead, Bgez, Bgtz, Blez, Bltz, Jalr,B,LB, Jal, mflo, mfhi, mtlo, mthi, mult);
	 
endmodule
