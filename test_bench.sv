module test_bench();
/*
    reg [3:0] A;
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
*/

 // Declaración de señales de prueba
  logic [3:0] A;
  logic [3:0] B;
  logic Cin;
  logic [3:0] resta;
  logic Cout, zero_flag, negative_flag;
  
  // Instancia del módulo bajo prueba
  N_substractor_module uut (
    .A(A),
    .B(B),
    .z(resta),
    .Cout(Cout),
    .negative_flag(negative_flag),
    .zero_flag(zero_flag)
  );

  // Inicialización de señales
  initial begin



        // Prueba 1
        A = 4'b0101;
        B = 4'b1100;
        #40;
		  

		  
        // Prueba 1
        A = 4'b1111;
        B = 4'b1111;
        #40;
		  


        // Prueba 1
        A = 4'b1010;
        B = 4'b1111;
        #40;
		  


        // Prueba 1
        A = 4'b0001;
        B = 4'b0010;
        #40;
		  
		  // Prueba 1
        A = 4'b0001;
        B = 4'b0011;
        #40;
		  
		  // Prueba 1
        A = 4'b0001;
        B = 4'b0100;
        #40;
		  
		  // Prueba 1
        A = 4'b0001;
        B = 4'b0110;
        #40;
		  // Prueba 1
        A = 4'b0001;
        B = 4'b0111;
        #40;
		  
		  // Prueba 1
        A = 4'b0010;
        B = 4'b0011;
        #40;
		  
		  // Prueba 1
        A = 4'b0010;
        B = 4'b0100;
        #40;
		  
		  // Prueba 1
        A = 4'b0010;
        B = 4'b0110;
        #40;
		  // Prueba 1
        A = 4'b0010;
        B = 4'b0111;
        #40;

		  
		  // Prueba 1
        A = 4'b0011;
        B = 4'b0100;
        #40;
		  
		  // Prueba 1
        A = 4'b0011;
        B = 4'b0110;
        #40;
		  // Prueba 1
        A = 4'b0011;
        B = 4'b0111;
        #40;
    
  end

endmodule 