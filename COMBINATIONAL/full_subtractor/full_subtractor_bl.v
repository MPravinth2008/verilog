module full_subtractor_bl(
    input A,
    input B,
    input C,
    output reg Diff,
    output reg Borr
);
always @(*)
begin
Diff = A^B^C;
Borr = (~A&B )|( ~A&C )|( B&C );
end
endmodule