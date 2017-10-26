`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:49:21 10/24/2017 
// Design Name: 
// Module Name:    LCD_init_refresh 
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
module LCD_init_refresh(
    input clk,
    input rst,
    input lcd_enable,
    input mode,
    input [1:0] lcd_cnt,
    output reg lcd_finish,
    output reg wr_enable,
    output reg wr_finish,
    output reg [1:0] mux_sel,
    output reg [1:0] init_sel
    );

localparam  idle = 2'b00,
			data = 2'b01,
			data1 = 2'b10,
			endlcd = 2'b11;

reg [1:0] state, next_state;

always @(posedge clk, posedge rst)
	if(rst)
		state <= idle;
	else
		state <= next_state;
		
always @*
begin
	case(state)
		idle:
			if(lcd_enable)
				
			else 
				next_state = idle;
		data:
			next_state = data1;
		data1: 
			if(wr_finish)
				next_state = endlcd;
			else
				next_state = data1;
		endlcd:
			next_state = idle;
	endcase
end

endmodule
