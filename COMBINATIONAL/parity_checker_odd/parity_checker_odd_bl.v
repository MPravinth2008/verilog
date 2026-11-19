module parity_checker_odd_bl(
    input A,
    input B,
    input C,
    input P, 
    output reg E
);

    always @(*)
    begin 

        E = ~( A ^ B ^ C ^ P );
    end
endmodule