`timescale 1ns/1ps

module tb_halfAdder;
  reg a, b;
  wire sum, carry;

  halfAdder uut(.a(a), .b(b), .sum(sum), .carry(carry));

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_halfAdder);
    $monitor("a=%b b=%b -> sum=%b carry=%b", a, b, sum, carry);

    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    $display("Test complete.");
    $finish;
  end
endmodule