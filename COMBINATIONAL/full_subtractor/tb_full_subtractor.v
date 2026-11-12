module tb_full_subtractor;

reg A;
reg B;
reg C;
wire Diff_DFL,Borr_DFL;
wire Diff_BL,Borr_BL;

full_subtractor_dfl DFL(.A(A),.B(B),.C(C),.Diff(Diff_DFL),.Borr(Borr_DFL));
full_subtractor_bl BL(.A(A),.B(B),.C(C),.Diff(Diff_BL),.Borr(Borr_BL));

initial begin

$dumpfile("full_subtractor.vcd");
$dumpvars(0,tb_full_subtractor);

A=0;B=0;C=0;#10;
A=0;B=0;C=1;#10;
A=0;B=1;C=0;#10;
A=0;B=1;C=1;#10;
A=1;B=0;C=0;#10;
A=1;B=0;C=1;#10;
A=1;B=1;C=0;#10;
A=1;B=1;C=1;#10;

$finish;
end

initial begin

$monitor(" A=%b B=%b C=%b | %b %b | %b %b ", A,B,C,Diff_DFL,Borr_DFL,Diff_BL,Borr_BL);
end
endmodule