/*Finite State Machines*/
//Simple FSM1(asynchronous reset)
module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

	//This part is for state desciption
    parameter A=1'b0, B=1'b1; 
    reg current_state, next_state;

	always@(posedge clk or posedge areset) begin
		if(areset) begin
			current_state <= B;
		end
		else begin
			current_state <= next_state;
		end
	end

	always@(*) begin
		case(current_state)
			B:begin
				if(in == 1'b1) begin
					next_state = B;
				end
				else begin
					next_state = A;
				end
			end
			
			A:begin
				if(in == 1'b1) begin
					next_state = A;
				end
				else begin
					next_state = B;
				end
			end
			
			default: begin
				next_state = current_state;
			end
		endcase
	end
	
	//When you after state desciption, you need to implement state output
	always@(posedge clk or posedge areset) begin
		if(areset) begin
			out <= 1'b1;
		end
		else if(next_state == B) begin
			out <= 1'b1;
		end
		else begin
			out <= 1'b0;
		end
	end
endmodule

////////////////////////////////////////

//Simple FSM1(synchronous reset)
module top_module(
	input clk,
	input reset,
	input in,
	output out
);
	parameter A = 1'b0, B = 1'b1;
	reg current_state,  next_state;
	
	always@(posedge clk) begin
		if(reset)
			current_state <= B;
		else
			current_state <= next_state;
	end
	
	always@(*) begin
		case(current_state)
			B: begin
				if(in == 1'b1)
					next_state = B;
				else
					next_state = A;
			end
			A: begin
				if(in == 1'b1)
					next_state = A;
				else
					next_state = B;
			end
			
			default: 
				next_state = current_state;
		endcase
	end
	
	always@(posedge clk) begin
		if(reset)
			out <= 1'b1;
		else if(next_state == B)
			out <= 1'b1;
		else if(next_state == A)
			out <= 1'b0;
	end
endmodule

/////////////////////////////////////////////

//Simple FSM2(asynchronous)
module top_module(
	input clk,
	input areset,
	input j,
	input k,
	output out);
	
	parameter OFF = 1'b0, ON = 1'b1;
	reg current_state, next_state;
	
	always@(posedge clk or posedge areset) begin
		if(areset)
			current_state <= OFF;
		else
			current_state <= next_state;
	end
	
	always@(*) begin
		case(current_state)
			OFF: begin 
				if(j == 1'b0)
					next_state = OFF;
				else if(j == 1'b1)
					next_state = ON;
			end
			ON: begin
				if(k == 1'b0)
					next_state = ON;
				else if(k == 1'b1)
					next_state = OFF;
			end
			
			default: begin
				next_state = current_state;
			end
		endcase
	end
	
	always@(posedge clk or posedge areset) begin
		if(areset)
			out <= 1'b0;
		else if(next_state == OFF)
			out <= 1'b0;
		else if(next_state == ON)
			out <= 1'b1;
	end	
	
endmodule

/////////////////////////////////////

//Simple FSM2(synchronous)
module top_module(
	input clk,
	input reset,
	input j,
	input k,
	output out);
	
	parameter OFF = 1'b0, ON = 1'b1;
	reg current_state, next_state;
	
	always@(posedge clk) begin
		if(reset)
			current_state <= OFF;
		else
			current_state <= next_state;
	end
	
	always@(*) begin
		case(current_state)
			OFF: begin 
				if(j == 1'b0)
					next_state = OFF;
				else if(j == 1'b1)
					next_state = ON;
			end
			ON: begin
				if(k == 1'b0)
					next_state = ON;
				else if(k == 1'b1)
					next_state = OFF;
			end
			
			default: begin
				next_state = current_state;
			end
		endcase
	end
	
	always@(posedge clk) begin
		if(reset)
			out <= 1'b0;
		else if(next_state == OFF)
			out <= 1'b0;
		else if(next_state == ON)
			out <= 1'b1;
	end	
	
endmodule

////////////////////////////////////

//Simple state transitions 3
module top_module(
	input in,
	input [1:0] state,
	output [1:0] next_state,
	output out);
	
	parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;
	
	always@(*) begin
		case(state)
			2'b00: begin
				if(in == 1'b0)
					next_state = A;
				else if(in == 1'b1)
					next_state = B;
			end
			
			2'b01: begin
				if(in == 1'b0)
					next_state = C;
				else if(in == 1'b1)
					next_state = B;
			end
			
			2'b10: begin
				if(in == 1'b0)
					next_state = A;
				else if(in == 1'b1)
					next_state = D;
			end
			
			2'b11: begin
				if(in == 1'b0)
					next_state = C;
				else if(in == 1'b1)
					next_state = B;
			end
			
			default:
				next_state = state;
		endcase
	end
	
	always@(*) begin
		if(state == 2'b00)
			out = 1'b0;
		else if(state == 2'b01)
			out = 1'b0;
		else if(state == 2'b10)
			out = 1'b0;
		else if(state == 2'b11)
			out = 1'b1;
	end
	
endmodule

///////////////////////////////////////

//Simple one-hot state transitions 3