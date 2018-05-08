// $Id: $
// File name:   tb_rx_fifo.sv
// Created:     2/20/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: test bench for fifo
`timescale  1ns / 10 ps
module tb_rx_fifo();

localparam CLK_PERIOD = 2.5;
localparam CHECK_DELAY = 1;

	reg tb_clk;
	reg tb_n_rst;
	reg tb_r_enable;
	reg tb_w_enable;
	reg [7:0] tb_w_data;
	reg [7:0] tb_r_data;
	reg tb_empty;
	reg tb_full;

	rx_fifo FIFO_DUT(.clk(tb_clk), .n_rst(tb_n_rst), .r_enable(tb_r_enable), .w_enable(tb_w_enable), .w_data(tb_w_data), .r_data(tb_r_data), .empty(tb_empty), .full(tb_full));

	always begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	
	initial begin
		tb_clk = 0;
		tb_n_rst = 0;
		tb_r_enable = 0;
		tb_w_enable = 0;
		tb_w_data = '0;
		@(posedge tb_clk);
		tb_n_rst = 1;
		@(posedge tb_clk);
		tb_w_data = '1;
		@(posedge tb_clk);
		tb_w_enable = 1;

		@(posedge tb_clk);
		tb_r_enable = 1;
               	@(posedge tb_clk);
		tb_w_enable = 0;
	        @(posedge tb_clk);
	        tb_r_enable = 0;
	   
	        @(posedge tb_clk);
		tb_w_data = '0;
	   	@(posedge tb_clk);
		tb_w_enable = 1;
		@(posedge tb_clk);
		tb_w_enable = 1;
		@(posedge tb_clk);
		tb_w_enable = 1;
		@(posedge tb_clk);
		tb_w_enable = 1;
		@(posedge tb_clk);
		tb_w_enable = 1;
		@(posedge tb_clk);
		tb_w_enable = 1;
		@(posedge tb_clk);
		tb_w_enable = 1;
		@(posedge tb_clk);
		tb_w_enable = 1;
		@(posedge tb_clk);
		tb_w_enable = 1;
	        @(posedge tb_clk);
	        tb_r_enable = 1;
	   	@(posedge tb_clk);
		tb_w_enable = 0;
	        @(posedge tb_clk);
	        tb_r_enable = 0;
	   

		@(posedge tb_clk);
		tb_n_rst = 0;

		
	end
endmodule



