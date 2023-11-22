module write_mem(input str,
                output enable,
                output[14:0] addr,
                output[31:0] data);

always @(str) begin

    if(str) begin

        enable = 1'b1;
        addr = 14'd20000;
        data = 31'd1;

        end
        else begin
        enable = 1'b1;
        addr = 14'd20000;
        data = 31'd0;
        end


    
end



endmodule 