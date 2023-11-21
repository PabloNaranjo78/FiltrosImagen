module N_fulladder_module #(parameter N=32) (
    input [N-1:0] a,
    input [N-1:0] b,
    input cin,
    output [N-1:0] sum,
    output cout,
    output carry_flag,
    output overflow_flag,
    output zero_flag
);

wire [N:0] carries;
  genvar i;


generate 
    for (i = 0; i < N; i = i + 1) begin: nadder
        fulladder_module s1 (.a(a[i]), .b(b[i]), .cin(carries[i]), .sum(sum[i]), .cout(carries[i+1]));
    end
endgenerate
//	 assign result[N] = carries[N];


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

