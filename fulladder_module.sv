module fulladder_module (input a, input b, input cin, output sum, output cout);

    logic p, g;

    assign p = a ^ b;
    assign g = a & b;

    assign sum = p ^ cin;
    assign cout = g | (p & cin);

            
endmodule

module sumador(input logic a, b, cin, output logic z,cout);

	wire [2:0] v;
	
	xor xor1(v[0],a,b);
	xor xor2(z,v[0],cin);
	and and1(v[1],cin,v[0]);
	and and2(v[2],a,b);
	or or1(cout,v[1],v[2]);

endmodule