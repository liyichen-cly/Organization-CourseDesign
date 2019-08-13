module ALU(ALUctr, A, B, B_PC, shif, Result, Zero, Bgez, Bgtz, mult_in, mult_result);
	input[4:0] ALUctr;
	input[31:0] A, B, B_PC;
	input[4:0] shif;
	input mult_in;
	output[31:0] Result;
	output Zero, Bgez, Bgtz;
	output[63:0] mult_result;
    wire[4:0] shf;
    assign shf = (ALUctr==5'b01101)?A[4:0]:shif;
    wire [1:0] shf_1_0;
    wire [1:0] shf_3_2;
    assign shf_1_0 = shf[1:0];
    assign shf_3_2 = shf[3:2];

	wire [31:0] sra_step1;
	wire [31:0] sra_step2;
	wire[31:0] sra_result;
  	assign sra_step1 = {32{shf_1_0 == 2'b00}} & B 
                     | {32{shf_1_0 == 2'b01}} & {B[31], B[31:1]}          
                     | {32{shf_1_0 == 2'b10}} & {{2{B[31]}}, B[31:2]}      
                     | {32{shf_1_0 == 2'b11}} & {{3{B[31]}}, B[31:3]};     
  	assign sra_step2 = {32{shf_3_2 == 2'b00}} & sra_step1                               
                     | {32{shf_3_2 == 2'b01}} & {{4{sra_step1[31]}}, sra_step1[31:4]}  
                     | {32{shf_3_2 == 2'b10}} & {{8{sra_step1[31]}}, sra_step1[31:8]}    
                     | {32{shf_3_2 == 2'b11}} & {{12{sra_step1[31]}}, sra_step1[31:12]};
  	assign sra_result = shf[4] ? {{16{sra_step2[31]}}, sra_step2[31:16]} : sra_step2;  
	
	assign Result = (ALUctr==5'b00000)?A + B:
						(ALUctr==5'b00001)?A - B:
						(ALUctr==5'b00010)?(A[31]==1&&B[31]==0) || (A[31]==0&&B[31]==0&&A[30:0]<B[30:0]) || (A[31]==1&&B[31]==1&&A[30:0]>B[30:0]):
						(ALUctr==5'b00011)?A & B:
						(ALUctr==5'b00100)? ~(A | B):
						(ALUctr==5'b00101)?A | B:
						(ALUctr==5'b00110)?A ^ B:
						(ALUctr==5'b00111)?B << shif:
						(ALUctr==5'b01000)?B >> shif:
						(ALUctr==5'b01001)?{B[15:0], 16'b0 }:
						(ALUctr==5'b01010)?A < B:
						(ALUctr==5'b01011)?B << A:
						(ALUctr==5'b01100)?sra_result:
						(ALUctr==5'b01101)?sra_result:
						(ALUctr==5'b01110)?B >> A:
						(ALUctr==5'b01111)?B_PC +  4:
						(ALUctr==5'b10000)?A:0;
						
	assign Zero = (Result == 0);
	assign Bgez = (A[31]==0);
	assign Bgtz = (A[31]==0&&A[30:0]>0);
	
	multiply mul(mult, A, B, mult_result);

endmodule