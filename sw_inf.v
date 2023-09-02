module sw_inf(
  input mclk,
  input [3:0] sw,
  output reg run = 1'b0,
  output reg rst = 1'b0,
  output reg sel = 1'b0,
  output reg mode = 1'b0
);

reg sw2_z = 1'b0;
reg sw2_zz = 1'b0;

always @(posedge sw[0])
begin
  if (mode == 1'b0)
  run <= ~run;
end

always @(posedge mclk)
begin
  if (mode == 1'b0)
  begin
  sw2_z <= sw[2];
  sw2_zz <= sw2_z;
  if(sw2_z&&(~sw2_zz))
    begin
      if(run == 1'b1)
        sel <= ~sel;
    end
  
  else
    if(run == 1'b0)
      begin
        rst <= sw[1];
        if (rst)
          sel <= 1'b0;
      end
    end
end

always @(posedge sw[3])
begin
	if(run == 2'b0)
		mode <= ~mode;
end
endmodule