module tb_demux_1to8 ;

    reg D;
    reg S0;
    reg S1;
    reg S2;
    wire Y0_DFL , Y0_BL ;
    wire Y1_DFL , Y1_BL ;
    wire Y2_DFL , Y2_BL ;
    wire Y3_DFL , Y3_BL ;
    wire Y4_DFL , Y4_BL ;
    wire Y5_DFL , Y5_BL ;
    wire Y6_DFL , Y6_BL ;
    wire Y7_DFL , Y7_BL ;

    demux_1to8_dfl DFL(.D(D),.S0(S0),.S1(S1),.S2(S2),.Y0(Y0_DFL),.Y1(Y1_DFL),.Y2(Y2_DFL),.Y3(Y3_DFL),.Y4(Y4_DFL),.Y5(Y5_DFL),.Y6(Y6_DFL),.Y7(Y7_DFL));
    demux_1to8_bl B(.D(D),.S0(S0),.S1(S1),.S2(S2),.Y0(Y0_BL),.Y1(Y1_BL),.Y2(Y2_BL),.Y3(Y3_BL),.Y4(Y4_BL),.Y5(Y5_BL),.Y6(Y6_BL),.Y7(Y7_BL));

    initial begin

        $dumpfile("demux_1to8.vcd");
        $dumpvars(0,tb_demux_1to8);

        D=0;S0=0;S1=0;S2=0;#10;
        D=0;S0=0;S1=0;S2=1;#10;
        D=0;S0=0;S1=1;S2=0;#10;
        D=0;S0=0;S1=1;S2=1;#10;
        D=0;S0=1;S1=0;S2=0;#10;
        D=0;S0=1;S1=0;S2=1;#10;
        D=0;S0=1;S1=1;S2=0;#10;
        D=0;S0=1;S1=1;S2=1;#10;
        D=1;S0=0;S1=0;S2=0;#10;
        D=1;S0=0;S1=0;S2=1;#10;
        D=1;S0=0;S1=1;S2=0;#10;
        D=1;S0=0;S1=1;S2=1;#10;
        D=1;S0=1;S1=0;S2=1;#10;
        D=1;S0=1;S1=1;S2=0;#10;
        D=1;S0=1;S1=1;S2=1;#10;
    $finish;
    end

    initial begin

    $monitor("D = %b | S0 = %b S1 = %b S2 = %b | %b %b %b %b %b %b %b %b | %b %b %b %b %b %b %b %b ",
    D,S0,S1,S2,Y0_DFL,Y1_DFL,Y2_DFL,Y3_DFL,Y4_DFL,Y5_DFL,Y6_DFL,Y7_DFL,Y0_BL,Y1_BL,Y2_BL,Y3_BL,Y4_BL,Y5_BL,Y6_BL,Y7_BL);
    
    end
endmodule