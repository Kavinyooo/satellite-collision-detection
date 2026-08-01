`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:13:15 07/24/2026
// Design Name:   Satellite_Collision_Sys
// Module Name:   /home/ise/Satellite_Collision_System/tb_satellite.v
// Project Name:  Satellite_Collision_System
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Satellite_Collision_Sys
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_satellite;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [7:0] Ax;
	wire [7:0] Ay;
	wire [7:0] Bx;
	wire [7:0] By;
	wire [7:0] distance;
	wire collision;
	wire [2:0] thrust_level;
	wire [1:0] state;

	// Instantiate the Unit Under Test (UUT)
	Satellite_Collision_Sys uut (
		.clk(clk), 
		.rst(rst), 
		.Ax(Ax), 
		.Ay(Ay), 
		.Bx(Bx), 
		.By(By), 
		.distance(distance), 
		.collision(collision), 
		.thrust_level(thrust_level), 
		.state(state)
	);

	always #5 clk=~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		
		#20;
		rst=0;
		#300;
	
	$finish;
		// Add stimulus here

	end

	//Display values
	
	initial begin
	
		$monitor(
		"Time=%0t | State=%b | A=(%d,%d) | B=(%d,%d) | Dist=%d | Collision=%b | Thrust=%d",
		$time,
		state,
		Ax,
		Ay,
		Bx,
		By,
		distance,
		collision,
		thrust_level
		);
		
	end
endmodule


