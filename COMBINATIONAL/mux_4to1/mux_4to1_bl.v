module mux_4to1_bl(
    input I0,
    input I1,
    input I2,
    input I3,
    input S0,
    input S1,
    output reg Y
);
always @(*)
begin
Y = (~S0 & ~S1 & I0)|(~S0 & S1 & I1) | ( S0 & ~S1 & I2 ) | ( S0 & S1 & I3 );
end 
endmodule