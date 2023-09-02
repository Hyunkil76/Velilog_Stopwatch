module count10(
  input run,
  input rst,
  input clk,
  output reg [3:0] q = 4'b0000
);

always @(negedge clk or posedge rst)
begin
  if (rst == 1'b1)
   q[3:0] <= 4'b0000;
 else 
   begin
    if (run == 1'b1)
    begin
    if (q[3:0] >= 4'b1001)
      q[3:0] <= 4'b0000;
    else
      q[3:0] <= q[3:0]+1'b1;
    end
    end
end
endmodule