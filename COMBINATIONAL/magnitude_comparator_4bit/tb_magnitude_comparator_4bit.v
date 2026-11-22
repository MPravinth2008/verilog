module tb_magnitude_comparator_4bit ;

    reg [3:0] A;
    reg [3:0] B;
    wire A_GT_B_DFL , A_LT_B_DFL , A_EQ_B_DFL ;
    wire A_GT_B_BL , A_LT_B_BL , A_EQ_B_BL ; 

    magnitude_comparator_4bit_dfl DFL(.A(A),.B(B),.A_GT_B(A_GT_B_DFL),.A_LT_B(A_LT_B_DFL),.A_EQ_B(A_EQ_B_DFL));
    magnitude_comparator_4bit_bl BL(.A(A),.B(B),.A_GT_B(A_GT_B_BL),.A_LT_B(A_LT_B_BL),.A_EQ_B(A_EQ_B_BL));

    initial begin

        $dumpfile("magnitude_comparator_4bit.vcd");
        $dumpvars(0,tb_magnitude_comparator_4bit);

        A=4'b0000 ; B=4'b0000 ; #10;
        A=4'b0010 ; B=4'b0001 ; #10;
        A=4'b0100 ; B=4'b1000 ; #10;
        A=4'b0011 ; B=4'b1000 ; #10;
        A=4'b1001 ; B=4'b0110 ; #10;
        A=4'b0011 ; B=4'b1010 ; #10;
        A=4'b1010 ; B=4'b0100 ; #10;
        A=4'b1111 ; B=4'b0000 ; #10;
        A=4'b1110 ; B=4'b0000 ; #10;
        A=4'b0101 ; B=4'b0110 ; #10;
        A=4'b1010 ; B=4'b0110 ; #10;
        A=4'b0101 ; B=4'b1100 ; #10;
        A=4'b1011 ; B=4'b1000 ; #10;
        A=4'b0000 ; B=4'b0000 ; #10;
        A=4'b1111 ; B=4'b0011 ; #10;
        A=4'b1011 ; B=4'b1111 ; #10;
        A=4'b1110 ; B=4'b1010 ; #10;
        

    $finish;
    end

    initial begin
        $monitor("A = %b B = %b | %b %b %b | %b %b %b ", A , B ,A_GT_B_DFL,A_LT_B_DFL,A_EQ_B_DFL,A_GT_B_BL,A_LT_B_BL,A_EQ_B_BL);
    end
endmodule