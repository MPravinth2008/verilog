module tb_buffer_gate;

reg A;
wire Y_GL;
wire Y_DFL;
wire Y_BL;

buffer_gate_gl GL(.A(A),.Y(Y_GL));
buffer_gate_dfl DFL(.A(A),.Y(Y_DFL));
buffer_gate_bl BL(.A(A),.Y(Y_BL));

initial begin

$dumpfile("buffer_gate.vcd");
$dumpvars(0,tb_buffer_gate);
$display("A| GL,DFL,BL");

A=0;#10;
A=1;#10;

$finish;
end

initial begin

$monitor(" %b | %b %b %b",A,Y_GL,Y_DFL,Y_BL);
end
endmodule


