`timescale 1ns/1ps

module tb_fullAdder;
  reg a, b, cin;
  wire sum, carry;

  fullAdder uut(.a(a), .b(b), .cin(cin), .sum(sum), .carry(carry));

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_fullAdder);
    $monitor("a=%b b=%b cin=%b => sum=%b carry=%b", a, b, cin, sum, carry);

    // Test all 8 input combinations
    a = 0; b = 0; cin = 0; #10;
    a = 0; b = 0; cin = 1; #10;
    a = 0; b = 1; cin = 0; #10;
    a = 0; b = 1; cin = 1; #10;
    a = 1; b = 0; cin = 0; #10;
    a = 1; b = 0; cin = 1; #10;
    a = 1; b = 1; cin = 0; #10;
    a = 1; b = 1; cin = 1; #10;

    $display("Test complete");
    $finish;
  end
endmodule
