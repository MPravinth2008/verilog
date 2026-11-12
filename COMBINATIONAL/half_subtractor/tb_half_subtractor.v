module tb_half_subtractor;

reg A;
reg B;
wire Diff_DFL,Borr_DFL;
wire Diff_BL,Borr_BL;

half_subtractor_dfl DFL(.A(A),.B(B),.Diff(Diff_DFL),.Borr(Borr_DFL));
half_subtractor_bl BL(.A(A),.B(B),.Diff(Diff_BL),.Borr(Borr_BL));

initial begin

$dumpfile("half_subtractor.vcd");
$dumpvars(0,tb_half_subtractor);

A=0;B=0;#10;
A=0;B=1;#10;
A=1;B=0;#10;
A=1;B=1;#10;

$finish;
end
initial begin 
$monitor("A=%b B=%b | %b %b | %b %b",A,B,Diff_DFL,Borr_DFL,Diff_BL,Borr_BL);
end
endmodule