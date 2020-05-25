module ACC #(
    parameter DataWidth = 8
)
(
    input wire i_la,
    input wire i_clk,
    input wire i_ea,

    input wire [DataWidth-1:0] i_data,

    output reg [DataWidth-1:0] o_dataToBUS,
    output reg [DataWidth-1:0] o_dataToALU
);

    reg [DataWidth-1:0] ACC_Reg;

    initial begin
        ACC_Reg = 0;
    end

    always @(posedge i_clk) begin
        o_dataToALU <= ACC_Reg;
        if (i_ea) begin
            o_dataToBUS = ACC_Reg;
        end else begin
            o_dataToBUS = {DataWidth{1'dz}};
        end
        if (i_la) begin
            ACC_Reg <= i_data;
        end
    end


endmodule

