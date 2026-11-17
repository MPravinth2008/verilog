module encoder_4to2_dfl(
    input D0,D1,D2,D3,
    output Y0,Y1
);

    assign Y0 = D2 | D3 ;
    assign Y1 = D1 | D3 ;
endmodule