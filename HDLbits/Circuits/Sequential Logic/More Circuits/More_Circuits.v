/*More Circuits*/
//Rule 90
module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
	
	always@(posedge clk) begin
		if(load) begin
			q <= data;
		end
		else begin
			q[0] <= q[1]^1'b0;
			q[511] <= q[510]^1'b0;
			for(int i=1; i<511; i=i+1) begin
				q[i] <= q[i-1] ^ q[i+1];
			end
		end	
	end
	
endmodule

//////////////////////////////////

//Rule 110
module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
);

	always@(posedge clk) begin
		if(load) begin
			q <= data;
		end	
		else begin
			q[]
		end	
	end
	
endmodule

///////////////////////////////////

//Conway's game of life
/*I'm not going to study Conway's game of life*/
module top_module(
	input clk,
	input load,
	input [255:0] data,
	output [255:0] q
);

	reg [15:0] q_2d [15:0]; //2 dimensional declaring
	reg [15:0] q_next [15:0]; //2 dimensional q next state
	reg [3:0] sum;
	
	integer i, j;
	always@(*) begin
		for(i=0; i<16; i++) begin
			for(j=0; j<16; j++) begin
				if(i==0 && j==0)//top left 
					sum = q_2d[15][1]+q_2d[15][0]+q_2d[15][15]+q_2d[0][1]+q_2d[0][15]+q_2d[1][0]+q_2d[1][1]+q_2d[1][15];
			end
		end
	end
	
endmodule