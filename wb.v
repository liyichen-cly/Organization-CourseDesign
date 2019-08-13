module wb(
	input[31:0] Dout,
	input[31:0] Result,
	input MemtoReg,
	
	output wire[31:0] Din
    );
	 
	 mux2 mux(Result,Dout,MemtoReg,Din);
 
endmodule
