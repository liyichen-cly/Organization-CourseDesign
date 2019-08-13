module load_use(
	input clk,
	input MemRead,
	input[4:0] rs_id,
	input[4:0] rt_id,
	input[4:0] rt_ex,
	input Bgez,
	input Bgtz,
	input Blez,
	input Bltz,
	input zBgez,
	input zBgtz,
	input Jalr,
	input Jal,
	input Zero,
	input Jump,
	input Branch_beq,
	input Branch_bne,
	output reg[1:0] bubble
    ); 
	 
	initial
		bubble = 0;

	always @(negedge clk)
	begin
		if(MemRead && (rs_id==rt_ex || rt_id==rt_ex) && bubble == 0) bubble = 1;
		else if(bubble !=0 ) bubble = bubble - 2'b01;
		else bubble = 0;
		if( Jump || (Branch_bne&&!Zero) || (Branch_beq&&Zero) ||Jalr || Jalr || (Bgez && zBgez) || (Bltz && !zBgez) || (Bgtz && zBgtz) || (Blez && !zBgtz)) bubble=0;
	end

endmodule
