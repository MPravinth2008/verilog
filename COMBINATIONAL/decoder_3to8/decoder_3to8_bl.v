module decoder_3to8_bl(
    input A0,
    input A1,
    input A2,
    output reg Y0 , Y1 , Y2 , Y3 , Y4 , Y5 , Y6 , Y7
);

    always @(*)
    begin

         Y0 = ~A0 & ~A1 & ~A2 ;
         Y1 = ~A0 & ~A1 & A2 ;
         Y2 = ~A0 & A1 & ~A2 ;
         Y3 = ~A0 & A1 & A2 ;
         Y4 = A0 & ~A1 & ~A2 ;
         Y5 = A0 & ~A1 & A2 ;
         Y6 = A0 & A1 & ~A2 ;
         Y7 = A0 & A1 & A2 ;
    end
endmodule
