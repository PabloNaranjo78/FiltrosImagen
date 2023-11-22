module alu_module(
    input logic [31:0] SrcA, SrcB,
    input logic [1:0] AluControl,
    output logic [31:0] ALUResult,
    output logic [3:0] ALUFlags
);

    logic [31:0] and_result, or_result, sum_result, subs_result;
    logic flag_carry_add, flag_ov_add, flag_zero_add, flag_neg_sub, flag_zero_sub, flag_ov_sub;

    N_fulladder_module #(32) full_adder_inst(
        .A(SrcA),
        .B(SrcB),
        .Sum(sum_result),
        .carry_flag(flag_carry_add),
        .overflow_flag(flag_ov_add),
        .zero_flag(flag_zero_add)
    );

    N_substractor_module #(32) subtractor_inst(
        .A(SrcA),
        .B(SrcB),
        .z(subs_result),
        .Cout(flag_carry_add), // Reuse the carry flag from the adder for subtraction
        .negative_flag(flag_neg_sub),
        .zero_flag(flag_zero_sub),
        .overflow_flag(flag_ov_sub)
    );

    N_and_module #(32) and_inst(
        .a(SrcA),
        .b(SrcB),
        .z(and_result)
    );

    N_or_module #(32) or_inst(
        .a(SrcA),
        .b(SrcB),
        .z(or_result)
    );

    always_comb begin
        case (AluControl)
            2'b00: begin
                ALUResult = sum_result;
                ALUFlags = {flag_neg_sub, flag_zero_add, flag_carry_add, flag_ov_add};
            end
            2'b01: begin
                ALUResult = subs_result;
                ALUFlags = {flag_neg_sub, flag_zero_sub, flag_carry_add, flag_ov_sub}; 
            end
            2'b10: begin
                ALUResult = and_result;
                ALUFlags = {flag_neg_sub, flag_zero_add, 1'b0, 1'b0}; 
            end
            2'b11: begin
                ALUResult = or_result;
                ALUFlags = {flag_neg_sub, flag_zero_add, 1'b0, 1'b0};
            end
            default: begin
                ALUResult = sum_result;
                ALUFlags = {flag_neg_sub, flag_zero_add, flag_carry_add, flag_ov_add};
            end
        endcase
    end

endmodule
