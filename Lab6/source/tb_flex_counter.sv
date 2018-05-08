
// $Id: $
// File name:   tb_flex_pts_sr.sv
// Created:     9/2/2013
// Author:      foo
// Lab Section: 99
// Version:     1.0  Initial Design Entry
// Description: Flexible Parallel to Serial shift register test bench

`timescale 1ns / 10ps

module tb_flex_counter ();

	localparam	CLK_PERIOD	= 2.5;
   	localparam NUM_CNT_BITS = 4;
	localparam CHECK_DELAY = 1;
   
	reg tb_clk;
	reg tb_n_rst;
	reg tb_clear;
	reg tb_count_enable;
	reg [(NUM_CNT_BITS-1):0] tb_rollover_val;
	reg [(NUM_CNT_BITS-1):0] tb_count_out;
	reg tb_rollover_flag;

	flex_counter DUT
	(
		.clk( tb_clk ),
		.n_rst( tb_n_rst ),
		.clear( tb_clear ),
		.count_enable( tb_count_enable ),
		.rollover_val( tb_rollover_val ),
		.count_out( tb_count_out ),
		.rollover_flag( tb_rollover_flag )
	);
		
	//generate clock signal
	always begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	
	initial begin
	//case1
	@(posedge tb_clk);
	tb_clear = 1'b1;
	@(posedge tb_clk);
	tb_clear = 1'b0;
	@(posedge tb_clk);

	
	tb_n_rst = 1'b0;
	tb_rollover_val = 2;
	tb_count_enable = 1'b0;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	#(CHECK_DELAY);
	if((tb_count_out == 0) && (tb_rollover_flag == 0))
		$info("case 0 pass");
	else
		$error("case 0 failed");
	
	tb_n_rst = 1'b1;
	tb_rollover_val = 2;
	tb_count_enable = 1'b0;
	tb_clear = 1'b0;

	@(posedge tb_clk);
	#(CHECK_DELAY);
	if((tb_count_out == 0) && (tb_rollover_flag == 0))
		$info("case 1 pass");
	else
		$error("case 1 failed");	
		
	//case2  
	tb_count_enable = 1'b1;
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if((tb_count_out == 1) && (tb_rollover_flag == 0))
		$info("case 2 pass");
	else
		$error("case 2 failed");	
	

	//case3

	@(posedge tb_clk);
	#(CHECK_DELAY);
	if((tb_count_out == 2) && (tb_rollover_flag == 1))
		$info("case 3 pass");
	else
		$error("case 3 failed");
	//case4
	
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if((tb_count_out == 1) && (tb_rollover_flag == 0))
		$info("case 4 pass");
	else
		$error("case 4 failed");

//case 5
	@(posedge tb_clk);
	#(CHECK_DELAY);
	if((tb_count_out == 2) && (tb_rollover_flag == 1))
		$info("case 5 pass");
	else
		$error("case 5 failed");

//case 6
tb_count_enable = 0'b0;
@(posedge tb_clk);
#(CHECK_DELAY)
if((tb_count_out == 2) && (tb_rollover_flag == 1))
		$info("case 6 pass");
	else
		$error("case 6 failed");

//case 7
tb_n_rst = 0;
@(posedge tb_clk);
#(CHECK_DELAY)
if((tb_count_out == 0) && (tb_rollover_flag == 0))
	$info("case 7 pass");
	else
		$error("case 7 failed");

//case 8
tb_n_rst = 0;
tb_clear = 1'b1;
@(posedge tb_clk);
#(CHECK_DELAY)
if((tb_count_out == 0) && (tb_rollover_flag == 0))
	$info("case 7 pass");
	else
		$error("case 7 failed");






end
	
	










	
	
	
endmodule 

