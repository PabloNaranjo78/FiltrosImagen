module top_module(
    input logic clock,
    output logic [7:0] VGA_R, VGA_G, VGA_B,
	output logic VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK
     
     );

    vga_module vga_module(
        .clk(clock),
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .VGA_BLANK_N(VGA_BLANK_N),
        .VGA_SYNC_N(VGA_SYNC_N),
        .VGA_CLK(VGA_CLK)
    );
//    N_fulladder_module #(32) fulladder0 (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));


endmodule
