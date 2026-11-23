
module tb_sr_latch;

    reg S, R;
    wire Q_BL;
    sr_latch BL(.S(S),.R(R),.Q(Q_BL));

initial begin

    $dumpfile("sr_latch.vcd");
    $dumpvars(0, tb_sr_latch);

    S=0; R=0;#10;
    S=1; R=0;#10;
    S=0; R=0;#10;
    S=0; R=1;#10;
    S=0; R=0;#10;
    S=1; R=1;#10;

    $finish;
    end

    initial begin

        $monitor("S=%b R=%b Q=%b", S, R, Q_BL);
    end
endmodule