// $Id: $
// File name:   tb_decode.sv
// Created:     2/19/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: test bench for decode

`timescale 1ns / 10ps

module tb_decode();
	localparam CLK_PERIOD = 2.5;
	localparam CHECK_DELAY = 1;
	
	reg tb_clk;
	reg tb_n_rst;
	reg tb_d_plus;
	reg tb_shift_enable;
	reg tb_eop;
	reg tb_d_orig;

	decode DECODE_DUT (.clk(tb_clk), .n_rst(tb_n_rst), .d_plus(tb_d_plus), .shift_enable(tb_shift_enable), .eop(tb_eop), .d_orig(tb_d_orig));
	
	always begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	

	initial begin
		tb_n_rst = '0;
		tb_shift_enable = '0;
		tb_d_plus = '0;
		tb_eop = '0;
		@(posedge tb_clk);  //1
		tb_n_rst = 1;
		@(posedge tb_clk);  //2
		tb_shift_enable = 1;
		tb_eop = 1;
		tb_d_plus = 1;	
		@(posedge tb_clk);  //3
		//case 1
		//#0.5
		//if(tb_d_orig == 1) begin
		//	$info("case 1 pass\n");
		//end
		//else begin
		//	$error("case 1 fail\n");
		//end
		@(posedge tb_clk);  //4
		tb_shift_enable = 0;
		@(posedge tb_clk);  //5
		//#0.5
		//if(tb_d_orig == 1) begin
		//	$info("case 2 pass\n");
		//end
		//else begin
		//	$error("case 2 fail\n");
		//end
		@(posedge tb_clk); //6
		tb_shift_enable = 1;
		@(posedge tb_clk); //7
		tb_d_plus = 0;
		@(posedge tb_clk); //8
		//#0.5
		//if(tb_d_orig == 0) begin
		//	$info("case 3 pass\n");
		//end
		//else begin
		//	$error("case 3 fail\n");
		//end
		@(posedge tb_clk); //9
		tb_eop = 0;
		@(posedge tb_clk); //10
		//#0.5
		//if(tb_d_orig == 1) begin
		//	$info("case 4 pass\n");
		//end
		//else begin
		//	$error("case 4 fail\n");
		//end
		@(posedge tb_clk); //11
		tb_n_rst = 0;
		@(posedge tb_clk); //12
		//#0.5
		//if(tb_d_orig == 0) begin
		//	$info("case 5 pass\n");
		//end
		//else begin
		//	$error("case 5 fail\n");
		//end
		@(posedge tb_clk); //13
		tb_eop = 1;
		@(posedge tb_clk); //14
		//#0.5
		//if(tb_d_orig == 0) begin
		//	$info("case 6 pass\n");
		//end
		//else begin
		//	$error("case 6 fail\n");
		//end
		
			
		
/*
		tb_n_rst = '0;
		tb_shift_enable = '0;
		tb_eop = '0;
		tb_d_plus = '0;
		@(posedge tb_clk);
		tb_n_rst = '1;
		@(posedge tb_clk);
		tb_d_plus = '1; //previous d_plus value is 0
		@(posedge tb_clk);
		tb_shift_enable = '1;
		@(posedge tb_clk);
		tb_eop = '0;
		//case 1
		if(tb_d_orig == '1) begin
			$info("case 1 is passed\n");
		end
		else begin
			$error("case 1 is failed\n");
		end
		
		tb_n_rst = '0;
		@(posedge tb_clk);
		tb_n_rst = '1;
		@(posedge tb_clk);
		tb_d_plus = '1;  //previous d_plus value is 1
		@(posedge tb_clk);
		tb_shift_enable = '1;
		@(posedge tb_clk);
		tb_eop = '0;
		//case 2
		if(tb_d_orig == '1) begin
			$info("case 2 is pass\n");
		end
		else begin
			$error("case 2 is fail\n");
		end

		@(posedge tb_clk);
		tb_n_rst = '0;
		@(posedge tb_clk);
		tb_n_rst = '1;
		@(posedge tb_clk);
		tb_d_plus = '1;  //previous d_plus value is 1
		@(posedge tb_clk);
		tb_shift_enable = '1;
		@(posedge tb_clk);
		tb_eop = '1;
		//case 3
		if(tb_d_orig == '1) begin
			$info("case 3 is pass\n");
		end
		else begin
			$error("case 3 is fail\n");
		end

		@(posedge tb_clk);
		tb_n_rst = '1;
		@(posedge tb_clk);
		tb_d_plus = '0;  //previous d_plus value is 1
		@(posedge tb_clk);
		tb_shift_enable = '1;
		@(posedge tb_clk);
		tb_eop = '0;
		//case 4
		if(tb_d_orig == '0) begin
			$info("case 4 is pass\n");
		end
		else begin
			$error("case 4 is fail\n");
		end
		
		tb_n_rst = '0;
		@(posedge tb_clk);
		tb_n_rst = '1;
		tb_shift_enable = '0;
		@(posedge tb_clk);
		tb_d_plus = '1;  //previous d_plus value is 0
		@(posedge tb_clk);
		tb_eop = '1;
		//case 5
		if(tb_d_orig == '0) begin
			$info("case 5 is pass\n");
		end
		else begin
			$error("case 5 is fail\n");
		end

		tb_n_rst = '0;
		tb_shift_enable = '1;
		tb_eop = '0;
		@(posedge tb_clk);
		tb_n_rst = '1;
		@(posedge tb_clk);
		tb_d_plus = '1;  //previous d_plus is 1
		@(posedge tb_clk);
		tb_d_plus = '0;
		//case 6
		if(tb_d_orig == '1) begin
			$info("case 6 is pass\n");
		end
		else begin
			$error("case 6 is fail\n");
		end
		
		tb_n_rst = '0;
		tb_shift_enable = '1;
		tb_eop = '0;
		@(posedge tb_clk);
		tb_n_rst = '1;
		@(posedge tb_clk);
		tb_d_plus = '1; 
		if(tb_d_orig == '1) begin
			$info("case 7 is pass\n");
		end
		else begin
			$error("case 7 is fail\n");
		end

*/


	end
endmodule
		
		
	
	
		

