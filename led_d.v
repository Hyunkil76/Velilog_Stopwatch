module led_d(
  input [3:0] val,
  input mode,
  output reg [7:0] q = 8'b00000000,
  output reg q2 = 1'b0
);

always @(val)
begin
  if(val[3:0] >= 4'b0101)
    begin
      q <= 8'b11111111;
    end
  else
    begin
      q <= 8'b00000000;
    end
end

always @(mode)
begin
	q2 <= mode;
end
endmodule