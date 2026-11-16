module demux_1to2_dfl(
    input D,
    input S,
    output Y0,
    output Y1
);
assign Y0 = D & ~S;
assign Y1 = D & S;
endmodule
