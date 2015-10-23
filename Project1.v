//////////////////////////////////////////////////////////////////////////////////
// Name:   Project1.v                                      		                //
//                                                                              //
// Author: Sergio PL                                                            //
//         http://idielectronica.blogspot.com/                                  //
//                                                                              //
// Description: Sample code for Terasic DE0-Nano FPGA board. State machine      //
// makes on-board LEDs blink.                                                   //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

module Project1(		// The top-level module must match the name 
input CLOCK_50,			// of the project file
output reg [7:0]LED
);

reg 	[25:0]count;	
reg			clk2;	
reg			state=0;

// clock divider 50MHz to 1Hz
always@(posedge CLOCK_50)
    begin
        if(count==26'd25_000_000)    // counts 25M clk cycles and 
            begin                    // toggles clk2 hi or lo
             count<=0;                
             clk2 <= ~clk2;          
            end
        else
            begin
             count<=count+1;
            end
    end     

// state machine blinks on-board LEDs 
always @(posedge clk2)
	begin
		 case(state)
		 1'b0:	begin
			LED[7:0] <= 8'b01010101;	// turns on LEDs
			state <= 1'b1;				// next state
			end
		1'b1: 	begin	
			LED[7:0] = 8'b10101010;
			state <= 1'b0;
			end
		default: begin
			state <= 1'b0;
			end
		endcase	
	end
endmodule
 

