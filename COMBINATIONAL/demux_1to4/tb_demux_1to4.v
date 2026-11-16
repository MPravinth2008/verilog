module tb_demux_1to4;

reg D;
reg S0;
reg S1;
wire Y0_DFL , Y1_DFL , Y2_DFL , Y3_DFL;
wire Y0_BL , Y1_BL , Y2_BL , Y3_BL;

demux_1to4_dfl DFL(.D(D),.S0(S0),.S1(S1),.Y0(Y0_DFL),.Y1(Y1_DFL),.Y2(Y2_DFL),.Y3(Y3_DFL));
demux_1to4_bl BL(.D(D),.S0(S0),.S1(S1),.Y0(Y0_BL),.Y1(Y1_BL),.Y2(Y2_BL),.Y3(Y3_BL));

initial begin

$dumpfile("demux_1to4.vcd");
$dumpvars(0,tb_demux_1to4);

D=0;S0=0;S1=0;#10;
D=0;S0=0;S1=1;#10;
D=0;S0=1;S1=0;#10;
D=0;S0=1;S1=1;#10;
D=1;S0=0;S1=0;#10;
D=1;S0=0;S1=1;#10;
D=1;S0=1;S1=0;#10;
D=1;S0=1;S1=1;#10;

$finish;
end

initial begin

$monitor(" D = %b | S0 = %b S1 = %b | %b %b %b %b | %b %b %b %b ",D,S0,S1,Y0_DFL,Y1_DFL,Y2_DFL,Y3_DFL,Y0_BL,Y1_BL,Y2_BL,Y3_BL);
end
endmodule