//***************************************************************************************
// Name:   		clk_div_odd.v
//
// Author: 		Sergio PL                                                                 
//         		http://github.com/MrPotati/      http://idielectronica.blogspot.com/                                              
//
// Device: 		FPGA, CPLD                 
//
// Description: This Verilog code describes a frequency divider by 5. The code can be 
// easily modified to divide the clock by 3, 7, or any other odd number N. Simply modify 
// the counter value in line 38 with N-1 (example, use 6 if you want to divide by 7) and 
// the value in line 60 with (N+1)/2  (example, use 4 to divide by 7, since (7+1)/2=4.
//***************************************************************************************

`timescale 1ns / 1ps

module clk_div_odd(
	input			clk_in,
	output 		clk_out
    );

reg  [3:0] count = 4'b0;
reg 		  A1 = 0;
reg 	     B1 = 0;
reg	 	  Tff_A = 0;
reg		  Tff_B = 0;
wire		  clock_out;
wire		  wTff_A;
wire		  wTff_B;

assign 	 wTff_A  = Tff_A;			//Connects registers to wires 
assign 	 wTff_B  = Tff_B;			//to use combinational logic

assign 	 clk_out = wTff_B ^ wTff_A;	//XOR gate produces output clock.

//Counter for division by N
always@(posedge clk_in)
	begin
		if(count == 4'b1000)	//Count to N-1. Ex: Use 4 to divide by 5
			begin
				count <= 4'b0000;
			end	
		else
			begin
				count <= count + 1;
			end	
	end

//Sets A to high for one clock cycle after counter is 0
always@(posedge clk_in)
	begin
		if(count == 4'b0000)
			A1 <= 1;
		else
			A1 <= 0;
	end

//Sets B to high for one clock cycle after counter is (N+1)/2
always@(posedge clk_in)
	begin
		if(count == 4'b0101)	//Use (N+1)/2. Ex: (5+1)/2 = 3		
			B1 <= 1;
		else
			B1 <= 0;
	end

//T flip flop toggles 
always@(negedge A1)		// Toggle signal Tff_A whenever A1 goes from 1 to 0
	begin
		Tff_A <= ~Tff_A;
	end

always@(negedge clk_in)
	begin
		if(B1)				// Toggle signal Tff_B whenever B1 clk_in goes from 1 to 0
			begin				// and B1 is 1
				Tff_B <= ~Tff_B;
			end
	end

endmodule
