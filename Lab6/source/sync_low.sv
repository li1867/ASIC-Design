// $Id: $
// File name:   sync_low.sv
// Created:     1/21/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: reset to logic low synchronizer

module sync_low(
		input wire clk,
		input wire n_rst,
		input wire async_in,
		output reg sync_out
		);

   reg 			    Q; //flip flop signal name
   
   always_ff @ (posedge clk, negedge n_rst)
     begin
	if(1'b0 == n_rst)
	  begin
	     Q <= 0;
	     sync_out <= 0;
	  end
	else if(async_in == 0 || async_in == 1)
	  begin
	     Q <= async_in;
	     sync_out <= Q;
	  end
	else
	       begin
		  Q <= 0;
		  sync_out <= 0;
	       end
	  end // always_ff @

   endmodule
	    
   
