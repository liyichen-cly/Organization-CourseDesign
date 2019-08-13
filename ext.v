module ext #(parameter WIDTH = 16, ExtWIDTH = 32)
    (ExtOp, in, out);
    input ExtOp;
    input [WIDTH-1:0] in;
    output [ExtWIDTH-1:0] out;
    
    assign out = ExtOp ?{{ExtWIDTH-WIDTH{in[WIDTH-1]}}, in} : {{ExtWIDTH-WIDTH{1'b0}}, in};
    
endmodule

module SignExt #(parameter WIDTH = 16 , ExtWIDTH = 32)(in , out);
	input [WIDTH-1:0] in;
	output [ExtWIDTH-1:0] out;

	assign out = {{(ExtWIDTH-WIDTH){in[WIDTH-1]}},in};
endmodule
