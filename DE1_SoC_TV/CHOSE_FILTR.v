module CHOSE_FILTR(
							SW,
							iRed,
							iBlue,
							iGreen,
							iRed_new,
							iBlue_new,
							iGreen_new);
							
input    [9:0] SW;				
input		[9:0]	iRed;
input		[9:0]	iGreen;
input		[9:0]	iBlue;

output   [9:0] iRed_new;
output	[9:0]	iBlue_new;
output   [9:0] iGreen_new;						





reg   [9:0] iRed_temp;
reg	[9:0]	iBlue_temp;
reg   [9:0] iGreen_temp;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//																	POMYSŁ - dokończyćdziałanie filtra 2,            
//																	wymiana kolejnych par kolorów ze sobą
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
always begin
					
																		
if(SW[9]==1 && SW[8]==0)begin                                    //jakiś randomowy filtr
																		
iRed_temp	  =	iRed;
iBlue_temp	  =	iBlue;
iGreen_temp    =	iGreen;

//if(CHOSE)begin

																							
if(SW[0])begin

	iRed_temp	  =	iBlue_temp;
	iBlue_temp	  =	iRed_temp;
	iGreen_temp    =	iGreen_temp;
	
				end

if(SW[1])begin
	
	iRed_temp	  =	iRed_temp;
	iBlue_temp	  =	iGreen_temp;
	iGreen_temp    =	iBlue_temp;
	end

if(SW[2]) begin
	
	iRed_temp	  =	iGreen_temp;
	iBlue_temp	  =	iBlue_temp;
	iGreen_temp    =	iRed_temp;
	
	end

	end
			
			
	if(SW[8]==1 && SW[9]==0)begin      //zamienianie kolejnych kolorów ze sobą

iRed_temp	  =	iRed;
iBlue_temp	  =	iBlue;
iGreen_temp    =	iGreen;

																							
if(SW[2:0]==0)begin

	iRed_temp	  =	iRed_temp;
	iBlue_temp	  =	iBlue_temp;
	iGreen_temp    =	iGreen_temp;
	
				end

if(SW[2:0]==1)begin
	
	iRed_temp	  =	iRed_temp;
	iBlue_temp	  =	iGreen_temp;
	iGreen_temp    =	iBlue_temp;
	end

if(SW[2:0]==2) begin
	
	iRed_temp	  =	iBlue_temp;
	iBlue_temp	  =	iRed_temp;
	iGreen_temp    =	iGreen_temp;

end

if(SW[2:0]==3) begin
	
	iRed_temp	  =	iBlue_temp;
	iBlue_temp	  =	iGreen_temp;
	iGreen_temp    =	iRed_temp;

end 	 	

if(SW[2:0]==4) begin
	
	iRed_temp	  =	iGreen_temp;
	iBlue_temp	  =	iRed_temp;
	iGreen_temp    =	iBlue_temp;

end 	 

if(SW[2:0]==5) begin
	
	iRed_temp	  =	iGreen_temp;
	iBlue_temp	  =	iBlue_temp;
	iGreen_temp    =	iRed_temp;

end 	 

	
end
	

				if((SW[9]==0 && SW[8]==0)|| (SW[9]==1&& SW[8]==1))begin 										//Przekierowanie obrazu bez filtrów
				iRed_temp	  =	iRed;
				iBlue_temp	  =	iBlue;
				iGreen_temp    =	iGreen;
				end
end

assign	iRed_new      =	iRed_temp;   
assign	iBlue_new	  =	iBlue_temp;
assign	iGreen_new    =	iGreen_temp;

endmodule









//always begin
//
//if(SW[9])begin
//CHOSE1=1;
//end
//
//end
//
//Filtr_SWITCH 			f1(   .SW(SW[9:0]),
//							.iRed(mRed),
//							.iGreen(mGreen),
//							.iBlue(mBlue),
//							//out
//							.iRed_new(mRed_new),
//							.iGreen_new(mGreen_new),
//							.iBlue_new(mBlue_new));
//
//Filtr_NULL 			f0(   .SW(SW[9:0]),
//							.iRed(mRed),
//							.iGreen(mGreen),
//							.iBlue(mBlue),
//							//out
//							.iRed_new(mRed_new),
//							.iGreen_new(mGreen_new),
//							.iBlue_new(mBlue_new));							
//							
//assign	iRed_new      =	iRed_new;   
//assign	iBlue_new	  =	iBlue_new;
//assign	iGreen_new    =	iGreen_new;							
//							
//							
//endmodule