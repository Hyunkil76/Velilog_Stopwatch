module lap(
  input sel,
  input [6:0] r1,
  input [6:0] r2,
  input [6:0] r3,
  input [6:0] r4,
  input [6:0] r5,
  input [6:0] r6,
  output reg [6:0] l1 = 7'b000_0000,
  output reg [6:0] l2 = 7'b000_0000,
  output reg [6:0] l3 = 7'b000_0000,
  output reg [6:0] l4 = 7'b000_0000,
  output reg [6:0] l5 = 7'b000_0000,
  output reg [6:0] l6 = 7'b000_0000
);

always @(posedge sel)
begin
  l1[6:0] <= r1[6:0];
  l2[6:0] <= r2[6:0];
  l3[6:0] <= r3[6:0];
  l4[6:0] <= r4[6:0];
  l5[6:0] <= r5[6:0];
  l6[6:0] <= r6[6:0];
end
endmodule