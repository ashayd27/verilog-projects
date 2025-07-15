`timescale 1ns/1ps

module tb_mux4to1;
	reg d0, d1, d2, d3;
	reg [1:0] sel;
	wire y;
	
	mux4to1 uut(.d0(d0), .d1(d1), .d2(d2), .d3(d3), .sel(sel), .y(y));
	
	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0, tb_mux4to1);
		$monitor("sel=%b | d0=%b d1=%b d2=%b d3=%b => y=%b", sel, d0, d1, d2, d3, y);
		
    d0 = 1; d1 = 0; d2 = 0; d3 = 0; sel = 2'b00; #10;
    d0 = 0; d1 = 1; d2 = 0; d3 = 0; sel = 2'b01; #10;
    d0 = 0; d1 = 0; d2 = 1; d3 = 0; sel = 2'b10; #10;
    d0 = 0; d1 = 0; d2 = 0; d3 = 1; sel = 2'b11; #10;

    $display("4-to-1 MUX test complete");
    $finish;
  end
endmodule
