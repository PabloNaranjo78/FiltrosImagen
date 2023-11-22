module top_module(input logic clk, rst,
						input logic  str,
						output[31:0] q,
						output[14:0] address,
                        output logic [7:0] VGA_R, VGA_G, VGA_B,
	                    output logic VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK);
						
logic wren;

logic[7:0] data, addr_wr;

ram2 mem(address,clk, data, wren, q);
write_mem write (str, wren, addr_wr, data);
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


endmodule
