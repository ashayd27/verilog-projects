`timescale 1ns/1ps

module tb_rippleAdder;
  reg [3:0] a, b;
  reg cin;
  wire [3:0] sum;
  wire cout;

  rippleAdder uut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_rippleAdder);
    $monitor("a=%b b=%b cin=%b => cout=%b sum=%b", a, b, cin, cout, sum);

    a = 4'b0001; b = 4'b0010; cin = 0; #10;  // 1 + 2 = 3
    a = 4'b0101; b = 4'b0011; cin = 0; #10;  // 5 + 3 = 8
    a = 4'b1111; b = 4'b0001; cin = 0; #10;  // 15 + 1 = 16 (cout = 1)
    a = 4'b1000; b = 4'b1000; cin = 1; #10;  // 8 + 8 + 1 = 17

    $finish;
  end
endmodule
