module MAR #(
    parameter PC_Width = 4
) 
(
    input wire i_clk,
    input wire i_lm,

    input wire [PC_Width-1:0] i_addr,
    
    output reg [PC_Width-1:0] o_addr
);

    always @(posedge i_clk) begin
        if (i_lm) begin
            o_addr <= i_addr;
        end        

    end
endmodule