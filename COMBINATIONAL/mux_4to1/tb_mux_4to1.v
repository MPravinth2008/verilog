module tb_mux_4to1;

reg I0;
reg I1;
reg I2;
reg I3;
reg S0;
reg S1;
wire Y_DFL;
wire Y_BL;

mux_4to1_dfl DFL(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.S0(S0),.S1(S1),.Y(Y_DFL));
mux_4to1_dfl BL(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.S0(S0),.S1(S1),.Y(Y_BL));

initial begin

$dumpfile("mux_4to1.vcd");
$dumpvars(0,tb_mux_4to1);
I0 = 1; I1 = 0; I2 = 0 ; I3 = 1; 
S0=0;S1=0;#10;
S0=0;S1=1;#10;
S0=1;S1=0;#10;
S0=1;S1=1;#10;

$finish;
end

initial begin

$monitor("I0 = %b I1 = %b I2 = %b I3 = %b S0 = %b S1 = %b | %b | %b ",I0,I1,I2,I3,S0,S1,Y_DFL,Y_BL);
end
endmodule