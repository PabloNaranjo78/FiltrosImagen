module N_and_module #(parameter N = 32) (
						
						input logic [N-1:0] a, b,
						output logic [N-1:0] z);
						
						
		assign z = a & b;



endmodule 