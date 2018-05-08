// $Id: $
// File name:   sensor_s.sv
// Created:     1/16/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: step 1.2.1.1
// 

module sensor_s(
	
	input wire[3:0] sensors,
	output wire error
	
);

wire o1;
wire o2;

OR2X1 A2 (.Y(o1),.A(sensors[3]),.B(sensors[2]));
AND2X1 A1 (.Y(o2),.A(o1),.B(sensors[1]));
OR2X1 A3 (.Y(error),.A(sensors[0]),.B(o2));


endmodule

