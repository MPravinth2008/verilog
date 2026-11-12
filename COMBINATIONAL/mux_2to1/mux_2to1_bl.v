module mux_2to1_bl(
    input A,
    input B,
    input S,
    output reg Y
);
always @(*)
begin
Y = (~S&A)|(S&B);
end
endmodule
