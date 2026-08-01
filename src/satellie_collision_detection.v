`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:14:42 07/24/2026 
// Design Name: 
// Module Name:    Satellite_Collision_Sys 
// Project Name: 
// Target Devices: 
// Tool versions: x
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Satellite_Collision_Sys(
		input clk,
		input rst,
		
		output reg[7:0] Ax,
		output reg[7:0] Ay,
		output reg[7:0] Bx,
		output reg[7:0] By,
		
		output[7:0] distance,
		
		output reg collision,
		output reg[2:0] thrust_level,
		output reg[1:0] state
	 );

	parameter safe=8;
	parameter move=2'b00;
	parameter warning=2'b01;
	parameter avoid=2'b10;
	
	wire[7:0] dx;
	wire[7:0] dy;
	
	assign dx=(Ax>Bx)?(Ax-Bx):(Bx-Ax);
	assign dy=(Ay>By)?(Ay-By):(By-Ay);
	assign distance=(dx+dy);
	
	always@(posedge clk or posedge rst)
		
		begin
			if(rst)
				
				begin
					Ax<=8'd10;
					Ay<=8'd10;
					
					Bx<=8'd30;
					By<=8'd10;
					
					collision<=0;
					thrust_level<=0;
					
					state<=move;
				end
			
			else
			
				begin
					case(state)
					
						move:
							begin
								collision<=0;
								thrust_level<=0;
								
								Ax<=Ax+1;
								Bx<=Bx-1;
								
								if(distance<=safe)
									state<=warning;
							end
						
						warning:
							begin
								collision<=1;
								state<=avoid;
							end
							
						avoid:
							begin
								if(distance<=2)
									begin
										thrust_level<=3'd5;
										Bx<=Bx+5;
										By<=By+1;
									end
								
								else if(distance<=4)
									begin
										thrust_level<=3'd4;
										Bx<=Bx+4;
										By<=By+1;
									end
									
								else if(distance<=6)
									begin
										thrust_level<=3'd3;
										Bx<=Bx+3;
										By<=By+1;
									end
						
								else
									begin
										thrust_level<=3'd2;
										Bx<=Bx+2;
										By<=By+2;
									end
								
								if(distance>safe)
									begin
										collision<=0;
										thrust_level<=0;
										state<=move;
									end
							end

					default:
						begin
							state<=move;
						end
				
				endcase
			end
		end
endmodule

