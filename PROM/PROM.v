module PROM #(
    parameter AddressWidth = 4,
    parameter WordWidth    = 8
) (
    input wire i_er,
    input wire [AddressWidth-1:0] i_mar,

    output reg [WordWidth-1:0] o_word
);

    localparam AddressCount = 2**AddressWidth;
    
    reg [WordWidth-1:0]  Mem [AddressCount-1:0] ;

    initial begin
        $readmemh("memory.hex", Mem);
    end 

    always @(i_er) begin
        if (i_er) begin
            o_word = Mem[i_mar];
        end else begin
            o_word = {WordWidth{1'bz}};
        end
    end
endmodule