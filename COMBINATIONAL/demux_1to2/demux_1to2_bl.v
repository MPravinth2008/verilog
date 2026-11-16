module demux_1to2_bl(
    input D,
    input S,
    output reg Y0,
    output reg Y1
);
always @(*) begin

    if(S == 0) begin
        Y0 = D;
        Y1 = 0;
    end

    else begin
        Y0=0;
        Y1=D;
    end

end
endmodule