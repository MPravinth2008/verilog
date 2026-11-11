module xnor_gate_dfl(
    input A,
    input B,
    output Y
);
assign Y = ~(A^B);
endmodule