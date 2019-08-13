module pipeline_cpu(   input clk, 
					input resetn,
					input[4:0]   rf_addr,
					input[31:0] mem_addr,
					output[31:0] rf_data,
					output[31:0] mem_data,
					output[31:0] IF_pc,
					output[31:0] IF_inst,
					output[31:0] ID_pc,
					output[31:0] EXE_pc,
					output[31:0] MEM_pc,
					output[31:0] WB_pc,
					output[31:0] HI_data,
					output[31:0] LO_data  );
							

	wire Zero_4,Jump_4, Branch_beq4, Branch_bne4, Bgez_4, Bgtz_4, Blez_4, Bltz_4, zBgez_4, zBgtz_4, Jalr_4, Jal_4;
	wire[1:0] bubble;
	wire [15:0] imm16_4;
	wire[25:0] target_4;
	wire[31:0] inst_0, PC_0, pre_PC, bus_rs;
	assign IF_pc = PC_0;
	assign IF_inst = inst_0 ;
	fetch fetch(clk, bubble, resetn, Zero_4, Jump_4, Branch_beq4, Branch_bne4, Bgez_4, Bgtz_4, Blez_4, Bltz_4, zBgez_4, zBgtz_4, Jalr_4, Jal_4, pre_PC, imm16_4, target_4, bus_rs, inst_0, PC_0);

	wire[31:0] inst_1, PC_1;
	IFIDReg IFIDReg(clk, bubble, PC_0, inst_0, inst_1, PC_1);
	
	wire[31:0] busW,busA_1,busB_1;
	wire[63:0] mult_result_6;
	wire[25:0] target_1;
	wire[15:0] imm16_1;
	wire[4:0] rd_1,rs_1,rt_1,rw_6,shf_1, ALUCtr_1;
	wire B_1, LB_1, Jalr_1, Jal_1, Branch_beq1, Branch_bne1, Jump_1,RegDst_1,ALUSrc_1,MemtoReg_1, mtlo_6, mthi_6, mult_1; 
	wire RegWr_1,MemWr_1,ExtOp_1,RegWr_6, MemRead_1, Bgez_1, Bgtz_1, Blez_1, Bltz_1, mflo_1, mfhi_1, mtlo_1, mthi_1, mult_6;
	decode decode(clk, inst_1, busW, rw_6, rf_addr, RegWr_6, mtlo_6, mthi_6, mult_6, mult_result_6, imm16_1, busA_1, busB_1, rs_1, rt_1, rd_1, shf_1, target_1,
					Branch_beq1, Branch_bne1, Jump_1, RegDst_1, ALUSrc_1, MemtoReg_1, RegWr_1, MemWr_1,
					ExtOp_1, ALUCtr_1,MemRead_1, Bgez_1, Bgtz_1, Blez_1, Bltz_1, Jalr_1, B_1, LB_1, Jal_1, mflo_1, mfhi_1, mtlo_1, mthi_1, mult_1, HI_data, LO_data, rf_data);
	assign ID_pc = PC_1;
								
	
	wire B_2, LB_2, Jalr_2, Jal_2, Branch_beq2, Branch_bne2, Jump_2, RegDst_2, ALUSrc_2, MemtoReg_2, mult_2;
	wire RegWr_2, MemWr_2, ExtOp_2, Bgez_2, Bgtz_2, Blez_2, Bltz_2, mflo_2, mfhi_2, mtlo_2, mthi_2, MemRead_2;
	wire[31:0] busA_2, busB_2, PC_2, Result_3, Result_5;
	wire[25:0] target_2;
	wire[15:0] imm16_2;
	wire[4:0] rt_2,rd_2,rs_2,shf_2, ALUCtr_2, rw_3, rw_5;
	IDEXReg IDEXReg(clk, bubble, PC_1, target_1, imm16_1, busA_1, busB_1, rs_1, rt_1, rd_1, shf_1, rw_3, rw_5, Result_3, Result_5,
							Branch_beq1, Branch_bne1, Jump_1, RegDst_1, ALUSrc_1, MemtoReg_1, RegWr_1, MemWr_1, ExtOp_1, 
								ALUCtr_1, Bgez_1, Bgtz_1, Blez_1, Bltz_1, Jalr_1, B_1, LB_1, Jal_1, mflo_1, mfhi_1, mtlo_1, mthi_1, MemRead_1, mult_1, Branch_beq2, Branch_bne2, Jump_2, RegDst_2, ALUSrc_2, MemtoReg_2, RegWr_2, MemWr_2, ExtOp_2, 
									ALUCtr_2, busA_2, busB_2, rs_2, rt_2, rd_2, shf_2, imm16_2, target_2, PC_2, Bgez_2, Bgtz_2, Blez_2, Bltz_2, Jalr_2, B_2, LB_2, Jal_2, mflo_2, mfhi_2, mtlo_2, mthi_2, MemRead_2, mult_2);
								
								
	

	wire MemWr_3, MemtoReg_3, RegWr_3, Zero_3, Overflow_3,Jump_3, zBgez_3, zBgtz_3;
	wire[31:0] Result_4, busB_3;
	wire[25:0] target_3;
	wire[15:0] imm16_3;
	wire[1:0] ALUSrc_A, ALUSrc_B;
	wire[63:0] mult_result_3;
	assign EXE_pc = PC_2;
	exe exe(clk, imm16_2, busA_2, busB_2, rt_2, rd_2, target_2, Result_4, busW, PC_2, shf_2, Jump_2, RegDst_2,
					ALUSrc_A, ALUSrc_B, MemtoReg_2, RegWr_2, MemWr_2, ExtOp_2, mult_2, ALUCtr_2, MemWr_3, Jump_3, MemtoReg_3, RegWr_3, 
					Zero_3, Overflow_3, rw_3, Result_3, target_3, imm16_3, busB_3, zBgez_3, zBgtz_3, mult_result_3);
	

	wire MemWr_4, MemtoReg_4, RegWr_4, Overflow_4, B_4, LB_4, mtlo_4, mthi_4, mult_4;
	wire[1:0] bubbles;
	wire[4:0] rw_4;
	wire[31:0] busB_4;
	wire[63:0] mult_result_4;
	EXMEMReg EXMEMReg(clk, MemWr_3, Branch_beq2, Branch_bne2, Jump_3, MemtoReg_3, RegWr_3, Zero_3, Overflow_3, bubbles, rw_3, PC_2, Result_3, busA_2,
							busB_3, target_3, imm16_3, mult_result_3, Bgez_2, Bgtz_2, Blez_2, Bltz_2, zBgez_3, zBgtz_3, Jalr_2, B_2, LB_2, Jal_2, mtlo_2, mthi_2, mult_2, MemWr_4, Branch_beq4, Branch_bne4, Jump_4, MemtoReg_4, RegWr_4, Zero_4, Overflow_4, 
							rw_4, pre_PC, Result_4, bus_rs, busB_4, target_4, imm16_4, mult_result_4, Bgez_4, Bgtz_4, Blez_4, Bltz_4, zBgez_4, zBgtz_4, Jalr_4, B_4, LB_4, Jal_4, mtlo_4, mthi_4, mult_4);
							
	

	wire Overflow_5;
	wire[31:0] Dout_5;
	assign MEM_pc = pre_PC;
	mem mem(clk, MemWr_4, Overflow_4, B_4, LB_4, rw_4, mem_addr, Result_4, busB_4, Dout_5, Result_5, mem_data,  rw_5, Overflow_5);
	
	wire[31:0] Dout_6, Result_6, PC_6;
	wire  MemtoReg_6,Overflow_6;
	MEMWRReg MEMWRReg(clk, MemtoReg_4, RegWr_4, Dout_5, Result_5, pre_PC, rw_5, Overflow_5, mtlo_4, mthi_4, mult_4,
							mult_result_4, Dout_6, Result_6, PC_6, rw_6, Overflow_6, MemtoReg_6, RegWr_6, mtlo_6, mthi_6, mult_6, mult_result_6);
	
	wb wb(Dout_6, Result_6, MemtoReg_6, busW);
	assign WB_pc = PC_6;

	forwarding forwarding(rs_2, rt_2, rw_4, rw_6, RegWr_4, RegWr_6, ALUSrc_2, mflo_2, mfhi_2, mtlo_4, mthi_4, mtlo_6, mthi_6, ALUSrc_A, ALUSrc_B);
	
	load_use load_use(clk, MemRead_2, rs_1, rt_1, rt_2, Bgez_4, Bgtz_4, Blez_4, Bltz_4, zBgez_4, zBgtz_4, Jalr_4, Jal_4,  Zero_4, Jump_4, Branch_beq4, Branch_bne4, bubble);

	contr_hazar contr_hazar(clk, Jump_3, Branch_beq2, Branch_bne2, Zero_3, Bgez_2, Bgtz_2, Blez_2, Bltz_2, zBgez_3, zBgtz_3, Jalr_2, Jal_2, bubbles);

endmodule

