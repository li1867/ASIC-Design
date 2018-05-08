// $Id: $
// File name:   sensor_d.sv
// Created:     1/16/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: step122.
// 
module sensor_d(
		input wire [3:0] sensors,
		output wire error
		);

   wire o1;
   wire o2;

   assign o1 = sensors[3] || sensors[2];
   assign o2 = o1 && sensors[1];
   assign error = sensors[0] || o2;
   

   endmodule
