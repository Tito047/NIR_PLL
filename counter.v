module counter(out, reset, clk);
	input reset, clk;
	output reg [7:0] out;

	always @(posedge clk)
	begin
		if (reset)
			out <= 48;
		else
			out <= out + 1;
	end
endmodule