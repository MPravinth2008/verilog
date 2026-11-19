module tb_parity_checker_even;

    reg A;
    reg B;
    reg C;
    wire P_DFL;
    wire P_BL;

    parity_checker_even_dfl DFL(.A(A),.B(B),.C(C),.P(P_DFL));
    parity_checker_even_bl BL(.A(A),.B(B),.C(C),.P(P_BL));

    initial begin
    
        $dumpfile("parity_checker_even.vcd");
        $dumpvars(0,tb_parity_checker_even);
        
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

        $monitor("A=%b B=%b C=%b | %b | %b ",A,B,C,P_DFL,P_BL);
    end
endmodule