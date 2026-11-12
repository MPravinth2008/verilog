module full_adder_bl(
    input A,
    input B,
    input Cin,
    output reg Sum;
    output reg Carry;
);
always @(*)
begin
Sum = A^B^Cin