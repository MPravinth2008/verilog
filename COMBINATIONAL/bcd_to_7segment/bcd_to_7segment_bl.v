
module bcd_to_7segment_bl(
    input [3:0] BCD,
    output reg [6:0] SEG
);
    always @(*)
    begin

        SEG[6] = (BCD == 0) || (BCD == 2) || (BCD == 3) || (BCD == 5) || (BCD == 6) || (BCD == 7) || (BCD == 8) || (BCD == 9);
        SEG[5] = (BCD == 0) || (BCD == 1) || (BCD == 2) || (BCD == 3) || (BCD == 4) || (BCD == 7) || (BCD == 8) || (BCD == 9);
        SEG[4] = (BCD == 0) || (BCD == 1) || (BCD == 3) || (BCD == 4) || (BCD == 5) || (BCD == 6) || (BCD == 7) || (BCD == 8) || (BCD == 9);
        SEG[3] = (BCD == 0) || (BCD == 2) || (BCD == 3) || (BCD == 5) || (BCD == 6) || (BCD == 8) || (BCD == 9);
        SEG[2] = (BCD == 0) || (BCD == 2) || (BCD == 6) || (BCD == 8);
        SEG[1] = (BCD == 0) || (BCD == 4) || (BCD == 5) || (BCD == 6) || (BCD == 8) || (BCD == 9);
        SEG[0] = (BCD == 2) || (BCD == 3) || (BCD == 4) || (BCD == 5) || (BCD == 6) || (BCD == 8) || (BCD == 9);
    end
endmodule