module parity_checker_even_bl(
    input A,
    input B,
    input C,
    output reg P
);
    always @(*)
    begin

        P = A ^ B ^ C ;
    end
endmodule