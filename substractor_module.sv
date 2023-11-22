module substractor_module(input logic a,b,cin, output logic z,cout);

	assign z = a ^ (b ^ cin);
	assign cout =  (~a & b) + (~a & cin) + (b & cin);

endmodule