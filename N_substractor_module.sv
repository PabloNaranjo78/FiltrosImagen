module N_substractor_module #(parameter int N = 32)(
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    output logic [N-1:0] z,
    output logic cout,
    output logic negative_flag,
    output logic zero_flag
);

    reg [N:0] carryaux = 0;
    logic flag = 0;
    reg [N-1:0] comp = 0;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : loop_01
            restador res(
                .a(a[i]),
                .b(b[i]),
                .cin(carryaux[i]),
                .z(comp[i]),
                .cout(carryaux[i+1])
            );
        end
        assign cout = carryaux[N];
    endgenerate

    always_comb begin
        if (cout == 1) begin
            flag = 0;
            for (int i = 0; i < N; i = i + 1) begin
                if (flag) begin 
                    z[i] = ~comp[i];
                end else begin 
                    z[i] = comp[i];
                    if (z[i] == 1 && flag == 0) begin 
                        flag = 1;
                    end
                end
            end
        end else begin
            for (int i = 0; i < N; i = i + 1) begin
                z[i] = comp[i];
            end
        end

        // Flags
        negative_flag = flag;
        zero_flag = (&z == 0);
    end

endmodule
