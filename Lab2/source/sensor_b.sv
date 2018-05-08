// $Id: $
// File name:   sensors_b.sv
// Created:     1/16/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: behavioral

module sensor_b(
		input wire [3:0] sensors,
		output reg error
		);
   
   reg o1;
   reg o2;
   
always_comb
  begin
    if(sensors[0] == 1)
	error = 1;
else if(sensors[1] == 1 && (sensors[2] == 1 || sensors[3] == 1))
error = 1;
else
error = 0;
  end // always_comb
    // UNMATCHED !!

     
   //o1 = {sensors[3] || sensors[2]};
   //o2 = {o1 && sensors[1]};
   //error = {sensors[0] || o2};

   endmodule
