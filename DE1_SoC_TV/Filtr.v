module Filtr(
				Button,
				iRed,
				iBlue,
				iGreen,
				iRed_new,
				iBlue_new,
				iGreen_new);
				
				
input    [2:1] Button;				                                 
input		[9:0]	iRed;
input		[9:0]	iGreen;
input		[9:0]	iBlue;

output   [9:0] iRed_new;
output	[9:0]	iBlue_new;
output   [9:0] iGreen_new;

//assign	iRed_new      =	iRed;   																				//iRed -> 0 dziala (wycina dany kolor)
//assign	iBlue_new	  =	iBlue;
//assign	iGreen_new    =	iGreen;



reg   [9:0] iRed_temp;
reg	[9:0]	iBlue_temp;
reg   [9:0] iGreen_temp;

always begin
																							//// POMYSŁ  przerobic kontrolowanie na switche, kazdy switch zamienia dwa kolory ze soba
																							// na poczatku przypsiac wszystkie kolory do temp i pozniej działac juz na temp
if(Button[2]==0 && Button[1]==0)begin

	iRed_temp	  =	iGreen;
	iBlue_temp	  =	iBlue;
	iGreen_temp    =	iRed;
	
				end
else 
	if(Button[2]==1 && Button[1]==0)begin
	
	iRed_temp	  =	iBlue;
	iBlue_temp	  =	iRed;
	iGreen_temp    =	iGreen;
	end
else 
	if(Button[2]==0 && Button[1]==1) begin
	
	iRed_temp	  =	iRed;
	iBlue_temp	  =	iGreen;
	iGreen_temp    =	iBlue;
	
	end
else
	if(Button[2]==1 && Button[1]==1) begin
	
	iRed_temp	  =	iRed;
	iBlue_temp	  =	iBlue;
	iGreen_temp    =	iGreen;
	
	end
			
				
end

assign	iRed_new      =	iRed_temp;   
assign	iBlue_new	  =	iBlue_temp;
assign	iGreen_new    =	iGreen_temp;

endmodule