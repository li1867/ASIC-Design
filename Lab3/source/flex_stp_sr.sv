// $Id: $
// File name:   flex_stp_sr.sv
// Created:     1/28/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: module 4.1.1

module flex_stp_sr
  #(
    parameter NUM_BITS = 4,
    parameter SHIFT_MSB = 1
    )
   (	  
		   input wire 			 clk,
	  	   input wire 			 n_rst,
		   input wire 			 serial_in,
		   input wire 			 shift_enable,
		   output reg [(NUM_BITS - 1):0] parallel_out
    );
   
   reg [(NUM_BITS - 1) : 0] 			Q;
   int i;
   
   always_ff @ (posedge clk, negedge n_rst)
     begin
	if (n_rst == 0)
	for( i = 0; i < NUM_BITS; i = i + 1) begin
	  parallel_out[i] <= 1;
	end
	else
	parallel_out <= Q;	
     end
   
always_comb
     begin
	if (shift_enable == 1)
	  begin
	  if (SHIFT_MSB == 1)
	    begin
	       Q <= {parallel_out[(NUM_BITS-2):0],serial_in};     
	    end
	  else
	    begin
	       Q <= {serial_in,parallel_out[(NUM_BITS-1):1]};
	    end
	  end
	else
	  begin
	     Q <= parallel_out;
	  end   
       end
endmodule
   
