module imem(
	input logic [31:0] a,
	output logic [31:0] rd
);
	
	logic [31:0] ROM[63:0];
	
	
	initial
		$readmif("rom_data1.mif",ROM);
		assign rd = ROM[a[31:2]]; // word aligned
endmodule
