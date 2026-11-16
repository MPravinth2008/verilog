module mux_8to1_dfl(
    input I0,
    input I1,
    input I2,
    input I3,
    input I4,
    input I5,
    input I6,
    input I7,
    input S0,
    input S1,
    input S2,
    output Y
);
assign Y = (I0 & ~S0 & ~S1 & ~S2) | ( I1 & ~S0 & ~S1 & S2 ) |  (I2 & ~S0 & S1 & ~S2) |  (I3 & ~S0 & S1 & S2)  | ( I4 & S0 & ~S1 & ~S2) | ( I5 & S0 & ~S1 & S2 ) | (I6 & S0 & S1 & ~S2) | (I7 & S0 & S1 & S2) ;
endmodule