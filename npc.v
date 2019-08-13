module npc (PC, pre_PC, Target, imm16,  bus_rs, Branch_beq, Branch_bne, Bgez, Bgtz, Blez, Bltz, zBgez, zBgtz, Jalr, Jal, Zero, Jump, NPC);
    input [31:0] bus_rs;
    input [31:0] PC, pre_PC;
    input [25:0] Target;
    input [15:0] imm16;
    input  Branch_beq, Branch_bne, Bgez, Bgtz, Blez, Bltz, zBgez, zBgtz, Zero, Jump, Jalr, Jal;
    
    output [31:0] NPC;
    
    wire [29:0] imm30;
    wire [31:0] imm32;                       
    SignExt #(16, 30) SignExt30 (imm16, imm30);
    assign imm32 = {imm30, 2'b00};
    
    wire [31:0] NormalNPC = PC + 4;
    wire [31:0] BranchNPC = pre_PC + 4 + imm32;
    wire [31:0] JumpNPC = {pre_PC[31:28], Target, 2'b00};
    
    assign NPC = Jump ?  JumpNPC : 
		Jal ? JumpNPC:
		Jalr ? bus_rs: 
		(Branch_beq&&Zero) ? BranchNPC : 
		(Branch_bne&&!Zero)?BranchNPC : 
		(Bgez && zBgez)?BranchNPC:
		(Bltz && !zBgez)?BranchNPC:
		(Bgtz && zBgtz)?BranchNPC:
		(Blez && !zBgtz)?BranchNPC:NormalNPC;


endmodule