module tb_gray_to_binary ;

    reg [2:0] G;
    wire [2:0] B_DFL;
    wire [2:0] B_BL;

    gray_to_binary_dfl DFL(.G(G),.B(B_DFL));
    gray_to_binary_bl BL(.G(G),.B(B_BL));

    initial begin 

        $dumpfile("gray_to_binary.vcd");
        $dumpvars(0,tb_gray_to_binary);

        G= 3'b000; #10;
        G= 3'b001; #10;
        G= 3'b010; #10;
        G= 3'b011; #10;
        G= 3'b100; #10;
        G= 3'b101; #10;
        G= 3'b110; #10;
        G= 3'b111; #10;

    $finish;
    end

    initial begin

        $monitor(" G = %b | %b | %b ",G,B_DFL,B_BL );

    end
endmodule