module tb_bcd_to_7segment;

    reg [3:0] BCD;
    wire [6:0] SEG_DFL;
    wire [6:0] SEG_BL;

    bcd_to_7segment_dfl DFL (.BCD(BCD),.SEG(SEG_DFL));
    bcd_to_7segment_bl BL (.BCD(BCD),.SEG(SEG_BL));
    
    initial begin
    
        $dumpfile("bcd_to_7segment.vcd");
        $dumpvars(0, tb_bcd_to_7segment);

        BCD = 4'b0000; #10;
        BCD = 4'b0001; #10;
        BCD = 4'b0010; #10;
        BCD = 4'b0011; #10;
        BCD = 4'b0100; #10;
        BCD = 4'b0101; #10;
        BCD = 4'b0110; #10;
        BCD = 4'b0111; #10;
        BCD = 4'b1000; #10;
        BCD = 4'b1001; #10;
        BCD = 4'b1010; #10;
        BCD = 4'b1011; #10;
        BCD = 4'b1100; #10;
        BCD = 4'b1101; #10;
        BCD = 4'b1110; #10;
        BCD = 4'b1111; #10;

    $finish;
    end

    initial begin

        $monitor("BCD = %b | %b | %b ", BCD , SEG_DFL , SEG_BL );
    end
endmodule
