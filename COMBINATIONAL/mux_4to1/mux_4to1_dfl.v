module mux_4to1_dfl(
    input I0,
    input I1,
    input I2,
    input I3,
    input S0,
    input S1,
    output Y
);
assign Y = ( ~S0 & ~S1 & I0 ) | ( ~S1 & S0 & I1 ) | ( S1 & ~S0 & I2 ) | (S0 & S1 & I3 ) ;
endmodule
