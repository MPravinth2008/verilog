
module bcd_to_7segment_dfl(
    input [3:0] BCD,
    output [6:0] SEG
);
assign SEG[6] = (BCD == 0) || (BCD == 2) || (BCD == 3) || (BCD == 5) || (BCD == 6) || (BCD == 7) || (BCD == 8) || (BCD == 9);
assign SEG[5] = (BCD == 0) || (BCD == 1) || (BCD == 2) || (BCD == 3) || (BCD == 4) || (BCD == 7) || (BCD == 8) || (BCD == 9);
assign SEG[4] = (BCD == 0) || (BCD == 1) || (BCD == 3) || (BCD == 4) || (BCD == 5) || (BCD == 6) || (BCD == 7) || (BCD == 8) || (BCD == 9);
assign SEG[3] = (BCD == 0) || (BCD == 2) || (BCD == 3) || (BCD == 5) || (BCD == 6) || (BCD == 8) || (BCD == 9);
assign SEG[2] = (BCD == 0) || (BCD == 2) || (BCD == 6) || (BCD == 8);
assign SEG[1] = (BCD == 0) || (BCD == 4) || (BCD == 5) || (BCD == 6) || (BCD == 8) || (BCD == 9);
assign SEG[0] = (BCD == 2) || (BCD == 3) || (BCD == 4) || (BCD == 5) || (BCD == 6) || (BCD == 8) || (BCD == 9);

endmodule