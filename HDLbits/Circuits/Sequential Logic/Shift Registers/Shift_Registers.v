/*Shift Registers*/
//4-bit shift register
module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
		
	always@(posedge clk, posedge areset) begin
		if(areset)
			q <= 4'b0;
		else if(load)
			q <= data;
		else if(ena)
			q <= q[3:1];
	end	

endmodule

////////////////////////////////

//Left/right rotator
module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 
	
	always@(posedge clk) begin
		if(load)
			q <= data;
		else
			case(ena)
				2'b00 : q <= q;
				2'b01 : q <= {q[0], q[99:1]};
				2'b10 : q <= {q[98:0], q[99]};
				default : q <= q;
			endcase
	end
	
endmodule
