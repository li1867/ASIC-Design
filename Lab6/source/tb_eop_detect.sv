// $Id: $
// File name:   tb_eop_detect.sv
// Created:     2/19/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: eop detect test bench
`timescale 1ns / 10ps

module tb_eop_detect();
	
	parameter CLK_PERIOD = 2.5;
	
	reg tb_d_plus;
	reg tb_d_minus;
	reg tb_eop;
	reg tb_clk;
	
	eop_detect EOP_DUT (.d_plus(tb_d_plus), .d_minus(tb_d_minus), .eop(tb_eop));
	
	always begin
		tb_clk = '0;
		#(CLK_PERIOD / 2.0);
		tb_clk = '1;
		#(CLK_PERIOD / 2.0);	
	end
	initial
	begin
		@(negedge tb_clk);		
		tb_d_plus = '1;
		tb_d_minus = '1;
		@(negedge tb_clk);
		tb_d_plus = 1;
		tb_d_minus = 0;
		@(negedge tb_clk);
		tb_d_plus = 0;
		tb_d_minus = 1;
		@(negedge tb_clk);
		tb_d_plus = 0;
		tb_d_minus = 0;
		@(negedge tb_clk)
		tb_d_plus = 1;
		tb_d_minus = 0;
		@(negedge tb_clk);
		tb_d_plus = 1;
		tb_d_minus = 1;
		
	end	
endmodule
