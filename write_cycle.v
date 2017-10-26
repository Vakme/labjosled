`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:41 10/24/2017 
// Design Name: 
// Module Name:    write_cycle 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module write_cycle(
	input clk;
    input wr_enable,
    output reg [1:0] state,
    output reg wr_finish,
    output reg E_out
    );

always @(posedge clk)
	case(state)
		2'b00: // idle
			wr_finish <= 1'b0;
			if(wr_enable)
				state <= 2'b01;
		2'b01: // init
			E_out <= 1'b1;
			state <= 2'b10;
		2'b10: // Eout 
			state <= 2'b11;
		2'b11: // endwr
			E_out <= 1'b0;
			state <= 2'b00;
	endcase
	

endmodule
