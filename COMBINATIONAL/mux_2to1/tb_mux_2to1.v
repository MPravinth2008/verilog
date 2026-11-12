module tb_mux_2to1;

reg A;
reg B;
reg S;
wire Y_DFL;
wire Y_BL;

mux_2to1_dfl DFL(.A(A),.B(B),.S(S),.Y(Y_DFL));
mux_2to1_bl BL(.A(A),.B(B),.S(S),.Y(Y_BL));

initial begin

$dumpfile("mux_2to1.vcd");
$dumpvars(0,tb_mux_2to1);

S=0;A=0;B=0;#10;
S=0;A=0;B=1;#10;
S=0;A=1;B=0;#10;
S=0;A=1;B=1;#10;
S=1;A=0;B=0;#10;
S=1;A=0;B=1;#10;
S=1;A=1;B=0;#10;
S=1;A=1;B=1;#10;

$finish;
end

initial begin 

$monitor(" S=%b A=%b B=%b | %b | %b ", S,A,B,Y_DFL,Y_BL);
end 
endmodule