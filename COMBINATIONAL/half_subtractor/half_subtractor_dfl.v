module half_subtractor_dfl(
    input A,
    input B,
    output Diff,
    output Borr
);
assign Diff = A^B;
assign Borr = ~A&B;
endmodule