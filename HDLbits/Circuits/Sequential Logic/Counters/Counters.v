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
		if(reset)
			q <= 4'd0;
		else if(slowena) begin
			if(q == 4'd9)
				q <= 4'd0;
			else
				q <= q + 1'b1;
		end
	end	
	
endmodule

//////////////////////////////

//Counter 1-12
module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
	
	assign c_enable = enable;
    assign c_load = reset || ((Q == 4'd12) && enable == 1'b1);
    assign c_d = c_load ? 4'd1 : 4'd0;
    
	count4 the_counter (clk, c_enable, c_load, c_d, Q);
	
endmodule
//need to comfirm this problem

/////////////////////////////////

//Counter 1000
module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //

    bcdcount counter0 (clk, reset, c_enable[0]/*, ... */);
    bcdcount counter1 (clk, reset, c_enable[1]/*, ... */);

endmodule
