module dm(addr, mem_addr, din, we, clk, dout, mem_data, B, ExtOp) ;
	input   [31:0]  addr ;  
	input   [31:0]  din ;   
	input   [31:0]   mem_addr;
	input           we ;    
	input           clk ;  
	input           ExtOp;
	input           B;
	output  [31:0]  dout ; 
	output  [31:0]   mem_data;
	
	reg [31:0]  dm[127:0] ;
	integer i;

	wire[1:0] s;
	wire[31:0] dout_0, dout_1, dout_2, dout_3;
	
	assign s = addr[1:0]; 
	ext #(8,32) ext(ExtOp , dm[addr[31:2]][7:0], dout_0);
	ext #(8,32) ext1(ExtOp , dm[addr[31:2]][15:8], dout_1);
	ext #(8,32) ext2(ExtOp , dm[addr[31:2]][23:16], dout_2);
	ext #(8,32) ext3(ExtOp , dm[addr[31:2]][31:24], dout_3);


	assign dout = (!B)?dm[addr[31:2]]: 
				(s==2'b00)?dout_0:
				(s==2'b01)?dout_1:
				(s==2'b10)?dout_2:dout_3;
	assign mem_data = dm[mem_addr[31:2]];

	initial
	begin
		for(i = 0; i < 1024; i=i+1) dm[i] = 32'b0;
    	end 
	
    	always@(negedge clk)
    	    if (we)
			if(B && s == 2'b00) 
    	        		dm[addr[31:2]][7:0] <= din[7:0];
			else if(B && s == 2'b01)
    	        		dm[addr[31:2]][15:8] <= din[7:0];
			else if(B && s == 2'b10)
    	        		dm[addr[31:2]][23:16] <= din[7:0];
			else if(B && s == 2'b11)
    	        		dm[addr[31:2]][31:24] <= din[7:0];
			else dm[addr[31:2]] <= din;

endmodule