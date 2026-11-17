module tb_encoder_4to2 ;

    reg D0 , D1 , D2 , D3 ;
    wire Y0_DFL , Y1_DFL ;
    wire Y0_BL , Y1_BL ;

    encoder_4to2_dfl DFL(.D0(D0),.D1(D1),.D2(D2),.D3(D3),.Y0(Y0_DFL),.Y1(Y1_DFL));
    encoder_4to2_bl BL(.D0(D0),.D1(D1),.D2(D2),.D3(D3),.Y0(Y0_BL),.Y1(Y1_BL));

    initial begin

        $dumpfile("encoder_4to2.vcd");
        $dumpvars(0,tb_encoder_4to2);

        D0=1;D1=0;D2=0;D3=0;#10;
        D0=0;D1=1;D2=0;D3=0;#10;
        D0=0;D1=0;D2=1;D3=0;#10;
        D0=0;D1=0;D2=0;D3=1;#10;

    $finish;
    end

    initial begin

        $monitor(" D0 = %b D1 = %b D2 = %b D3 = %b | %b %b | %b %b ",D0,D1,D2,D3,Y0_DFL,Y1_DFL,Y0_BL,Y1_BL);
    end
endmodule
