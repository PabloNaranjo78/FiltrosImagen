module N_fulladder_module #(parameter n=32) (
    input logic [n-1:0] A,
    input logic [n-1:0] B,
    output logic [n-1:0] Sum,
    output carry_flag,
    output overflow_flag,
    output zero_flag
);



reg [n:0] carry_out_intermediate=0;
    
    // Instancias de sumadores de 1 bit
    genvar i;
    generate
        for (i = 0; i < n; i = i + 1) begin: loop_01
            fulladder_module sum(
                .A(A[i]),
                .B(B[i]),
                .Cin(carry_out_intermediate[i]),
					 .Sum(Sum[i]),
                .Cout(carry_out_intermediate[i+1])
            );
        end
    endgenerate
	
	
	// Flags
	assign carry_flag = carry_out_intermediate[n];
  assign overflow_flag = carry_out_intermediate[n];
	assign zero_flag = (Sum == 0) & carry_flag == 0;
	


endmodule


