module tb_decoder_3to8 ;

    reg A0;
    reg A1;
    reg A2;
    wire Y0_DFL , Y0_BL ;
    wire Y1_DFL , Y1_BL ;
    wire Y2_DFL , Y2_BL ;
    wire Y3_DFL , Y3_BL ;
    wire Y4_DFL , Y4_BL ;
    wire Y5_DFL , Y5_BL ;
    wire Y6_DFL , Y6_BL ;
    wire Y7_DFL , Y7_BL ;

    decoder_3to8_dfl DFL(.A0(A0),.A1(A1),.A2(A2),.Y0(Y0_DFL),.Y1(Y1_DFL),.Y2(Y2_DFL),.Y3(Y3_DFL),.Y4(Y4_DFL),.Y5(Y5_DFL),.Y6(Y6_DFL),.Y7(Y7_DFL));
    decoder_3to8_bl BL(.A0(A0),.A1(A1),.A2(A2),.Y0(Y0_BL),.Y1(Y1_BL),.Y2(Y2_BL),.Y3(Y3_BL),.Y4(Y4_BL),.Y5(Y5_BL),.Y6(Y6_BL),.Y7(Y7_BL));

    initial begin

        $dumpfile("decoder_3to8.vcd");
        $dumpvars(0,tb_decoder_3to8);

        A0=0;A1=0;A2=0;#10;
        A0=0;A1=0;A2=1;#10;
        A0=0;A1=1;A2=0;#10;
        A0=0;A1=1;A2=1;#10;
        A0=1;A1=0;A2=0;#10;
        A0=1;A1=0;A2=1;#10;
        A0=1;A1=1;A2=0;#10;
        A0=1;A1=1;A2=1;#10;

    $finish;
    end

    initial begin
    
        $monitor("A0 = %b A1 = %b A2 = %b | %b %b %b %b %b %b %b %b | %b %b %b %b %b %b %b %b ",A0,A1,A2,Y0_DFL,Y1_DFL,Y2_DFL,
        Y3_DFL,Y4_DFL,Y5_DFL,Y6_DFL,Y7_DFL,Y0_BL,Y1_BL,Y2_BL,Y3_BL,Y4_BL,Y5_BL,Y6_BL,Y7_BL);
    end
endmodule