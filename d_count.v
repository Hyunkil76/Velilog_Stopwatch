module d_count(
  input mclk,
  input clkout,
  input mode,
  input rs_s,
  input rst_s,
  input [7:0] sw,
  output reg [3:0] m_l = 4'b0000,
  output reg [3:0] m_r = 4'b0000,
  output reg [3:0] s_l = 4'b0000,
  output reg [3:0] s_r = 4'b0000,
  output reg [3:0] ms_l = 4'b0000,
  output reg [3:0] ms_r = 4'b0000
);



reg sw0_z = 1'b0;
reg sw0_zz = 1'b0;
reg sw1_z = 1'b0;
reg sw1_zz = 1'b0;
reg sw2_z = 1'b0;
reg sw2_zz = 1'b0;
reg sw3_z = 1'b0;
reg sw3_zz = 1'b0;
reg sw4_z = 1'b0;
reg sw4_zz = 1'b0;
reg sw5_z = 1'b0;
reg sw5_zz = 1'b0;
reg sw6_z = 1'b0;
reg sw6_zz = 1'b0;
reg sw7_z = 1'b0;
reg sw7_zz = 1'b0;
reg rss_z = 1'b0;
reg rss_zz = 1'b0;
reg rst_z = 1'b0;
reg rst_zz = 1'b0;
reg clkout_z = 1'b0;
reg clkout_zz = 1'b0;
reg rs = 1'b00;

always @(posedge mclk)
begin
  sw0_z <= sw[0];
  sw0_zz <= sw0_z;
  sw1_z <= sw[1];
  sw1_zz <= sw1_z;
  sw2_z <= sw[2];
  sw2_zz <= sw2_z;
  sw3_z <= sw[3];
  sw3_zz <= sw3_z;
  sw4_z <= sw[4];
  sw4_zz <= sw4_z;
  sw5_z <= sw[5];
  sw5_zz <= sw5_z;
  sw6_z <= sw[6];
  sw6_zz <= sw6_z;
  sw7_z <= sw[7];
  sw7_zz <= sw7_z;
  rss_z <= rs_s;
  rss_zz <= rss_z;
  rst_z <= rst_s;
  rst_zz <= rst_z;
  clkout_z <= clkout;
  clkout_zz <= clkout_z;
  if (mode)
    begin
      if (rs == 1'b0)
        begin
          if (sw0_z&&(~sw0_zz))
            begin
              if(m_l[3:0] >= 4'b1001)
                m_l[3:0] <= 4'b0000;
              else
                m_l[3:0] <= m_l[3:0]+4'b0001;
            end
          
          else if (sw1_z&&(~sw1_zz))
            begin
              if(m_l[3:0] == 4'b0000)
                m_l[3:0] <= 4'b1001;
              else
                m_l[3:0] <= m_l[3:0]-4'b0001;
            end
          
          else if (sw2_z&&(~sw2_zz))
            begin
              if(m_r[3:0] >= 4'b1001)
                m_r[3:0] <= 4'b0000;
              else
                m_r[3:0] <= m_r[3:0]+4'b0001;
            end 
          
          else if (sw3_z&&(~sw3_zz))
            begin
              if(m_r[3:0] == 4'b0000)
                m_r[3:0] <= 4'b1001;
              else
                m_r[3:0] <= m_r[3:0]-4'b0001;
            end
             
          else if (sw4_z&&(~sw4_zz))
            begin
              if(s_l[3:0] >= 4'b0101)
                s_l[3:0] <= 4'b0000;
              else
                s_l[3:0] <= s_l[3:0]+4'b0001;
            end
            
          else if (sw5_z&&(~sw5_zz))
            begin
              if(s_l[3:0] == 4'b0000)
                s_l[3:0] <= 4'b0101;
              else
                s_l[3:0] <= s_l[3:0]-4'b0001;
            end
            
          else if (sw6_z&&(~sw6_zz))
            begin
              if(s_r[3:0] >= 4'b1001)
                s_r[3:0] <= 4'b0000;
              else
                s_r[3:0] <= s_r[3:0]+4'b0001;
            end
            
          else if (sw7_z&&(~sw7_zz))
            begin
              if(s_r[3:0] == 4'b0000)
                s_r[3:0] <= 4'b1001;
              else
                s_r[3:0] <= s_r[3:0]-4'b0001;
            end
				
			else if (rst_z&&(~rst_zz))
				begin
					m_l[3:0] <= 4'b0000;
					m_r[3:0] <= 4'b0000;
					s_l[3:0] <= 4'b0000;
					s_r[3:0] <= 4'b0000;
					ms_l[3:0] <= 4'b0000;
					ms_r[3:0] <= 4'b0000;
				end
        end
        
      else if(rs == 1'b1)
        begin
          if(clkout_z&&(~clkout_zz))
            begin
          if ((m_l[3:0]|m_r[3:0]|s_l[3:0]|s_r[3:0]|ms_l[3:0]|ms_r[3:0]) != 4'b0000)
          begin
          if(ms_r[3:0]>4'b0000)
            ms_r[3:0] <= ms_r[3:0]-4'b0001;
          
          else if(ms_r[3:0]==4'b0000)
            begin
              ms_r[3:0] <= 4'b1001;
            
              if(ms_l[3:0]>4'b0000)
               ms_l[3:0] <= ms_l[3:0]-4'b0001;
              
              else if(ms_l==4'b0000)
              begin
                ms_l[3:0] <= 4'b1001;
              
                if (s_r[3:0]>4'b0000)
                s_r[3:0] <= s_r[3:0]-4'b0001;
            
                else if (s_r[3:0] == 4'b0000)
                  begin
                   s_r[3:0] <= 4'b1001;
              
                   if(s_l[3:0]>4'b0000)
                    s_l[3:0] <= s_l[3:0]-4'b0001;
                   else
                     begin
                      s_l[3:0] <= 4'b0101;
                  
                      if(m_r>4'b0000)
                       m_r[3:0] <= m_r[3:0]-4'b0001;
                      else
                        begin
                         m_r[3:0] <= 4'b1001;
                      
                         if(m_l[3:0]>4'b0000)
                           m_l[3:0] <= m_l[3:0]-4'b0001;
                         else
                           m_l[3:0] <= 4'b0101;
                        end
                     end
                  end
              end
            end
          end
          end
        end
      if((m_l[3:0]|m_r[3:0]|s_l[3:0]|s_r[3:0]|ms_l[3:0]|ms_r[3:0]) == 4'b0000)
        rs <= 1'b0;
      else if(rss_z&&(~rss_zz))
        begin
          rs <= ~rs;
        end
    end
end
endmodule