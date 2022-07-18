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
			q[0] <= q[0];
			q[511] <= q[511]^q[510] || q[510];
			for(int i=1; i<511; i=i+1) begin
				q[i] <= (q[i] ^ q[i-1]) | (!q[i+1] & q[i]);
			end
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
				else if(i==0 && j==0)//top right
					sum = sum=q_2d[0][0]+q_2d[0][14]+q_2d[15][0]+q_2d[15][14]+q_2d[15][15]+q_2d[1][0]+q_2d[1][14]+q_2d[1][15];
				else if(i==15 && j==0)//bottom left
                    sum = q_2d[15][1]+q_2d[15][15]+q_2d[14][0]+q_2d[14][15]+q_2d[14][1]+q_2d[0][0]+q_2d[0][1]+q_2d[0][15];
                else if(i==15 && j==15)//bottom right
                    sum = q_2d[15][0]+q_2d[15][14]+q_2d[14][15]+q_2d[14][0]+q_2d[14][14]+q_2d[0][0]+q_2d[0][15]+q_2d[0][14];
				else if(i==0)//top border
                    sum=q_2d[0][j-1]+q_2d[0][j+1]+q_2d[1][j-1]+q_2d[1][j]+q_2d[1][j+1]+q_2d[15][j-1]+q_2d[15][j]+q_2d[15][j+1];
                else if(i==15)//bottom border
                    sum=q_2d[15][j-1]+q_2d[15][j+1]+q_2d[0][j-1]+q_2d[0][j]+q_2d[0][j+1]+q_2d[14][j-1]+q_2d[14][j]+q_2d[14][j+1];
                else if(j==0)//left border
                    sum=q_2d[i][1]+q_2d[i][15]+q_2d[i-1][0]+q_2d[i-1][15]+q_2d[i-1][1]+q_2d[i+1][0]+q_2d[i+1][1]+q_2d[i+1][15];
                else if(j==15)//right border
                    sum=q_2d[i][0]+q_2d[i][14]+q_2d[i-1][0]+q_2d[i-1][14]+q_2d[i-1][15]+q_2d[i+1][0]+q_2d[i+1][14]+q_2d[i+1][15];
                else  //mid item
                    sum=q_2d[i-1][j]+q_2d[i-1][j-1]+q_2d[i-1][j+1]+q_2d[i][j-1]+q_2d[i][j+1]+q_2d[i+1][j]+q_2d[i+1][j-1]+q_2d[i+1][j+1];
			end
		end
	end
	
endmodule