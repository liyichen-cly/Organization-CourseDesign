module mem(
		input clk,
		input MemWr,
		input Overflow_in,
		input B,
		input LB,
		input[4:0] rw_in,
		input[31:0] mem_addr,
		input[31:0] Result_in,
		input[31:0] busB,
		
		output[31:0] Dout,
		output[31:0] Result,
		output[31:0] mem_data,
		output[4:0] rw,
		output Overflow
    );
	

	dm dm(Result, mem_addr, busB, MemWr, clk, Dout, mem_data, B, LB);
	
	assign Result = Result_in;
	assign Overflow = Overflow_in;
	assign rw = rw_in;

endmodule
