module priority_encoder_8to3_dfl(
    input D0,D1,D2,D3,D4,D5,D6,D7,
    output [2:0] Y
);

    assign Y = D7 ? 3'b111 :
               D6 ? 3'b110 :
               D5 ? 3'b101 :
               D4 ? 3'b100 :
               D3 ? 3'b011 :
               D2 ? 3'b010 :
               D1 ? 3'b001 :
               D0 ? 3'b000 :
                    3'b000 ;
endmodule
