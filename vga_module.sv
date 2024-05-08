module vga_module(
    input logic clk,
    output logic VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK,
    output logic [7:0] VGA_R, VGA_G, VGA_B
);

    vga v(
        .clk(clk),
        .vgaclk(VGA_CLK),
        .hsync(VGA_HS),
        .vsync(VGA_VS),
        .sync_b(VGA_SYNC_N),
        .blank_b(VGA_BLANK_N),
        .r(VGA_R),
        .g(VGA_G),
        .b(VGA_B)
    );

endmodule

module vga(
    input logic clk,
    output logic vgaclk, // 25.175 MHz VGA clock
    output logic hsync, vsync,
    output logic sync_b, blank_b, // To monitor & DAC
    output logic [7:0] r, g, b
); // To video DAC
    logic [9:0] x, y;
    clockDivider vgapll(clk, vgaclk);
    vgaController vgaCont(vgaclk, hsync, vsync, sync_b, blank_b, x, y);
    videoGen videoGen(vgaclk,x, y, r, g, b);
endmodule

module vgaController #(
    parameter HACTIVE = 10'd640,
    HFP = 10'd16,
    HSYN = 10'd96,
    HBP = 10'd48,
    HMAX = HACTIVE + HFP + HSYN + HBP,
    VBP = 10'd32,
    VACTIVE = 10'd480,
    VFP = 10'd11,
    VSYN = 10'd2,
    VMAX = VACTIVE + VFP + VSYN + VBP
)(
    input logic vgaclk,
    output logic hsync, vsync, sync_b, blank_b,
    output logic [9:0] hcnt, vcnt
);
    // counters for horizontal and vertical positions
    always @(posedge vgaclk) begin
        hcnt++;
        if (hcnt == HMAX) begin
            hcnt = 0;
            vcnt++;
            if (vcnt == VMAX) vcnt = 0;
        end
    end
    // Compute sync signals (active low)
    assign hsync = ~(hcnt >= HACTIVE + HFP & hcnt < HACTIVE + HFP + HSYN);
    assign vsync = ~(vcnt >= VACTIVE + VFP & vcnt < VACTIVE + VFP + VSYN);
    assign sync_b = hsync & vsync;
    // Force outputs to black when outside the legal display area
    assign blank_b = (hcnt < HACTIVE) & (vcnt < VACTIVE);
endmodule

module videoGen(
    input logic clk,
    input logic [9:0] x, y,
    output logic [7:0] r, g, b
);
    logic [9:0] x0, y0;
    logic [31:0] img;

    assign x0 = (x < 100) ? x : 0;
    assign y0 = (y < 100) ? y : 0;

    // Llamada la ram
    ram3 mem (
        .address((y0*100 + x0)),
        .clock(clk),
        .data(32'h0),
        .wren(0),
        .q(img)
    );

    assign r = (x < 100) & (y < 100) ? img : 8'hFF;
    assign g = (x < 100) & (y < 100) ? img : 8'h00;
    assign b = (x < 100) & (y < 100) ? img : 8'hFF;
	 
	 

endmodule


module clockDivider (clock_in, clock_out);
	input clock_in;
	output reg clock_out;
	reg [27:0] counter = 28'd0;
	parameter DIVISOR = 28'd2;
	
	always @ (posedge clock_in)
		begin 
			counter <= counter + 28'd1;
			if (counter >= (DIVISOR - 1))
			counter <= 28'd0;
			clock_out <= (counter<DIVISOR/2) ? 1'b1 : 1'b0;
		end  

endmodule 