module not_gate_bl(
    input A,
    output reg Y
);
    always @(*) begin
        Y = ~A;
    end
endmodule
