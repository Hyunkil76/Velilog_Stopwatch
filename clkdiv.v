module clkdiv(
  input mclk,
  output reg clkout = 1'b0
);
  
reg [19:0] rCnt = 20'h0_0000;
always @(posedge mclk)
begin
  if(rCnt[19:0] >= 20'b0000_0001_0011_1000_0111)
    begin
      rCnt[19:0] <= 20'h0_0000;
      clkout <= ~clkout;
    end
    
  else
    begin
      rCnt[19:0] <= rCnt[19:0]+20'h0_0001;
    end
end
endmodule




