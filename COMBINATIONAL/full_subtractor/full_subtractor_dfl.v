module full_subtractor_dfl(
    input A,
    input B,
    input C,
    output Diff,
    output Borr
);
assign Diff = A^B^C ;
assign Borr = (~A&B) |( ~A&C )|( B&C );
endmodule