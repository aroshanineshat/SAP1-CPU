module PC 
#(parameter PC_WIDTH=4)
(
    input wire i_clk,
    input wire i_cp,
    input wire i_clr,
    input wire i_ep,

    output reg [PC_WIDTH-1:0] o_pc
); 
    
    reg [PC_WIDTH-1:0] pc_value;

    initial begin
        pc_value = 0;
    end

    always @(posedge i_clk) begin
        if (i_clr) begin
            pc_value <= 0;
        end else if (i_cp) begin
            pc_value <= pc_value + 1;
        end
        if (i_ep) begin
            o_pc = pc_value;
        end else begin
            o_pc = {PC_WIDTH{1'dz}};
        end
    end
endmodule