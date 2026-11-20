module tb_excess3_to_bcd ;

    reg [3:0] EXCESS3 ;
    wire [3:0] BCD_DFL;
    wire [3:0] BCD_BL;

    excess3_to_bcd_dfl DFL(.EXCESS3(EXCESS3),.BCD(BCD_DFL));
    excess3_to_bcd_bl BL(.EXCESS3(EXCESS3),.BCD(BCD_BL));

    initial begin

        $dumpfile("excess3_to_bcd.vcd");
        $dumpvars(0,tb_excess3_to_bcd);

        EXCESS3 = 4'b0011 ; #10;
        EXCESS3 = 4'b0100 ; #10;
        EXCESS3 = 4'b0101 ; #10;
        EXCESS3 = 4'b0110 ; #10;
        EXCESS3 = 4'b0111 ; #10;
        EXCESS3 = 4'b1000 ; #10;
        EXCESS3 = 4'b1001 ; #10;
        EXCESS3 = 4'b1010 ; #10;
        EXCESS3 = 4'b1011 ; #10;
        EXCESS3 = 4'b1100 ; #10;

    $finish;
    end

    initial begin

        $monitor("EXCESS3 = %b | %b | %b ",EXCESS3,BCD_DFL,BCD_BL);
    end
endmodule
