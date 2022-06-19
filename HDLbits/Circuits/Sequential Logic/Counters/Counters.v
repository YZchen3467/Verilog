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

/////////////////////////////////

//Counter 1-12 (important)
module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); 
	
    assign c_enable = enable;
    assign c_load = reset || ((Q == 4'd12) && (enable == 1'b1));
    assign c_d = c_load ? 4'd1 : 4'd0;
   
    count4 the_counter (clk, c_enable, c_load, c_d, Q);

endmodule

//////////////////////////////////

//Counter 1000 (important)
module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
	
	wire [3:0] Q0, Q1, Q2;
	
    bcdcount counter0 (clk, reset, c_enable[0], Q0);
    bcdcount counter1 (clk, reset, c_enable[1], Q1);
	bcdcount counter1 (clk, reset, c_enable[2], Q2);
	
	assign c_enable[0] = ~reset;
	assign c_enable[1] = ~reset && (Q0 == 4'd9);
	assign c_enable[2] = ~reset && (Q0 == 4'd9) && (Q1 == 4'd9);
	
	assign OneHertz = (Q0 == 4'd9) && (Q1 == 4'd9) && (Q2 == 4'd9) ? 1'b1 : 1'b0;
endmodule

////////////////////////////////////

//4-digit decimal counter (not understand yet)
module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    always@(posedge clk)begin
        if(reset)begin
            q <= 'd0;
        end
        else if(q[3:0] != 'd9)begin
            q[3:0] <= q[3:0] + 1'b1;
        end
        else begin
            q[3:0] <= 'd0;
            q[7:4] <= q[7:4] + 1'b1;
            if(q[7:4] == 'd9)begin
                q[7:4] <= 'd0;
                q[11:8] <= q[11:8] + 'd1;
                if(q[11:8] == 'd9)begin
                    q[11:8] <= 'd0;
                    q[15:12] <= q[15:12] + 'd1;
                    if(q[15:12] == 'd9)begin
                        q[15:12] <= 'd0;
                    end
                end
            end
        end
    end
    assign ena[1] = q[3:0] == 4'd9;
    assign ena[2] = q[7:4] == 4'd9 && q[3:0] == 4'd9; 
    assign ena[3] = q[11:8] == 4'd9 && q[7:4] == 4'd9 && q[3:0] == 4'd9; 
endmodule