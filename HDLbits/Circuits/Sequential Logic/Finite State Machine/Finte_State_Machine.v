/*Finite State Machines*/
//Simple FSM1
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
	
	//And when you after state desciption, you need to output your answer
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