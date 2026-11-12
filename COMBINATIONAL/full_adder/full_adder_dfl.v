module full_adder_dfl(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);
assign sum = A^B^C;
assign carry = (A&B)|(B&Cin)|(A&Cin);
endmodule