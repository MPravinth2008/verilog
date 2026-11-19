module tb_parity_checker_odd;

    reg A;
    reg B;
    reg C;
    reg P;
    wire E_DFL;
    wire E_BL;

    parity_checker_odd_dfl DFL(.A(A),.B(B),.C(C),.P(P),.E(E_DFL));
    parity_checker_odd_bl BL(.A(A),.B(B),.C(C),.P(P),.E(E_BL));

    initial begin

        $dumpfile("parity_checker_odd.vcd");
        $dumpvars(0,tb_parity_checker_odd);

        A=0;B=0;C=0;P=0;#10;
        A=0;B=0;C=1;P=0;#10;
        A=0;B=1;C=0;P=0;#10;
        A=0;B=1;C=1;P=1;#10;
        A=1;B=0;C=1;P=0;#10;
        A=1;B=0;C=1;P=1;#10;
        A=1;B=1;C=0;P=1;#10;
        A=1;B=1;C=1;P=1;#10;

    $finish;
    end

    initial begin 

        $monitor("A=%b B=%b C=%b P=%b | %b | %b ",A,B,C,P,E_DFL,E_BL);
    end
endmodule