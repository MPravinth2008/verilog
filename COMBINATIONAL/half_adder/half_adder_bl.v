module half_adder_bl(
    input A,
    input B,
    output reg sum,
    output reg carry
);
always @(*)
begin
sum = A^B;
carry = A&B;
end
endmodule