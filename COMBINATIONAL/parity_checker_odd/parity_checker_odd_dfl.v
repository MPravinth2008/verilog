module parity_checker_odd_dfl(
    input A,
    input B,
    input C,
    input P,
    output E
);
    assign E = ~( A ^ B ^ C ^ P );

endmodule
