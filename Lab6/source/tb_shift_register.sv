// $Id: $
// File name:   tb_shift_register.sv
// Created:     2/22/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: test bench for shift register
`timescale 1ns / 10ps

module tb_shift_register ();
	parameter CLK_PERIOD = 2.5;
	reg tb_clk;
	reg tb_n_rst; 
	reg tb_shift_enable;
	reg tb_d_orig;
	reg [7:0] tb_rcv_data;

	shift_register SHIFT_REGISTER_DUT (.clk(tb_clk), .n_rst(tb_n_rst), .shift_enable(tb_shift_enable), .d_orig(tb_d_orig), .rcv_data(tb_rcv_data));
	
	always begin
		tb_clk = '0;
		#(CLK_PERIOD / 2.0);
		tb_clk = '1;
		#(CLK_PERIOD / 2.0);
	end

	initial begin
		tb_n_rst = '0;
		tb_shift_enable = '0;
		tb_d_orig = '1;
		//tb_rcv_data = '0;
	
		@(posedge tb_clk);
		tb_n_rst = '1;
		tb_shift_enable = '1;
		tb_d_orig = '1;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);	

	
	
	end


endmodule
