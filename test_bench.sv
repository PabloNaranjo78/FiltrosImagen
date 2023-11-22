module test_bench();

    reg [3:0] A_input;
    reg [3:0] B_input;
    wire [3:0] Sum_output;
    wire carry_flag, overflow_flag, zero_flag;

    // Instanciar el módulo SumaNBits
    N_fulladder_module #(4) dut (
        .A(A_input),
        .B(B_input),
        .Sum(Sum_output),
        .carry_flag(carry_flag),
        .overflow_flag(overflow_flag),
        .zero_flag(zero_flag)

    );

    // Generar estímulos
    initial begin
        $display("A\tB\tSum\tCout");
        $monitor("%b\t%b\t%b\t%b", A_input, B_input, Sum_output, carry_flag);

        // Prueba 1
        A_input = 4'b0101;
        B_input = 4'b1100;
        #40;
		  
		  $display("A\tB\tSum\tCout");
        $monitor("%b\t%b\t%b\t%b", A_input, B_input, Sum_output, carry_flag);
		  
        // Prueba 1
        A_input = 4'b1111;
        B_input = 4'b1111;
        #40;
		  
		  $display("A\tB\tSum\tCout");
        $monitor("%b\t%b\t%b\t%b", A_input, B_input, Sum_output, carry_flag);

        // Prueba 1
        A_input = 4'b1010;
        B_input = 4'b1111;
        #40;
		  
		  $display("A\tB\tSum\tCout");
        $monitor("%b\t%b\t%b\t%b", A_input, B_input, Sum_output, carry_flag);

        // Prueba 1
        A_input = 4'b000;
        B_input = 4'b000;
        #40;
		  
		  
    end

endmodule 