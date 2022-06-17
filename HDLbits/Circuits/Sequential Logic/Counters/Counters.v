/*Counters*/
//Four-bit binary counter
module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
	
	always@(posedge clk) begin
		if(reset || q == 4'hf)
			q <= 4'd0;
		else
			q <= q + 1'b1;
	end	
	
endmodule

////////////////////////////

//Decade counter
module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
	
	always@(posedge clk) begin
		if(reset || q == 4'h9)
			q <= 4'd0;
		else 
			q <= q + 1'b1;
	end
	
endmodule

//////////////////////////////

//Decade counter again
module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
	
	always@(posedge clk) begin
		if(reset || q == 4'ha)
			q <= 4'd1;
		else 
			q <= q + 1'b1;
	end
	
endmodule

/////////////////////////////

//Show decade counter
module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
	
	always@(posedge clk) begin
		if(reset || q == 4'h9)
			q <= 4'd0;
		else if(slowena)
			q <= q + 1'b1;
		else
			q <= q;
	end	
	
endmodule
