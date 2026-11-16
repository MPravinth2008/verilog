module demux_1to4_bl(
    input D,
    input S0,
    input S1,
    output reg Y0,
    output reg Y1,
    output reg Y2,
    output reg Y3
);

always @(*)
begin

Y0 = D & ~S0 & ~S1;
Y1 = D & ~S0 & S1;
Y2 = D & S0 & ~S1;
Y3 = D & S0 & S1;

end
endmodule