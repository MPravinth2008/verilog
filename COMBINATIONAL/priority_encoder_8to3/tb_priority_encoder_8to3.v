module tb_priority_encoder_8to3 ;

    reg D0,D1,D2,D3,D4,D5,D6,D7 ;
    wire [2:0] Y_DFL;
    wire [2:0] Y_BL ;
 
    priority_encoder_8to3_dfl DFL(.D0(D0),.D1(D1),.D2(D2),.D3(D3),.D4(D4),.D5(D5),.D6(D6),.D7(D7),.Y(Y_DFL)) ;
    priority_encoder_8to3_bl BL(.D0(D0),.D1(D1),.D2(D2),.D3(D3),.D4(D4),.D5(D5),.D6(D6),.D7(D7),.Y(Y_BL));

    initial begin 

        $dumpfile("priority_encoder_8to3.vcd");
        $dumpvars(0,tb_priority_encoder_8to3);

        D7=0;D6=0;D5=0;D4=0;D3=0;D2=0;D1=0;D0=1;#10;
        D7=0;D6=0;D5=0;D4=0;D3=0;D2=0;D1=1;D0=0;#10;
        D7=0;D6=0;D5=0;D4=0;D3=0;D2=1;D1=0;D0=0;#10;
        D7=0;D6=0;D5=0;D4=0;D3=1;D2=0;D1=0;D0=0;#10;
        D7=0;D6=0;D5=0;D4=1;D3=0;D2=0;D1=0;D0=0;#10;
        D7=0;D6=0;D5=1;D4=1;D3=1;D2=1;D1=1;D0=1;#10;
        D7=0;D6=1;D5=1;D4=1;D3=1;D2=1;D1=1;D0=1;#10;
        D7=1;D6=1;D5=1;D4=1;D3=1;D2=1;D1=1;D0=1;#10;
        D7=0;D6=0;D5=0;D4=0;D3=0;D2=0;D1=0;D0=0;#10;

        $finish;
        end
    initial begin

        $monitor("D0 = %b D1 = %b D2 = %b D3 = %b D4 = %b D5 = %b D6 = %b D7 = %b | %b | %b ", D0,D1,D2,D3,D4,D5,D6,D7,Y_DFL,Y_BL);
    end

endmodule