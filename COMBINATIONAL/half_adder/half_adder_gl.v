module half_adder_gl(
    input A,
    input B,
    output sum,
    output carry
);
xor(sum,A,B);
and(carry,A,B);
endmodule
