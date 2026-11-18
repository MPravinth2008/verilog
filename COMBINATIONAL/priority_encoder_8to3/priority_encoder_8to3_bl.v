module priority_encoder_8to3_bl(

    input D0,D1,D2,D3,D4,D5,D6,D7,
    output reg [2:0] Y
);

    always @(*)
    begin

        casez ({ D7 , D6 , D5 , D4 , D3 , D2 , D1 , D0})

            8'b1??????? : Y = 3'b111 ;
            8'b01?????? : Y = 3'b110 ;
            8'b001????? : Y = 3'b101 ;
            8'b0001???? : Y = 3'b100 ;
            8'b00001??? : Y = 3'b011 ;
            8'b000001?? : Y = 3'b010 ;
            8'b0000001? : Y = 3'b001 ;
            8'b00000001 : Y = 3'b000 ;
        
            default : Y = 3'b000 ;
         endcase
    end
endmodule
