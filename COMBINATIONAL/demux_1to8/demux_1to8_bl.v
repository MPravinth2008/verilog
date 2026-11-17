module demux_1to8_bl(
    input D,
    input S0,
    input S1,
    input S2,
    output reg Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7
);
always @(*)
begin

Y0 = D & ~S2 & ~ S1 & ~S0 ;
Y1 = D & ~S2 & ~S1 & S0 ;
Y2 = D & ~S2 & S1 & S0 ;
Y3 = D & ~S2 & S1 & S0 ;
Y4 = D & S2 & ~S1 & ~S0 ;
Y5 = D & S2 & ~S1 & S0 ;
Y6 = D & S2 & S1 & ~S0 ;
Y7 = D & S2 & S1 & S0 ;

end 
endmodule