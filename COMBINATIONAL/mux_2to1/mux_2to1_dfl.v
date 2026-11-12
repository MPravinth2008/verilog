module mux_2to1_dfl(
    input A,
    input B,
    input S,
    output Y
);
assign Y = (~S&A)| (S&B);
endmodule
