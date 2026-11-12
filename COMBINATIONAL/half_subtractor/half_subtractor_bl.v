module half_subtractor_bl(
    input A,
    input B,
    output reg Diff,
    output reg Borr
);
always @(*)
begin
Diff = A^B;
Borr = ~A&B;
end
endmodule