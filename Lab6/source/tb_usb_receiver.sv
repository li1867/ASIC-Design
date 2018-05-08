// $Id: $
// File name:   tb_usb_receiver.sv
// Created:     2/21/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: use receiver test bench

//`timescale 1ns / 100ps

module tb_usb_receiver();
/*
	localparam CLK_PERIOD = 10.4;
	localparam SIZE = 4;
	localparam DELAY = 1;
	
	

	reg tb_clk;	 
	reg tb_n_rst; 
	reg tb_d_plus; 
	reg tb_d_minus; 
	reg tb_r_enable; 
	
	//output from RX FIFO block
	reg [7:0] tb_r_data; 
	reg tb_empty; 
	reg tb_full; 
	
	//output from RCU block
	reg tb_rcving; 
	reg tb_r_error;

	usb_receiver DUT (.clk(tb_clk), .n_rst(tb_n_rst), .d_plus(tb_d_plus), .d_minus(tb_d_minus), .r_enable(tb_r_enable), .r_data(tb_r_data), .empty(tb_empty), .full(tb_full), .rcving(tb_rcving), .r_error(tb_r_error));
	
	reg [7:0] input1 = 8'b10000000;	
	
	task Bit;	
		input d_plus;
		begin
			tb_d_plus = d_plus;
			tb_d_minus = !d_plus;	
			#(CLK_PERIOD * 8);		
		end
	endtask

	task send_eop;
		tb_d_plus = '0;
		tb_d_minus = '0;
		#(CLK_PERIOD * 2*8);
		tb_d_plus = '1;
		tb_d_minus = '0;
	endtask
		
	task Byte;
		int i;
		input [7:0] input1;
		for(i = 0; i < 8; i = i + 1) begin
			Bit(input1[i]);
		end
	endtask
	
	

	always begin
		tb_clk = '0;
		#(CLK_PERIOD / 2.0);
		tb_clk = '1;
		#(CLK_PERIOD / 2.0);
	end
	
	initial begin
		tb_n_rst = '0;
		@(posedge tb_clk);
		tb_n_rst = '1;
		tb_r_enable = '1;
		Byte(input1);
		send_eop;
		@(posedge tb_clk);
		Byte(input1);
		send_eop;
		@(posedge tb_clk);
		Byte(input1);
		send_eop;
		@(posedge tb_clk);
		Byte(input1);
		send_eop;
		@(posedge tb_clk);
		Byte(input1);
		send_eop;
		@(posedge tb_clk);
		Byte(input1);
		send_eop;
		@(posedge tb_clk);
		Byte(input1);
		send_eop;
		@(posedge tb_clk);
		Byte(input1);
		send_eop;
		@(posedge tb_clk);
		Byte(input1);
		send_eop;
		@(posedge tb_clk);
		Byte(input1);
		send_eop;
	
	end
		
		
		
		
		
		
	*/


endmodule



