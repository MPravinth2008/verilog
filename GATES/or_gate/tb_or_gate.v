module tb_or_gate;

reg A;
reg B;
wire Y_GL;
wire Y_DFL;
wire Y_BL;

or_gate_gl GL(.A(A),.B(B),.Y(Y_GL));
or_gate_dfl DFL(.A(A),.B(B),.Y(Y_DFL));
or_gate_bl BL(.A(A),.B(B),.Y(Y_BL));

initial begin

$dumpfile("or_gate.vcd");
$dumpvars(0,tb_or_gate);
$display(" A B | GL DFL BL");

A=0;B=0;#10;
A=0;B=1;#10;
A=1;B=0;#10;
A=1;B=1;#10;

$finish;
end

initial begin
$monitor(" %b %b | %b %b %b",A,B,Y_GL,Y_DFL,Y_BL);
end
endmodule