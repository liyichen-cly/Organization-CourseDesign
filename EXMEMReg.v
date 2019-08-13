module EXMEMReg(
		input clk,
		input MemWr_in,
		input Branch_beqin,
		input Branch_bnein,
		input Jump_in,
		input MemtoReg_in,
		input RegWr_in,
		input Zero_in,
		input Overflow_in,
		input[1:0] bubbles,     
		input[4:0] rw_in,
		input[31:0] PC_in,
		input[31:0] Result_in,
		input[31:0] busA_in,
		input[31:0] busB_in,
		input[25:0] target_in,
		input[15:0] imm16_in,
		input[63:0] mult_result_in,
		input Bgez_in,
		input Bgtz_in,
		input Blez_in,
		input Bltz_in,
		input zBgez_in,
		input zBgtz_in,
		input Jalr_in,
		input B_in,
		input LB_in,
		input Jal_in,
		input mtlo_in,
		input mthi_in,
		input mult_in,
		

		output reg MemWr,
		output reg Branch_beq,
		output reg Branch_bne,
		output reg Jump,
		output reg MemtoReg,
		output reg RegWr,
		output reg Zero,
		output reg Overflow,
		output reg[4:0] rw,
		output reg[31:0] PC,
		output reg[31:0] Result,
		output reg[31:0] busA,
		output reg[31:0] busB,
		output reg[25:0] target,
		output reg[15:0] imm16,
		output reg[63:0] mult_result,
		output reg Bgez,
		output reg Bgtz,
		output reg Blez,
		output reg Bltz,
		output reg zBgez,
		output reg zBgtz,
		output reg Jalr,
		output reg B,
		output reg LB,
		output reg Jal,
		output reg mtlo,
		output reg mthi,
		output reg mult
    );

	
	initial
	begin
		MemWr = 0 ;
		Branch_beq = 0;
		Branch_bne = 0;
		MemtoReg = 0;
		RegWr = 0;
		Zero =  0;
		Overflow = 0;
		rw = rw_in;
		Result = Result_in;
		busB = busB_in;
		target = target_in;
		imm16 = imm16_in;
		Jump = 0;
		Bgez = 0;
		Bgtz = 0;
		Blez = 0;
		Bltz = 0;
		zBgez = 0;
		zBgtz = 0;
		Jalr = 0;
		B = 0;
		LB = 0;
		Jal = 0;
		mult = 0;
		mtlo = 0;
		mthi = 0;
	end
	 
	 always @(posedge clk)
	 begin
		if(bubbles == 2'b00)
		begin
		PC = PC_in;
		MemWr = MemWr_in;
		Branch_beq = Branch_beqin;
		Branch_bne = Branch_bnein;
		MemtoReg = MemtoReg_in;
		RegWr = RegWr_in;
		Zero = Zero_in;
		Overflow = Overflow_in;
		rw = rw_in;
		Result = Result_in;
		busA = busA_in;
		busB = busB_in;
		target = target_in;
		imm16 = imm16_in;
		Jump = Jump_in;
		Bgez = Bgez_in;
		Bgtz = Bgtz_in;
		Blez = Blez_in;
		Bltz = Bltz_in;
		zBgez = zBgez_in;
		zBgtz = zBgtz_in;
		Jalr = Jalr_in;
		B = B_in;
		LB = LB_in;
		Jal = Jal_in;
		mtlo = mtlo_in;
		mthi = mthi_in;
		mult = mult_in;
		mult_result = mult_result_in;
		end
		else 
		begin RegWr = 0; MemWr = 0; Branch_beq = 0; Branch_bne = 0;  Jump = 0; Zero = 0; rw = 0; mult = 0;
		Bgez = 0;Bgtz = 0; Blez = 0;Bltz = 0; zBgez = 0; zBgtz = 0;Jalr=0; B=0; LB=0; Jal = 0;mtlo = 0;mthi = 0; end 
	 end
		
endmodule