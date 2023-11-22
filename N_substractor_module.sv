module N_substractor_module #(parameter int n = 32)(
    input logic [n-1:0] A,
    input logic [n-1:0] B,
    output logic [n-1:0] z,
    output logic Cout,
    output logic negative_flag,
    output logic zero_flag,
    output logic overflow_flag
);

    reg [n:0] carry_out_intermediate=0;
	 logic flag = 0;
	 reg [n-1:0] complemento =0;
    
    // Instancias de sumadores de 1 bit
    genvar i;
    generate
		for (i = 0; i < n; i = i + 1) begin: loop_01
			substractor_module res(
				.a(A[i]),
				.b(B[i]),
				.cin(carry_out_intermediate[i]),
				.z(complemento[i]),
            .cout(carry_out_intermediate[i+1])
			);
		end
		assign Cout = carry_out_intermediate[n];
    endgenerate
	 
	 always @(*) begin
		if (Cout ==1) begin
			flag= 0;
			for (int i = 0; i < n; i = i + 1) begin
				if (flag) begin 
					z[i]= ~complemento[i];
				end else begin 
					z[i]= complemento[i];
					if (z[i]==1 && flag == 0) begin 
						flag = 1;
					end
				end
			end
			$display("Num: %b Compl: %b", z, complemento);
		end else begin
			for (int i = 0; i < n; i = i + 1) begin
				z[i]= complemento[i];
			end
		end
	end

    assign negative_flag = Cout;
    assign zero_flag = (z == 0);
    assign overflow_flag = (A[n-1] == 1 && B[n-1] == 0 && z[n-1] == 0) || (A[n-1] == 0 && B[n-1] == 1 && z[n-1] == 1);


endmodule
