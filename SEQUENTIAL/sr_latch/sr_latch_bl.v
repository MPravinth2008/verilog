
module sr_latch(
    input S,
    input R,
    output reg Q
);
always @(*)
begin
    if (S == 1 && R == 0)
        Q = 1;
    else if (S == 0 && R == 1)
        Q = 0;
    else if (S == 0 && R == 0)
        Q = Q;
    else
        Q = 1'bx;
    end
endmodule