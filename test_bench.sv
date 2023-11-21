module test_bench();

// Parámetros del sumador
    logic [4:0] a;
    logic [4:0] b;
    logic [4:0] result;

    // Instanciar el módulo bajo prueba (reemplaza "nsumador" con el nombre correcto de tu módulo)
    nsumador modulo(.a(a), .b(b), .result(result));

    // Inicializar las señales de entrada antes del bloque initial
    initial begin
        a = 4'b0000; // Valores iniciales de a
        b = 4'b0000; // Valores iniciales de b
    end

    // Bloque de prueba
    initial begin
        // Realiza operaciones de prueba aquí
        
        // Por ejemplo, puedes cambiar los valores de a y b aquí y verificar el resultado
        a = 4'b0001; // Valores iniciales de a
        b = 4'b0000;
        
        // Espera un tiempo antes de verificar el resultado
        #10;

        // Verificar el resultado
        if (result == 4'b0010) begin
            $display("Prueba pasada: resultado es correcto");
        end else begin
            $display("Prueba fallida: resultado incorrecto");
        end

        // Terminar la simulación
   
    end


endmodule 