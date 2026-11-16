module demux_1to4_dfl(
    input D,
    input S0,
    input S1,
    output Y0,Y1,Y2,Y3
);
assign Y0 = D & ~S0 & ~S1;
assign Y1 = D & ~S0 & S1;
assign Y2 = D & S0 & ~S1;
assign Y3 = D & S0 & S1;

endmodule