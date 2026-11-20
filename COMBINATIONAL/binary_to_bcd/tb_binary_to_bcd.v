module tb_binary_to_bcd ;

    reg [3:0] BINARY ;
    wire [7:0] BCD_DFL ;
    wire [7:0] BCD_BL ;

    binary_to_bcd_dfl DFL(.BINARY(BINARY),.BCD(BCD_DFL));
    binary_to_bcd_bl BL(.BINARY(BINARY),.BCD(BCD_BL));

    initial begin

        $dumpfile("binary_to_bcd.vcd");
        $dumpvars(0,tb_binary_to_bcd);

        BINARY = 4'b0000 ; #10 ;
        BINARY = 4'b0001 ; #10 ;
        BINARY = 4'b0010 ; #10 ;
        BINARY = 4'b0011 ; #10 ;
        BINARY = 4'b0100 ; #10 ;
        BINARY = 4'b0101 ; #10 ;
        BINARY = 4'b0110 ; #10 ;
        BINARY = 4'b0111 ; #10 ;
        BINARY = 4'b1000 ; #10 ;
        BINARY = 4'b1001 ; #10 ;
        BINARY = 4'b1010 ; #10 ;
        BINARY = 4'b1011 ; #10 ;
        BINARY = 4'b1100 ; #10 ;
        BINARY = 4'b1101 ; #10 ;
        BINARY = 4'b1110 ; #10 ;
        BINARY = 4'b1111 ; #10 ;
    $finish;
    end
    
    initial begin

        $monitor("BINARY = %b | %b | %b ", BINARY,BCD_DFL,BCD_BL);
    end
endmodule