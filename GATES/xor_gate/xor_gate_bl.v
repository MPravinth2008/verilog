module xor_gate_bl(
    input A,
    input B,
    output reg Y
);
always @(*)
begin 
Y = A^B;
end
endmodule