module pc (NPC, clk, bubble, rst, PC);
	input [31:0] NPC;
	input clk, rst;
	input[1:0] bubble;
 
   output reg [31:0] PC;

    	initial
    		begin
    	    		PC = 32'h0000_0000 - 4;
    		end

    	always@(posedge clk)
    		begin
			if(bubble == 2'b00)
    		    PC <= rst == 0? 32'h0000_0000 : NPC;
    		end
endmodule  