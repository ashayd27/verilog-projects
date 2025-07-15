module rippleAdder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);

wire c1, c2, c3;

fullAdder FA0(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .carry(c1));
fullAdder FA1(.a(a[1]), .b(b[1]), .cin(c1),  .sum(sum[1]), .carry(c2));
fullAdder FA2(.a(a[2]), .b(b[2]), .cin(c2),  .sum(sum[2]), .carry(c3));
fullAdder FA3(.a(a[3]), .b(b[3]), .cin(c3),  .sum(sum[3]), .carry(cout));

endmodule