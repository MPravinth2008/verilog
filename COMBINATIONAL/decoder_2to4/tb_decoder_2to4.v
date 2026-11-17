module tb_decoder_2to4 ;

    reg A0;
    reg A1;
    wire Y0_DFL , Y0_BL ;
    wire Y1_DFL , Y1_BL ;
    wire Y2_DFL , Y2_BL;
    wire Y3_DFL , Y3_BL ;

    decoder_2to4_dfl DFL(.A0(A0),.A1(A1),.Y0(Y0_DFL),.Y1(Y1_DFL),.Y2(Y2_DFL),.Y3(Y3_DFL));
    decoder_2to4_bl BL(.A0(A0),.A1(A1),.Y0(Y0_BL),.Y1(Y1_BL),.Y2(Y2_BL),.Y3(Y3_BL));

    initial begin

        $dumpfile("decoder_2to4.vcd");
        $dumpvars(0,tb_decoder_2to4);

        A0=0;A1=0;#10;
        A0=0;A1=1;#10;
        A0=1;A1=0;#10;
        A0=1;A1=1;#10;

    $finish;
    end

    initial begin

        $monitor(" A0 = %b A1 = %b | %b %b %b %b | %b %b %b %b ",A0,A1,Y0_DFL,Y1_DFL,Y2_DFL,Y3_DFL,Y0_BL,Y1_BL,Y2_BL,Y3_BL);
    end
endmodule