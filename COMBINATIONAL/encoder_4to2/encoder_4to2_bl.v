module encoder_4to2_bl(
    input D0,D1,D2,D3,
    output reg Y0,Y1
);

    always @(*)
    begin

        Y0 = D2 | D3 ;
        Y1 = D1 | D3 ;
    end
endmodule