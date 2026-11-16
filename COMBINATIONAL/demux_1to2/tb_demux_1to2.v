module tb_demux_1to2;

reg D;
reg S;
wire Y0_DFL;
wire Y1_BL;

demux_1to2_dfl DFL(.D(D),.S(S),.Y0(Y0_DFL),.Y1(Y1_DFL));
demux_1to2_bl BL(.D(D),.S(S),.Y0(Y0_BL),.Y1(Y1_BL));

initial begin

$dumpfile("demux_1to2.vcd");
$dumpvars(0,tb_demux_1to2);

D=0;S=0;#10;
D=0;S=1;#10;
D=1;S=0;#10;
D=1;S=1;#10;

$finish;
end
initial begin

$monitor(" D=%b | S = %b | %b %b | %b %b ",D,S,Y0_DFL,Y1_DFL,Y0_BL,Y1_BL);
end
endmodule