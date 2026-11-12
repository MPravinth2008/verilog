
module full_adder_gl(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);
wire x1, x2, x3, x4;
xor (x1, A, B);
xor (Sum, x1, Cin);
and (x2, A, B);
and (x3, A, Cin);
and (x4, B, Cin);
or (Cout, x2, x3, x4);
endmodule