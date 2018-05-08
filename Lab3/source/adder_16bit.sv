// $Id: $
// File name:   adder_16bit.sv
// Created:     1/23/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: 16bit adder
`timescale 1ns / 100ps
module adder_16bit(
		   input wire [15:0] a,
		   input wire [15:0] b,
		   input wire carry_in,

		   output wire [15:0] sum,
		   output wire overflow
		   
		   );
   adder_nbit #(16) A1 (.a(a), .b(b), .carry_in(carry_in), .sum(sum), .overflow(overflow));

   //genvar 		       i;
   int 			       i;
	
always @ (a,b,carry_in)
	  begin
	     for (i = 0; i < 16; i = i + 1) begin
		assert((a[i] == 1'b1) || (a[i] == 1'b0))
		  else $error("Input 'a' of component is not a digital logic value");
		assert((b[i] == 1'b1) || (b[i] == 1'b0))
		  else $error("Input 'b' of component is not a digital logic value");
	     end
	     assert((carry_in == 1'b1) || (carry_in == 1'b0))
		  else $error("Input 'carry_in' of component is not a digital logic value");
	     
	  end


	always @ (a, b, carry_in)
	begin
	#(2) assert(((a + b + carry_in)) == {overflow, sum})
		    else $error("Output 's' is not correct");
	end

   endmodule
   
