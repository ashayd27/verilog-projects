`timescale 1ns/1ps

module tb_priorityEncoder;
	reg [3:0] in;
	wire [1:0] out;
	wire valid;
	
	priorityEncoder uut(.in(in), .out(out), .valid(valid));
	
	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0, tb_priorityEncoder);
		$monitor("in=%b -> out=%b, valid=%b", in, out, valid);

		in = 4'b0000; #10;
		in = 4'b0001; #10;
		in = 4'b0010; #10;
		in = 4'b0100; #10;
		in = 4'b1000; #10;
		in = 4'b1101; #10;
		in = 4'b1010; #10;

		$display("Priority Encoder test done");
		$finish;
	end

endmodule
