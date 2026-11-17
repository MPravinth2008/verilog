module encoder_8to3_bl(
    input D0 , D1 , D2 ,D3 ,D4 , D5 , D6 ,D7,
    output reg Y0 , Y1 , Y2 
);

    always @(*)
    begin

         Y0 = D4 | D5 | D6 | D7 ;
         Y1 = D2 | D3 | D6 | D7 ;
         Y2 = D1 | D3 | D5 | D7 ;
    end 
endmodule