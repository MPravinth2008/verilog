module tb_binary_to_gray;

    reg [2:0] B;
    wire [2:0] G_DFL;
    wire [2:0] G_BL;

    binary_to_gray_dfl DFL(.B(B),.G(G_DFL));
    binary_to_gray_bl BL(.B(B),.G(G_BL));

    initial begin

        $dumpfile("binary_to_gray.vcd");
        $dumpvars(0,tb_binary_to_gray);
        
        B=3'b000; #10;
        B=3'b001; #10;
        B=3'b010; #10;
        B=3'b011; #10;
        B=3'b100; #10;
        B=3'b101; #10;
        B=3'b110; #10;
        B=3'b111; #10;
    $finish;
    end

    initial begin

        $monitor("B=%b | %b | %b ",B,G_DFL,G_BL);

    end
endmodule