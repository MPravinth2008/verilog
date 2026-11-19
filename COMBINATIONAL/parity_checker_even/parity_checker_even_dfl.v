module parity_checker_even_dfl(
    input A,
    input B,
    input C,
    output P
);
    assign P = A ^ B ^ C ;

endmodule 