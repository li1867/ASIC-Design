// $Id: $
// File name:   fir_filter.sv
// Created:     2/12/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: fir_filter

module fir_filter
(
	input wire clk,
	input wire n_reset,
	input wire [15:0] sample_data,
	input wire [15:0] fir_coefficient,
	input wire data_ready,
	input wire load_coeff,
	output wire one_k_samples,
	output wire modwait,
	output wire [15:0] fir_out,
	output wire err
);

reg dataready;
reg loadcoeff;

wire lc_temp;
wire dr_temp;
wire overflow_temp;
wire cnt_up_temp;
wire clear_temp;
wire [2:0]op_temp;
wire [3:0]src1_temp;
wire [3:0]src2_temp;
wire [3:0]dest_temp;
wire [16:0] mag_in_temp;


sync_low A (.clk(clk), .n_rst(n_reset), .async_in(data_ready), .sync_out(dataready));
sync_low B (.clk(clk), .n_rst(n_reset), .async_in(load_coeff), .sync_out(loadcoeff));

controller control(.clk(clk), .n_rst(n_reset), .dr(dataready), .lc(loadcoeff), .overflow(overflow_temp), .cnt_up(cnt_up_temp), .clear(clear_temp), .modwait(modwait), .op(op_temp), .src1(src1_temp), .src2(src2_temp), .dest(dest_temp), .err(err));
datapath data(.clk(clk), .n_reset(n_reset), .op(op_temp), .src1(src1_temp), .src2(src2_temp), .dest(dest_temp),.ext_data1(sample_data),.ext_data2(fir_coefficient), .outreg_data(mag_in_temp), .overflow(overflow_temp));
magnitude get_pos(.in(mag_in_temp), .out(fir_out));
counter count(.clk(clk), .n_reset(n_reset), .cnt_up(cnt_up_temp),.clear(clear_temp), .one_k_samples(one_k_samples));
//datapath data(.clk(clk), .n_reset(n_reset), .op(op_temp), .src1(src1_temp), .src2(src2_temp), .dest(dest_temp),.ext_data1(sample_data),.ext_data2(fir_coefficient), .outreg_data(mag_in_temp), .overflow(overflow_temp));


endmodule



