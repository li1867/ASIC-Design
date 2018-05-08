// $Id: $
// File name:   tb_edge_detect.sv
// Created:     2/19/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: test bench for edge detect

`timescale 1ns / 10ps
module tb_edge_detect();
	localparam	CLK_PERIOD	= 2.5;
	localparam	CHECK_DELAY	= 1;
	
	reg tb_clk;
	reg tb_n_rst;
	reg tb_d_plus;
	reg tb_d_edge;

	edge_detect EDGE_DUT (.clk(tb_clk), .n_rst(tb_n_rst), .d_plus(tb_d_plus), .d_edge(tb_d_edge));
	
	
	always begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	
	initial begin
		tb_n_rst = 0;
	        @(posedge tb_clk);
		tb_d_plus = 0;
		@(posedge tb_clk);
		tb_n_rst = 1;
		@(posedge tb_clk);  //1
		tb_d_plus = 1;
		@(posedge tb_clk);//2
		tb_d_plus = 1;
		@(posedge tb_clk); //3
		tb_d_plus = 1;
		@(posedge tb_clk); //4
		tb_d_plus = 1;
		@(posedge tb_clk);//5
		tb_d_plus = 1;
	        @(posedge tb_clk);//6
		tb_d_plus = 0;
	       @(posedge tb_clk);
	       @(posedge tb_clk);
		tb_n_rst = 0;
		  //7
		tb_d_plus = 1;
		
end
endmodule
	
