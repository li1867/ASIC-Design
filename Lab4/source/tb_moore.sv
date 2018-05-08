// $Id: $
// File name:   tb_flex_stp_sr.sv
// Created:     9/2/2013
// Author:      foo
// Lab Section: 99
// Version:     1.0  Initial Design Entry
// Description: Flexible Serial to Parallel Shift register test bench

`timescale 1ns / 10ps

module tb_moore ();

	// Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	= 2.5;
	localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay
	
	
	// Shared Test Variables
	reg tb_clk;
	reg tb_n_rst;
	reg tb_o;
	reg tb_i;

	moore DUI
	(
		.clk( tb_clk),
		.n_rst( tb_n_rst ),
		.i( tb_i ),
		.o( tb_o )
		
	);	
	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end

	initial begin
		//case 1 
			tb_n_rst = 1'b0;
			#(CHECK_DELAY)
			tb_n_rst = 1'b1;
			@(posedge tb_clk);
			tb_n_rst = 1'b1;
			@(posedge tb_clk);
			if(tb_o == 0)
				$info("test 1 pass");
			else
				$error("test 1 fail");

		//case2
			tb_i = 1;
			@(posedge tb_clk);
			if(tb_o == 0)
				$info("case 2 pass");
			else
				$error("case 2 fail");

		
		//case 3
			tb_n_rst = 0;
			#(CHECK_DELAY);
			tb_n_rst = 1;
			@(posedge tb_clk);
			tb_i = 1;
			@(posedge tb_clk);
			tb_i = 1;
			@(posedge tb_clk);
			tb_i = 0;
			@(posedge tb_clk);
			tb_i = 1;
			@(posedge tb_clk);
			if(tb_o == 1)
				$info("case 3 pass");
			else
				$error("case 3 failed");
			
			









	end
endmodule
