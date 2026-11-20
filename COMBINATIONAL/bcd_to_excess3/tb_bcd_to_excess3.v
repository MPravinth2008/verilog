module tb_bcd_to_excess3 ;

    reg [3:0] BCD ;
    wire [3:0] EXCESS3_DFL;
    wire [3:0] EXCESS3_BL ;

    bcd_to_excess3_dfl DFL(.BCD(BCD),.EXCESS3(EXCESS3_DFL));
    bcd_to_excess3_bl BL(.BCD(BCD),.EXCESS3(EXCESS3_BL));

    initial begin

        $dumpfile("bcd_to_excess3.vcd");
        $dumpvars(0,tb_bcd_to_excess3);

        BCD = 4'b0000;#10;
        BCD = 4'b0001;#10;
        BCD = 4'b0010;#10;
        BCD = 4'b0011;#10;
        BCD = 4'b0100;#10;
        BCD = 4'b0101;#10;
        BCD = 4'b0110;#10;
        BCD = 4'b0111;#10;
        BCD = 4'b1000;#10;
        BCD = 4'b1001;#10;

    $finish;
    end

    initial begin

        $monitor("BCD = %b | %b | %B ",BCD,EXCESS3_DFL,EXCESS3_BL);
    end
endmodule