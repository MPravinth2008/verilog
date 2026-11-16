module tb_mux_8to1;

reg I0;
reg I1;
reg I2;
reg I3;
reg I4;
reg I5;
reg I6;
reg I7;
reg S0;
reg S1;
reg S2;
wire Y_DFL;
wire Y_BL;

mux_8to1_dfl DFL(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.S0(S0),.S1(S1),.S2(S2),.Y(Y_DFL));
mux_8to1_bl BL(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.S0(S0),.S1(S1),.S2(S2),.Y(Y_BL));

initial begin

$dumpfile("mux_8to1.vcd");
$dumpvars(0,tb_mux_8to1);

I0=0;I1=1;I2=0;I3=1;I4=1;I5=0;I6=1;I7=0;

S0=0;S1=0;S2=0;#10;
S0=0;S1=0;S2=1;#10;
S0=0;S1=1;S2=0;#10;
S0=0;S1=1;S2=1;#10;
S0=1;S1=0;S2=0;#10;
S0=1;S1=0;S2=1;#10;
S0=1;S1=1;S2=0;#10;
S0=1;S1=1;S2=1;#10;

$finish;
end
initial begin
$monitor("I0 = %b I1 = %b I2 = %b I3 = %b I4 = %b I5 = %b I6 = %b I7= %b | S0 = %b S1 = %b S2 = %b | %b | %b ",I0,I1,I2,I3,I4,I5,I6,I7,S0,S1,S2,Y_DFL,Y_BL);
end
endmodule