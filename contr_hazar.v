module contr_hazar(
		input clk,
		input Jump,
		input Branch_beq,
		input Branch_bne,
		input Zero,
		input Bgez,
		input Bgtz,
		input Blez,
		input Bltz,
		input zBgez,
		input zBgtz,
		input Jalr,
		input Jal,
		
		output reg[1:0] bubble
    );


	 initial
		bubble = 0;

	always @(posedge clk)
	begin
		if(Jump && bubble == 0) bubble = 3;
		else if(Branch_beq && Zero && bubble == 0) bubble = 3;
		else if(Branch_bne && !Zero && bubble == 0)  bubble = 3;
		else if(Bgez && zBgez && bubble == 0) bubble = 3;
		else if(Bltz && !zBgez && bubble == 0) bubble = 3;
		else if(Bgtz && zBgtz && bubble == 0) bubble = 3;
		else if(Blez && !zBgtz && bubble == 0) bubble = 3;	
		else if(bubble == 0 && Jalr) bubble = 3;
		else if(bubble == 0 && Jal) bubble = 3;
		else if(bubble != 2'b00) bubble = bubble - 1;
		else bubble = 0;
	end
	
endmodule
