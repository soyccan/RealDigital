// PG logic generator
module BitSlice(
    input A,
    input B,
    output P,
    output G
);

// Carry propagated
assign P = A ^ B;

// Carry generated
assign G = A & B;

endmodule
