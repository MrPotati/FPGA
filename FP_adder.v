module FPAdder(
  input 			 clk,
  input	[31:0] A_56,
  input 	[31:0] B_56,
  output reg  [31:0] sum_56
);  

//Register and Wire declaration
	wire			 sA_56;
	wire			 sB_56;
	wire	 [7:0] eA_56;
	wire	 [7:0] eB_56;
	wire	[22:0] mA_56;
	wire	[22:0] mB_56;
	
  reg 	[22:0]t_mA_56;
  reg 	[22:0]t_mB_56;
  reg 	[7:0]t_eA_56;
  reg 	[7:0]t_eB_56;
	reg	   	 eA_larger_eB_56;
  reg	 [7:0] eA_minus_eB_56;
  reg	 [7:0] eB_minus_eA_56;
	
	reg	 [7:0] e_diff_56;
	reg  [22:0] m_small_56;
	reg  [22:0] m_large_56;
	reg	 [7:0] e_small_56;
	reg	 [7:0] e_large_56;
		
	reg	[22:0] m_shifted_56;
		
	reg	[22:0] m_sum_56;
	reg 			 m_of_56;
	reg		    sum_sign_56=0;
	
  reg [7:0]	e_large_of_56;
  reg [7:0]	e_large_nof_56;
	
	reg   [31:0] s1_A_56;
	reg   [31:0] s1_B_56;
	reg    [7:0] s1_eA_56;
	reg    [7:0] s1_eB_56;
	reg   [22:0] s1_mA_56;
	reg   [22:0] s1_mB_56;
	
	reg   [31:0] s2_A_56;
	reg   [31:0] s2_B_56;
	reg    [7:0] s2_eA_56;
	reg    [7:0] s2_eB_56;
	reg   [22:0] s2_mA_56;
	reg   [22:0] s2_mB_56;
	
	reg   [31:0] s3_A_56;
	reg   [31:0] s3_B_56;
	reg    [7:0] s3_eA_56;
	reg    [7:0] s3_eB_56;
	reg   [22:0] s3_mA_56;
	reg   [22:0] s3_mB_56;
	
	reg   [31:0] s4_A_56;
	reg   [31:0] s4_B_56;
	reg    [7:0] s4_eA_56;
	reg    [7:0] s4_eB_56;
	reg   [22:0] s4_mA_56;
	reg   [22:0] s4_mB_56;
	
  reg	   	 s1_eA_larger_eB_56;
  reg	 [7:0] s1_eA_minus_eB_56;
  reg	 [7:0] s1_eB_minus_eA_56;
	reg	 [7:0] s1_e_diff_56;
	reg 	[22:0] s1_m_small_56;
	reg 	[22:0] s1_m_large_56;
	reg	 [7:0] s1_e_small_56;
	reg	 [7:0] s1_e_large_56;
	reg	[22:0] s1_m_shifted_56;
	reg	[22:0] s1_m_sum_56;
	reg 			 s1_m_of_56;
	reg		    s1_sum_sign_56=0;
	reg [7:0]	 s1_e_large_of_56;
  reg [7:0]	 s1_e_large_nof_56;
	
  reg	   	 s2_eA_larger_eB_56;
  reg	 [7:0] s2_eA_minus_eB_56;
  reg	 [7:0] s2_eB_minus_eA_56;
	reg	 [7:0] s2_e_diff_56;
	reg 	[22:0] s2_m_small_56;
	reg 	[22:0] s2_m_large_56;
	reg	 [7:0] s2_e_small_56;
	reg	 [7:0] s2_e_large_56;
	reg	[22:0] s2_m_shifted_56;
	reg	[22:0] s2_m_sum_56;
	reg 			 s2_m_of_56;
	reg		    s2_sum_sign_56=0;
	reg [7:0]	 s2_e_large_of_56;
  reg [7:0]	 s2_e_large_nof_56;	
	
  reg	   	 s3_eA_larger_eB_56;
  reg	 [7:0] s3_eA_minus_eB_56;
  reg	 [7:0] s3_eB_minus_eA_56;
	reg	 [7:0] s3_e_diff_56;
	reg 	[22:0] s3_m_small_56;
	reg 	[22:0] s3_m_large_56;
	reg	 [7:0] s3_e_small_56;
	reg	 [7:0] s3_e_large_56;
	reg	[22:0] s3_m_shifted_56;
	reg	[22:0] s3_m_sum_56;
	reg 			 s3_m_of_56;
	reg		    s3_sum_sign_56=0;
	reg [7:0]	 s3_e_large_of_56;
  reg [7:0]	 s3_e_large_nof_56;	

  reg	   	 s4_eA_larger_eB_56;
  reg	 [7:0] s4_eA_minus_eB_56;
  reg	 [7:0] s4_eB_minus_eA_56;
	reg	 [7:0] s4_e_diff_56;
	reg 	[22:0] s4_m_small_56;
	reg 	[22:0] s4_m_large_56;
	reg	 [7:0] s4_e_small_56;
	reg	 [7:0] s4_e_large_56;
	reg	[22:0] s4_m_shifted_56;
	reg	[22:0] s4_m_sum_56;
	reg 			 s4_m_of_56;
	reg		    s4_sum_sign_56=0;
	reg [7:0]	 s4_e_large_of_56;
  reg [7:0]	 s4_e_large_nof_56;

	assign   eA_56[7:0] = A_56[30:23];
	assign  mA_56[22:0] = A_56[22:0];
	assign   eB_56[7:0] = B_56[30:23];
	assign  mB_56[22:0] = B_56[22:0];
	
	
	always@(posedge clk)
		begin
		  t_mA_56 <= A_56[22:0];
		  t_mB_56 <= B_56[22:0];
        t_eA_56 <= A_56[30:23];
		  t_eB_56 <= B_56[30:23];
		end
	
//Stage 1 
	always@(posedge clk)
		begin
			 s1_eA_larger_eB_56 <= (eA_56 > eB_56);
			 s1_eA_minus_eB_56  <=  eA_56 - eB_56;
			 s1_eB_minus_eA_56  <=  eB_56 - eA_56;
			
 			 s1_e_diff_56 <= 0;
			 s1_m_small_56 <= 0;
			 s1_m_large_56 <= 0;
			 s1_e_small_56 <= 0;
			 s1_e_large_56 <= 0;
			 s1_m_shifted_56 <= 0;
			 s1_m_sum_56 <= 0;
			 s1_m_of_56 <= 0;
			 s1_sum_sign_56 <= 0;
			 s1_e_large_of_56 <= 0;
			 s1_e_large_nof_56 <= 0;
			 
			 s1_A_56 <= A_56;
			 s1_B_56 <= B_56;
			 s1_eA_56 <= eA_56;
			 s1_eB_56 <= eB_56;
			 s1_mA_56 <= mA_56;
			 s1_mB_56 <= mB_56;
	 	end

//Stage 2
	always@(posedge clk)
		begin
		
			s2_e_small_56 <= s1_eA_larger_eB_56 ? s1_eB_56 : s1_eA_56;
			s2_m_small_56 <= s1_eA_larger_eB_56 ? s1_mB_56 : s1_mA_56;
			s2_e_large_56 <= s1_eA_larger_eB_56 ? s1_eA_56 : s1_eB_56;
			s2_m_large_56 <= s1_eA_larger_eB_56 ? s1_mA_56 : s1_mB_56;
			s2_e_diff_56  <= s1_eA_larger_eB_56 ? s1_eA_minus_eB_56 : s1_eB_minus_eA_56;
	
			s2_m_shifted_56	<=	s1_m_shifted_56;
			s2_m_sum_56			<=	s1_m_sum_56;
			s2_m_of_56			<=	s1_m_of_56;
			s2_sum_sign_56		<=	s1_sum_sign_56;
			s2_e_large_of_56	<=	s1_e_large_of_56;
			s2_e_large_nof_56	<=	s1_e_large_nof_56;
			
			s2_A_56 <= s1_A_56; 
			s2_B_56 <= s1_B_56; 
			s2_eA_56 <= s1_eA_56; 
			s2_eB_56 <= s1_eB_56;
			s2_mA_56 <= s1_mA_56;
			s2_mB_56 <= s1_mB_56;
			
		end

//Stage 3
	always@(posedge clk)
		begin
			s3_m_shifted_56 <= s2_m_small_56 >> s2_e_diff_56;
			
	 		s3_eA_larger_eB_56<=	s2_eA_larger_eB_56;
			s3_eA_minus_eB_56	<=	s2_eA_minus_eB_56;
			s3_eB_minus_eA_56	<=	s2_eB_minus_eA_56;
			s3_e_diff_56		<=	s2_e_diff_56;
			s3_m_small_56		<=	s2_m_small_56;
			s3_m_large_56		<=	s2_m_large_56;
			s3_e_small_56		<=	s2_e_small_56;
			s3_e_large_56		<=	s2_e_large_56;
			s3_m_sum_56			<=	s2_m_sum_56;
			s3_m_of_56			<=	s2_m_of_56;
			s3_sum_sign_56		<=	s2_sum_sign_56;
			s3_e_large_of_56	<=	s2_e_large_of_56;
			s3_e_large_nof_56	<=	s2_e_large_nof_56;
			
			s3_A_56 <= s2_A_56; 
			s3_B_56 <= s2_B_56; 
			s3_eA_56 <= s2_eA_56; 
			s3_eB_56 <= s2_eB_56;
			s3_mA_56 <= s2_mA_56;
			s3_mB_56 <= s2_mB_56;
						
		end

//Stage 4
	always@(posedge clk)
		begin
				if(s3_A_56[31] == s3_B_56[31])
				  begin
					 {s4_m_of_56,s4_m_sum_56} <= s3_m_large_56 + s3_m_shifted_56;
					 s4_e_large_of_56 <= s3_e_large_56 + 1;
					 s4_e_large_nof_56 <= s3_e_large_56;
				  end
				else
				  begin
					 if(s3_m_large_56 > s3_m_shifted_56)
					   begin
						 {s4_m_of_56,s4_m_sum_56} <= s3_m_large_56 - s3_m_shifted_56;
						 s4_e_large_of_56 <= s3_e_large_56 + 1;
						 s4_e_large_nof_56 <= s3_e_large_56;
						end 
					  else
					   begin
						 {s4_m_of_56,s4_m_sum_56} <= s3_m_shifted_56 - s3_m_large_56;
						 s4_e_large_of_56 <= s3_e_large_56 + 1;
						 s4_e_large_nof_56 <= s3_e_large_56;
						end 	
				  end
	
	
				if((s3_A_56[31]==1 & (s3_eA_56 > s3_eB_56))|(s3_B_56[31]==1 & (s3_eB_56 > s3_eA_56))|(s3_A_56[31]==1 & s3_B_56[31]==1))		//if A is negative and larger
					begin
						s4_sum_sign_56 <= 1;
					end
				else if((s3_eA_56 == s3_eB_56) & ((s3_A_56[31]==1 & (s3_mA_56 > s3_mB_56)) | (s3_B_56[31]==1 & (s3_mB_56 > s3_mA_56))))
					begin
						s4_sum_sign_56 <= 1;
					end
				else
					begin
						s4_sum_sign_56 <= 0;
					end	
				
	
			s4_eA_larger_eB_56<=	s3_eA_larger_eB_56;	
			s4_eA_minus_eB_56	<=	s3_eA_minus_eB_56;
			s4_eB_minus_eA_56	<=	s3_eB_minus_eA_56;	
			s4_e_diff_56		<=	s3_e_diff_56;
			s4_m_small_56		<=	s3_m_small_56;
			s4_m_large_56		<=	s3_m_large_56;
			s4_e_small_56		<=	s3_e_small_56;
			s4_e_large_56		<=	s3_e_large_56;
			s4_m_shifted_56	<=	s3_m_shifted_56;

			
			s4_A_56 <= s3_A_56;
			s4_B_56 <= s3_B_56;
			s4_eA_56 <= s3_eA_56;
			s4_eB_56 <= s3_eB_56;
			s4_mA_56 <= s3_mA_56;
			s4_mB_56 <= s3_mB_56;
			
		end

//Stage 5
	always@(posedge clk)
		begin
			if(s4_A_56==32'b0)
			  begin
				 sum_56 = s4_B_56;
			  end
			else if(s4_B_56==32'b0)
			  begin
				 sum_56 = s4_A_56;
			  end
			else
			  begin
					if(s4_m_of_56==0 && s4_m_sum_56[22]==1)
					  begin
						 sum_56[31]   = s4_sum_sign_56;
						 sum_56[30:0] = {s4_e_large_nof_56,s4_m_sum_56};
					  end
					else if(s4_m_of_56==0 && s4_m_sum_56[22]==0)
					  begin
						 sum_56[31]   = s4_sum_sign_56;
						 sum_56[30:0] = {s4_e_large_nof_56-1,s4_m_sum_56[21:0],1'b0};
					  end	 
					else if(s4_m_of_56==1)
					  begin
						 sum_56[31]   = s4_sum_sign_56;
						 sum_56[30:0] = {s4_e_large_of_56,1'b1,s4_m_sum_56[22:1]}; 
					  end	 
				end
		end
			
endmodule		
