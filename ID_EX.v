module ID_EX(
input clk,
input multiply,
input mthi,mtlo, mfhi, mflo, mtc0, mfc0, syscall, eret,rf_wen,
input [11:0] alu_control,
input [31:0] alu_operand1, alu_operand2,
input  [3:0] con_memrw,
input [31:0] store_data,
input [7:0] cp0r_addr, 
input [4:0] rf_wdest,
input [31:0] ID_pc,

output reg [31:0] EXE_mult, EXE_mthi, EXE_mtlo, EXE_mfhi,EXE_mflo,EXE_mtc0,EXE_mfc0,EXE_syscall,EXE_eret,EXE_rf_wen,
output reg [11:0] EXE_alu_control,
output reg [31:0] EXE_alu_operand1,EXE_alu_operand2,
output reg [3:0] EXE_con_memrw,
output reg EXE_store_data,
output reg [7:0]EXE_cp0r_addr,
output reg [4:0] EXE_rf_wdest,
output reg [31:0] EXE_pc
);

always @(posedge clk)
begin
EXE_mult=multiply;
 EXE_mthi=mthi;
EXE_mtlo=mtlo;
 EXE_mfhi=mfhi;
EXE_mflo=mflo;
EXE_mtc0=mtc0;
EXE_mfc0=mfc0;
EXE_syscall=syscall;
EXE_eret=eret;
EXE_rf_wen=rf_wen;
EXE_alu_control=alu_control;
 EXE_alu_operand1=alu_operand1;
EXE_alu_operand2=alu_operand2;
 EXE_con_memrw=con_memrw;
 EXE_store_data=store_data;
EXE_cp0r_addr=cp0r_addr;
 EXE_rf_wdest=rf_wdest;
 EXE_pc=ID_pc;
end
endmodule
