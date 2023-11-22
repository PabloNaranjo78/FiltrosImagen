module top_module(input logic clk, rst,
						input logic  str,
						output[31:0] q,
						output[14:0] address);
						
logic wren;

logic[7:0] data, addr_wr;

ram1 mem(address,clk, data, wren, q);
write_mem write (str, wren, addr_wr, data);


endmodule
