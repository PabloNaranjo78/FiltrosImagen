module top_module( input [7:0] a, input [7:0] b, input cin, output [8:0] sum, output cout);

    N_fulladder_module #(32) fulladder0 (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));


endmodule
