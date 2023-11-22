module N_fulladder_module #(parameter n=32) (
    input logic [n-1:0] A,
    input logic [n-1:0] B,
    output logic [n-1:0] Sum,
    output logic Cout,
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
	
	assign Cout = carry_out_intermediate[n];


    // Flags
   // assign carry_flag = cout_intermediate[N-1];
   // assign overflow_flag = |(sum_intermediate > (2**N-1));
    //assign zero_flag = (&sum == 0);

endmodule

module nsumador #(parameter N = 4) (
  input logic [N-1:0] a,
  input logic [N-1:0] b,
  output logic [N-1:0] result,
  output logic carryOut
  
);

  wire [N:0] carries;
  genvar i;

  generate 
    for (i = 0; i < N; i = i + 1)
     begin: nadder
      sumador s1 (.a(a[i]), .b(b[i]), .cin(carries[i]), .z(result[i]), .cout(carries[i+1]));
        end
    endgenerate
//	 assign result[N] = carries[N];
	 assign carryOut = carries[N];
	 

endmodule

