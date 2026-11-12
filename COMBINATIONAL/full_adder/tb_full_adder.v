module tb_full_adder;

reg A;
reg B;
reg Cin;
wire Sum_GL,Cout_GL;
wire Sum_DFL,Cout_DFL;
wire Sum_BL,Cout_BL;

full_adder_gl GL(.A(A),.B(B),.Cin(Cin),.Sum(Sum_GL),.Cout(Cout_GL));
full_adder_dfl DFL(.A(A),.B(B),.Cin(Cin),.Sum(Sum_DFL),.Cout(Cout_DFL));
full_adder_bl BL(.A(A),.B(B),.Cin(Cin),.Sum(Sum_BL),.Cout(Cout_BL));

initial begin

$dumpfile("full_adder.vcd");
$dumpvars(0,tb_full_adder);

A=0;B=0;Cin=0;#10;
A=0;B=0;Cin=1;#10;
A=0;B=1;Cin=0;#10;
A=0;B=1;Cin=1;#10;
A=1;B=0;Cin=0;#10;
A=1;B=0;Cin=1;#10;
A=1;B=1;Cin=0;#10;
A=1;B=1;Cin=1;#10;

$finish;
end

initial begin

$monitor("A=%b B=%b |  %b %b |  %b %b | %b %b ",A,B,Sum_GL,Cout_GL,Sum_DFL,Cout_DFL,Sum_BL,Cout_BL);
end 
endmodule
