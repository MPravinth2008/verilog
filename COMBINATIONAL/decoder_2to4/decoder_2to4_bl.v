module decoder_2to4_bl(
    input A0,
    input A1,
    output reg Y0,Y1,Y2,Y3
);

    always @(*)
    begin

        case ({A0,A1})

            2'b00 : begin
            Y0 = 1 ; Y1 = 0 ; Y2 = 0; Y3 = 0;
            end

            2'b01 : begin
            Y0 = 0 ; Y1 = 1 ; Y2 = 0; Y3 =0;
            end

            2'b10 : begin
            Y0 = 0 ; Y1 = 0 ; Y2 = 1; Y3 = 0;
            end

            2'b11 : begin
            Y0 = 0; Y1 = 0; Y2 = 0; Y3 = 1;
            end
        endcase
    end
endmodule

