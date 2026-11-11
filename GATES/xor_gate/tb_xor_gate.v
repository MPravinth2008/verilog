module tb_xor_gate;

reg A;
reg B;
wire Y_GL;
wire Y_DFL;
wire Y_BL;

xor_gate_gl GL(.A(A),.B(B),.Y(Y_GL));
xor_gate_dfl DFL(.A(A),.B(B),.Y(Y_DFL));
xor_gate_bl BL(.A(A),.B(B),.Y(Y_BL));

initial begin

$dumpfile("xor_gate.vcd");
$dumpvars(0,tb_xor_gate);
$display(" A B | GL , DFL , BL");

A=0;B=0;#10;
A=0;B=1;#10;
A=1;B=0;#10;
A=1;B=1;#10;

$finish;
end

initial begin

$monitor(" %b %b | %b %b %b ",A,B,Y_GL,Y_DFL,Y_BL);
end
endmodule