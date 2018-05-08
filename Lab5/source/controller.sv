// $Id: $
// File name:   controller.sv
// Created:     2/12/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: controller

module controller
(
	input wire clk,
	input wire n_rst,
	input wire dr,
	input wire lc,
	input wire overflow,
	output reg cnt_up,
	output reg clear,
	output reg modwait,
	output reg [2:0] op,
	output reg [3:0] src1,
	output reg [3:0] src2,
	output reg [3:0] dest,
	output reg err
);

typedef enum bit [4:0] {IDLE, STORE, ZERO, SORT1, SORT2, SORT3, SORT4, MUL1, ADD1, MUL2, SUB1, MUL3, ADD2, MUL4, SUB2,  EIDLE, COEF1, COEF2, COEF3, COEF4, DUMMY1, DUMMY2, DUMMY3} stateType;
stateType next_state;
stateType current_state;
reg current_mod;
reg next_mod;

always_ff @ (posedge clk, negedge n_rst) begin
	if(n_rst == 0) begin
		current_state <= IDLE;
		current_mod <= 0;
	end
	else begin
		current_state <= next_state;
		current_mod <= next_mod;	
	end
end

always_comb begin
	cnt_up = 0;
	clear = 0;
	op = 3'b000; //NOP
	src1 = 4'd0;
	src2 = 4'd0;
	dest = 4'd0;
	err = 0;
	next_mod = 1;
	
	if(current_state == IDLE) begin
		//clear = 1;
		next_mod = 0;
	end
	else if(current_state == STORE) begin
		dest = 4'd5;
		op = 3'b010;  //LOAD1
	end
	else if(current_state == ZERO) begin
		cnt_up = 1;
		op = 3'b101;  //SUB
		src1 = 0;
		src2 = 0;
		dest = 0;
	end
	else if(current_state == SORT1) begin
		//cnt_up = 1;
		op = 3'b001;  //COPY
		src1 = 4'd2;
		dest = 4'd1;
	end
	else if(current_state == SORT2) begin
		op = 3'b001;  //COPY
		src1 = 4'd3;
		dest = 4'd2;
	end
	else if(current_state == SORT3) begin
		op = 3'b001;  //COPY
		src1 = 4'd4;
		dest = 4'd3;
	end
	else if(current_state == SORT4) begin
		op = 3'b001;  //COPY
		src1 = 4'd5;
		dest = 4'd4;
	end
	else if(current_state == MUL1) begin
		op = 3'b110;  //MUL
		src1 = 4'd1;
		src2 = 4'd9;
		dest = 4'd10;
	end
	else if(current_state == ADD1) begin
		op = 3'b100;  //ADD
		src1 = 4'd0;
		src2 = 4'd10;
		dest = 4'd0;
	end
	else if (current_state == MUL2) begin
		op = 3'b110;  //MUL
		src1 = 4'd8;
		src2 = 4'd2;
		dest = 4'd10;
	end
	else if(current_state == SUB1) begin
		op = 3'b101;  //SUB
		src2 = 4'd10;
		src1 = 0;
		dest = 0;
	end
	else if(current_state == MUL3) begin
		op = 3'b110;  //MUL
		src1 = 4'd3;
		src2 = 4'd7;
		dest = 4'd10;
	end
	else if(current_state == ADD2) begin
		op = 3'b100;  //ADD
		src2 = 4'd10;
		src1 = 4'd0;
		dest = 4'd0;
	end
	else if(current_state == MUL4) begin
		op = 3'b110;  //MUL
		src1 = 4'd4;
		src2 = 4'd6;
		dest = 4'd10;
	end
	else if(current_state == SUB2) begin
		op = 3'b101;  //SUB
		src2 = 4'd10;
		src1 = 4'd0;
		dest = 4'd0;
	end
	else if(current_state == COEF1) begin
		op = 3'b011;  //LOAD2
		dest = 4'd6;
		clear = 1;
	end
	else if(current_state == COEF2) begin
		op = 3'b011;  //LOAD2
		dest = 4'd7;
		clear = 1;
	end
	else if(current_state == COEF3) begin
		op = 3'b011;  //LOAD2
		dest = 4'd8;
		clear = 1;
	end
	else if(current_state == COEF4) begin
		op = 3'b011;  //LOAD2
		dest = 4'd9;
		clear = 1;
	end
	else if(current_state == DUMMY1) begin
		next_mod = 0;
	end
	else if(current_state == DUMMY2) begin
		next_mod = 0;
	end
	else if(current_state == DUMMY3) begin
		next_mod = 0;
	end
	else if(current_state == EIDLE) begin
		err = 1;
		next_mod = 0;
	end

end

always_comb begin
	next_state = current_state;
	//next_mod = current_mod;

	case(current_state)
	IDLE: begin
		if(dr == 1) begin
			next_state = STORE;
			//next_mod = 1;
		end
		else if (lc == 1) begin
			next_state = COEF1;
			//next_mod = 1;
		end
		else begin
			next_state = IDLE;
	//		next_mod = 0;
		end
	end
	STORE: begin
		if(dr == 0) begin
			next_state = EIDLE;
	//		next_mod = 0;
		end
		else begin
			next_state = ZERO;
	//		next_mod = 1;
		end
	end
	ZERO: begin
		next_state = SORT1;
	//	next_mod = 1;
	end
	SORT1: begin
		next_state = SORT2;
	//	next_mod = 1;
	end
	SORT2: begin
		next_state = SORT3;
	//	next_mod = 1;
	end
	SORT3: begin
		next_state = SORT4;
	//	next_mod = 1;
	end
	SORT4: begin
		next_state = MUL1;
	//	next_mod = 1;
	end
	MUL1: begin
		next_state = SUB1;
	//	next_mod = 1;
	end
	ADD1: begin
		if(overflow == 1) begin
			next_state = EIDLE;
	//		next_mod = 0;
		end
		else begin
			next_state = MUL3;
	//		next_mod = 1;
		end
	end
	MUL2: begin
		next_state = ADD1;
	//	next_mod = 1;
	end
	SUB1: begin
		if(overflow == 1) begin
			next_state = EIDLE;
	//		next_mod = 0;
		end
		else begin
			next_state = MUL2;
	//		next_mod = 1;
		end
	end
	MUL3: begin
		next_state = SUB2;
	//	next_mod = 1;
	end
	ADD2: begin
		if(overflow == 1) begin
			next_state = EIDLE;
	//		next_mod = 0;
		end
		else begin
			next_state = IDLE;
	//		next_mod = 1;
		end
	end
	MUL4: begin
		next_state = ADD2;
	//	next_mod = 1;
	end
	SUB2: begin
		if(overflow == 1) begin
			next_state = EIDLE;
	//		next_mod = 0;
		end
		else begin
			next_state = MUL4;
	//		next_mod = 1;
		end
	end
	//LOAD: begin
	//	next_state = IDLE;	
	//	next_mod = 1;
	//end
	COEF1: begin
		next_state = DUMMY1;
	//	next_mod = 0;
	end
	DUMMY1: begin
		if (lc == 1'b1) begin
			next_state = COEF2;
	//		next_mod = 1;
		end
		else begin
			next_state = DUMMY1;
	//		next_mod = 0;
		end
	end
	COEF2: begin
		next_state = DUMMY2;
	//	next_mod = 0;
	end
	DUMMY2: begin
		if (lc == 1'b1) begin
			next_state = COEF3;
	//		next_mod = 1;
		end
		else begin
			next_state = DUMMY2;
	//		next_mod = 0;
		end
	end
	COEF3: begin
		next_state = DUMMY3;
	//	next_mod = 0;
	end
	DUMMY3: begin
		if (lc == 1'b1) begin
			next_state = COEF4;
	//		next_mod = 1;
		end
		else begin
			next_state = DUMMY3;
	//		next_mod = 0;
		end
	end
	COEF4: begin
		next_state = IDLE;
	//	next_mod = 0;
	end
	EIDLE: begin
		if(dr == 1) begin
			next_state = STORE;
	//		next_mod = 1;
		end
		else if (lc == 1) begin
			next_state = COEF1;
	//		next_mod = 1;
		end
		else begin
			next_state = EIDLE;
	//		next_mod = 0;
		end
	end
endcase	
end
assign modwait = current_mod;

endmodule


	























