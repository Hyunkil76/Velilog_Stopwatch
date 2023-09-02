module mux(
  input sel,
  input clk,
  input [6:0] r1,
  input [6:0] r2,
  input [6:0] r3,
  input [6:0] r4,
  input [6:0] r5,
  input [6:0] r6,
  input [6:0] l1,
  input [6:0] l2,
  input [6:0] l3,
  input [6:0] l4,
  input [6:0] l5,
  input [6:0] l6,
  output reg [6:0] m1 =7'b000_0000,
  output reg [6:0] m2 =7'b000_0000,
  output reg [6:0] m3 =7'b000_0000,
  output reg [6:0] m4 =7'b000_0000,
  output reg [6:0] m5 =7'b000_0000,
  output reg [6:0] m6 =7'b000_0000
);

always @(clk)
begin
  if (sel == 1'b0)
    begin
      m1[6:0] <= r1[6:0];
      m2[6:0] <= r2[6:0];
      m3[6:0] <= r3[6:0];
      m4[6:0] <= r4[6:0];
      m5[6:0] <= r5[6:0];
      m6[6:0] <= r6[6:0];
    end
  else
    begin
      m1[6:0] <= l1[6:0];
      m2[6:0] <= l2[6:0];
      m3[6:0] <= l3[6:0];
      m4[6:0] <= l4[6:0];
      m5[6:0] <= l5[6:0];
      m6[6:0] <= l6[6:0];
    end
end
endmodule