module testALU(
    );
	 
	reg[4:0] ALUctr;
	reg[31:0] A, B, B_PC;
	reg[4:0] shif;
	wire[31:0] Result;
	wire Zero, Bgez, Bgtz;
	 
	ALU alu(ALUctr, A, B, B_PC, shif, Result, Zero, Bgez, Bgtz);
	
	initial
	begin
	ALUctr = 5'd0;
	A = 32'h00000010;
	B = 32'h000c0000;
	//shif = 5'd16;
	end
	
	always #100 ALUctr = ALUctr + 1; 
	
endmodule
