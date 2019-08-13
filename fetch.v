module fetch(
		input clk,
		input[1:0] bubble,
		input rst,
		input Zero,
		input Jump,
		input Branch_beq,
		input Branch_bne,
		input Bgez,
		input Bgtz,
		input Blez,
		input Bltz,
		input zBgez,
		input zBgtz,
		input Jalr,
		input Jal,
		input[31:0] pre_PC,
		input[15:0] imm16,
		input[25:0] target,
		input[31:0] bus_rs,

		output[31:0] inst,
		output[31:0] PC
		);
		

	wire[31:0] NPC;
	pc pc(NPC, clk, bubble, rst, PC);
	
	im im(PC[11:2], inst);
	
	npc npc(PC, pre_PC, target, imm16, bus_rs, Branch_beq, Branch_bne, Bgez, Bgtz, Blez, Bltz, zBgez, zBgtz, Jalr, Jal, Zero, Jump, NPC);

endmodule
