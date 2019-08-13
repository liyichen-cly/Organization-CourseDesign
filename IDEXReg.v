module IDEXReg(
		input clk,
		input[1:0] bubble,
		input[31:0] PC_in,
		input[25:0] target_in,
		input[15:0] imm16_in,
		input[31:0] busA_in,
		input[31:0] busB_in,
		input[4:0] rs_in,
		input[4:0] rt_in,
		input[4:0] rd_in,
		input[4:0] shf_in,
		input[4:0] rw_exe,
		input[4:0] rw_mem,
		input[31:0] result_exe,
		input[31:0] result_mem,
		

		input Branch_beqin,
		input Branch_bnein,
		input Jump_in,
		input RegDst_in,
		input ALUSrc_in,
		input MemtoReg_in,
		input RegWr_in,
		input MemWr_in,
		input ExtOp_in,
		input[4:0] ALUCtr_in,
		input Bgez_in,
		input Bgtz_in,
		input Blez_in,
		input Bltz_in,
		input Jalr_in,
		input B_in,
		input LB_in,
		input Jal_in,
		input mflo_in,
		input mfhi_in,
		input mtlo_in,
		input mthi_in,
		input MemRead_in,
		input mult_in,
		
		output reg Branch_beq,
		output reg Branch_bne,
		output reg Jump,
		output reg RegDst,
		output reg ALUSrc,
		output reg MemtoReg,
		output reg RegWr,
		output reg MemWr,
		output reg ExtOp,
		output reg[4:0] ALUCtr,
		output reg[31:0] busA,
		output reg[31:0] busB,
		output reg[4:0] rs,
		output reg[4:0] rt,
		output reg[4:0] rd,
		output reg[4:0] shf,
		output reg[15:0] imm16,
		output reg[25:0] target,
		output reg[31:0] PC,
		output reg Bgez,
		output reg Bgtz,
		output reg Blez,
		output reg Bltz,
		output reg Jalr,
		output reg B,
		output reg LB,
		output reg Jal,
		output reg mflo,
		output reg mfhi,
		output reg mtlo,
		output reg mthi,
		output reg MemRead,
		output reg mult
    );

	initial
	begin
		mult = 0;
		Branch_beq = 0;
		Branch_bne = 0;
		Jump <= 0;
		RegDst <= 0;
		ALUSrc <= 0;
		MemtoReg <= 0;
		RegWr <= 0;
		ExtOp <= 0;
		MemWr = 0;
		ALUCtr <= 5'b111111;
		Bgez = 0;
		Bgtz = 0;
		Blez = 0;
		Bltz = 0;
		Jalr = 0;
		B = 0;
		LB = 0;
		Jal = 0;
		busA = busA_in;
		busB = busB_in;
		rs = rs_in;
		rt = rt_in;
		rd = rd_in;
		shf = 0;
		imm16 = imm16_in;
		target = target_in;
		mflo = 0;
		mfhi = 0;
		mtlo = 0;
		mthi = 0;
		MemRead = 0;
	end

	
	 always @(posedge clk)
	 begin
		if(bubble == 2'b00)
		begin
		mult = mult_in;
		B = B_in;
		LB = LB_in;
		Jalr = Jalr_in;
		PC = PC_in;
		Branch_beq = Branch_beqin;
		Branch_bne = Branch_bnein;
		Jump = Jump_in;
		RegDst = RegDst_in;
		ALUSrc = ALUSrc_in;
		MemtoReg = MemtoReg_in;
		RegWr = RegWr_in;
		ExtOp = ExtOp_in;
		MemWr = MemWr_in;
		ALUCtr <= ALUCtr_in;
		MemRead = MemRead_in;
		
		if(Jalr_in && rs_in==rw_exe) busA = result_exe;
		else if(Jalr_in && rs_in==rw_mem) busA = result_mem;
		else busA = busA_in;
		
		if(rt_in==rw_exe) busB = result_exe;
		else if(rt_in==rw_mem) busB = result_mem;
		else busB = busB_in;
		
		rs = rs_in;
		rt = rt_in;
		rd = rd_in;
		shf = shf_in;
		imm16 = imm16_in;
		target = target_in;
		Bgez = Bgez_in;
		Bgtz = Bgtz_in;
		Blez = Blez_in;
		Bltz = Bltz_in;
		Jal = Jal_in;
		mflo = mflo_in;
		mfhi = mfhi_in;
		mtlo = mtlo_in;
		mthi = mthi_in;
		end
		else
		begin
		Jump = 0;
		Branch_beq = 0;
		Branch_bne = 0;
		RegWr = 0;
		MemWr = 0;
		Bgez = 0;
		Bgtz = 0;
		Blez = 0;
		Bltz = 0;
		//rs = 0;
		//rt = 0;
		Jalr = 0;
		B = 0;
		LB = 0;
		Jal = 0;
		mflo = 0;
		mfhi = 0;
		mtlo = 0;
		mthi = 0;
		MemRead = 0;
		mult = 0;
		end
		if(Jal==1) begin RegWr = 1; rt = 31; RegDst = 0; end
	end
endmodule
