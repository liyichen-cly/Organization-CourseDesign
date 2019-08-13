module regfile(Rs,Rt,Rw, test_addr, busW,clk,busA,busB, hi_out, lo_out, test_data, RegWr, mflo, mfhi, mtlo, mthi, mult, mult_result);
	input clk,RegWr, mflo, mfhi, mtlo, mthi, mult;
 	input[4:0] Rs,Rt,Rw, test_addr;
 	input[31:0] busW;
	input[63:0] mult_result;
 	output[31:0] busA,busB, hi_out, lo_out;
	output reg [31:0]test_data;

 	reg [31:0] regs[31:0];
	reg[31:0] hi,lo;
 
 	initial
 	begin
		regs[0] = 0;
	end
	assign busA = mflo?hi:mfhi?lo:regs[Rs];
	assign busB = regs[Rt];
	assign hi_out = hi;
	assign lo_out = lo;
	
	always @(*)
		begin
	        case (test_addr)
            5'd1 : test_data <= regs[1 ];
            5'd2 : test_data <= regs[2 ];
            5'd3 : test_data <= regs[3 ];
            5'd4 : test_data <= regs[4 ];
            5'd5 : test_data <= regs[5 ];
            5'd6 : test_data <= regs[6 ];
            5'd7 : test_data <= regs[7 ];
            5'd8 : test_data <= regs[8 ];
            5'd9 : test_data <= regs[9 ];
            5'd10: test_data <= regs[10];
            5'd11: test_data <= regs[11];
            5'd12: test_data <= regs[12];
            5'd13: test_data <= regs[13];
            5'd14: test_data <= regs[14];
            5'd15: test_data <= regs[15];
            5'd16: test_data <= regs[16];
            5'd17: test_data <= regs[17];
            5'd18: test_data <= regs[18];
            5'd19: test_data <= regs[19];
            5'd20: test_data <= regs[20];
            5'd21: test_data <= regs[21];
            5'd22: test_data <= regs[22];
            5'd23: test_data <= regs[23];
            5'd24: test_data <= regs[24];
            5'd25: test_data <= regs[25];
            5'd26: test_data <= regs[26];
            5'd27: test_data <= regs[27];
            5'd28: test_data <= regs[28];
            5'd29: test_data <= regs[29];
            5'd30: test_data <= regs[30];
            5'd31: test_data <= regs[31];
            default : test_data <= 32'd0;
        endcase
   end

	always@ (negedge clk)
	begin
		if(mtlo) lo = busW;
		else if(mthi) hi = busW;
		else if(RegWr) regs[Rw] = busW;
		
		if(mult) begin hi = mult_result[63:32]; lo = mult_result[31:0];end
	end

endmodule


 
 