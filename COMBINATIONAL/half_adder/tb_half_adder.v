module tb_half_adder;

reg A;
reg B;
wire sum_GL,carry_GL;
wire sum_DFL,carry_DFL;
wire sum_BL,carry_BL;

half_adder_gl GL(.A(A),.B(B),.sum(sum_GL),.carry(carry_GL));
half_adder_dfl DFL(.A(A),.B(B),.sum(sum_DFL),.carry(carry_DFL));
half_adder_bl BL(.A(A),.B(B),.sum(sum_BL),.carry(carry_BL));

initial begin
$dumpfile("half_adder.vcd");
$dumpvars(0,tb_half_adder);

A=0;B=0;#10;
A=0;B=1;#10;
A=1;B=0;#10;
A=1;B=1;#10;

$finish;


end 
initial  begin
$monitor("Time=%0t A=%b B=%b | A= %b B=%b | A= %b B=%b | A= %b B= %b",$time,A,B,sum_GL,carry_GL,sum_DFL,carry_DFL,sum_BL,carry_BL);

end
endmodule
