module mux2 #(parameter WIDTH = 32)(a,b,s,y);
 input s;
 input[WIDTH-1:0] a,b;
 output[WIDTH-1:0] y;
	
 assign y = (s == 0)?a:b;

endmodule

module mux3 #(parameter WIDTH = 32)(a,b,c,s,y);
 input[1:0] s;
 input[WIDTH-1:0] a,b,c;
 output[WIDTH-1:0] y;
	
 assign y = (s == 2'b00)?a:(s == 2'b01)?b:c;

endmodule

module mux4 #(parameter WIDTH = 32)(a,b,c,d,s,y);
 input[1:0] s;
 input[WIDTH-1:0] a,b,c,d;
 output[WIDTH-1:0] y;

 assign y = (s == 2'b00)?a:(s == 2'b01)?b:(s == 2'b10)?c:d;

endmodule
