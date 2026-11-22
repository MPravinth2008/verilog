
module tb_bcd_to_binary;

    reg [7:0] BCD;
    wire [7:0] BINARY_DFL;
    wire [7:0] BINARY_BL;


    bcd_to_binary_dfl uut1 (.BCD(BCD),.BINARY(BINARY_DFL));
    bcd_to_binary_bl uut2 (.BCD(BCD),.BINARY(BINARY_BL));


    initial
    begin

        $dumpfile("bcd_to_binary.vcd");
        $dumpvars(0, tb_bcd_to_binary);

        BCD = 8'b00000000;
        #10;

        BCD = 8'b00000101;
        #10;

        BCD = 8'b00010010;
        #10;

        BCD = 8'b00011001;
        #10;

        BCD = 8'b00100101;
        #10;

        BCD = 8'b00111001;
        #10;

        BCD = 8'b01000101;
        #10;

        BCD = 8'b10011001;
        #10;

    $finish;

    end

    initial
    begin
        $monitor("BCD = %b | DFL = %b | BL = %b",
        BCD, BINARY_DFL, BINARY_BL);
    end

endmodule